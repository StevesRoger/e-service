package org.code.jarvis.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by KimChheng on 5/8/2017.
 */
@Configuration
public class MvcConfiguration extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("index");
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/product").setViewName("product");
        registry.addViewController("/promotion").setViewName("promotion");
        registry.addViewController("/advertisement").setViewName("advertisement");
        registry.addViewController("/login").setViewName("login");
        registry.addViewController("/swagger").setViewName("swagger");
        registry.addViewController("/403").setViewName("403");
        registry.addViewController("/wed-customer").setViewName("wed-customer");
        registry.addViewController("/warm-customer").setViewName("warm-customer");
        registry.addViewController("/birth-customer").setViewName("birth-customer");
        registry.addViewController("/ceremony-customer").setViewName("ceremony-customer");
        registry.addViewController("/invoice-customer").setViewName("invoice-customer");
        registry.addViewController("/des-customer").setViewName("des-customer");

    }

  @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedMethods("*")
                .allowedHeaders("*")
                .allowedOrigins("*")
                .allowCredentials(true)
                .maxAge(3600);
    }


    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("WEB-INF/resources/");
    }

}
