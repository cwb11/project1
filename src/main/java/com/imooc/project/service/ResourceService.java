package com.imooc.project.service;

import com.imooc.project.entity.Resource;
import com.baomidou.mybatisplus.extension.service.IService;
import com.imooc.project.vo.ResourceVO;
import com.imooc.project.vo.TreeVO;

import java.util.HashSet;
import java.util.List;

/**
 * <p>
 * 资源表 服务类
 * </p>
 *
 * @author xiaochen
 * @since 2021-04-02
 */
public interface ResourceService extends MyService<Resource> {

    /**
     * 根据角色id，查询该角色所具有的资源
     * @param roleId
     * @return
     */
    List<ResourceVO> listResourceByRoleId(Long roleId);


    /**
     * 查询系统资源，供前端组件渲染
     * @return
     */
    List<TreeVO> listResource(Long roleId,Integer flag);

    /**
     * 将资源转换为代码模块的集合
     * @param resourceVOS
     * @return
     */
    HashSet<String> convert(List<ResourceVO> resourceVOS);
}
