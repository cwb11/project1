package com.imooc.project.vo;

import lombok.Data;

import java.lang.reflect.Array;
import java.util.List;

@Data
public class TreeVO {

    private String title;//节点标题

    private Long id;//节点唯一索引值，用于对指定节点进行各类操作

    private List<TreeVO> children;//子节点。支持设定选项同父节点

    private Boolean checked;//节点是否初始为选中状态（如果开启复选框的话），默认 false
}
