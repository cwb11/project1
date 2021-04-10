package com.imooc.project.utils;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.Map;
import java.util.Set;

public class QueryUtil {

    /**
     * 构建MyQuery对象服务于分页查询方法中
     * @param param
     * @param <T>
     * @return
     */
    public static  <T> MyQuery<T>  buildMyQuery(Map<String,String> param){
        MyQuery<T> myQuery = new MyQuery<>();

        Long page=1L;
        Long limit=10L;

        QueryWrapper<T> queryWrapper = new QueryWrapper<>();

        Set<Map.Entry<String,String>> entries=param.entrySet();
        for (Map.Entry<String,String> entry:entries){
            String value=entry.getValue();
            if (StringUtils.isNotBlank(value)){
                String key=entry.getKey();
                if ("page".equals(key)){
                    page=Long.parseLong(value);
                }else if ("limit".equals(key)){
                    limit=Long.parseLong(value);
                }else {
                    String[] keyArray = key.split("\\$");
                    switch(keyArray[0]){
                        case "like":
                            queryWrapper.like(keyArray[1],value);
                            break;
                        case "ge":
                            queryWrapper.ge(keyArray[1],value);
                            break;
                        case "le":
                            queryWrapper.le(keyArray[1],value);
                            break;
                        case "eq":
                        default:
                            queryWrapper.eq(keyArray[1],value);
                            break;


                    }
                }
            }
        }
        myQuery.setPage(new Page<>(page,limit));
        myQuery.setWrapper(queryWrapper);
        return myQuery;
    }
}
