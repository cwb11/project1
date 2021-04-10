package com.imooc.project.vo;

import lombok.Data;

import java.util.List;


@Data
public class ResourceVO {
    /**
     * 主键
     */
    private Long resourceId;

    /**
     * 资源名称
     */
    private String resourceName;

    /**
     * 资源类型(0、目录 1、菜单 2、按钮)
     */
    private Integer resourceType;

    /**
     * 请求地址
     */
    private String url;

    /**
     * 子资源
     */
    private List<ResourceVO> subs;
}
