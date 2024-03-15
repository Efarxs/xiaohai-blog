package com.xiaohai.note.pojo.dto;

import java.io.Serializable;
import java.io.Serial;
import java.time.LocalDateTime;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
* <p>
* 系统通知 DTO 数据传输对象
* </p>
*
* @author xiaohai
* @since 2024-03-09
*/
@Getter
@Setter
@Schema(name = "NotificationsDto", description = "系统通知 DTO 数据传输对象")
public class NotificationsDto implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Schema(description = "id")
    private Integer id;

//    @Schema(description = "用户id")
//    private Integer userId;

    @Schema(description = "通知类型")
    private String type;

    @Schema(description = "文章id")
    private Integer articleId;

    @Schema(description = "文章标题")
    private String title;

    @Schema(description = "评论id")
    private Integer commentId;

    @Schema(description = "喜欢id")
    private Integer likeId;

    @Schema(description = "喜欢用户")
    private String likeNickName;

    @Schema(description = "是否已读(0否，1是)")
    private Integer isRead;

    @Schema(description = "创建时间")
    private LocalDateTime createdTime;
}