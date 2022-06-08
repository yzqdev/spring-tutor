package com.yzq.shirodemo.config.shiro;

import com.yzq.shirodemo.config.filter.SubjectFilter;
import com.yzq.shirodemo.constant.SecurityConstants;
import com.yzq.shirodemo.constant.UserRoleConstants;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.spring.web.config.DefaultShiroFilterChainDefinition;
import org.apache.shiro.spring.web.config.ShiroFilterChainDefinition;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.aop.framework.autoproxy.DefaultAdvisorAutoProxyCreator;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.Map;

/**
 * @author Hellohao
 * @version 1.0
 * @date 2021/6/3 10:37
 */

@Configuration
public class ShiroConfig {
    @Bean
    ShiroFilterChainDefinition shiroFilterChainDefinition() {
        DefaultShiroFilterChainDefinition definition = new DefaultShiroFilterChainDefinition();
       definition.addPathDefinition("/api/auth/login", "anon");
       definition.addPathDefinition("/api/user/reg", "anon");

        definition.addPathDefinition("/api/**", "authc");
        //definition.addPathDefinition("/**", "JWT");
        definition.addPathDefinition("/v3/**", "anon");
        definition.addPathDefinition("/swagger-ui/**", "anon");
        return definition;
    }

    /**
     * 防止接口上有RequiresPermission导致swaggerui失效
     * @return
     */
    @Bean
    public DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator() {
        DefaultAdvisorAutoProxyCreator defaultAdvisorAutoProxyCreator =
                new DefaultAdvisorAutoProxyCreator();
        defaultAdvisorAutoProxyCreator.setUsePrefix(true);

        return defaultAdvisorAutoProxyCreator;
    }
    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(@Qualifier("defaultWebSecurityManager") DefaultWebSecurityManager defaultWebSecurityManager, ShiroFilterChainDefinition shiroFilterChainDefinition) {
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        bean.setSecurityManager(defaultWebSecurityManager);
        Map<String, String> map = shiroFilterChainDefinition.getFilterChainMap();
        //添加filterchainmap
        bean.setFilterChainDefinitionMap(map);

        Map<String, Filter> filters = bean.getFilters();
        filters.put("JWT", new SubjectFilter());
        bean.setFilters(filters);

        bean.setLoginUrl("/jurisError");
        bean.setUnauthorizedUrl("/authError");

        return bean;

    }



    @Bean
    public DefaultWebSecurityManager defaultWebSecurityManager(@Qualifier("userRealm") UserRealm userRealm) {
        DefaultWebSecurityManager defaultWebSecurityManager = new DefaultWebSecurityManager();
        defaultWebSecurityManager.setRealm(userRealm);
        defaultWebSecurityManager.setRememberMeManager(null);
        return defaultWebSecurityManager;
    }

    @Bean(name = "userRealm")
    public UserRealm userRealm() {
        return new UserRealm();
    }


}

