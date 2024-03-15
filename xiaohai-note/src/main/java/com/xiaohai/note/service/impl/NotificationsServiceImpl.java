package com.xiaohai.note.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xiaohai.common.daomain.PageData;
import com.xiaohai.common.daomain.ReturnPageData;
import com.xiaohai.common.utils.PageUtils;
import com.xiaohai.note.dao.NotificationsMapper;
import com.xiaohai.note.pojo.dto.NotificationsDto;
import com.xiaohai.note.pojo.entity.Notifications;
import com.xiaohai.note.pojo.query.NotificationsQuery;
import com.xiaohai.note.pojo.vo.NotificationsVo;
import com.xiaohai.note.service.NotificationsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 系统通知 服务实现类
 *
 * @author xiaohai
 * @since 2024-03-09
 */
@Service
@Slf4j
public class NotificationsServiceImpl extends ServiceImpl<NotificationsMapper, Notifications> implements NotificationsService {

    private final Map<Integer, SseEmitter> sseEmitterMap = new ConcurrentHashMap<>();

    // 心跳间隔时间（单位：毫秒）
    private static final long HEARTBEAT_INTERVAL = 5000;


    /**
     * 定时任务，定期发送心跳消息给客户端
     */
    @Scheduled(fixedRate = HEARTBEAT_INTERVAL)
    public void sendHeartbeat() {
        for (Map.Entry<Integer, SseEmitter> entry : sseEmitterMap.entrySet()) {
            SseEmitter emitter = entry.getValue();
            try {
                emitter.send("heartbeat");
            } catch (IOException e) {
                sseEmitterMap.remove(entry.getKey());
                emitter.complete();
                log.info("用户：{}，SSE连接断开！", entry.getKey());
            }
        }
    }

    @Override
    public SseEmitter getSseEmitter() {
        SseEmitter sseEmitter = new SseEmitter(0L);

        Integer userId = Integer.valueOf(String.valueOf(StpUtil.getLoginId()));
        long count = baseMapper.selectCount(new LambdaQueryWrapper<Notifications>()
                .eq(Notifications::getUserId, userId)
                .eq(Notifications::getIsRead, 0));
        try {
            sseEmitter.send(SseEmitter.event()
                    .id(userId.toString())
                    .data(count)
                    .reconnectTime(3000));
        } catch (IOException e) {
            log.error("获取SSE连接失败！");
            return null;
        }

        // 监听连接完成事件，当客户端断开连接时移除对应的userId
        sseEmitter.onCompletion(() -> {
            sseEmitterMap.remove(userId);
            sseEmitter.complete();
        });

        // 监听出错事件，当发送消息失败时也移除对应的userId
        sseEmitter.onError((error) -> {
            sseEmitterMap.remove(userId);
            sseEmitter.completeWithError(error);
        });
        // 将userId与sseEmitter关联起来
        sseEmitterMap.put(userId, sseEmitter);
        log.info("用户：{}，获取SSE连接成功！", userId);
        return sseEmitter;
    }

    @Override
    @Async("syncExecutorPool")
    public void add(NotificationsVo vo) {
        var userId = vo.getUserId();

        Notifications notifications = new Notifications();
        BeanUtils.copyProperties(vo, notifications);
        notifications.setCreatedTime(LocalDateTime.now());
        baseMapper.insert(notifications);
        long count = baseMapper.selectCount(new LambdaQueryWrapper<Notifications>()
                .eq(Notifications::getUserId, userId)
                .eq(Notifications::getIsRead, 0));
        SseEmitter sseEmitter = sseEmitterMap.get(userId);
        if (sseEmitter != null) {
            try {
                sseEmitter.send(SseEmitter.event()
                        .data(count)
                        .reconnectTime(3000));
            } catch (IOException e) {
                sseEmitterMap.remove(userId);
                sseEmitter.complete();
                log.info("用户：{}，SSE连接断开！", userId);
            }
        }
    }

    @Override
    public Integer delete(Long[] ids) {
        for (Long id : ids) {
            baseMapper.deleteById(id);
        }
        return ids.length;
    }

    @Override
    public Integer updateData(Long[] ids) {
        for (Long id : ids) {
            Notifications notifications = new Notifications();
            notifications.setId(Math.toIntExact(id));
            notifications.setIsRead(1);
            baseMapper.updateById(notifications);
        }
        return ids.length;
    }

    @Override
    public List<NotificationsDto> findList() {
        Integer userId = Integer.valueOf(String.valueOf(StpUtil.getLoginId()));
        NotificationsQuery query = new NotificationsQuery();
        query.setIsRead(0);
        IPage<NotificationsDto> wherePage = new Page<>(1, 5);
        IPage<NotificationsDto> iPage = baseMapper.selectFindList(wherePage, query, userId);
        List<NotificationsDto> list = iPage.getRecords();
//        for (NotificationsDto dto : list) {
//           dto.getCommentId()
//        }
        return list;
    }

    @Override
    public ReturnPageData<NotificationsDto> findListByPage(NotificationsQuery query) {
        IPage<NotificationsDto> wherePage = new Page<>(PageUtils.getPageNo(), PageUtils.getPageSize());
        Integer userId = Integer.valueOf(String.valueOf(StpUtil.getLoginId()));
        IPage<NotificationsDto> iPage = baseMapper.selectFindList(wherePage, query, userId);
        List<NotificationsDto> list = iPage.getRecords();
//        for (NotificationsDto dto : list) {
//            dto.getCommentId();
//        }
        PageData pageData = new PageData();
        BeanUtils.copyProperties(iPage, pageData);
        return ReturnPageData.fillingData(pageData, list);
    }
}