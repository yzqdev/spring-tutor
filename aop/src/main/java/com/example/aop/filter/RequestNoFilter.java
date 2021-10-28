
package com.example.aop.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;


/**
 * 对请求生成唯一编码
 *
 * @author stylefeng
 * @date 2020/6/21 10:04
 */
public class RequestNoFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            // 生成唯一请求号uuid
            String requestNo = UUID.randomUUID().toString();

            // 增加响应头的请求号
            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
            httpServletResponse.addHeader("Request-No", requestNo);

            // 临时存储


            // 放开请求
            chain.doFilter(request, response);

        }  catch (Exception e){
            e.printStackTrace();
        }

    }

}