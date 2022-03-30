package com.yzq.transfer.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * @author yanni
 * @date time 2022/3/30 19:35
 * @modified By:
 */
@RestController
@RequestMapping("/my")
public class MyController {

    /**
     * 保存
     * 用map接收
     * api使用: http://localhost:9400/my/save
     * <pre>
     *     <code>
     *         {
     *   "additionalProp1": "string",
     *   "additionalProp2": "string",
     *   "additionalProp3": "string"
     * }
     *     </code>
     * </pre>
     * @param map 地图
     * @return {@link Map}<{@link String}, {@link String}>
     */
    @PostMapping("/save")
    public Map<String, String> save(@RequestBody Map<String,String> map) {
       return map;
    }
}
