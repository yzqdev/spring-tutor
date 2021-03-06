package spring.security.jwt.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.filter.CorsFilter;
import org.zalando.problem.spring.web.advice.security.SecurityProblemSupport;
import spring.security.jwt.constant.SecurityConstants;

import javax.annotation.Resource;

import static spring.security.jwt.config.security.MyCustomDsl.customDsl;

/**
 * Web 安全配置
 *
 * @author star
 **/
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@Import(SecurityProblemSupport.class)
public class SecurityConfiguration  {

    @Resource
    private CorsFilter corsFilter;

    @Resource
    private SecurityProblemSupport securityProblemSupport;

    /**
     * 使用 Spring Security 推荐的加密方式进行登录密码的加密
     */
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

    /**
     * 此方法配置的资源路径不会进入 Spring Security 机制进行验证
     */
    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
      return  web->  web.ignoring()
                .antMatchers(HttpMethod.OPTIONS, "/**")
                .antMatchers("/app/**/*.{js,html}")
                .antMatchers("/v3/api-docs/**")
                .antMatchers("/i18n/**")
                .antMatchers("/test/**")
                .antMatchers("/h2")
                .antMatchers("/content/**")
                .antMatchers("/swagger-ui/**")
                .antMatchers("/swagger-resources/**")
                .antMatchers("/swagger-ui.html");
    }

    /**
     * 定义安全策略，设置 HTTP 访问规则
     */
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .addFilterBefore(corsFilter, UsernamePasswordAuthenticationFilter.class)
                .exceptionHandling()
                // 当用户无权访问资源时发送 401 响应
                .authenticationEntryPoint(new HttpStatusEntryPoint(HttpStatus.UNAUTHORIZED))
                // 当用户访问资源因权限不足时发送 403 响应
                .accessDeniedHandler(securityProblemSupport);

                // 禁用 CSRF
               http .csrf().disable()
                .headers().frameOptions().disable()
             .and()
                .logout().logoutUrl("/auth/logout").and()
                .authorizeRequests()
                 // 指定路径下的资源需要进行验证后才能访问
                .antMatchers("/").permitAll()
                // 配置登录地址
                .antMatchers(HttpMethod.POST, SecurityConstants.AUTH_LOGIN_URL).permitAll()
                .antMatchers(HttpMethod.POST,"/api/user/reg").permitAll()
                // 其他请求需验证
                .anyRequest().authenticated()
             .and()
                // 不需要 session（不创建会话）
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
             .and()
               .apply(customDsl());
        return http.build();

    }


}
