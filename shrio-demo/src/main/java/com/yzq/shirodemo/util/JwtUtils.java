package com.yzq.shirodemo.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.InvalidClaimException;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.exceptions.TokenExpiredException;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.yzq.shirodemo.constant.SecurityConstants;
import com.yzq.shirodemo.constant.UserRoleConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.util.*;
import java.util.stream.Collectors;

/**
 * Jwt 工具类，用于生成、解析与验证 token
 *
 * @author star
 **/
public class JwtUtils {

    private static final Logger logger = LoggerFactory.getLogger(JwtUtils.class);
 private static final String jwtSecretKey =  SecurityConstants.JWT_SECRET_KEY ;

    private JwtUtils() {
        throw new IllegalStateException("Cannot create instance of static util class");
    }

    /**
     * 根据用户名和用户角色生成 token
     *
     * @param userName   用户名
     * @param roles      用户角色
     * @param isRemember 是否记住我
     * @return 返回生成的 token
     */
    public static String generateToken(String userName, List<String> roles, boolean isRemember) {

        // 过期时间
        long expiration = isRemember ? SecurityConstants.EXPIRATION_REMEMBER_TIME : SecurityConstants.EXPIRATION_TIME;
        // 生成 token
        return JWT.create()
                // 生成签证信息
                //.setHeaderParam("typ", SecurityConstants.TOKEN_TYPE)
                .withSubject(userName)
                .withClaim(SecurityConstants.TOKEN_ROLE_CLAIM, roles)
                .withIssuer(SecurityConstants.TOKEN_ISSUER)
                .withIssuedAt(new Date())
                .withAudience(SecurityConstants.TOKEN_AUDIENCE)
                // 设置有效时间
                .withExpiresAt(new Date(System.currentTimeMillis() + expiration * 1000))
                .sign( Algorithm.HMAC256(jwtSecretKey));
    }

    /**
     * 验证 token 是否有效
     *
     * <p>
     * 如果解析失败，说明 token 是无效的
     *
     * @param token token 信息
     * @return 如果返回 true，说明 token 有效
     */
    public static boolean validateToken(String token) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(jwtSecretKey);
            JWTVerifier verifier = JWT.require(algorithm).build();
            DecodedJWT jwt = verifier.verify(token);
            return true;

        } catch (TokenExpiredException e) {
            logger.warn("Request to parse expired JWT : {} failed : {}", token, e.getMessage());
        } catch (InvalidClaimException e) {
            logger.warn("Request to parse unsupported JWT : {} failed : {}", token, e.getMessage());
        } catch (JWTDecodeException
                e) {
            logger.warn("Request to parse invalid JWT : {} failed : {}", token, e.getMessage());
        } catch (IllegalArgumentException e) {
            logger.warn("Request to parse empty or null JWT : {} failed : {}", token, e.getMessage());
        }
        return false;
    }




}
