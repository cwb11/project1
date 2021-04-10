package com.imooc.project.service;

import com.imooc.project.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author xiaochen
 * @since 2021-04-02
 */
public interface RoleService extends MyService<Role> {

    /**
     * 新增角色及所具有的资源
     * @param role
     * @return
     */
    boolean saveRole(Role role);


    /**
     * 修改角色及所具有的资源
     * @param role
     * @return
     */
    boolean updateRole(Role role);
}
