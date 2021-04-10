package com.imooc.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.toolkit.SqlHelper;
import com.imooc.project.mapper.MyMapper;

public interface MyService<T> extends IService<T> {

    default boolean removeByIdWithFill(T entity){
        int count = ((MyMapper<T>) getBaseMapper()).deleteByIdWithFill(entity);
        return SqlHelper.retBool(count);//根据mp提供的方法，count>0为true，否则为false
    }
}
