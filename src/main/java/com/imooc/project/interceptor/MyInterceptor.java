package com.imooc.project.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;

/**
 * 权限拦截器
 */
public class MyInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //获取url
        String requestURI = request.getRequestURI();
        // /account/toList account/toList
        String substring = requestURI.substring(1);

        // account/toList account
        int index=substring.indexOf("/");
        if (index!=-1){
            //account
            substring=substring.substring(0,index);
        }

        HashSet<String> urls=(HashSet<String>)request.getSession().getAttribute("module");
        //account是否在  该用户所有有权限的资源中
        boolean result=urls.stream().anyMatch(substring::equals);
        if (!result){
            response.sendRedirect("/");
        }
        return result;
    }
}
