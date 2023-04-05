package com.xiaohai.note.service;

import com.xiaohai.note.pojo.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import com.xiaohai.common.daomain.ReturnPageData;
import com.xiaohai.note.pojo.query.ArticleQuery;
import com.xiaohai.note.pojo.vo.ArticleVo;
import com.xiaohai.note.pojo.dto.ArticleDto;

/**
 *
 * 文章表 服务类
 *
 *
 * @author xiaohai
 * @since 2023-04-04
 */
public interface ArticleService extends IService<Article> {


    /**
     * 添加文章表
     *
     * @param vo 文章表 VO（View Object）：显示层对象
     * @return Integer
     */
    Integer add(ArticleVo vo);

    /**
     * 删除文章表
     *
     * @param ids 主键
     * @return Integer
     */
    Integer delete(Long[] ids);

    /**
     * 修改文章表
     *
     * @param vo 文章表 VO（View Object）：显示层对象
     * @return Integer
     */
    Integer updateData(ArticleVo vo);

    /**
     * id查询数据
     *
     * @param id id
     * @return   Article
*/
    Article findById(Long id);

    /**
    * 查询文章表列表数据
    *
    * @param query 文章表 Query 数据查询对象
    * @return Response
    */
    ReturnPageData<ArticleDto> findListByPage(ArticleQuery query);
}