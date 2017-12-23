package org.code.jarvis.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * Created by Dang Dim
 * Date     : 23-Dec-17, 1:44 PM
 * Email    : d.dim@gl-f.com
 */

public class BaseInterceptor extends HandlerInterceptorAdapter {

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        String controllerName = "";
        String actionName = "";

        if( handler instanceof HandlerMethod ) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            controllerName  = handlerMethod.getBeanType().getSimpleName().replace("Controller", "");
            actionName = handlerMethod.getMethod().getName();

            System.out.println("controller name : " + controllerName );
            System.out.println("actionName name : " + actionName );
        }

        modelAndView.addObject("controllerName", controllerName );
        modelAndView.addObject("actionName", actionName );
    }



}
