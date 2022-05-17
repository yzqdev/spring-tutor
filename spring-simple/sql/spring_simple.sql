/*
 Navicat Premium Data Transfer

 Source Server         : localpg
 Source Server Type    : PostgreSQL
 Source Server Version : 140002
 Source Host           : localhost:5432
 Source Catalog        : spring_simple
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140002
 File Encoding         : 65001

 Date: 17/05/2022 08:29:54
*/


-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS "public"."cate";
CREATE TABLE "public"."cate" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "pid" int4 NOT NULL,
  "intro" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of cate
-- ----------------------------
INSERT INTO "public"."cate" VALUES (1, '博客文章', 0, 'article');
INSERT INTO "public"."cate" VALUES (3, '学习笔记', 0, 'learn');
INSERT INTO "public"."cate" VALUES (4, '动态网站', 0, 'goweb');
INSERT INTO "public"."cate" VALUES (5, 'python', 0, 'python');
INSERT INTO "public"."cate" VALUES (6, 'javascript', 0, 'javascript');

-- ----------------------------
-- Table structure for opts
-- ----------------------------
DROP TABLE IF EXISTS "public"."opts";
CREATE TABLE "public"."opts" (
  "key" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(2048) COLLATE "pg_catalog"."default" NOT NULL,
  "intro" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(32) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of opts
-- ----------------------------
INSERT INTO "public"."opts" VALUES ('analytic', '<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script> ', '统计代码，可以添加百度统计、Google 统计等', NULL);
INSERT INTO "public"."opts" VALUES ('auto_summary', '0', '', NULL);
INSERT INTO "public"."opts" VALUES ('comment', '{"clientID": "clientIDValue","clientSecret": "clientSecretValue","repo": "repoValue","owner": "zxysilentValue","admin":["adminValue"],"distractionFreeMode":true,"githubUserName":"githubUserNameValue","使用说明":"https://github.com/gitalk/gitalk"}', '评论类型', NULL);
INSERT INTO "public"."opts" VALUES ('custom_js', 'console.log("https://blog.zxysilent.com")', '自定义js', NULL);
INSERT INTO "public"."opts" VALUES ('introription', 'zxysilent;zxysilent blog;zxyslt;zxyslt blog;', '网站描述', NULL);
INSERT INTO "public"."opts" VALUES ('favicon_url', '/favicon.ico', 'favicon', NULL);
INSERT INTO "public"."opts" VALUES ('github_url', 'https://github.com/zxysilent', 'GitHub 地址', NULL);
INSERT INTO "public"."opts" VALUES ('keywords', 'zxysilent,zxyslt,zxy', '网站关键字', NULL);
INSERT INTO "public"."opts" VALUES ('logo_url', '/static/logo.png', 'logo 地址', NULL);
INSERT INTO "public"."opts" VALUES ('miitbeian', '蜀ICP备16011344号-2', '网站备案号', NULL);
INSERT INTO "public"."opts" VALUES ('page_size', '6', '文章一页显示的条数', NULL);
INSERT INTO "public"."opts" VALUES ('site_url', 'https://blog.zxysilent.com', '网站地址', NULL);
INSERT INTO "public"."opts" VALUES ('title', 'zxysilent', '网站标题', NULL);
INSERT INTO "public"."opts" VALUES ('weibo_url', 'https://weibo.com/u/2909680165', '微博地址', NULL);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS "public"."post";
CREATE TABLE "public"."post" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "cate_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "type" int2 NOT NULL,
  "status" int2 NOT NULL,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "summary" text COLLATE "pg_catalog"."default" NOT NULL,
  "markdown_content" text COLLATE "pg_catalog"."default" NOT NULL,
  "content" text COLLATE "pg_catalog"."default" NOT NULL,
  "allow_comment" int2 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6) NOT NULL,
  "is_public" int2 NOT NULL,
  "comment_num" int4 NOT NULL,
  "options" varchar(4096) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."post"."type" IS '0 为文章，1 为页面';
COMMENT ON COLUMN "public"."post"."status" IS '0 为草稿，1 为待审核，2 为已拒绝，3 为已经发布';
COMMENT ON COLUMN "public"."post"."path" IS 'URL 的 pathname';
COMMENT ON COLUMN "public"."post"."summary" IS '摘要';
COMMENT ON COLUMN "public"."post"."allow_comment" IS '1 为允许， 0 为不允许';
COMMENT ON COLUMN "public"."post"."is_public" IS '1 为公开，0 为不公开';
COMMENT ON COLUMN "public"."post"."options" IS '一些选项，JSON 结构';

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO "public"."post" VALUES ('1', '1', '1', 0, 3, '本站点部署', 'one', '<p><strong>第一次部署</strong></p>
<p>nginx代理8360
直接访问<a href="http://blog.zxysilent.com">http://blog.zxysilent.com</a>
导致nginx崩溃,浏览器显示链接被重置。
一直找不到原因。</p>
<hr>
<p><strong>重新来过</strong></p>
<p>表示没有问题。</p>
', '**第一次部署**

nginx代理8360
直接访问[http://blog.zxysilent.com](http://blog.zxysilent.com)
导致nginx崩溃,浏览器显示链接被重置。
一直找不到原因。

----------
**重新来过**

表示没有问题。
<!--more-->
使用pm2守护
在windows平台使用 bat,vbs实现自启动

```
//.bat
pm2 startOrReload pm2.json
```

```
//.vbs
set wscriptObj = CreateObject("Wscript.Shell")
wscriptObj.run "zblog.bat",0

```
 之前也有个个人网站，那个时候租了upftp的主机和数据库。上线了一段没有续费，然后数据就被删了。一晃差不多两年去了，有幸可以控制一台很棒的服务器。一直比较关注nodejs&thinkjs 就在服务器上配置了node环境安装了博客系统。', '<div class="toc"></div><p><strong>第一次部署</strong></p>
<p>nginx代理8360
直接访问<a href="http://blog.zxysilent.com">http://blog.zxysilent.com</a>
导致nginx崩溃,浏览器显示链接被重置。
一直找不到原因。</p>
<hr>
<p><strong>重新来过</strong></p>
<p>表示没有问题。
<!--more-->
使用pm2守护
在windows平台使用 bat,vbs实现自启动</p>
<pre><code class="hljs lang-stylus"><span class="hljs-comment">//.bat</span>
pm2 startOrReload pm2<span class="hljs-selector-class">.json</span>
</code></pre><pre><code class="hljs lang-gams"><span class="hljs-comment">//.vbs</span>
<span class="hljs-keyword">set</span> wscriptObj <span class="hljs-comment">= CreateObject(</span><span class="hljs-comment">"Wscript.Shell"</span><span class="hljs-comment">)</span>
wscriptObj.run <span class="hljs-comment">"zblog.bat"</span><span class="hljs-comment">,0</span>
</code></pre><p> 之前也有个个人网站，那个时候租了upftp的主机和数据库。上线了一段没有续费，然后数据就被删了。一晃差不多两年去了，有幸可以控制一台很棒的服务器。一直比较关注nodejs&amp;thinkjs 就在服务器上配置了node环境安装了博客系统。</p>
', 0, '2017-04-07 10:08:03', '2017-09-04 11:34:02', 1, 0, '"{\"template\":\"\",\"push_sites\":[]}"');
INSERT INTO "public"."post" VALUES ('10', '1', '1', 0, 3, '环境搭建', 'teach-site-go-evn', '<h3 id="go-">go 下载</h3>
<ul>
<li>下载地址
<a href="http://www.golangtc.com/">Golang中国社区</a>   <blockquote>
<p><img src="https://blog.zxysilent.com\static\upload\20170409\malpaeScfiXkzH4TqlHmrrVx.png" alt="alt"></p>
</blockquote>
</li>
</ul>
', '### go 下载
* 下载地址
[Golang中国社区](http://www.golangtc.com/)   
>![alt](https://blog.zxysilent.com\static\upload\20170409\malpaeScfiXkzH4TqlHmrrVx.png)
<!--more-->
>![alt](https://blog.zxysilent.com\static\upload\20170409\ctsYwz9cDvWVHHA8NXBvXGsv.png)  

* 安装   

* 环境配置  
 * GOROOT  
 go 的安装路径  
比如：`D:\Program Files\Go\`
 * GOPATh  
你的工作路径 
比如：`D:\Appdata\Go\`  

### IDE
* 下载地址
[Golang中国社区](http://www.golangtc.com/)   
>![alt](https://blog.zxysilent.com\static\upload\20170409\48thZc_ERWtW7Up0XaEZnU0F.png)
>![alt](http://blog.zxysilent.com\static\upload\20170409\Z7ZCT9raRP_V88GDRgL46AII.png)

### Git
* 下载地址
[Git -Downloads](https://git-scm.com/downloads)

> 用来方便安装 go package
', '<div class="toc"><ul>
<li><a href="#toc-18b">go 下载</a></li>
<li><a href="#ide">IDE</a></li>
<li><a href="#git">Git</a></li>
</ul>
</div><h3><a id="toc-18b" class="anchor" href="#toc-18b"></a>go 下载</h3>
<ul>
<li><p>下载地址
<a href="http://www.golangtc.com/">Golang中国社区</a>   </p>
<blockquote>
<p><img src="https://blog.zxysilent.com\static\upload\20170409\malpaeScfiXkzH4TqlHmrrVx.png" alt="alt"></p>
<!--more-->
<p><img src="https://blog.zxysilent.com\static\upload\20170409\ctsYwz9cDvWVHHA8NXBvXGsv.png" alt="alt">  </p>
</blockquote>
</li>
<li><p>安装   </p>
</li>
<li><p>环境配置  </p>
<ul>
<li>GOROOT<br>go 的安装路径<br>比如：<code>D:\Program Files\Go\</code></li>
<li>GOPATh<br>你的工作路径 
比如：<code>D:\Appdata\Go\</code>  </li>
</ul>
</li>
</ul>
<h3><a id="ide" class="anchor" href="#ide"></a>IDE</h3>
<ul>
<li>下载地址
<a href="http://www.golangtc.com/">Golang中国社区</a>   <blockquote>
<p><img src="https://blog.zxysilent.com\static\upload\20170409\48thZc_ERWtW7Up0XaEZnU0F.png" alt="alt">
<img src="http://blog.zxysilent.com\static\upload\20170409\Z7ZCT9raRP_V88GDRgL46AII.png" alt="alt"></p>
</blockquote>
</li>
</ul>
<h3><a id="git" class="anchor" href="#git"></a>Git</h3>
<ul>
<li>下载地址
<a href="https://git-scm.com/downloads">Git -Downloads</a></li>
</ul>
<blockquote>
<p>用来方便安装 go package</p>
</blockquote>
', 1, '2017-04-09 10:30:59', '2017-11-04 11:56:28', 1, 0, '{"template":"","push_sites":[],"featuredImage":"https://blog.zxysilent.com/static/upload/20170409/ctsYwz9cDvWVHHA8NXBvXGsv.png"}');
INSERT INTO "public"."post" VALUES ('13', '3', '1', 0, 3, 'nginx参数', 'nginx', '<h2 id="-cmd">基础cmd</h2>
<pre><code class="hljs lang-nginx"><span class="hljs-attribute">sudo</span> nginx <span class="hljs-comment">#打开 nginx</span>
nginx -s reload|reopen|stop|quit  <span class="hljs-comment">#重新加载配置|重启|停止|退出 nginx</span>
nginx -t   <span class="hljs-comment">#测试配置是否有语法错误</span>
nginx [-?hvVtq] [-s signal] [-c filename] [-p prefix] [-g directives]

-?,-h           : 打开帮助信息
-v              : 显示版本信息并退出
-V              : 显示版本和配置选项信息，然后退出
-t              : 检测配置文件是否有语法错误，然后退出
-q              : 在检测配置文件期间屏蔽非错误信息
-s signal       : 给一个 nginx 主进程发送信号：stop（停止）, quit（退出）, reopen（重启）, reload（重新加载配置文件）
-p prefix       : 设置前缀路径
-c filename     : 设置配置文件
-g directives   : 设置配置文件外的全局指令
</code></pre>
', '## 基础cmd

```nginx
sudo nginx #打开 nginx
nginx -s reload|reopen|stop|quit  #重新加载配置|重启|停止|退出 nginx
nginx -t   #测试配置是否有语法错误
nginx [-?hvVtq] [-s signal] [-c filename] [-p prefix] [-g directives]

-?,-h           : 打开帮助信息
-v              : 显示版本信息并退出
-V              : 显示版本和配置选项信息，然后退出
-t              : 检测配置文件是否有语法错误，然后退出
-q              : 在检测配置文件期间屏蔽非错误信息
-s signal       : 给一个 nginx 主进程发送信号：stop（停止）, quit（退出）, reopen（重启）, reload（重新加载配置文件）
-p prefix       : 设置前缀路径
-c filename     : 设置配置文件
-g directives   : 设置配置文件外的全局指令
```
<!--more-->

## 配置文件 
`main`  全局设置  
 main部分设置的指令将影响其它所有部分的设置；  
`server`  主机设置  
server部分的指令主要用于指定虚拟主机域名、IP和端口；  
`upstream`  上游服务器设置，主要为反向代理、负载均衡相关配置  
upstream的指令用于设置一系列的后端服务器，设置反向代理及后端服务器的负载均衡；  
`location`  URL匹配特定位置后的设置   
location部分用于匹配网页位置（比如，根目录“/”,“/images”,等等）  
> server继承main，location继承server；  
>upstream既不会继承指令也不会被继承。它有自己的特殊指令，不需要在其他地方的应用。

### 通用
下面的`nginx.conf`简单的实现nginx在前端做反向代理服务器的例子，处理js、png等静态文件，jsp等动态请求转发到其它服务器：

```
user  www www;
worker_processes  2;
error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;
pid        logs/nginx.pid;
events {
    use epoll;
    worker_connections  2048;
}
http {
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  ''$remote_addr - $remote_user [$time_local] "$request" ''
    #                  ''$status $body_bytes_sent "$http_referer" ''
    #                  ''"$http_user_agent" "$http_x_forwarded_for"'';

    #access_log  logs/access.log  main;
    sendfile        on;
    # tcp_nopush     on;
    keepalive_timeout  65;
  # gzip压缩功能设置
    gzip on;
    gzip_min_length 1k;
    gzip_buffers    4 16k;
    gzip_http_version 1.0;
    gzip_comp_level 6;
    gzip_types text/html text/plain text/css text/javascript application/json application/javascript application/x-javascript application/xml;
    gzip_vary on;
  # http_proxy 设置
    client_max_body_size   10m;
    client_body_buffer_size   128k;
    proxy_connect_timeout   75;
    proxy_send_timeout   75;
    proxy_read_timeout   75;
    proxy_buffer_size   4k;
    proxy_buffers   4 32k;
    proxy_busy_buffers_size   64k;
    proxy_temp_file_write_size  64k;
    proxy_temp_path   /usr/local/nginx/proxy_temp 1 2;
  # 设定负载均衡后台服务器列表 
    upstream  backend  { 
              #ip_hash; 
              server   192.168.10.110:8000 max_fails=2 fail_timeout=30s ;  
              server   192.168.10.100:8000 max_fails=2 fail_timeout=30s ;  
    }
  # 虚拟主机配置
    server {
        listen       80;
        server_name  itoatest.example.com;
        root   /apps/oaapp;
        charset utf-8;
        access_log  logs/host.access.log  main;
        #对 / 所有做负载均衡+反向代理
        location / {
            root   /apps/oaapp;
            index  index.jsp index.html index.htm;
            proxy_pass        http://backend;  
            proxy_redirect off;
            # 后端的Web服务器可以通过X-Forwarded-For获取用户真实IP
            proxy_set_header  Host  $host;
            proxy_set_header  X-Real-IP  $remote_addr;  
            proxy_set_header  X-Forwarded-For  $proxy_add_x_forwarded_for;
            proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
        }
        #静态文件，nginx自己处理，不去backend请求tomcat
        location  ~* /download/ {  
            root /apps/oa/fs;  
        }
        location ~ .*\.(gif|jpg|jpeg|bmp|png|ico|txt|js|css)$   
        {   
            root /apps/oaapp;   
            expires      7d; 
        }
        location /nginx_status {
            stub_status on;
            access_log off;
            allow 192.168.10.0/24;
            deny all;
        }
        location ~ ^/(WEB-INF)/ {   
            deny all;   
        }
        #error_page  404              /404.html;
        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
  ## 其它虚拟主机，server 指令开始
}
```
## 常用指令
### main全局配置
nginx在运行时与具体业务功能（比如http服务或者email服务代理）无关的一些参数，比如工作进程数，运行的身份等。    
- `woker_processes 2`
worker角色的工作进程的个数，master进程是接收并分配请求给worker处理。这个数值简单一点可以设置为cpu的核数如果开启了ssl和gzip更应该设置成与逻辑CPU数量一样甚至为2倍，可以减少I/O操作。如果nginx服务器还有其它服务，可以考虑适当减少。  
- `worker_connections 2048`
写在events部分。每一个worker进程能并发处理（发起）的最大连接数（包含与客户端或后端被代理服务器间等所有连接数）。nginx作为反向代理服务器，计算公式 `最大连接数 = worker_processes * worker_connections/4`，不能超过后面的`worker_rlimit_nofile`。当nginx作为http服务器时，计算公式里面是除以2。  
- `worker_rlimit_nofile 10240`
同时连接的数量,默认是没有设置，可以限制为操作系统最大的限制65535。  
- `use epoll`
写在events部分。在Linux操作系统下，nginx默认使用epoll事件模型,在操作系统不支持这些高效模型时才使用select。  

### http服务器  
与提供http服务相关的一些配置参数。例如：是否使用keepalive啊，是否使用gzip进行压缩等。  
- `sendfile on`  
开启高效文件传输模式，sendfile指令指定nginx是否调用sendfile函数来输出文件，减少用户空间到内核空间的上下文切换。对于普通应用设为 on，如果用来进行下载等应用磁盘IO重负载应用，可设置为off，以平衡磁盘与网络I/O处理速度，降低系统的负载。
- `keepalive_timeout 65` : 长连接超时时间，单位是秒，这个参数很敏感，涉及浏览器的种类、后端服务器的超时设置、操作系统的设置，可以另外起一片文章了。长连接请求大量小文件的时候，可以减少重建连接的开销，但假如有大文件上传，65s内没上传完成会导致失败。如果设置时间过长，用户又多，长时间保持连接会占用大量资源。  
- `send_timeout` : 用于指定响应客户端的超时时间。这个超时仅限于两个连接活动之间的时间，如果超过这个时间，客户端没有任何活动，Nginx将会关闭连接。
- `client_max_body_size 10m`
允许客户端请求的最大单文件字节数。如果有上传较大文件，请设置它的限制值  
- `client_body_buffer_size 128k`
缓冲区代理缓冲用户端请求的最大字节数  
#### http_proxy
- `proxy_connect_timeout 60`
nginx跟后端服务器连接超时时间(代理连接超时)
- `proxy_read_timeout 60`
连接成功后，与后端服务器两个成功的响应操作之间超时时间(代理接收超时)
- `proxy_buffer_size 4k`
设置代理服务器（nginx）从后端realserver读取并保存用户头信息的缓冲区大小，默认与proxy_buffers大小相同，其实可以将这个指令值设的小一点
- `proxy_buffers 4 32k`
proxy_buffers缓冲区，nginx针对单个连接缓存来自后端realserver的响应，网页平均在32k以下的话，这样设置
- `proxy_busy_buffers_size 64k`
高负荷下缓冲大小（proxy_buffers*2）  
- `proxy_max_temp_file_size`
当proxy_buffers放不下后端服务器的响应内容时，会将一部分保存到硬盘的临时文件中，这个值用来设置最大临时文件大小，默认1024M，它与proxy_cache没有关系。大于这个值，将从upstream服务器传回。设置为0禁用。
- `proxy_temp_file_write_size 64k`
当缓存被代理的服务器响应到临时文件时，这个选项限制每次写临时文件的大小。
- `proxy_pass`，proxy_redirect见 location 部分。
#### http_gzip
- `gzip on` : 开启gzip压缩输出，减少网络传输。
- `gzip_min_length 1k `： 设置允许压缩的页面最小字节数，页面字节数从header头得content-length中进行获取。默认值是20。建议设置成大于1k的字节数，小于1k可能会越压越大。  
- `gzip_buffers 4 16k `： 设置系统获取几个单位的缓存用于存储gzip的压缩结果数据流。4 16k代表以16k为单位，安装原始数据大小以16k为单位的4倍申请内存。  
- `gzip_http_version 1.0` ： 用于识别 http 协议的版本，早期的浏览器不支持 Gzip 压缩，用户就会看到乱码，所以为了支持前期版本加上了这个选项，如果你用了 Nginx 的反向代理并期望也启用 Gzip 压缩的话，由于末端通信是 http/1.0，故请设置为 1.0。  
- `gzip_comp_level 6` ： gzip压缩比，1压缩比最小处理速度最快，9压缩比最大但处理速度最慢(传输快但比较消耗cpu)  
- `gzip_types` ：匹配mime类型进行压缩，无论是否指定,”text/html”类型总是会被压缩的。  
- `gzip_proxied any` ： Nginx作为反向代理的时候启用，决定开启或者关闭后端服务器返回的结果是否压缩，匹配的前提是后端服务器必须要返回包含”Via”的 header头。  
- `gzip_vary on `： 和http头有关系，会在响应头加个 Vary: Accept-Encoding ，可以让前端的缓存服务器缓存经过gzip压缩的页面，例如，用Squid缓存经过Nginx压缩的数据。   
### server虚拟主机  
http服务上支持若干虚拟主机。
每个虚拟主机一个对应的server配置项，配置项里面包含该虚拟主机相关的配置。在提供mail服务的代理时，也可以建立若干server。每个server通过监听地址或端口来区分。  
`listen`
监听端口，默认80，小于1024的要以root启动。可以为listen *:80、listen 127.0.0.1:80等形式。  
`server_name`
服务器名，如`localhost`、`www.example.com`，可以通过正则匹配。

###  location  
http服务中，某些特定的URL对应的一系列配置项。    
`root /var/www/html`
定义服务器的默认网站根目录位置。如果locationURL匹配的是子目录或文件，root没什么作用，一般放在server指令里面或/下。    
`index index.jsp index.html index.htm`
定义路径下默认访问的文件名，一般跟着root放  
`proxy_pass http:/backend`
请求转向backend定义的服务器列表，即反向代理，对应upstream负载均衡器。也可以`proxy_pass http://ip:port`。 
```
proxy_redirect off;
proxy_set_header Host $host;
proxy_set_header X-Real-IP $remote_addr;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
```
代理客户端真实信息到后端  
### 其它  
#### 访问控制 allow/deny
Nginx 的访问控制模块默认就会安装，而且写法也非常简单，可以分别有多个allow,deny，允许或禁止某个ip或ip段访问，依次满足任何一个规则就停止往下匹配。如：
```
location /nginx-status {
  stub_status on;
  access_log off;
  allow 192.168.10.100;
  allow 172.29.73.0/24;
  deny all;
}
```
#### 列出目录 autoindex
Nginx默认是不允许列出整个目录的。  
如需此功能，打开nginx.conf文件，在location，server 或 http段中加入`autoindex on`;，另外两个参数最好也加上去:  
`autoindex_exact_size off`; 默认为on，显示出文件的确切大小，单位是bytes。改为off后，显示出文件的大概大小，单位是kB或者MB或者GB  
`autoindex_localtime on;`
默认为off，显示的文件时间为GMT时间。改为on后，显示的文件时间为文件的服务器时间  
```
location /images {
  root   /var/www/nginx-default/images;
  autoindex on;
  autoindex_exact_size off;
  autoindex_localtime on;
  }
```
', '<div class="toc"><ul>
<li><a href="#toc-0fa">基础cmd</a></li>
<li><a href="#toc-15c">配置文件</a><ul>
<li><a href="#toc-aa0">通用</a></li>
</ul>
</li>
<li><a href="#toc-390">常用指令</a><ul>
<li><a href="#toc-ef5">main全局配置</a></li>
<li><a href="#toc-6e1">http服务器</a><ul>
<li><a href="#http_proxy">http_proxy</a></li>
<li><a href="#http_gzip">http_gzip</a></li>
</ul>
</li>
<li><a href="#toc-bad">server虚拟主机</a></li>
<li><a href="#location">location</a></li>
<li><a href="#toc-5a0">其它</a><ul>
<li><a href="#toc-54a">访问控制 allow/deny</a></li>
<li><a href="#toc-b7d">列出目录 autoindex</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div><h2><a id="toc-0fa" class="anchor" href="#toc-0fa"></a>基础cmd</h2>
<pre><code class="hljs lang-nginx"><span class="hljs-attribute">sudo</span> nginx <span class="hljs-comment">#打开 nginx</span>
nginx -s reload|reopen|stop|quit  <span class="hljs-comment">#重新加载配置|重启|停止|退出 nginx</span>
nginx -t   <span class="hljs-comment">#测试配置是否有语法错误</span>
nginx [-?hvVtq] [-s signal] [-c filename] [-p prefix] [-g directives]

-?,-h           : 打开帮助信息
-v              : 显示版本信息并退出
-V              : 显示版本和配置选项信息，然后退出
-t              : 检测配置文件是否有语法错误，然后退出
-q              : 在检测配置文件期间屏蔽非错误信息
-s signal       : 给一个 nginx 主进程发送信号：stop（停止）, quit（退出）, reopen（重启）, reload（重新加载配置文件）
-p prefix       : 设置前缀路径
-c filename     : 设置配置文件
-g directives   : 设置配置文件外的全局指令
</code></pre>
<!--more-->
<h2><a id="toc-15c" class="anchor" href="#toc-15c"></a>配置文件</h2>
<p><code>main</code>  全局设置<br> main部分设置的指令将影响其它所有部分的设置；<br><code>server</code>  主机设置<br>server部分的指令主要用于指定虚拟主机域名、IP和端口；<br><code>upstream</code>  上游服务器设置，主要为反向代理、负载均衡相关配置<br>upstream的指令用于设置一系列的后端服务器，设置反向代理及后端服务器的负载均衡；<br><code>location</code>  URL匹配特定位置后的设置<br>location部分用于匹配网页位置（比如，根目录“/”,“/images”,等等）  </p>
<blockquote>
<p>server继承main，location继承server；<br>upstream既不会继承指令也不会被继承。它有自己的特殊指令，不需要在其他地方的应用。</p>
</blockquote>
<h3><a id="toc-aa0" class="anchor" href="#toc-aa0"></a>通用</h3>
<p>下面的<code>nginx.conf</code>简单的实现nginx在前端做反向代理服务器的例子，处理js、png等静态文件，jsp等动态请求转发到其它服务器：</p>
<pre><code class="hljs lang-nginx"><span class="hljs-attribute">user</span>  www www;
<span class="hljs-attribute">worker_processes</span>  <span class="hljs-number">2</span>;
<span class="hljs-attribute">error_log</span>  logs/error.log;
<span class="hljs-comment">#error_log  logs/error.log  notice;</span>
<span class="hljs-comment">#error_log  logs/error.log  info;</span>
<span class="hljs-attribute">pid</span>        logs/nginx.pid;
<span class="hljs-section">events</span> {
    <span class="hljs-attribute">use</span> <span class="hljs-literal">epoll</span>;
    <span class="hljs-attribute">worker_connections</span>  <span class="hljs-number">2048</span>;
}
<span class="hljs-section">http</span> {
    <span class="hljs-attribute">include</span>       mime.types;
    <span class="hljs-attribute">default_type</span>  application/octet-stream;

    <span class="hljs-comment">#log_format  main  ''$remote_addr - $remote_user [$time_local] "$request" ''</span>
    <span class="hljs-comment">#                  ''$status $body_bytes_sent "$http_referer" ''</span>
    <span class="hljs-comment">#                  ''"$http_user_agent" "$http_x_forwarded_for"'';</span>

    <span class="hljs-comment">#access_log  logs/access.log  main;</span>
    <span class="hljs-attribute">sendfile</span>        <span class="hljs-literal">on</span>;
    <span class="hljs-comment"># tcp_nopush     on;</span>
    <span class="hljs-attribute">keepalive_timeout</span>  <span class="hljs-number">65</span>;
  <span class="hljs-comment"># gzip压缩功能设置</span>
    <span class="hljs-attribute">gzip</span> <span class="hljs-literal">on</span>;
    <span class="hljs-attribute">gzip_min_length</span> <span class="hljs-number">1k</span>;
    <span class="hljs-attribute">gzip_buffers</span>    <span class="hljs-number">4</span> <span class="hljs-number">16k</span>;
    <span class="hljs-attribute">gzip_http_version</span> <span class="hljs-number">1</span>.<span class="hljs-number">0</span>;
    <span class="hljs-attribute">gzip_comp_level</span> <span class="hljs-number">6</span>;
    <span class="hljs-attribute">gzip_types</span> text/html text/plain text/css text/javascript application/json application/javascript application/x-javascript application/xml;
    <span class="hljs-attribute">gzip_vary</span> <span class="hljs-literal">on</span>;
  <span class="hljs-comment"># http_proxy 设置</span>
    <span class="hljs-attribute">client_max_body_size</span>   <span class="hljs-number">10m</span>;
    <span class="hljs-attribute">client_body_buffer_size</span>   <span class="hljs-number">128k</span>;
    <span class="hljs-attribute">proxy_connect_timeout</span>   <span class="hljs-number">75</span>;
    <span class="hljs-attribute">proxy_send_timeout</span>   <span class="hljs-number">75</span>;
    <span class="hljs-attribute">proxy_read_timeout</span>   <span class="hljs-number">75</span>;
    <span class="hljs-attribute">proxy_buffer_size</span>   <span class="hljs-number">4k</span>;
    <span class="hljs-attribute">proxy_buffers</span>   <span class="hljs-number">4</span> <span class="hljs-number">32k</span>;
    <span class="hljs-attribute">proxy_busy_buffers_size</span>   <span class="hljs-number">64k</span>;
    <span class="hljs-attribute">proxy_temp_file_write_size</span>  <span class="hljs-number">64k</span>;
    <span class="hljs-attribute">proxy_temp_path</span>   /usr/local/nginx/proxy_temp <span class="hljs-number">1</span> <span class="hljs-number">2</span>;
  <span class="hljs-comment"># 设定负载均衡后台服务器列表 </span>
    <span class="hljs-attribute">upstream</span>  backend  { 
              <span class="hljs-comment">#ip_hash; </span>
              <span class="hljs-attribute">server</span>   <span class="hljs-number">192.168.10.110:8000</span> max_fails=<span class="hljs-number">2</span> fail_timeout=<span class="hljs-number">30s</span> ;  
              <span class="hljs-attribute">server</span>   <span class="hljs-number">192.168.10.100:8000</span> max_fails=<span class="hljs-number">2</span> fail_timeout=<span class="hljs-number">30s</span> ;  
    }
  <span class="hljs-comment"># 虚拟主机配置</span>
    <span class="hljs-section">server</span> {
        <span class="hljs-attribute">listen</span>       <span class="hljs-number">80</span>;
        <span class="hljs-attribute">server_name</span>  itoatest.example.com;
        <span class="hljs-attribute">root</span>   /apps/oaapp;
        <span class="hljs-attribute">charset</span> utf-<span class="hljs-number">8</span>;
        <span class="hljs-attribute">access_log</span>  logs/host.access.log  main;
        <span class="hljs-comment">#对 / 所有做负载均衡+反向代理</span>
        <span class="hljs-attribute">location</span> / {
            <span class="hljs-attribute">root</span>   /apps/oaapp;
            <span class="hljs-attribute">index</span>  index.jsp index.html index.htm;
            <span class="hljs-attribute">proxy_pass</span>        http://backend;  
            <span class="hljs-attribute">proxy_redirect</span> <span class="hljs-literal">off</span>;
            <span class="hljs-comment"># 后端的Web服务器可以通过X-Forwarded-For获取用户真实IP</span>
            <span class="hljs-attribute">proxy_set_header</span>  Host  <span class="hljs-variable">$host</span>;
            <span class="hljs-attribute">proxy_set_header</span>  X-Real-IP  <span class="hljs-variable">$remote_addr</span>;  
            <span class="hljs-attribute">proxy_set_header</span>  X-Forwarded-For  <span class="hljs-variable">$proxy_add_x_forwarded_for</span>;
            <span class="hljs-attribute">proxy_next_upstream</span> <span class="hljs-literal">error</span> timeout invalid_header http_500 http_502 http_503 http_504;
        }
        <span class="hljs-comment">#静态文件，nginx自己处理，不去backend请求tomcat</span>
        <span class="hljs-attribute">location</span>  <span class="hljs-regexp">~* /download/</span> {  
            <span class="hljs-attribute">root</span> /apps/oa/fs;  
        }
        <span class="hljs-attribute">location</span> <span class="hljs-regexp">~ .*\.(gif|jpg|jpeg|bmp|png|ico|txt|js|css)$</span>   
        {   
            <span class="hljs-attribute">root</span> /apps/oaapp;   
            <span class="hljs-attribute">expires</span>      <span class="hljs-number">7d</span>; 
        }
        <span class="hljs-attribute">location</span> /nginx_status {
            <span class="hljs-attribute">stub_status</span> <span class="hljs-literal">on</span>;
            <span class="hljs-attribute">access_log</span> <span class="hljs-literal">off</span>;
            <span class="hljs-attribute">allow</span> <span class="hljs-number">192.168.10.0</span>/<span class="hljs-number">24</span>;
            <span class="hljs-attribute">deny</span> all;
        }
        <span class="hljs-attribute">location</span> <span class="hljs-regexp">~ ^/(WEB-INF)/</span> {   
            <span class="hljs-attribute">deny</span> all;   
        }
        <span class="hljs-comment">#error_page  404              /404.html;</span>
        <span class="hljs-comment"># redirect server error pages to the static page /50x.html</span>
        <span class="hljs-comment">#</span>
        <span class="hljs-attribute">error_page</span>   <span class="hljs-number">500</span> <span class="hljs-number">502</span> <span class="hljs-number">503</span> <span class="hljs-number">504</span>  /50x.html;
        <span class="hljs-attribute">location</span> = /50x.html {
            <span class="hljs-attribute">root</span>   html;
        }
    }
  <span class="hljs-comment">## 其它虚拟主机，server 指令开始</span>
}
</code></pre><h2><a id="toc-390" class="anchor" href="#toc-390"></a>常用指令</h2>
<h3><a id="toc-ef5" class="anchor" href="#toc-ef5"></a>main全局配置</h3>
<p>nginx在运行时与具体业务功能（比如http服务或者email服务代理）无关的一些参数，比如工作进程数，运行的身份等。    </p>
<ul>
<li><code>woker_processes 2</code>
worker角色的工作进程的个数，master进程是接收并分配请求给worker处理。这个数值简单一点可以设置为cpu的核数如果开启了ssl和gzip更应该设置成与逻辑CPU数量一样甚至为2倍，可以减少I/O操作。如果nginx服务器还有其它服务，可以考虑适当减少。  </li>
<li><code>worker_connections 2048</code>
写在events部分。每一个worker进程能并发处理（发起）的最大连接数（包含与客户端或后端被代理服务器间等所有连接数）。nginx作为反向代理服务器，计算公式 <code>最大连接数 = worker_processes * worker_connections/4</code>，不能超过后面的<code>worker_rlimit_nofile</code>。当nginx作为http服务器时，计算公式里面是除以2。  </li>
<li><code>worker_rlimit_nofile 10240</code>
同时连接的数量,默认是没有设置，可以限制为操作系统最大的限制65535。  </li>
<li><code>use epoll</code>
写在events部分。在Linux操作系统下，nginx默认使用epoll事件模型,在操作系统不支持这些高效模型时才使用select。  </li>
</ul>
<h3><a id="toc-6e1" class="anchor" href="#toc-6e1"></a>http服务器</h3>
<p>与提供http服务相关的一些配置参数。例如：是否使用keepalive啊，是否使用gzip进行压缩等。  </p>
<ul>
<li><code>sendfile on</code><br>开启高效文件传输模式，sendfile指令指定nginx是否调用sendfile函数来输出文件，减少用户空间到内核空间的上下文切换。对于普通应用设为 on，如果用来进行下载等应用磁盘IO重负载应用，可设置为off，以平衡磁盘与网络I/O处理速度，降低系统的负载。</li>
<li><code>keepalive_timeout 65</code> : 长连接超时时间，单位是秒，这个参数很敏感，涉及浏览器的种类、后端服务器的超时设置、操作系统的设置，可以另外起一片文章了。长连接请求大量小文件的时候，可以减少重建连接的开销，但假如有大文件上传，65s内没上传完成会导致失败。如果设置时间过长，用户又多，长时间保持连接会占用大量资源。  </li>
<li><code>send_timeout</code> : 用于指定响应客户端的超时时间。这个超时仅限于两个连接活动之间的时间，如果超过这个时间，客户端没有任何活动，Nginx将会关闭连接。</li>
<li><code>client_max_body_size 10m</code>
允许客户端请求的最大单文件字节数。如果有上传较大文件，请设置它的限制值  </li>
<li><code>client_body_buffer_size 128k</code>
缓冲区代理缓冲用户端请求的最大字节数  <h4><a id="http_proxy" class="anchor" href="#http_proxy"></a>http_proxy</h4>
</li>
<li><code>proxy_connect_timeout 60</code>
nginx跟后端服务器连接超时时间(代理连接超时)</li>
<li><code>proxy_read_timeout 60</code>
连接成功后，与后端服务器两个成功的响应操作之间超时时间(代理接收超时)</li>
<li><code>proxy_buffer_size 4k</code>
设置代理服务器（nginx）从后端realserver读取并保存用户头信息的缓冲区大小，默认与proxy_buffers大小相同，其实可以将这个指令值设的小一点</li>
<li><code>proxy_buffers 4 32k</code>
proxy_buffers缓冲区，nginx针对单个连接缓存来自后端realserver的响应，网页平均在32k以下的话，这样设置</li>
<li><code>proxy_busy_buffers_size 64k</code>
高负荷下缓冲大小（proxy_buffers*2）  </li>
<li><code>proxy_max_temp_file_size</code>
当proxy_buffers放不下后端服务器的响应内容时，会将一部分保存到硬盘的临时文件中，这个值用来设置最大临时文件大小，默认1024M，它与proxy_cache没有关系。大于这个值，将从upstream服务器传回。设置为0禁用。</li>
<li><code>proxy_temp_file_write_size 64k</code>
当缓存被代理的服务器响应到临时文件时，这个选项限制每次写临时文件的大小。</li>
<li><code>proxy_pass</code>，proxy_redirect见 location 部分。<h4><a id="http_gzip" class="anchor" href="#http_gzip"></a>http_gzip</h4>
</li>
<li><code>gzip on</code> : 开启gzip压缩输出，减少网络传输。</li>
<li><code>gzip_min_length 1k</code>： 设置允许压缩的页面最小字节数，页面字节数从header头得content-length中进行获取。默认值是20。建议设置成大于1k的字节数，小于1k可能会越压越大。  </li>
<li><code>gzip_buffers 4 16k</code>： 设置系统获取几个单位的缓存用于存储gzip的压缩结果数据流。4 16k代表以16k为单位，安装原始数据大小以16k为单位的4倍申请内存。  </li>
<li><code>gzip_http_version 1.0</code> ： 用于识别 http 协议的版本，早期的浏览器不支持 Gzip 压缩，用户就会看到乱码，所以为了支持前期版本加上了这个选项，如果你用了 Nginx 的反向代理并期望也启用 Gzip 压缩的话，由于末端通信是 http/1.0，故请设置为 1.0。  </li>
<li><code>gzip_comp_level 6</code> ： gzip压缩比，1压缩比最小处理速度最快，9压缩比最大但处理速度最慢(传输快但比较消耗cpu)  </li>
<li><code>gzip_types</code> ：匹配mime类型进行压缩，无论是否指定,”text/html”类型总是会被压缩的。  </li>
<li><code>gzip_proxied any</code> ： Nginx作为反向代理的时候启用，决定开启或者关闭后端服务器返回的结果是否压缩，匹配的前提是后端服务器必须要返回包含”Via”的 header头。  </li>
<li><code>gzip_vary on</code>： 和http头有关系，会在响应头加个 Vary: Accept-Encoding ，可以让前端的缓存服务器缓存经过gzip压缩的页面，例如，用Squid缓存经过Nginx压缩的数据。   <h3><a id="toc-bad" class="anchor" href="#toc-bad"></a>server虚拟主机</h3>
http服务上支持若干虚拟主机。
每个虚拟主机一个对应的server配置项，配置项里面包含该虚拟主机相关的配置。在提供mail服务的代理时，也可以建立若干server。每个server通过监听地址或端口来区分。<br><code>listen</code>
监听端口，默认80，小于1024的要以root启动。可以为listen *:80、listen 127.0.0.1:80等形式。<br><code>server_name</code>
服务器名，如<code>localhost</code>、<code>www.example.com</code>，可以通过正则匹配。</li>
</ul>
<h3><a id="location" class="anchor" href="#location"></a>location</h3>
<p>http服务中，某些特定的URL对应的一系列配置项。<br><code>root /var/www/html</code>
定义服务器的默认网站根目录位置。如果locationURL匹配的是子目录或文件，root没什么作用，一般放在server指令里面或/下。<br><code>index index.jsp index.html index.htm</code>
定义路径下默认访问的文件名，一般跟着root放<br><code>proxy_pass http:/backend</code>
请求转向backend定义的服务器列表，即反向代理，对应upstream负载均衡器。也可以<code>proxy_pass http://ip:port</code>。 </p>
<pre><code class="hljs lang-nginx"><span class="hljs-attribute">proxy_redirect</span> <span class="hljs-literal">off</span>;
<span class="hljs-attribute">proxy_set_header</span> Host <span class="hljs-variable">$host</span>;
<span class="hljs-attribute">proxy_set_header</span> X-Real-IP <span class="hljs-variable">$remote_addr</span>;
<span class="hljs-attribute">proxy_set_header</span> X-Forwarded-For <span class="hljs-variable">$proxy_add_x_forwarded_for</span>;
</code></pre><p>代理客户端真实信息到后端  </p>
<h3><a id="toc-5a0" class="anchor" href="#toc-5a0"></a>其它</h3>
<h4><a id="toc-54a" class="anchor" href="#toc-54a"></a>访问控制 allow/deny</h4>
<p>Nginx 的访问控制模块默认就会安装，而且写法也非常简单，可以分别有多个allow,deny，允许或禁止某个ip或ip段访问，依次满足任何一个规则就停止往下匹配。如：</p>
<pre><code class="hljs lang-nginx"><span class="hljs-attribute">location</span> /nginx-status {
  <span class="hljs-attribute">stub_status</span> <span class="hljs-literal">on</span>;
  <span class="hljs-attribute">access_log</span> <span class="hljs-literal">off</span>;
  <span class="hljs-attribute">allow</span> <span class="hljs-number">192.168.10.100</span>;
  <span class="hljs-attribute">allow</span> <span class="hljs-number">172.29.73.0</span>/<span class="hljs-number">24</span>;
  <span class="hljs-attribute">deny</span> all;
}
</code></pre><h4><a id="toc-b7d" class="anchor" href="#toc-b7d"></a>列出目录 autoindex</h4>
<p>Nginx默认是不允许列出整个目录的。<br>如需此功能，打开nginx.conf文件，在location，server 或 http段中加入<code>autoindex on</code>;，另外两个参数最好也加上去:<br><code>autoindex_exact_size off</code>; 默认为on，显示出文件的确切大小，单位是bytes。改为off后，显示出文件的大概大小，单位是kB或者MB或者GB<br><code>autoindex_localtime on;</code>
默认为off，显示的文件时间为GMT时间。改为on后，显示的文件时间为文件的服务器时间  </p>
<pre><code class="hljs lang-nginx"><span class="hljs-attribute">location</span> /images {
  <span class="hljs-attribute">root</span>   /var/www/nginx-default/images;
  <span class="hljs-attribute">autoindex</span> <span class="hljs-literal">on</span>;
  <span class="hljs-attribute">autoindex_exact_size</span> <span class="hljs-literal">off</span>;
  <span class="hljs-attribute">autoindex_localtime</span> <span class="hljs-literal">on</span>;
  }
</code></pre>', 1, '2017-04-10 21:41:17', '2018-07-13 11:32:09', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('14', '1', '1', 0, 3, 'beego环境搭建记录', 'beego-env', '<h3 id="-">课堂记录</h3>
<pre><code class="hljs lang-stylus"><span class="hljs-number">1</span>.安装 git
<span class="hljs-number">2</span><span class="hljs-selector-class">.win</span> + r =&gt;cmd
<span class="hljs-number">3</span><span class="hljs-selector-class">.go</span> get github.com/astaxie/beego
<span class="hljs-number">4</span><span class="hljs-selector-class">.go</span> get github.com/beego/bee
<span class="hljs-number">5</span>.添加环境变量 Path=&gt;GOPATH/bin
<span class="hljs-number">6</span>.在GOPATH/src 打开命令窗口(shift + 鼠标右键)
<span class="hljs-number">7</span><span class="hljs-selector-class">.bee</span> new 项目名称
<span class="hljs-number">8</span><span class="hljs-selector-class">.liteIDE</span> 打开项目
<span class="hljs-number">9</span>.双击main<span class="hljs-selector-class">.go</span> 点击 BR (build and run)
<span class="hljs-number">10</span>.浏览器打开输入 <span class="hljs-number">127.0</span>.<span class="hljs-number">0.1</span>:<span class="hljs-number">8080</span>
</code></pre>', '### 课堂记录
```
1.安装 git
2.win + r =>cmd
3.go get github.com/astaxie/beego
4.go get github.com/beego/bee
5.添加环境变量 Path=>GOPATH/bin
6.在GOPATH/src 打开命令窗口(shift + 鼠标右键)
7.bee new 项目名称
8.liteIDE 打开项目
9.双击main.go 点击 BR (build and run)
10.浏览器打开输入 127.0.0.1:8080
```
<!--more-->
![alt](/static/upload/20170412/oCssNW8RjNPl0VmcCRzAX1-w.png)
#### beego 官网
[beego](https://beego.me/)
### 安装beego
`go get github.com/astaxie/beego`  
** 若出现错误**  
请删除 `github.com/astaxie/beego `后重新运行下载
### 安装bee工具
`go get github.com/beego/bee`
> 安装成果后在`GOPATH/bin/`下会有bee.exe
> 添加当前bin目录到path环境变量   

###  测试结果
在`GOPATH/src/`下打开控制台(shift+鼠标右键)
运行 `bee new demo`  
*  LiteIDE打开当前创建项目目录
* 双击main.go 点击 BR(build and run)
* 浏览器输入 `127.0.0.1:8080`  
* 查看运行效果
![alt](/static/upload/20170412/fjA5-ulZlHHZpYVcIqgj2Y_D.png)', '<div class="toc"><ul>
<li><a href="#toc-739">课堂记录</a><ul>
<li><a href="#toc-1c2">beego 官网</a></li>
</ul>
</li>
<li><a href="#toc-7dc">安装beego</a></li>
<li><a href="#toc-59f">安装bee工具</a></li>
<li><a href="#toc-c6c">测试结果</a></li>
</ul>
</div><h3><a id="toc-739" class="anchor" href="#toc-739"></a>课堂记录</h3>
<pre><code class="hljs lang-stylus"><span class="hljs-number">1</span>.安装 git
<span class="hljs-number">2</span><span class="hljs-selector-class">.win</span> + r =&gt;cmd
<span class="hljs-number">3</span><span class="hljs-selector-class">.go</span> get github.com/astaxie/beego
<span class="hljs-number">4</span><span class="hljs-selector-class">.go</span> get github.com/beego/bee
<span class="hljs-number">5</span>.添加环境变量 Path=&gt;GOPATH/bin
<span class="hljs-number">6</span>.在GOPATH/src 打开命令窗口(shift + 鼠标右键)
<span class="hljs-number">7</span><span class="hljs-selector-class">.bee</span> new 项目名称
<span class="hljs-number">8</span><span class="hljs-selector-class">.liteIDE</span> 打开项目
<span class="hljs-number">9</span>.双击main<span class="hljs-selector-class">.go</span> 点击 BR (build and run)
<span class="hljs-number">10</span>.浏览器打开输入 <span class="hljs-number">127.0</span>.<span class="hljs-number">0.1</span>:<span class="hljs-number">8080</span>
</code></pre><!--more-->
<p><img src="/static/upload/20170412/oCssNW8RjNPl0VmcCRzAX1-w.png" alt="alt"></p>
<h4><a id="toc-1c2" class="anchor" href="#toc-1c2"></a>beego 官网</h4>
<p><a href="https://beego.me/">beego</a></p>
<h3><a id="toc-7dc" class="anchor" href="#toc-7dc"></a>安装beego</h3>
<p><code>go get github.com/astaxie/beego</code><br><strong> 若出现错误</strong><br>请删除 <code>github.com/astaxie/beego</code>后重新运行下载</p>
<h3><a id="toc-59f" class="anchor" href="#toc-59f"></a>安装bee工具</h3>
<p><code>go get github.com/beego/bee</code></p>
<blockquote>
<p>安装成果后在<code>GOPATH/bin/</code>下会有bee.exe
添加当前bin目录到path环境变量   </p>
</blockquote>
<h3><a id="toc-c6c" class="anchor" href="#toc-c6c"></a>测试结果</h3>
<p>在<code>GOPATH/src/</code>下打开控制台(shift+鼠标右键)
运行 <code>bee new demo</code>  </p>
<ul>
<li>LiteIDE打开当前创建项目目录</li>
<li>双击main.go 点击 BR(build and run)</li>
<li>浏览器输入 <code>127.0.0.1:8080</code>  </li>
<li>查看运行效果
<img src="/static/upload/20170412/fjA5-ulZlHHZpYVcIqgj2Y_D.png" alt="alt"></li>
</ul>
', 0, '2017-04-12 14:32:22', '2017-10-30 10:45:46', 1, 0, '"{\"template\":\"\",\"push_sites\":[]}"');
INSERT INTO "public"."post" VALUES ('15', '1', '1', 0, 3, '关闭WannaCry勒索病毒可能利用的端口（135 137 138 139 445）', 'close-port', '<h3 id="-">快速关闭办法</h3>
<ol>
<li>新建一个记事本文件  <strong> closePort.txt  </strong><br><img src="/static/upload/20170515/IQ2PN0uf1a_zVtTZv46OJP4y.png" alt="alt"></li>
<li>复制下面代码到txt文件中   </li>
</ol>
', '### 快速关闭办法
1.  新建一个记事本文件  ** closePort.txt  **  
![alt](/static/upload/20170515/IQ2PN0uf1a_zVtTZv46OJP4y.png)
2.  复制下面代码到txt文件中   
<!--more-->
代码
```
echo close-port & netsh firewall set opmode mode = enable & netsh advfirewall firewall add rule name = "Disable port 135 - TCP" dir = in action = block protocol = TCP localport = 135 & netsh advfirewall firewall add rule name = "Disable port 135 - UDP" dir = in action = block protocol = UDP localport = 135 & netsh advfirewall firewall add rule name = "Disable port 137 - TCP" dir = in action = block protocol = TCP localport = 137 & netsh advfirewall firewall add rule name = "Disable port 137 - UDP" dir = in action = block protocol = UDP localport = 137 & netsh advfirewall firewall add rule name = "Disable port 138 - TCP" dir = in action = block protocol = TCP localport = 138 & netsh advfirewall firewall add rule name = "Disable port 138 - UDP" dir = in action = block protocol = UDP localport = 138 & netsh advfirewall firewall add rule name = "Disable port 139 - TCP" dir = in action = block protocol = TCP localport = 139 & netsh advfirewall firewall add rule name = "Disable port 139 - UDP" dir = in action = block protocol = UDP localport = 139 & netsh advfirewall firewall add rule name = "Disable port 445 - TCP" dir = in action = block protocol = TCP localport = 445 & netsh advfirewall firewall add rule name = "Disable port 445 - UDP" dir = in action = block protocol = UDP localport = 445
```
效果  
![alt](/static/upload/20170515/2PK9M051NKqZD0yPin-gPxkX.png)  

3.  修改文件名称为 **closePort.bat ** (主要是后缀名)  
![alt](/static/upload/20170515/gQrMZQEyFbFlZkeq6NtS2J0O.png)

![alt](/static/upload/20170515/lt4t3fMXOR29omI8RfB5EtmK.png)
4. 单击鼠标右键管理员运行  
![alt](/static/upload/20170515/-rJbkogIPeITNbjgZBeQfK9w.png)
5. 关闭成功  
![alt](/static/upload/20170515/u-H5Q2xx3T0y9qHd0MiYyyv7.png)
![alt](/static/upload/20170515/X9QBH7c7IXs-z3ia-ebR9R2I.png)  

###  上面的步骤麻烦？  
1. 直接下载  
[点击下载](/static/upload/20170515/closePort.bat)
2. 管理员运行  
![alt](/static/upload/20170515/-rJbkogIPeITNbjgZBeQfK9w.png)  

### 不想下载东西？
1. win + x  
![alt](/static/upload/20170516/BZtdLS6-QBf8c6KRMLGf7Kvr.png)
2. 命令提示符(管理员)(A)  
![alt](/static/upload/20170516/XlZ2iq2ux4LGEebMnMWjiHwz.png)
3. 复制上面的代码 > 粘贴 > 回车 
![alt](/static/upload/20170516/TmBGzJuaSAKHoAyRi6lV5cUS.png)
4. 关闭成功  
![alt](/static/upload/20170515/u-H5Q2xx3T0y9qHd0MiYyyv7.png)
![alt](/static/upload/20170515/X9QBH7c7IXs-z3ia-ebR9R2I.png)  ', '<div class="toc"><ul>
<li><a href="#toc-2f3">快速关闭办法</a></li>
<li><a href="#toc-120">上面的步骤麻烦？</a></li>
<li><a href="#toc-023">不想下载东西？</a></li>
</ul>
</div><h3><a id="toc-2f3" class="anchor" href="#toc-2f3"></a>快速关闭办法</h3>
<ol>
<li>新建一个记事本文件  <strong> closePort.txt  </strong><br><img src="/static/upload/20170515/IQ2PN0uf1a_zVtTZv46OJP4y.png" alt="alt"></li>
<li><p>复制下面代码到txt文件中   </p>
<!--more-->
<p>代码</p>
<pre><code class="hljs lang-nix">echo close-port &amp; netsh firewall set opmode <span class="hljs-attr">mode</span> = enable &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 135 - TCP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = TCP <span class="hljs-attr">localport</span> = <span class="hljs-number">135</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 135 - UDP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = UDP <span class="hljs-attr">localport</span> = <span class="hljs-number">135</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 137 - TCP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = TCP <span class="hljs-attr">localport</span> = <span class="hljs-number">137</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 137 - UDP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = UDP <span class="hljs-attr">localport</span> = <span class="hljs-number">137</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 138 - TCP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = TCP <span class="hljs-attr">localport</span> = <span class="hljs-number">138</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 138 - UDP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = UDP <span class="hljs-attr">localport</span> = <span class="hljs-number">138</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 139 - TCP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = TCP <span class="hljs-attr">localport</span> = <span class="hljs-number">139</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 139 - UDP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = UDP <span class="hljs-attr">localport</span> = <span class="hljs-number">139</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 445 - TCP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = TCP <span class="hljs-attr">localport</span> = <span class="hljs-number">445</span> &amp; netsh advfirewall firewall add rule <span class="hljs-attr">name</span> = <span class="hljs-string">"Disable port 445 - UDP"</span> <span class="hljs-attr">dir</span> = <span class="hljs-keyword">in</span> <span class="hljs-attr">action</span> = block <span class="hljs-attr">protocol</span> = UDP <span class="hljs-attr">localport</span> = <span class="hljs-number">445</span>
</code></pre><p>效果<br><img src="/static/upload/20170515/2PK9M051NKqZD0yPin-gPxkX.png" alt="alt">  </p>
</li>
<li><p>修改文件名称为 <strong>closePort.bat </strong> (主要是后缀名)<br><img src="/static/upload/20170515/gQrMZQEyFbFlZkeq6NtS2J0O.png" alt="alt"></p>
</li>
</ol>
<p><img src="/static/upload/20170515/lt4t3fMXOR29omI8RfB5EtmK.png" alt="alt"></p>
<ol>
<li>单击鼠标右键管理员运行<br><img src="/static/upload/20170515/-rJbkogIPeITNbjgZBeQfK9w.png" alt="alt"></li>
<li>关闭成功<br><img src="/static/upload/20170515/u-H5Q2xx3T0y9qHd0MiYyyv7.png" alt="alt">
<img src="/static/upload/20170515/X9QBH7c7IXs-z3ia-ebR9R2I.png" alt="alt">  </li>
</ol>
<h3><a id="toc-120" class="anchor" href="#toc-120"></a>上面的步骤麻烦？</h3>
<ol>
<li>直接下载<br><a href="/static/upload/20170515/closePort.bat">点击下载</a></li>
<li>管理员运行<br><img src="/static/upload/20170515/-rJbkogIPeITNbjgZBeQfK9w.png" alt="alt">  </li>
</ol>
<h3><a id="toc-023" class="anchor" href="#toc-023"></a>不想下载东西？</h3>
<ol>
<li>win + x<br><img src="/static/upload/20170516/BZtdLS6-QBf8c6KRMLGf7Kvr.png" alt="alt"></li>
<li>命令提示符(管理员)(A)<br><img src="/static/upload/20170516/XlZ2iq2ux4LGEebMnMWjiHwz.png" alt="alt"></li>
<li>复制上面的代码 &gt; 粘贴 &gt; 回车 
<img src="/static/upload/20170516/TmBGzJuaSAKHoAyRi6lV5cUS.png" alt="alt"></li>
<li>关闭成功<br><img src="/static/upload/20170515/u-H5Q2xx3T0y9qHd0MiYyyv7.png" alt="alt">
<img src="/static/upload/20170515/X9QBH7c7IXs-z3ia-ebR9R2I.png" alt="alt">  </li>
</ol>
', 1, '2017-05-15 19:47:14', '2017-11-04 10:37:19', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('33', '3', '1', 0, 3, 'web开发的一些小提示', 'web-tips', '<h2 id="-">一些注意</h2>
<ol>
<li>页面编码规范<br> 1.1. 统一使用 UTF-8 编码,用@charset &quot;utf-8&quot;指定页面编码。<br> 1.2. 全局字体设置：<br> windows 7系统：微软雅黑 Arial；<br> windows XP及以下：新宋体，宋体，Arial<br> MAC默认字体：Helvetica Neue和Helvetica Hiragino Sans GB。<br> font-family:&quot;Microsoft Yahei&quot;,&quot;Hiragino Sans GB&quot;,&quot;Helvetica Neue&quot;,Helvetica,tahoma,arial,Verdana,sans-serif,&quot;WenQuanYi Micro Hei&quot;,&quot;\5B8B\4F53&quot;;<br> 1.3. 中文字体使用编码转换<br> 1.4. 推荐使用web安全色  </li>
</ol>
', '## 一些注意
1. 页面编码规范  
    1.1. 统一使用 UTF-8 编码,用@charset "utf-8"指定页面编码。  
    1.2. 全局字体设置：  
    windows 7系统：微软雅黑 Arial；  
    windows XP及以下：新宋体，宋体，Arial  
    MAC默认字体：Helvetica Neue和Helvetica Hiragino Sans GB。  
    font-family:"Microsoft Yahei","Hiragino Sans GB","Helvetica Neue",Helvetica,tahoma,arial,Verdana,sans-serif,"WenQuanYi Micro Hei","\5B8B\4F53";  
    1.3. 中文字体使用编码转换  
    1.4. 推荐使用web安全色  
<!--more-->
2. 属性写在一行内，属性之间、属性名和值之间以及属性与“{}”之间应减少空格，去掉最后一个“;”，例如：.class{width:200px;height:100px}

3. 属性的书写顺序：  
	3.1. 按照元素模型由外及内，由整体到细节书写，大致分为五组：  
```
  位置：position,left,right,float
  盒模型属性：display,margin,padding,width,height
  边框与背景：border,background
  段落与文本：line-height,text-indent,font,color,text-decoration,...
  其他属性：overflow,cursor,visibility,...
```
    3.2. 针对特殊浏览器的属性，应写在标准属性之前，例如：-webkit-box-shadow:;-moz-box-shadow:;box-shaow:;
    
4. 带有前缀的属性，单独一行，通过缩进，让每个属性的值垂直对齐，方便编辑维护。

5. 谨慎添加新的选择符规则，尤其不可滥用 id，尽可能继承和复用已有样式

6. 选择符、属性、值均用小写（格式的颜色值除外），缩写的选择符名称须说明缩写前的全称，例如 .cl -> Clearfix

7. 避免使用各种CSS Hack。

8. 勿使用冗余低效的 CSS 写法，例如：ul li a span{... }

9. 慎用 !important  

10. 建议使用具有语义化的classname或id.

11.避免使用兼容性不好的使用滤镜 .  

12.开发过程中的未定事项，须用 [!] 标出，以便于后续讨论整理。  

13.注释格式，统一使用双斜杠加*。  

14.上下模块之间的间距统一使用下一个模块的margin-top来实现，好处是：如果没有下一个模块也不会多出一段空隙。  

15.hover，selected，disabled，current等具有特定意义的请勿直接占用。
  
16.:link :visited :hover :active书写顺序 L-V-H-A，速记：LoVe（喜欢）HAte（讨厌）。 
 
 17.不要使用 @import

## 中文字体css编码转换
~~~
  微软雅黑   \5FAE\8F6F\96C5\9ED1  或 Microsoft YaHei
  黑体       \9ED1\4F53
  新宋体     \65b0\5b8b\4f53
  宋体       \5b8b\4f53
~~~

## css命名中英文对照
~~~

  current 当前    hover 悬停    selected 挑选   disabled 禁用   focus 得到焦点    
  blur 失去焦点   checked 勾选    success 成功    error 出错

  header(hd) 头部   content(cnt) 内容   title(tit) 标题   item 项目（条）   
  cell 单元   image/pic(img) 图片   text(txt) 文字    top 顶部    scrubber 时序菜单

  nav 导航    mainbav 主导航   subnav 子导航    topnav 顶部导航   
  breadcrumb 面包屑导航  flink 友情链接    footer 尾    copyright 版权
  menu 菜单   submenu 子菜单   dropdown 下拉菜单

  searchBar 搜索条   search 搜索条    searchTxt 搜索框   
  searchBtn 搜索按钮    search_key 搜索词

  member 会员   ucenter 用户中心    loginBar 登陆条   
  login 登录    loginBtn 登录按钮   regsiter 注册按钮  
  btn-regsiter注册按钮    name 用户名    password 密码  
  nickname 昵称   mobilephone/mobile 手机    
  telephone/tel 电话   defaultavatar 默认头像

  hot 热点    news 新闻   banner/AD 广告    download 下载
  content 内容    title 标题    summary 摘要    time 时间
  share 分享    digg 顶    like 喜欢

  list 列表   pList 图片列表    tList 文字列表    tpList 图文列表
  table 表格    row 行   column 列    gutter 间隔   viewport 视口
  tab 标签    tags 标签   scroll 滚动 

  sidebar 侧边栏   column 栏目   section 区块    msg 提示信息   
  status 状态   vote 投票   tips 小技巧    guild 指南    note 注释
  icon- 图标    btn- 按钮

  goods 商品    goodsList 商品列表    goodsDetail 商品详情    goodsInfo 商品信息
  tuan 团购   tuanList 团购列表   tuanDetail  团购详情    tuanInfo 团购信息

  transition 动画   shadow 阴影   fade 淡入淡出   flip 翻页效   
  slide 滑动    slideup 上滑动   slidedown 下滑动   turn 翻页 
  horizontal 水平   vertical 垂直   collapsible 折叠    corners 拐角  
  flow 流    reverse 反向    pop 弹窗

  count 总数/计数   plus 加号/正   minus 减号/负    controlgroup 控制组
~~~

## 页面命名
~~~
  default/index.html    首页
  404.html              404错误页
  print.html            打印页
  header.html           页头
  footer.html           页脚
  sitemap.html          网站地图
  passport.html         通行证
  rank.html             排行榜
  roll.html             滚动新闻

  solution.html         解决方案
  joinus.html           加入我们
  partner.html          合作伙伴
  service.html          服务
  aboutus.html          关于我们
  contact.html          联系我们
  company.html          公司介绍
  organization.html     组织结构
  culture.html          企业文化
  strategy.html         发展策略
  honor.html            公司荣誉
  aptitudes.html        企业资质
  events.html           大事记
  business.html         商务合作
  contract.html         服务条款
  privacy.html          隐私声明
  CSR.html              企业社会责任

  news-开头.html         新闻相关
  article-开头.html      资讯相关
  picture-开头.html      图片相关
  photo-开头.html        相册相关
  product-开头.html      产品相关
  goods-开头.html        商品相关
  system-开头.html       系统相关
  tag-开头.html          tag相关
  brand-开头.html        品牌相关
  help-开头.html         帮助相关
  member-开头.html       会员相关
  search-开头.html       搜索相关
~~~
  
##   文件命名
~~~
  admin     后台管理
  app       应用
  article   资讯
  common    公共
  config    配置
  data      数据
  digg      顶
  en-us     英文
  extend    延伸
  install   安装
  Lang      语言包
  Lib       库
  mall      商城
  picture   组图
  product   商品
  search    搜索
  section   区块
  shop      商店
  static    静态
  system    系统
  templates 模版
  tuan      团购
  ucenter   用户中心
  upload    上传
  video     视频
  vote      投票
  zh_tw     繁体中文
  zh-cn     简体中文
~~~

## HTTP 状态消息
当浏览器从 web 服务器请求服务时，可能会发生错误。

从而有可能会返回下面的一系列状态消息：

### 1xx
100 Continue	服务器仅接收到部分请求，但是一旦服务器并没有拒绝该请求，客户端应该继续发送其余的请求。  
101 Switching Protocols	服务器转换协议：服务器将遵从客户的请求转换到另外一种协议。

### 2xx
200 OK	请求成功（其后是对GET和POST请求的应答文档。）  
201 Created	请求被创建完成，同时新的资源被创建。  
202 Accepted	供处理的请求已被接受，但是处理未完成。  
203 Non-authoritative Information	文档已经正常地返回，但一些应答头可能不正确，因为使用的是文档的拷贝。  
204 No Content	没有新文档。浏览器应该继续显示原来的文档。如果用户定期地刷新页面，而Servlet可以确定用户文档足够新，这个状态代码是很有用的。  
205 Reset Content	没有新文档。但浏览器应该重置它所显示的内容。用来强制浏览器清除表单输入内容。  
206 Partial Content	客户发送了一个带有Range头的GET请求，服务器完成了它。  

### 3xx
300 Multiple Choices	多重选择。链接列表。用户可以选择某链接到达目的地。最多允许五个地址。  
301 Moved Permanently	所请求的页面已经转移至新的url。  
302 Found	所请求的页面已经临时转移至新的url。  
303 See Other	所请求的页面可在别的url下被找到。  
304 Not Modified	未按预期修改文档。客户端有缓冲的文档并发出了一个条件性的请求（一般是提供If-Modified-Since头表示客户只想比指定日期更新的文档）。服务器告诉客户，原来缓冲的文档还可以继续使用。  
305 Use Proxy	客户请求的文档应该通过Location头所指明的代理服务器提取。  
306 Unused	此代码被用于前一版本。目前已不再使用，但是代码依然被保留。  
307 Temporary Redirect	被请求的页面已经临时移至新的url。  

### 4xx
400 Bad Request	服务器未能理解请求。  
401 Unauthorized	被请求的页面需要用户名和密码。  
402 Payment Required	此代码尚无法使用。  
403 Forbidden	对被请求页面的访问被禁止。  
404 Not Found	服务器无法找到被请求的页面。  
405 Method Not Allowed	请求中指定的方法不被允许。  
406 Not Acceptable	服务器生成的响应无法被客户端所接受。  
407 Proxy Authentication Required	用户必须首先使用代理服务器进行验证，这样请求才会被处理。  
408 Request Timeout	请求超出了服务器的等待时间。  
409 Conflict	由于冲突，请求无法被完成。  
410 Gone	被请求的页面不可用。  
411 Length Required	"Content-Length" 未被定义。如果无此内容，服务器不会接受请求。  
412 Precondition Failed	请求中的前提条件被服务器评估为失败。  
413 Request Entity Too Large	由于所请求的实体的太大，服务器不会接受请求。  
414 Request-url Too Long	由于url太长，服务器不会接受请求。当post请求被转换为带有很长的查询信息的get请求时，就会发生这种情况。  
415 Unsupported Media Type	由于媒介类型不被支持，服务器不会接受请求。  
416	服务器不能满足客户在请求中指定的Range头。  
417 Expectation Failed  

### 5xx
500 Internal Server Error	请求未完成。服务器遇到不可预知的情况。  
501 Not Implemented	请求未完成。服务器不支持所请求的功能。  
502 Bad Gateway	请求未完成。服务器从上游服务器收到一个无效的响应。  
503 Service Unavailable	请求未完成。服务器临时过载或当机。  
504 Gateway Timeout	网关超时。  
505 HTTP Version Not Supported	服务器不支持请求中指明的HTTP协议版本。  ', '<div class="toc"><ul>
<li><a href="#toc-8ac">一些注意</a></li>
<li><a href="#toc-9a8">中文字体css编码转换</a></li>
<li><a href="#toc-098">css命名中英文对照</a></li>
<li><a href="#toc-738">页面命名</a></li>
<li><a href="#toc-42b">文件命名</a></li>
<li><a href="#toc-901">HTTP 状态消息</a><ul>
<li><a href="#1xx">1xx</a></li>
<li><a href="#2xx">2xx</a></li>
<li><a href="#3xx">3xx</a></li>
<li><a href="#4xx">4xx</a></li>
<li><a href="#5xx">5xx</a></li>
</ul>
</li>
</ul>
</div><h2><a id="toc-8ac" class="anchor" href="#toc-8ac"></a>一些注意</h2>
<ol>
<li>页面编码规范<br> 1.1. 统一使用 UTF-8 编码,用@charset &quot;utf-8&quot;指定页面编码。<br> 1.2. 全局字体设置：<br> windows 7系统：微软雅黑 Arial；<br> windows XP及以下：新宋体，宋体，Arial<br> MAC默认字体：Helvetica Neue和Helvetica Hiragino Sans GB。<br> font-family:&quot;Microsoft Yahei&quot;,&quot;Hiragino Sans GB&quot;,&quot;Helvetica Neue&quot;,Helvetica,tahoma,arial,Verdana,sans-serif,&quot;WenQuanYi Micro Hei&quot;,&quot;\5B8B\4F53&quot;;<br> 1.3. 中文字体使用编码转换<br> 1.4. 推荐使用web安全色  <!--more--></li>
<li><p>属性写在一行内，属性之间、属性名和值之间以及属性与“{}”之间应减少空格，去掉最后一个“;”，例如：.class{width:200px;height:100px}</p>
</li>
<li><p>属性的书写顺序：<br> 3.1. 按照元素模型由外及内，由整体到细节书写，大致分为五组：  </p>
<pre><code class="hljs lang-scss">位置：<span class="hljs-attribute">position</span>,<span class="hljs-attribute">left</span>,<span class="hljs-attribute">right</span>,<span class="hljs-attribute">float</span>
盒模型属性：<span class="hljs-attribute">display</span>,<span class="hljs-attribute">margin</span>,<span class="hljs-attribute">padding</span>,<span class="hljs-attribute">width</span>,<span class="hljs-attribute">height</span>
边框与背景：<span class="hljs-attribute">border</span>,<span class="hljs-attribute">background</span>
段落与文本：<span class="hljs-attribute">line-height</span>,<span class="hljs-attribute">text-indent</span>,<span class="hljs-attribute">font</span>,<span class="hljs-attribute">color</span>,<span class="hljs-attribute">text-decoration</span>,...
其他属性：<span class="hljs-attribute">overflow</span>,<span class="hljs-attribute">cursor</span>,<span class="hljs-attribute">visibility</span>,...
</code></pre><p> 3.2. 针对特殊浏览器的属性，应写在标准属性之前，例如：-webkit-box-shadow:;-moz-box-shadow:;box-shaow:;</p>
</li>
<li><p>带有前缀的属性，单独一行，通过缩进，让每个属性的值垂直对齐，方便编辑维护。</p>
</li>
<li><p>谨慎添加新的选择符规则，尤其不可滥用 id，尽可能继承和复用已有样式</p>
</li>
<li><p>选择符、属性、值均用小写（格式的颜色值除外），缩写的选择符名称须说明缩写前的全称，例如 .cl -&gt; Clearfix</p>
</li>
<li><p>避免使用各种CSS Hack。</p>
</li>
<li><p>勿使用冗余低效的 CSS 写法，例如：ul li a span{... }</p>
</li>
<li><p>慎用 !important  </p>
</li>
<li><p>建议使用具有语义化的classname或id.</p>
</li>
</ol>
<p>11.避免使用兼容性不好的使用滤镜 .  </p>
<p>12.开发过程中的未定事项，须用 [!] 标出，以便于后续讨论整理。  </p>
<p>13.注释格式，统一使用双斜杠加*。  </p>
<p>14.上下模块之间的间距统一使用下一个模块的margin-top来实现，好处是：如果没有下一个模块也不会多出一段空隙。  </p>
<p>15.hover，selected，disabled，current等具有特定意义的请勿直接占用。</p>
<p>16.:link :visited :hover :active书写顺序 L-V-H-A，速记：LoVe（喜欢）HAte（讨厌）。 </p>
<p> 17.不要使用 @import</p>
<h2><a id="toc-9a8" class="anchor" href="#toc-9a8"></a>中文字体css编码转换</h2>
<pre><code class="hljs lang-lsl">  微软雅黑   \<span class="hljs-number">5</span>FAE\<span class="hljs-number">8</span>F6F\<span class="hljs-number">96</span>C5\<span class="hljs-number">9</span>ED1  或 Microsoft YaHei
  黑体       \<span class="hljs-number">9</span>ED1\<span class="hljs-number">4</span>F53
  新宋体     \<span class="hljs-number">65</span>b0\<span class="hljs-number">5</span>b8b\<span class="hljs-number">4</span>f53
  宋体       \<span class="hljs-number">5</span>b8b\<span class="hljs-number">4</span>f53
</code></pre><h2><a id="toc-098" class="anchor" href="#toc-098"></a>css命名中英文对照</h2>
<pre><code class="hljs lang-stylus">
  current 当前    hover 悬停    selected 挑选   disabled 禁用   focus 得到焦点    
  blur 失去焦点   checked 勾选    success 成功    error 出错

  header(hd) 头部   <span class="hljs-attribute">content</span>(cnt) 内容   title(tit) 标题   item 项目（条）   
  cell 单元   image/pic(img) 图片   text(txt) 文字    <span class="hljs-attribute">top</span> 顶部    scrubber 时序菜单

  <span class="hljs-selector-tag">nav</span> 导航    mainbav 主导航   subnav 子导航    topnav 顶部导航   
  breadcrumb 面包屑导航  flink 友情链接    <span class="hljs-selector-tag">footer</span> 尾    copyright 版权
  <span class="hljs-selector-tag">menu</span> 菜单   submenu 子菜单   dropdown 下拉菜单

  searchBar 搜索条   search 搜索条    searchTxt 搜索框   
  searchBtn 搜索按钮    search_key 搜索词

  member 会员   ucenter 用户中心    loginBar 登陆条   
  login 登录    loginBtn 登录按钮   regsiter 注册按钮  
  btn-regsiter注册按钮    name 用户名    password 密码  
  nickname 昵称   mobilephone/mobile 手机    
  telephone/tel 电话   defaultavatar 默认头像

  hot 热点    news 新闻   banner/AD 广告    download 下载
  <span class="hljs-attribute">content</span> 内容    title 标题    summary 摘要    time 时间
  share 分享    digg 顶    like 喜欢

  list 列表   pList 图片列表    tList 文字列表    tpList 图文列表
  <span class="hljs-selector-tag">table</span> 表格    row 行   column 列    gutter 间隔   viewport 视口
  tab 标签    tags 标签   scroll 滚动 

  sidebar 侧边栏   column 栏目   <span class="hljs-selector-tag">section</span> 区块    msg 提示信息   
  status 状态   vote 投票   tips 小技巧    guild 指南    note 注释
  <span class="hljs-attribute">icon</span>- 图标    btn- 按钮

  goods 商品    goodsList 商品列表    goodsDetail 商品详情    goodsInfo 商品信息
  tuan 团购   tuanList 团购列表   tuanDetail  团购详情    tuanInfo 团购信息

  <span class="hljs-attribute">transition</span> 动画   shadow 阴影   fade 淡入淡出   flip 翻页效   
  slide 滑动    slideup 上滑动   slidedown 下滑动   turn 翻页 
  horizontal 水平   vertical 垂直   collapsible 折叠    corners 拐角  
  flow 流    reverse 反向    pop 弹窗

  count 总数/计数   plus 加号/正   minus 减号/负    controlgroup 控制组
</code></pre><h2><a id="toc-738" class="anchor" href="#toc-738"></a>页面命名</h2>
<pre><code class="hljs lang-stylus">  default/index<span class="hljs-selector-class">.html</span>    首页
  <span class="hljs-number">404</span><span class="hljs-selector-class">.html</span>              <span class="hljs-number">404</span>错误页
  print<span class="hljs-selector-class">.html</span>            打印页
  <span class="hljs-selector-tag">header</span><span class="hljs-selector-class">.html</span>           页头
  <span class="hljs-selector-tag">footer</span><span class="hljs-selector-class">.html</span>           页脚
  sitemap<span class="hljs-selector-class">.html</span>          网站地图
  passport<span class="hljs-selector-class">.html</span>         通行证
  rank<span class="hljs-selector-class">.html</span>             排行榜
  roll<span class="hljs-selector-class">.html</span>             滚动新闻

  solution<span class="hljs-selector-class">.html</span>         解决方案
  joinus<span class="hljs-selector-class">.html</span>           加入我们
  partner<span class="hljs-selector-class">.html</span>          合作伙伴
  service<span class="hljs-selector-class">.html</span>          服务
  aboutus<span class="hljs-selector-class">.html</span>          关于我们
  contact<span class="hljs-selector-class">.html</span>          联系我们
  company<span class="hljs-selector-class">.html</span>          公司介绍
  organization<span class="hljs-selector-class">.html</span>     组织结构
  culture<span class="hljs-selector-class">.html</span>          企业文化
  strategy<span class="hljs-selector-class">.html</span>         发展策略
  honor<span class="hljs-selector-class">.html</span>            公司荣誉
  aptitudes<span class="hljs-selector-class">.html</span>        企业资质
  events<span class="hljs-selector-class">.html</span>           大事记
  business<span class="hljs-selector-class">.html</span>         商务合作
  contract<span class="hljs-selector-class">.html</span>         服务条款
  privacy<span class="hljs-selector-class">.html</span>          隐私声明
  CSR<span class="hljs-selector-class">.html</span>              企业社会责任

  news-开头<span class="hljs-selector-class">.html</span>         新闻相关
  article-开头<span class="hljs-selector-class">.html</span>      资讯相关
  picture-开头<span class="hljs-selector-class">.html</span>      图片相关
  photo-开头<span class="hljs-selector-class">.html</span>        相册相关
  product-开头<span class="hljs-selector-class">.html</span>      产品相关
  goods-开头<span class="hljs-selector-class">.html</span>        商品相关
  system-开头<span class="hljs-selector-class">.html</span>       系统相关
  tag-开头<span class="hljs-selector-class">.html</span>          tag相关
  brand-开头<span class="hljs-selector-class">.html</span>        品牌相关
  help-开头<span class="hljs-selector-class">.html</span>         帮助相关
  member-开头<span class="hljs-selector-class">.html</span>       会员相关
  search-开头<span class="hljs-selector-class">.html</span>       搜索相关
</code></pre><h2><a id="toc-42b" class="anchor" href="#toc-42b"></a>文件命名</h2>
<pre><code class="hljs lang-routeros">  admin     后台管理
  app       应用
  article   资讯
  common    公共
 <span class="hljs-built_in"> config </span>   配置
  data      数据
  digg      顶
  en-us     英文
  extend    延伸
  install   安装
  Lang      语言包
  Lib       库
  mall      商城
  picture   组图
  product   商品
  search    搜索
  section   区块
  shop      商店
  static    静态
 <span class="hljs-built_in"> system </span>   系统
  templates 模版
  tuan      团购
  ucenter   用户中心
  upload    上传
  video     视频
  vote      投票
  zh_tw     繁体中文
  zh-cn     简体中文
</code></pre><h2><a id="toc-901" class="anchor" href="#toc-901"></a>HTTP 状态消息</h2>
<p>当浏览器从 web 服务器请求服务时，可能会发生错误。</p>
<p>从而有可能会返回下面的一系列状态消息：</p>
<h3><a id="1xx" class="anchor" href="#1xx"></a>1xx</h3>
<p>100 Continue    服务器仅接收到部分请求，但是一旦服务器并没有拒绝该请求，客户端应该继续发送其余的请求。<br>101 Switching Protocols    服务器转换协议：服务器将遵从客户的请求转换到另外一种协议。</p>
<h3><a id="2xx" class="anchor" href="#2xx"></a>2xx</h3>
<p>200 OK    请求成功（其后是对GET和POST请求的应答文档。）<br>201 Created    请求被创建完成，同时新的资源被创建。<br>202 Accepted    供处理的请求已被接受，但是处理未完成。<br>203 Non-authoritative Information    文档已经正常地返回，但一些应答头可能不正确，因为使用的是文档的拷贝。<br>204 No Content    没有新文档。浏览器应该继续显示原来的文档。如果用户定期地刷新页面，而Servlet可以确定用户文档足够新，这个状态代码是很有用的。<br>205 Reset Content    没有新文档。但浏览器应该重置它所显示的内容。用来强制浏览器清除表单输入内容。<br>206 Partial Content    客户发送了一个带有Range头的GET请求，服务器完成了它。  </p>
<h3><a id="3xx" class="anchor" href="#3xx"></a>3xx</h3>
<p>300 Multiple Choices    多重选择。链接列表。用户可以选择某链接到达目的地。最多允许五个地址。<br>301 Moved Permanently    所请求的页面已经转移至新的url。<br>302 Found    所请求的页面已经临时转移至新的url。<br>303 See Other    所请求的页面可在别的url下被找到。<br>304 Not Modified    未按预期修改文档。客户端有缓冲的文档并发出了一个条件性的请求（一般是提供If-Modified-Since头表示客户只想比指定日期更新的文档）。服务器告诉客户，原来缓冲的文档还可以继续使用。<br>305 Use Proxy    客户请求的文档应该通过Location头所指明的代理服务器提取。<br>306 Unused    此代码被用于前一版本。目前已不再使用，但是代码依然被保留。<br>307 Temporary Redirect    被请求的页面已经临时移至新的url。  </p>
<h3><a id="4xx" class="anchor" href="#4xx"></a>4xx</h3>
<p>400 Bad Request    服务器未能理解请求。<br>401 Unauthorized    被请求的页面需要用户名和密码。<br>402 Payment Required    此代码尚无法使用。<br>403 Forbidden    对被请求页面的访问被禁止。<br>404 Not Found    服务器无法找到被请求的页面。<br>405 Method Not Allowed    请求中指定的方法不被允许。<br>406 Not Acceptable    服务器生成的响应无法被客户端所接受。<br>407 Proxy Authentication Required    用户必须首先使用代理服务器进行验证，这样请求才会被处理。<br>408 Request Timeout    请求超出了服务器的等待时间。<br>409 Conflict    由于冲突，请求无法被完成。<br>410 Gone    被请求的页面不可用。<br>411 Length Required    &quot;Content-Length&quot; 未被定义。如果无此内容，服务器不会接受请求。<br>412 Precondition Failed    请求中的前提条件被服务器评估为失败。<br>413 Request Entity Too Large    由于所请求的实体的太大，服务器不会接受请求。<br>414 Request-url Too Long    由于url太长，服务器不会接受请求。当post请求被转换为带有很长的查询信息的get请求时，就会发生这种情况。<br>415 Unsupported Media Type    由于媒介类型不被支持，服务器不会接受请求。<br>416    服务器不能满足客户在请求中指定的Range头。<br>417 Expectation Failed  </p>
<h3><a id="5xx" class="anchor" href="#5xx"></a>5xx</h3>
<p>500 Internal Server Error    请求未完成。服务器遇到不可预知的情况。<br>501 Not Implemented    请求未完成。服务器不支持所请求的功能。<br>502 Bad Gateway    请求未完成。服务器从上游服务器收到一个无效的响应。<br>503 Service Unavailable    请求未完成。服务器临时过载或当机。<br>504 Gateway Timeout    网关超时。<br>505 HTTP Version Not Supported    服务器不支持请求中指明的HTTP协议版本。  </p>
', 1, '2018-03-11 17:11:47', '2018-12-07 12:34:58', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('16', '0', '1', 0, 3, 'window10子系统', 'win-linux', '<h3 id="-linux-">安装linux子系统</h3>
<p>1.打开程序和功能<br>2.cmd 输入 <code>bash</code><br>3.y</p>
', '### 安装linux子系统
1.打开程序和功能  
2.cmd 输入 ```bash```  
3.y

<!--more-->
### 卸载linux子系统
1.cmd 输入``` lxrun /uninstall /full ```  
2.y 
[常用命令](http://www.daniubiji.cn/archives/25)
', '<div class="toc"><ul>
<li><a href="#toc-541">安装linux子系统</a></li>
<li><a href="#toc-fdd">卸载linux子系统</a></li>
</ul>
</div><h3><a id="toc-541" class="anchor" href="#toc-541"></a>安装linux子系统</h3>
<p>1.打开程序和功能<br>2.cmd 输入 <code>bash</code><br>3.y</p>
<!--more-->
<h3><a id="toc-fdd" class="anchor" href="#toc-fdd"></a>卸载linux子系统</h3>
<p>1.cmd 输入<code>lxrun /uninstall /full</code><br>2.y 
<a href="http://www.daniubiji.cn/archives/25">常用命令</a></p>
', 1, '2017-05-26 17:12:44', '2017-05-26 17:15:07', 1, 0, '"{\"template\":\"\",\"push_sites\":[]}"');
INSERT INTO "public"."post" VALUES ('17', '3', '1', 0, 3, 'tips 各种小记录', 'tips', '<h3 id="hide-win">hide win</h3>
<pre><code class="hljs lang-armasm"><span class="hljs-symbol">go</span> <span class="hljs-keyword">build </span>-ldflags <span class="hljs-string">"-H windowsgui"</span>
</code></pre><p>### </p>
<pre><code class="hljs lang-armasm"><span class="hljs-symbol">go</span> <span class="hljs-keyword">build </span>-ldflags <span class="hljs-string">"-s -w"</span> 
</code></pre><p><code>-s</code> 去掉符号表，然后 <code>panic</code> 的时候 <code>stack trace</code> 就没有任何文件名/行号信息了。
<code>-w</code> 去掉 <code>DWARF</code> 调试信息，得到的程序就不能用 <code>gdb</code>调试。</p>
<h3 id="-">查看汇编</h3>
<pre><code class="hljs lang-routeros">go<span class="hljs-built_in"> tool </span>compile -S main.go
</code></pre><h3 id="static-file">static file</h3>
<pre><code class="hljs lang-livecodeserver"><span class="hljs-keyword">http</span>.Handle(<span class="hljs-string">"/"</span>, <span class="hljs-keyword">http</span>.FileServer(<span class="hljs-keyword">http</span>.Dir(<span class="hljs-string">"."</span>)))

<span class="hljs-keyword">http</span>.Handle(<span class="hljs-string">"/static/"</span>, <span class="hljs-keyword">http</span>.StripPrefix(<span class="hljs-string">"/static/"</span>, <span class="hljs-keyword">http</span>.FileServer(<span class="hljs-keyword">http</span>.Dir(<span class="hljs-string">"static/"</span>))))
</code></pre><h3 id="echo-mod">echo mod</h3>
<pre><code class="hljs lang-angelscript">module test

require (
    github.com/labstack/echo v3<span class="hljs-number">.3</span><span class="hljs-number">.7</span>+incompatible
    github.com/mattn/go-isatty v0<span class="hljs-number">.0</span><span class="hljs-number">.4</span> <span class="hljs-comment">// indirect</span>
    github.com/valyala/bytebufferpool v1<span class="hljs-number">.0</span><span class="hljs-number">.0</span> <span class="hljs-comment">// indirect</span>
)

replace (
    golang.org/x/crypto v0<span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-number">-20180312195533</span><span class="hljs-number">-182114</span>d58262 =&gt; github.com/golang/crypto v0<span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-number">-20181030102418</span><span class="hljs-number">-4</span>d3f4d9ffa16
    golang.org/x/sys v0<span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-number">-20180312081825</span>-c28acc882ebc =&gt; github.com/golang/sys v0<span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-number">-20181031143558</span><span class="hljs-number">-9</span>b800f95dbbc
)
</code></pre><h3 id="cookie">cookie</h3>
<pre><code class="hljs lang-go">    http.HandleFunc(<span class="hljs-string">"/one"</span>, <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(w http.ResponseWriter, r *http.Request)</span></span> {
        cookie := &amp;http.Cookie{Name: <span class="hljs-string">"cookie"</span>, Value: <span class="hljs-string">"zxysilent"</span>, Path: <span class="hljs-string">"/"</span>, HttpOnly: <span class="hljs-literal">true</span>}
        http.SetCookie(w, cookie)
    })
    http.HandleFunc(<span class="hljs-string">"/two"</span>, <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(w http.ResponseWriter, r *http.Request)</span></span> {
        cookie, _ := r.Cookie(<span class="hljs-string">"cookie"</span>)
        w.Write([]<span class="hljs-keyword">byte</span>(cookie.String()))
    })
</code></pre><h3 id="-">跨域</h3>
<pre><code class="hljs lang-autohotkey">w.Header().Set(`Access-Control-Allow-Origin`, `*`)
</code></pre><h3 id="-">中间件</h3>
<pre><code class="hljs lang-reasonml">http.<span class="hljs-constructor">Handle(`<span class="hljs-operator">/</span>`, <span class="hljs-params">mid</span>(<span class="hljs-params">http</span>.HandlerFunc(<span class="hljs-params">fn</span>)</span>))
func mid(next http.Handler) http.Handler {
    return http.<span class="hljs-constructor">HandlerFunc(<span class="hljs-params">func</span>(<span class="hljs-params">w</span> <span class="hljs-params">http</span>.ResponseWriter, <span class="hljs-params">r</span> <span class="hljs-operator">*</span><span class="hljs-params">http</span>.Request)</span> {
        <span class="hljs-comment">//中间件的逻辑</span>
        w.<span class="hljs-constructor">Header()</span>.<span class="hljs-constructor">Set(<span class="hljs-string">"Content-Type"</span>, <span class="hljs-string">"application/json"</span>)</span>
        w.<span class="hljs-constructor">Header()</span>.<span class="hljs-constructor">Set(`Access-Control-Allow-Origin`, `<span class="hljs-operator">*</span>`)</span>
        next.<span class="hljs-constructor">ServeHTTP(<span class="hljs-params">w</span>, <span class="hljs-params">r</span>)</span>
    })
}
</code></pre><h3 id="npm">npm</h3>
<pre><code class="hljs lang-taggerscript">prefix = D:<span class="hljs-symbol">\P</span>rogram Files<span class="hljs-symbol">\n</span>odejs<span class="hljs-symbol">\n</span>ode_global
cache = D:<span class="hljs-symbol">\P</span>rogram Files<span class="hljs-symbol">\n</span>odejs<span class="hljs-symbol">\n</span>ode_cache
</code></pre><h3 id="cnpm">cnpm</h3>
<pre><code class="hljs lang-coffeescript"><span class="hljs-built_in">npm</span> install -g cnpm --registry=https:<span class="hljs-regexp">//</span>registry.<span class="hljs-built_in">npm</span>.taobao.org
</code></pre><pre><code class="hljs lang-brainfuck"><span class="hljs-comment">//</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">history</span><span class="hljs-literal">-</span><span class="hljs-comment">api</span><span class="hljs-literal">-</span><span class="hljs-comment">fallback</span> <span class="hljs-comment">解决本地开发</span> <span class="hljs-comment">vue</span><span class="hljs-literal">-</span><span class="hljs-comment">router</span><span class="hljs-literal">-</span><span class="hljs-comment">history模式</span> <span class="hljs-comment">404</span> <span class="hljs-comment">错误</span>
<span class="hljs-comment">"scripts":</span> <span class="hljs-comment">{</span>
    <span class="hljs-comment">"dev":</span> <span class="hljs-comment">"webpack</span><span class="hljs-literal">-</span><span class="hljs-comment">dev</span><span class="hljs-literal">-</span><span class="hljs-comment">server</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">content</span><span class="hljs-literal">-</span><span class="hljs-comment">base</span> <span class="hljs-string">.</span><span class="hljs-comment">/</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">open</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">inline</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">hot</span>  <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">port=82</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">history</span><span class="hljs-literal">-</span><span class="hljs-comment">api</span><span class="hljs-literal">-</span><span class="hljs-comment">fallback</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">compress</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">config</span> <span class="hljs-comment">build/webpack</span><span class="hljs-string">.</span><span class="hljs-comment">dev</span><span class="hljs-string">.</span><span class="hljs-comment">config</span><span class="hljs-string">.</span><span class="hljs-comment">js"</span><span class="hljs-string">,</span>
    <span class="hljs-comment">"build":</span> <span class="hljs-comment">"webpack</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">progress</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">hide</span><span class="hljs-literal">-</span><span class="hljs-comment">modules</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">config</span> <span class="hljs-comment">build/webpack</span><span class="hljs-string">.</span><span class="hljs-comment">prod</span><span class="hljs-string">.</span><span class="hljs-comment">config</span><span class="hljs-string">.</span><span class="hljs-comment">js"</span>
  <span class="hljs-comment">}</span><span class="hljs-string">,</span>
</code></pre><p>install git </p>
<pre><code class="hljs lang-routeros">sudo apt-<span class="hljs-builtin-name">get</span> install git git-core git-doc
</code></pre><h2 id="node">node</h2>
<pre><code class="hljs lang-coffeescript"><span class="hljs-built_in">npm</span> install --registry=https:<span class="hljs-regexp">//</span>registry.<span class="hljs-built_in">npm</span>.taobao.org
</code></pre><p>prod</p>
<blockquote>
<p>npm run webpack.build.production</p>
</blockquote>
', '### hide win
```
go build -ldflags "-H windowsgui"
``` 
### 
```
go build -ldflags "-s -w" 
```
`-s` 去掉符号表，然后 `panic` 的时候 `stack trace` 就没有任何文件名/行号信息了。
`-w` 去掉 `DWARF` 调试信息，得到的程序就不能用 `gdb`调试。

### 查看汇编
```
go tool compile -S main.go
```

### static file

```
http.Handle("/", http.FileServer(http.Dir(".")))

http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static/"))))
```
### echo mod
```
module test

require (
	github.com/labstack/echo v3.3.7+incompatible
	github.com/mattn/go-isatty v0.0.4 // indirect
	github.com/valyala/bytebufferpool v1.0.0 // indirect
)

replace (
	golang.org/x/crypto v0.0.0-20180312195533-182114d58262 => github.com/golang/crypto v0.0.0-20181030102418-4d3f4d9ffa16
	golang.org/x/sys v0.0.0-20180312081825-c28acc882ebc => github.com/golang/sys v0.0.0-20181031143558-9b800f95dbbc
)
```

### cookie
```
	http.HandleFunc("/one", func(w http.ResponseWriter, r *http.Request) {
		cookie := &http.Cookie{Name: "cookie", Value: "zxysilent", Path: "/", HttpOnly: true}
		http.SetCookie(w, cookie)
	})
	http.HandleFunc("/two", func(w http.ResponseWriter, r *http.Request) {
		cookie, _ := r.Cookie("cookie")
		w.Write([]byte(cookie.String()))
	})
```

### 跨域
```
w.Header().Set(`Access-Control-Allow-Origin`, `*`)
```
### 中间件
```
http.Handle(`/`, mid(http.HandlerFunc(fn)))
func mid(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		//中间件的逻辑
		w.Header().Set("Content-Type", "application/json")
		w.Header().Set(`Access-Control-Allow-Origin`, `*`)
		next.ServeHTTP(w, r)
	})
}
```

### npm 
```
prefix = D:\Program Files\nodejs\node_global
cache = D:\Program Files\nodejs\node_cache
```
### cnpm 
```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

```
// --history-api-fallback 解决本地开发 vue-router-history模式 404 错误
"scripts": {
    "dev": "webpack-dev-server --content-base ./ --open --inline --hot  --port=82 --history-api-fallback --compress --config build/webpack.dev.config.js",
    "build": "webpack --progress --hide-modules --config build/webpack.prod.config.js"
  },
```
install git 
```
sudo apt-get install git git-core git-doc
```
## node

```
npm install --registry=https://registry.npm.taobao.org
```
prod
> npm run webpack.build.production

<!--more-->
dev
> npm run webpack

thinkjs

> 前执行 `npm run compile `命令，将 src/ 目录编译到 app/ 目录，然后将 app/ 目录下的文件上线

## ssh

```
// 不加入邮箱 自定义git 服务部署会失败
ssh-keygen -t rsa -C "zxysilent@foxmail.com"
```

### mysql 
 `uid:pass@tcp(host:port)/dbname?charset=utf8&parseTime=true`

### jquery
1. `$(''#id'').siblings()` 当前元素所有的兄弟节点
2. `$(''#id'').prev()`当前元素前一个兄弟节点
3. `$(''#id'').prevaAll()`当前元素之前所有的兄弟节点
4. `$(''#id'').next()`当前元素之后第一个兄弟节点
5. `$(''#id'').nextAll()` 当前元素之后所有的兄弟节点\

### caddy 
`-service install -name caddy -agree -log "E:\Caddy\logs\caddy.log" -conf "E:\Caddy\conf"  -email "zxysilent@foxmail.com"`

### mysql
```sql
update 数据表名 SET 字段名 = replace(字段名, ''要替换的字符串'', ''替换为'') where 设定条件;
```

## npm

```
npm cache clean --force
```

### vue 

render 

``` js
{
  // 和`v-bind:class`一样的 API
  ''class'': {
    foo: true,
    bar: false
  },
  // 和`v-bind:style`一样的 API
  style: {
    color: ''red'',
    fontSize: ''14px''
  },
  // 正常的 HTML 特性
  attrs: {
    id: ''foo''
  },
  // 组件 props
  props: {
    myProp: ''bar''
  },
  // DOM 属性
  domProps: {
    innerHTML: ''baz''
  },
  // 事件监听器基于 `on`
  // 所以不再支持如 `v-on:keyup.enter` 修饰器
  // 需要手动匹配 keyCode。
  on: {
    click: this.clickHandler
  },
  // 仅对于组件，用于监听原生事件，而不是组件内部使用 `vm.$emit` 触发的事件。
  nativeOn: {
    click: this.nativeClickHandler
  },
  // 自定义指令。注意事项：不能对绑定的旧值设值
  // Vue 会为您持续追踪
  directives: [
    {
      name: ''my-custom-directive'',
      value: ''2'',
      expression: ''1 + 1'',
      arg: ''foo'',
      modifiers: {
        bar: true
      }
    }
  ],
  // Scoped slots in the form of
  // { name: props => VNode | Array<VNode> }
  scopedSlots: {
    default: props => createElement(''span'', props.text)
  },
  // 如果组件是其他组件的子组件，需为插槽指定名称
  slot: ''name-of-slot'',
  // 其他特殊顶层属性
  key: ''myKey'',
  ref: ''myRef''
}
```
', '<div class="toc"><ul>
<li><a href="#hidewin">hide win</a></li>
<li><a href="#toc-27f">查看汇编</a></li>
<li><a href="#staticfile">static file</a></li>
<li><a href="#echomod">echo mod</a></li>
<li><a href="#cookie">cookie</a></li>
<li><a href="#toc-1c3">跨域</a></li>
<li><a href="#toc-3cb">中间件</a></li>
<li><a href="#npm">npm</a></li>
<li><a href="#cnpm">cnpm</a><ul>
<li><a href="#node">node</a></li>
<li><a href="#ssh">ssh</a></li>
</ul>
</li>
<li><a href="#mysql">mysql</a></li>
<li><a href="#jquery">jquery</a></li>
<li><a href="#caddy">caddy</a></li>
<li><a href="#mysql">mysql</a><ul>
<li><a href="#npm">npm</a></li>
</ul>
</li>
<li><a href="#vue">vue</a></li>
</ul>
</div><h3><a id="hidewin" class="anchor" href="#hidewin"></a>hide win</h3>
<pre><code class="hljs lang-armasm"><span class="hljs-symbol">go</span> <span class="hljs-keyword">build </span>-ldflags <span class="hljs-string">"-H windowsgui"</span>
</code></pre><p>### </p>
<pre><code class="hljs lang-armasm"><span class="hljs-symbol">go</span> <span class="hljs-keyword">build </span>-ldflags <span class="hljs-string">"-s -w"</span> 
</code></pre><p><code>-s</code> 去掉符号表，然后 <code>panic</code> 的时候 <code>stack trace</code> 就没有任何文件名/行号信息了。
<code>-w</code> 去掉 <code>DWARF</code> 调试信息，得到的程序就不能用 <code>gdb</code>调试。</p>
<h3><a id="toc-27f" class="anchor" href="#toc-27f"></a>查看汇编</h3>
<pre><code class="hljs lang-routeros">go<span class="hljs-built_in"> tool </span>compile -S main.go
</code></pre><h3><a id="staticfile" class="anchor" href="#staticfile"></a>static file</h3>
<pre><code class="hljs lang-livecodeserver"><span class="hljs-keyword">http</span>.Handle(<span class="hljs-string">"/"</span>, <span class="hljs-keyword">http</span>.FileServer(<span class="hljs-keyword">http</span>.Dir(<span class="hljs-string">"."</span>)))

<span class="hljs-keyword">http</span>.Handle(<span class="hljs-string">"/static/"</span>, <span class="hljs-keyword">http</span>.StripPrefix(<span class="hljs-string">"/static/"</span>, <span class="hljs-keyword">http</span>.FileServer(<span class="hljs-keyword">http</span>.Dir(<span class="hljs-string">"static/"</span>))))
</code></pre><h3><a id="echomod" class="anchor" href="#echomod"></a>echo mod</h3>
<pre><code class="hljs lang-angelscript">module test

require (
    github.com/labstack/echo v3<span class="hljs-number">.3</span><span class="hljs-number">.7</span>+incompatible
    github.com/mattn/go-isatty v0<span class="hljs-number">.0</span><span class="hljs-number">.4</span> <span class="hljs-comment">// indirect</span>
    github.com/valyala/bytebufferpool v1<span class="hljs-number">.0</span><span class="hljs-number">.0</span> <span class="hljs-comment">// indirect</span>
)

replace (
    golang.org/x/crypto v0<span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-number">-20180312195533</span><span class="hljs-number">-182114</span>d58262 =&gt; github.com/golang/crypto v0<span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-number">-20181030102418</span><span class="hljs-number">-4</span>d3f4d9ffa16
    golang.org/x/sys v0<span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-number">-20180312081825</span>-c28acc882ebc =&gt; github.com/golang/sys v0<span class="hljs-number">.0</span><span class="hljs-number">.0</span><span class="hljs-number">-20181031143558</span><span class="hljs-number">-9</span>b800f95dbbc
)
</code></pre><h3><a id="cookie" class="anchor" href="#cookie"></a>cookie</h3>
<pre><code class="hljs lang-go">    http.HandleFunc(<span class="hljs-string">"/one"</span>, <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(w http.ResponseWriter, r *http.Request)</span></span> {
        cookie := &amp;http.Cookie{Name: <span class="hljs-string">"cookie"</span>, Value: <span class="hljs-string">"zxysilent"</span>, Path: <span class="hljs-string">"/"</span>, HttpOnly: <span class="hljs-literal">true</span>}
        http.SetCookie(w, cookie)
    })
    http.HandleFunc(<span class="hljs-string">"/two"</span>, <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(w http.ResponseWriter, r *http.Request)</span></span> {
        cookie, _ := r.Cookie(<span class="hljs-string">"cookie"</span>)
        w.Write([]<span class="hljs-keyword">byte</span>(cookie.String()))
    })
</code></pre><h3><a id="toc-1c3" class="anchor" href="#toc-1c3"></a>跨域</h3>
<pre><code class="hljs lang-autohotkey">w.Header().Set(`Access-Control-Allow-Origin`, `*`)
</code></pre><h3><a id="toc-3cb" class="anchor" href="#toc-3cb"></a>中间件</h3>
<pre><code class="hljs lang-reasonml">http.<span class="hljs-constructor">Handle(`<span class="hljs-operator">/</span>`, <span class="hljs-params">mid</span>(<span class="hljs-params">http</span>.HandlerFunc(<span class="hljs-params">fn</span>)</span>))
func mid(next http.Handler) http.Handler {
    return http.<span class="hljs-constructor">HandlerFunc(<span class="hljs-params">func</span>(<span class="hljs-params">w</span> <span class="hljs-params">http</span>.ResponseWriter, <span class="hljs-params">r</span> <span class="hljs-operator">*</span><span class="hljs-params">http</span>.Request)</span> {
        <span class="hljs-comment">//中间件的逻辑</span>
        w.<span class="hljs-constructor">Header()</span>.<span class="hljs-constructor">Set(<span class="hljs-string">"Content-Type"</span>, <span class="hljs-string">"application/json"</span>)</span>
        w.<span class="hljs-constructor">Header()</span>.<span class="hljs-constructor">Set(`Access-Control-Allow-Origin`, `<span class="hljs-operator">*</span>`)</span>
        next.<span class="hljs-constructor">ServeHTTP(<span class="hljs-params">w</span>, <span class="hljs-params">r</span>)</span>
    })
}
</code></pre><h3><a id="npm" class="anchor" href="#npm"></a>npm</h3>
<pre><code class="hljs lang-taggerscript">prefix = D:<span class="hljs-symbol">\P</span>rogram Files<span class="hljs-symbol">\n</span>odejs<span class="hljs-symbol">\n</span>ode_global
cache = D:<span class="hljs-symbol">\P</span>rogram Files<span class="hljs-symbol">\n</span>odejs<span class="hljs-symbol">\n</span>ode_cache
</code></pre><h3><a id="cnpm" class="anchor" href="#cnpm"></a>cnpm</h3>
<pre><code class="hljs lang-coffeescript"><span class="hljs-built_in">npm</span> install -g cnpm --registry=https:<span class="hljs-regexp">//</span>registry.<span class="hljs-built_in">npm</span>.taobao.org
</code></pre><pre><code class="hljs lang-brainfuck"><span class="hljs-comment">//</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">history</span><span class="hljs-literal">-</span><span class="hljs-comment">api</span><span class="hljs-literal">-</span><span class="hljs-comment">fallback</span> <span class="hljs-comment">解决本地开发</span> <span class="hljs-comment">vue</span><span class="hljs-literal">-</span><span class="hljs-comment">router</span><span class="hljs-literal">-</span><span class="hljs-comment">history模式</span> <span class="hljs-comment">404</span> <span class="hljs-comment">错误</span>
<span class="hljs-comment">"scripts":</span> <span class="hljs-comment">{</span>
    <span class="hljs-comment">"dev":</span> <span class="hljs-comment">"webpack</span><span class="hljs-literal">-</span><span class="hljs-comment">dev</span><span class="hljs-literal">-</span><span class="hljs-comment">server</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">content</span><span class="hljs-literal">-</span><span class="hljs-comment">base</span> <span class="hljs-string">.</span><span class="hljs-comment">/</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">open</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">inline</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">hot</span>  <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">port=82</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">history</span><span class="hljs-literal">-</span><span class="hljs-comment">api</span><span class="hljs-literal">-</span><span class="hljs-comment">fallback</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">compress</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">config</span> <span class="hljs-comment">build/webpack</span><span class="hljs-string">.</span><span class="hljs-comment">dev</span><span class="hljs-string">.</span><span class="hljs-comment">config</span><span class="hljs-string">.</span><span class="hljs-comment">js"</span><span class="hljs-string">,</span>
    <span class="hljs-comment">"build":</span> <span class="hljs-comment">"webpack</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">progress</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">hide</span><span class="hljs-literal">-</span><span class="hljs-comment">modules</span> <span class="hljs-literal">-</span><span class="hljs-literal">-</span><span class="hljs-comment">config</span> <span class="hljs-comment">build/webpack</span><span class="hljs-string">.</span><span class="hljs-comment">prod</span><span class="hljs-string">.</span><span class="hljs-comment">config</span><span class="hljs-string">.</span><span class="hljs-comment">js"</span>
  <span class="hljs-comment">}</span><span class="hljs-string">,</span>
</code></pre><p>install git </p>
<pre><code class="hljs lang-routeros">sudo apt-<span class="hljs-builtin-name">get</span> install git git-core git-doc
</code></pre><h2><a id="node" class="anchor" href="#node"></a>node</h2>
<pre><code class="hljs lang-coffeescript"><span class="hljs-built_in">npm</span> install --registry=https:<span class="hljs-regexp">//</span>registry.<span class="hljs-built_in">npm</span>.taobao.org
</code></pre><p>prod</p>
<blockquote>
<p>npm run webpack.build.production</p>
</blockquote>
<!--more-->
<p>dev</p>
<blockquote>
<p>npm run webpack</p>
</blockquote>
<p>thinkjs</p>
<blockquote>
<p>前执行 <code>npm run compile</code>命令，将 src/ 目录编译到 app/ 目录，然后将 app/ 目录下的文件上线</p>
</blockquote>
<h2><a id="ssh" class="anchor" href="#ssh"></a>ssh</h2>
<pre><code class="hljs lang-1c"><span class="hljs-comment">// 不加入邮箱 自定义git 服务部署会失败</span>
ssh-keygen -t rsa -C <span class="hljs-string">"zxysilent@foxmail.com"</span>
</code></pre><h3><a id="mysql" class="anchor" href="#mysql"></a>mysql</h3>
<p> <code>uid:pass@tcp(host:port)/dbname?charset=utf8&amp;parseTime=true</code></p>
<h3><a id="jquery" class="anchor" href="#jquery"></a>jquery</h3>
<ol>
<li><code>$(&#39;#id&#39;).siblings()</code> 当前元素所有的兄弟节点</li>
<li><code>$(&#39;#id&#39;).prev()</code>当前元素前一个兄弟节点</li>
<li><code>$(&#39;#id&#39;).prevaAll()</code>当前元素之前所有的兄弟节点</li>
<li><code>$(&#39;#id&#39;).next()</code>当前元素之后第一个兄弟节点</li>
<li><code>$(&#39;#id&#39;).nextAll()</code> 当前元素之后所有的兄弟节点\</li>
</ol>
<h3><a id="caddy" class="anchor" href="#caddy"></a>caddy</h3>
<p><code>-service install -name caddy -agree -log &quot;E:\Caddy\logs\caddy.log&quot; -conf &quot;E:\Caddy\conf&quot;  -email &quot;zxysilent@foxmail.com&quot;</code></p>
<h3><a id="mysql" class="anchor" href="#mysql"></a>mysql</h3>
<pre><code class="hljs lang-sql"><span class="hljs-keyword">update</span> 数据表名 <span class="hljs-keyword">SET</span> 字段名 = <span class="hljs-keyword">replace</span>(字段名, <span class="hljs-string">''要替换的字符串''</span>, <span class="hljs-string">''替换为''</span>) <span class="hljs-keyword">where</span> 设定条件;
</code></pre>
<h2><a id="npm" class="anchor" href="#npm"></a>npm</h2>
<pre><code class="hljs lang-sql">npm <span class="hljs-keyword">cache</span> clean <span class="hljs-comment">--force</span>
</code></pre><h3><a id="vue" class="anchor" href="#vue"></a>vue</h3>
<p>render </p>
<pre><code class="hljs lang-js">{
  <span class="hljs-comment">// 和`v-bind:class`一样的 API</span>
  <span class="hljs-string">''class''</span>: {
    <span class="hljs-attr">foo</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-attr">bar</span>: <span class="hljs-literal">false</span>
  },
  <span class="hljs-comment">// 和`v-bind:style`一样的 API</span>
  style: {
    <span class="hljs-attr">color</span>: <span class="hljs-string">''red''</span>,
    <span class="hljs-attr">fontSize</span>: <span class="hljs-string">''14px''</span>
  },
  <span class="hljs-comment">// 正常的 HTML 特性</span>
  attrs: {
    <span class="hljs-attr">id</span>: <span class="hljs-string">''foo''</span>
  },
  <span class="hljs-comment">// 组件 props</span>
  props: {
    <span class="hljs-attr">myProp</span>: <span class="hljs-string">''bar''</span>
  },
  <span class="hljs-comment">// DOM 属性</span>
  domProps: {
    <span class="hljs-attr">innerHTML</span>: <span class="hljs-string">''baz''</span>
  },
  <span class="hljs-comment">// 事件监听器基于 `on`</span>
  <span class="hljs-comment">// 所以不再支持如 `v-on:keyup.enter` 修饰器</span>
  <span class="hljs-comment">// 需要手动匹配 keyCode。</span>
  on: {
    <span class="hljs-attr">click</span>: <span class="hljs-keyword">this</span>.clickHandler
  },
  <span class="hljs-comment">// 仅对于组件，用于监听原生事件，而不是组件内部使用 `vm.$emit` 触发的事件。</span>
  nativeOn: {
    <span class="hljs-attr">click</span>: <span class="hljs-keyword">this</span>.nativeClickHandler
  },
  <span class="hljs-comment">// 自定义指令。注意事项：不能对绑定的旧值设值</span>
  <span class="hljs-comment">// Vue 会为您持续追踪</span>
  directives: [
    {
      <span class="hljs-attr">name</span>: <span class="hljs-string">''my-custom-directive''</span>,
      <span class="hljs-attr">value</span>: <span class="hljs-string">''2''</span>,
      <span class="hljs-attr">expression</span>: <span class="hljs-string">''1 + 1''</span>,
      <span class="hljs-attr">arg</span>: <span class="hljs-string">''foo''</span>,
      <span class="hljs-attr">modifiers</span>: {
        <span class="hljs-attr">bar</span>: <span class="hljs-literal">true</span>
      }
    }
  ],
  <span class="hljs-comment">// Scoped slots in the form of</span>
  <span class="hljs-comment">// { name: props =&gt; VNode | Array&lt;VNode&gt; }</span>
  scopedSlots: {
    <span class="hljs-attr">default</span>: <span class="hljs-function"><span class="hljs-params">props</span> =&gt;</span> createElement(<span class="hljs-string">''span''</span>, props.text)
  },
  <span class="hljs-comment">// 如果组件是其他组件的子组件，需为插槽指定名称</span>
  slot: <span class="hljs-string">''name-of-slot''</span>,
  <span class="hljs-comment">// 其他特殊顶层属性</span>
  key: <span class="hljs-string">''myKey''</span>,
  <span class="hljs-attr">ref</span>: <span class="hljs-string">''myRef''</span>
}
</code></pre>
', 1, '2017-06-18 12:34:02', '2019-10-31 08:19:41', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('18', '1', '1', 0, 3, 'git提交数据到github', 'git-to-github', '<h3 id="1-git">1.设置Git</h3>
<pre><code class="hljs lang-routeros">git<span class="hljs-built_in"> config </span>--global user.name <span class="hljs-string">"zxysilent"</span>

git<span class="hljs-built_in"> config </span>--global user.email <span class="hljs-string">"zxysilent@foxmail.com"</span>  
</code></pre><h3 id="2-">2.初始化本地仓库</h3>
<pre><code class="hljs lang-ebnf"><span class="hljs-attribute">git init</span>
</code></pre><h3 id="3-">3.编写文件并添加到缓存区</h3>
', '### 1.设置Git
```
git config --global user.name "zxysilent"

git config --global user.email "zxysilent@foxmail.com"  
```
### 2.初始化本地仓库
```
git init
```
### 3.编写文件并添加到缓存区

<!--more-->
```
git add -A
```
### 4.提交到本地仓库
```
git commit  -m "提交备注信息"
```
### 5.添加github 地址
```
git remote add origin https://github.com/zxysilent/ueditor.git
```
### 6.提交到github(master分支)
```
git push origin master  
```
', '<div class="toc"><ul>
<li><a href="#toc-156">1.设置Git</a></li>
<li><a href="#toc-a49">2.初始化本地仓库</a></li>
<li><a href="#toc-7bb">3.编写文件并添加到缓存区</a></li>
<li><a href="#toc-99e">4.提交到本地仓库</a></li>
<li><a href="#toc-b9c">5.添加github 地址</a></li>
<li><a href="#toc-708">6.提交到github(master分支)</a></li>
</ul>
</div><h3><a id="toc-156" class="anchor" href="#toc-156"></a>1.设置Git</h3>
<pre><code class="hljs lang-stylus">git config --global user<span class="hljs-selector-class">.name</span> <span class="hljs-string">"zxysilent"</span>

git config --global user<span class="hljs-selector-class">.email</span> <span class="hljs-string">"zxysilent@foxmail.com"</span>
</code></pre><h3><a id="toc-a49" class="anchor" href="#toc-a49"></a>2.初始化本地仓库</h3>
<pre><code class="hljs lang-ebnf"><span class="hljs-attribute">git init</span>
</code></pre><h3><a id="toc-7bb" class="anchor" href="#toc-7bb"></a>3.编写文件并添加到缓存区</h3>
<!--more-->
<pre><code class="hljs lang-dockerfile">git <span class="hljs-keyword">add</span><span class="bash"> -A
</span></code></pre><h3><a id="toc-99e" class="anchor" href="#toc-99e"></a>4.提交到本地仓库</h3>
<pre><code class="hljs lang-nginx"><span class="hljs-attribute">git</span> commit  -m <span class="hljs-string">"提交备注信息"</span>
</code></pre><h3><a id="toc-b9c" class="anchor" href="#toc-b9c"></a>5.添加github 地址</h3>
<pre><code class="hljs lang-dockerfile">git remote <span class="hljs-keyword">add</span><span class="bash"> origin https://github.com/zxysilent/ueditor.git
</span></code></pre><h3><a id="toc-708" class="anchor" href="#toc-708"></a>6.提交到github(master分支)</h3>
<pre><code class="hljs lang-crmsh">git push origin <span class="hljs-keyword">master</span>
<span class="hljs-title"></span></code></pre>', 1, '2017-06-29 20:28:27', '2017-07-14 17:57:19', 1, 0, '"{\"template\":\"\",\"push_sites\":[]}"');
INSERT INTO "public"."post" VALUES ('19', '1', '1', 0, 3, 'go web 开发', 'go-weeb-dev', '<h3 id="go-web-">go web 开发</h3>
<p><a href="https://www.kancloud.cn/zxysilent/go-web-dev">传送门</a></p>
', '### go web 开发
[传送门](https://www.kancloud.cn/zxysilent/go-web-dev)', '<div class="toc"><ul>
<li><a href="#toc-0c3">go web 开发</a></li>
</ul>
</div><h3><a id="toc-0c3" class="anchor" href="#toc-0c3"></a>go web 开发</h3>
<p><a href="https://www.kancloud.cn/zxysilent/go-web-dev">传送门</a></p>
', 1, '2017-07-14 18:01:23', '2017-07-14 18:02:06', 1, 0, '"{\"template\":\"\",\"push_sites\":[]}"');
INSERT INTO "public"."post" VALUES ('2', '1', '1', 0, 3, 'vscode 插件记录', 'vscode-ext', '<h3 id="-">配置</h3>
<pre><code class="hljs lang-clojure">{
    <span class="hljs-string">"editor.fontFamily"</span>: <span class="hljs-string">"''Microsoft YaHei Mono'',Consolas, ''Courier New'', monospace"</span>,
    <span class="hljs-string">"editor.minimap.showSlider"</span>: <span class="hljs-string">"always"</span>,
    <span class="hljs-string">"editor.detectIndentation"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"editor.wordWrap"</span>: <span class="hljs-string">"on"</span>,
    <span class="hljs-string">"workbench.startupEditor"</span>: <span class="hljs-string">"newUntitledFile"</span>,
    <span class="hljs-string">"window.zoomLevel"</span>: <span class="hljs-number">0</span>,
    <span class="hljs-string">"html.format.extraLiners"</span>: <span class="hljs-string">""</span>,
    <span class="hljs-string">"git.enableSmartCommit"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"extensions.ignoreRecommendations"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"emmet.syntaxProfiles"</span>: {
        <span class="hljs-string">"vue-html"</span>: <span class="hljs-string">"html"</span>,
        <span class="hljs-string">"vue"</span>: <span class="hljs-string">"html"</span>
    },
    <span class="hljs-string">"terminal.integrated.copyOnSelection"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"git.path"</span>: <span class="hljs-string">"D:/Program Files/Git/bin/git.exe"</span>,
    <span class="hljs-string">"editor.rulers"</span>: [<span class="hljs-number">120</span>, <span class="hljs-number">180</span>],
    <span class="hljs-string">"git.inputValidationLength"</span>: <span class="hljs-number">120</span>,
    <span class="hljs-string">"[git-commit]"</span>: {
        <span class="hljs-string">"editor.rulers"</span>: [<span class="hljs-number">120</span>]
    },
    <span class="hljs-string">"prettier.jsxBracketSameLine"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"editor.wordWrapColumn"</span>: <span class="hljs-number">180</span>,
    // <span class="hljs-string">"html.suggest.angular1"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"explorer.confirmDragAndDrop"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"vetur.validation.template"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"vetur.format.options.tabSize"</span>: <span class="hljs-number">4</span>,
    <span class="hljs-string">"vetur.format.options.useTabs"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"vetur.format.defaultFormatter.html"</span>: <span class="hljs-string">"js-beautify-html"</span>,
    <span class="hljs-string">"vetur.format.defaultFormatterOptions"</span>: {
        <span class="hljs-string">"js-beautify-html"</span>: {
            <span class="hljs-string">"wrap_attributes"</span>: <span class="hljs-string">"auto"</span>
        }
    },
    <span class="hljs-string">"search.followSymlinks"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"editor.quickSuggestions"</span>: {
        <span class="hljs-string">"other"</span>: <span class="hljs-literal">true</span>,
        <span class="hljs-string">"comments"</span>: <span class="hljs-literal">true</span>,
        <span class="hljs-string">"strings"</span>: <span class="hljs-literal">true</span>
    },
    <span class="hljs-string">"emmet.triggerExpansionOnTab"</span>: <span class="hljs-literal">true</span>,
    //   <span class="hljs-string">"gitHistory.showEditorTitleMenuBarIcons"</span>: <span class="hljs-literal">false</span>,
    //   <span class="hljs-string">"view-in-browser.customBrowser"</span>: <span class="hljs-string">"chrome"</span>,
    <span class="hljs-string">"editor.renderLineHighlight"</span>: <span class="hljs-string">"all"</span>,
    <span class="hljs-string">"git.confirmSync"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"go.gopath"</span>: <span class="hljs-string">"D:/App/Go"</span>,
    // <span class="hljs-string">"go.useCodeSnippetsOnFunctionSuggest"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"go.addTags"</span>: {
        <span class="hljs-string">"tags"</span>: <span class="hljs-string">"json"</span>,//,form
        <span class="hljs-string">"options"</span>: <span class="hljs-string">""</span>,
        <span class="hljs-string">"promptForTags"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"transform"</span>: <span class="hljs-string">"snakecase"</span>
    },
    <span class="hljs-string">"go.testFlags"</span>: [<span class="hljs-string">"-v"</span>],
    <span class="hljs-string">"go.editorContextMenuCommands"</span>: {
        <span class="hljs-string">"toggleTestFile"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"addTags"</span>: <span class="hljs-literal">true</span>,
        <span class="hljs-string">"removeTags"</span>: <span class="hljs-literal">true</span>,
        <span class="hljs-string">"testAtCursor"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"testFile"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"testPackage"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"generateTestForFunction"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"generateTestForFile"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"generateTestForPackage"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"testCoverage"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"playground"</span>: <span class="hljs-literal">false</span>
    },
    <span class="hljs-string">"extensions.showRecommendationsOnlyOnDemand"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"git.autofetch"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"breadcrumbs.enabled"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"javascript.updateImportsOnFileMove.enabled"</span>: <span class="hljs-string">"always"</span>,
    <span class="hljs-string">"explorer.confirmDelete"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"editor.renderControlCharacters"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"workbench.activityBar.visible"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"python.jediEnabled"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"python.linting.enabled"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"python.autoComplete.addBrackets"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"python.pythonPath"</span>: <span class="hljs-string">"D:/Program Files/Python36/python.exe"</span>,
    <span class="hljs-string">"python.jediPath"</span>: <span class="hljs-string">"D:/Program Files/Python36/Lib/site-packages/jedi"</span>,
    // <span class="hljs-string">"C_Cpp.clang_format_fallbackStyle"</span>: <span class="hljs-string">"Google"</span>,
    //   <span class="hljs-string">"C_Cpp.default.includePath"</span>: [
    //     <span class="hljs-string">"D:/Program Portable Files/mingw64/x86_64-w64-mingw32/include/**"</span>
    //   ],
    <span class="hljs-string">"workbench.statusBar.visible"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"workbench.commandPalette.history"</span>: <span class="hljs-number">20</span>,
    <span class="hljs-string">"prettier.printWidth"</span>: <span class="hljs-number">180</span>,
    // <span class="hljs-string">"C_Cpp.clang_format_fallbackStyle"</span>: <span class="hljs-string">"Google"</span>,
    <span class="hljs-string">"window.menuBarVisibility"</span>: <span class="hljs-string">"default"</span>,
    <span class="hljs-string">"workbench.sideBar.location"</span>: <span class="hljs-string">"left"</span>,
    <span class="hljs-string">"html.format.indentHandlebars"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"html.format.wrapLineLength"</span>: <span class="hljs-number">0</span>,
    <span class="hljs-string">"html.format.enable"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"prettier.tabWidth"</span>: <span class="hljs-number">4</span>,
    <span class="hljs-string">"editor.minimap.maxColumn"</span>: <span class="hljs-number">120</span>,
    <span class="hljs-string">"html.format.wrapAttributes"</span>: <span class="hljs-string">"force-aligned"</span>,
    <span class="hljs-string">"editor.autoIndent"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"terminal.integrated.shell.windows"</span>: <span class="hljs-string">"D:\\Program Files\\Git\\bin\\bash.exe"</span>,
    <span class="hljs-string">"view-in-browser.customBrowser"</span>: <span class="hljs-string">"chrome"</span>,
    <span class="hljs-string">"gitlens.hovers.currentLine.over"</span>: <span class="hljs-string">"line"</span>,
    <span class="hljs-string">"[javascript]"</span>: {
        <span class="hljs-string">"editor.defaultFormatter"</span>: <span class="hljs-string">"esbenp.prettier-vscode"</span>
    },
    <span class="hljs-string">"window.title"</span>: <span class="hljs-string">"${dirty}${activeEditorLong}${separator}"</span>,
    <span class="hljs-string">"[json]"</span>: {
        <span class="hljs-string">"editor.defaultFormatter"</span>: <span class="hljs-string">"esbenp.prettier-vscode"</span>
    },
    <span class="hljs-string">"telemetry.enableTelemetry"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"editor.suggestSelection"</span>: <span class="hljs-string">"first"</span>,
    <span class="hljs-string">"vsintellicode.modify.editor.suggestSelection"</span>: <span class="hljs-string">"automaticallyOverrodeDefaultValue"</span>,
    <span class="hljs-string">"vsicons.dontShowNewVersionMessage"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"workbench.iconTheme"</span>: <span class="hljs-string">"vscode-icons"</span>,
    <span class="hljs-string">"[typescript]"</span>: {
        <span class="hljs-string">"editor.defaultFormatter"</span>: <span class="hljs-string">"vscode.typescript-language-features"</span>
    },
    <span class="hljs-string">"javascript.referencesCodeLens.enabled"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"javascript.suggest.completeFunctionCalls"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"typescript.implementationsCodeLens.enabled"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"dart.checkForSdkUpdates"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"dart.reportAnalyzerErrors"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"workbench.settings.enableNaturalLanguageSearch"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"telemetry.enableCrashReporter"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"workbench.enableExperiments"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"go.lintOnSave"</span>: <span class="hljs-string">"off"</span>
}
</code></pre>', '### 配置
```
{
    "editor.fontFamily": "''Microsoft YaHei Mono'',Consolas, ''Courier New'', monospace",
    "editor.minimap.showSlider": "always",
    "editor.detectIndentation": false,
    "editor.wordWrap": "on",
    "workbench.startupEditor": "newUntitledFile",
    "window.zoomLevel": 0,
    "html.format.extraLiners": "",
    "git.enableSmartCommit": true,
    "extensions.ignoreRecommendations": false,
    "emmet.syntaxProfiles": {
        "vue-html": "html",
        "vue": "html"
    },
    "terminal.integrated.copyOnSelection": true,
    "git.path": "D:/Program Files/Git/bin/git.exe",
    "editor.rulers": [120, 180],
    "git.inputValidationLength": 120,
    "[git-commit]": {
        "editor.rulers": [120]
    },
    "prettier.jsxBracketSameLine": true,
    "editor.wordWrapColumn": 180,
    // "html.suggest.angular1": false,
    "explorer.confirmDragAndDrop": false,
    "vetur.validation.template": false,
    "vetur.format.options.tabSize": 4,
    "vetur.format.options.useTabs": true,
    "vetur.format.defaultFormatter.html": "js-beautify-html",
    "vetur.format.defaultFormatterOptions": {
        "js-beautify-html": {
            "wrap_attributes": "auto"
        }
    },
    "search.followSymlinks": false,
    "editor.quickSuggestions": {
        "other": true,
        "comments": true,
        "strings": true
    },
    "emmet.triggerExpansionOnTab": true,
    //   "gitHistory.showEditorTitleMenuBarIcons": false,
    //   "view-in-browser.customBrowser": "chrome",
    "editor.renderLineHighlight": "all",
    "git.confirmSync": false,
    "go.gopath": "D:/App/Go",
    // "go.useCodeSnippetsOnFunctionSuggest": true,
    "go.addTags": {
        "tags": "json",//,form
        "options": "",
        "promptForTags": false,
        "transform": "snakecase"
    },
    "go.testFlags": ["-v"],
    "go.editorContextMenuCommands": {
        "toggleTestFile": false,
        "addTags": true,
        "removeTags": true,
        "testAtCursor": false,
        "testFile": false,
        "testPackage": false,
        "generateTestForFunction": false,
        "generateTestForFile": false,
        "generateTestForPackage": false,
        "testCoverage": false,
        "playground": false
    },
    "extensions.showRecommendationsOnlyOnDemand": true,
    "git.autofetch": true,
    "breadcrumbs.enabled": true,
    "javascript.updateImportsOnFileMove.enabled": "always",
    "explorer.confirmDelete": false,
    "editor.renderControlCharacters": true,
    "workbench.activityBar.visible": true,
    "python.jediEnabled": false,
    "python.linting.enabled": false,
    "python.autoComplete.addBrackets": true,
    "python.pythonPath": "D:/Program Files/Python36/python.exe",
    "python.jediPath": "D:/Program Files/Python36/Lib/site-packages/jedi",
    // "C_Cpp.clang_format_fallbackStyle": "Google",
    //   "C_Cpp.default.includePath": [
    //     "D:/Program Portable Files/mingw64/x86_64-w64-mingw32/include/**"
    //   ],
    "workbench.statusBar.visible": true,
    "workbench.commandPalette.history": 20,
    "prettier.printWidth": 180,
    // "C_Cpp.clang_format_fallbackStyle": "Google",
    "window.menuBarVisibility": "default",
    "workbench.sideBar.location": "left",
    "html.format.indentHandlebars": true,
    "html.format.wrapLineLength": 0,
    "html.format.enable": false,
    "prettier.tabWidth": 4,
    "editor.minimap.maxColumn": 120,
    "html.format.wrapAttributes": "force-aligned",
    "editor.autoIndent": false,
    "terminal.integrated.shell.windows": "D:\\Program Files\\Git\\bin\\bash.exe",
    "view-in-browser.customBrowser": "chrome",
    "gitlens.hovers.currentLine.over": "line",
    "[javascript]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "window.title": "${dirty}${activeEditorLong}${separator}",
    "[json]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "telemetry.enableTelemetry": false,
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue",
    "vsicons.dontShowNewVersionMessage": true,
    "workbench.iconTheme": "vscode-icons",
    "[typescript]": {
        "editor.defaultFormatter": "vscode.typescript-language-features"
    },
    "javascript.referencesCodeLens.enabled": true,
    "javascript.suggest.completeFunctionCalls": true,
    "typescript.implementationsCodeLens.enabled": true,
    "dart.checkForSdkUpdates": false,
    "dart.reportAnalyzerErrors": false,
    "workbench.settings.enableNaturalLanguageSearch": false,
    "telemetry.enableCrashReporter": false,
    "workbench.enableExperiments": false,
    "go.lintOnSave": "off"
}
```', '<div class="toc"><ul>
<li><a href="#toc-224">配置</a></li>
</ul>
</div><h3><a id="toc-224" class="anchor" href="#toc-224"></a>配置</h3>
<pre><code class="hljs lang-clojure">{
    <span class="hljs-string">"editor.fontFamily"</span>: <span class="hljs-string">"''Microsoft YaHei Mono'',Consolas, ''Courier New'', monospace"</span>,
    <span class="hljs-string">"editor.minimap.showSlider"</span>: <span class="hljs-string">"always"</span>,
    <span class="hljs-string">"editor.detectIndentation"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"editor.wordWrap"</span>: <span class="hljs-string">"on"</span>,
    <span class="hljs-string">"workbench.startupEditor"</span>: <span class="hljs-string">"newUntitledFile"</span>,
    <span class="hljs-string">"window.zoomLevel"</span>: <span class="hljs-number">0</span>,
    <span class="hljs-string">"html.format.extraLiners"</span>: <span class="hljs-string">""</span>,
    <span class="hljs-string">"git.enableSmartCommit"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"extensions.ignoreRecommendations"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"emmet.syntaxProfiles"</span>: {
        <span class="hljs-string">"vue-html"</span>: <span class="hljs-string">"html"</span>,
        <span class="hljs-string">"vue"</span>: <span class="hljs-string">"html"</span>
    },
    <span class="hljs-string">"terminal.integrated.copyOnSelection"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"git.path"</span>: <span class="hljs-string">"D:/Program Files/Git/bin/git.exe"</span>,
    <span class="hljs-string">"editor.rulers"</span>: [<span class="hljs-number">120</span>, <span class="hljs-number">180</span>],
    <span class="hljs-string">"git.inputValidationLength"</span>: <span class="hljs-number">120</span>,
    <span class="hljs-string">"[git-commit]"</span>: {
        <span class="hljs-string">"editor.rulers"</span>: [<span class="hljs-number">120</span>]
    },
    <span class="hljs-string">"prettier.jsxBracketSameLine"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"editor.wordWrapColumn"</span>: <span class="hljs-number">180</span>,
    // <span class="hljs-string">"html.suggest.angular1"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"explorer.confirmDragAndDrop"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"vetur.validation.template"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"vetur.format.options.tabSize"</span>: <span class="hljs-number">4</span>,
    <span class="hljs-string">"vetur.format.options.useTabs"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"vetur.format.defaultFormatter.html"</span>: <span class="hljs-string">"js-beautify-html"</span>,
    <span class="hljs-string">"vetur.format.defaultFormatterOptions"</span>: {
        <span class="hljs-string">"js-beautify-html"</span>: {
            <span class="hljs-string">"wrap_attributes"</span>: <span class="hljs-string">"auto"</span>
        }
    },
    <span class="hljs-string">"search.followSymlinks"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"editor.quickSuggestions"</span>: {
        <span class="hljs-string">"other"</span>: <span class="hljs-literal">true</span>,
        <span class="hljs-string">"comments"</span>: <span class="hljs-literal">true</span>,
        <span class="hljs-string">"strings"</span>: <span class="hljs-literal">true</span>
    },
    <span class="hljs-string">"emmet.triggerExpansionOnTab"</span>: <span class="hljs-literal">true</span>,
    //   <span class="hljs-string">"gitHistory.showEditorTitleMenuBarIcons"</span>: <span class="hljs-literal">false</span>,
    //   <span class="hljs-string">"view-in-browser.customBrowser"</span>: <span class="hljs-string">"chrome"</span>,
    <span class="hljs-string">"editor.renderLineHighlight"</span>: <span class="hljs-string">"all"</span>,
    <span class="hljs-string">"git.confirmSync"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"go.gopath"</span>: <span class="hljs-string">"D:/App/Go"</span>,
    // <span class="hljs-string">"go.useCodeSnippetsOnFunctionSuggest"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"go.addTags"</span>: {
        <span class="hljs-string">"tags"</span>: <span class="hljs-string">"json"</span>,//,form
        <span class="hljs-string">"options"</span>: <span class="hljs-string">""</span>,
        <span class="hljs-string">"promptForTags"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"transform"</span>: <span class="hljs-string">"snakecase"</span>
    },
    <span class="hljs-string">"go.testFlags"</span>: [<span class="hljs-string">"-v"</span>],
    <span class="hljs-string">"go.editorContextMenuCommands"</span>: {
        <span class="hljs-string">"toggleTestFile"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"addTags"</span>: <span class="hljs-literal">true</span>,
        <span class="hljs-string">"removeTags"</span>: <span class="hljs-literal">true</span>,
        <span class="hljs-string">"testAtCursor"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"testFile"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"testPackage"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"generateTestForFunction"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"generateTestForFile"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"generateTestForPackage"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"testCoverage"</span>: <span class="hljs-literal">false</span>,
        <span class="hljs-string">"playground"</span>: <span class="hljs-literal">false</span>
    },
    <span class="hljs-string">"extensions.showRecommendationsOnlyOnDemand"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"git.autofetch"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"breadcrumbs.enabled"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"javascript.updateImportsOnFileMove.enabled"</span>: <span class="hljs-string">"always"</span>,
    <span class="hljs-string">"explorer.confirmDelete"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"editor.renderControlCharacters"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"workbench.activityBar.visible"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"python.jediEnabled"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"python.linting.enabled"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"python.autoComplete.addBrackets"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"python.pythonPath"</span>: <span class="hljs-string">"D:/Program Files/Python36/python.exe"</span>,
    <span class="hljs-string">"python.jediPath"</span>: <span class="hljs-string">"D:/Program Files/Python36/Lib/site-packages/jedi"</span>,
    // <span class="hljs-string">"C_Cpp.clang_format_fallbackStyle"</span>: <span class="hljs-string">"Google"</span>,
    //   <span class="hljs-string">"C_Cpp.default.includePath"</span>: [
    //     <span class="hljs-string">"D:/Program Portable Files/mingw64/x86_64-w64-mingw32/include/**"</span>
    //   ],
    <span class="hljs-string">"workbench.statusBar.visible"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"workbench.commandPalette.history"</span>: <span class="hljs-number">20</span>,
    <span class="hljs-string">"prettier.printWidth"</span>: <span class="hljs-number">180</span>,
    // <span class="hljs-string">"C_Cpp.clang_format_fallbackStyle"</span>: <span class="hljs-string">"Google"</span>,
    <span class="hljs-string">"window.menuBarVisibility"</span>: <span class="hljs-string">"default"</span>,
    <span class="hljs-string">"workbench.sideBar.location"</span>: <span class="hljs-string">"left"</span>,
    <span class="hljs-string">"html.format.indentHandlebars"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"html.format.wrapLineLength"</span>: <span class="hljs-number">0</span>,
    <span class="hljs-string">"html.format.enable"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"prettier.tabWidth"</span>: <span class="hljs-number">4</span>,
    <span class="hljs-string">"editor.minimap.maxColumn"</span>: <span class="hljs-number">120</span>,
    <span class="hljs-string">"html.format.wrapAttributes"</span>: <span class="hljs-string">"force-aligned"</span>,
    <span class="hljs-string">"editor.autoIndent"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"terminal.integrated.shell.windows"</span>: <span class="hljs-string">"D:\\Program Files\\Git\\bin\\bash.exe"</span>,
    <span class="hljs-string">"view-in-browser.customBrowser"</span>: <span class="hljs-string">"chrome"</span>,
    <span class="hljs-string">"gitlens.hovers.currentLine.over"</span>: <span class="hljs-string">"line"</span>,
    <span class="hljs-string">"[javascript]"</span>: {
        <span class="hljs-string">"editor.defaultFormatter"</span>: <span class="hljs-string">"esbenp.prettier-vscode"</span>
    },
    <span class="hljs-string">"window.title"</span>: <span class="hljs-string">"${dirty}${activeEditorLong}${separator}"</span>,
    <span class="hljs-string">"[json]"</span>: {
        <span class="hljs-string">"editor.defaultFormatter"</span>: <span class="hljs-string">"esbenp.prettier-vscode"</span>
    },
    <span class="hljs-string">"telemetry.enableTelemetry"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"editor.suggestSelection"</span>: <span class="hljs-string">"first"</span>,
    <span class="hljs-string">"vsintellicode.modify.editor.suggestSelection"</span>: <span class="hljs-string">"automaticallyOverrodeDefaultValue"</span>,
    <span class="hljs-string">"vsicons.dontShowNewVersionMessage"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"workbench.iconTheme"</span>: <span class="hljs-string">"vscode-icons"</span>,
    <span class="hljs-string">"[typescript]"</span>: {
        <span class="hljs-string">"editor.defaultFormatter"</span>: <span class="hljs-string">"vscode.typescript-language-features"</span>
    },
    <span class="hljs-string">"javascript.referencesCodeLens.enabled"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"javascript.suggest.completeFunctionCalls"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"typescript.implementationsCodeLens.enabled"</span>: <span class="hljs-literal">true</span>,
    <span class="hljs-string">"dart.checkForSdkUpdates"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"dart.reportAnalyzerErrors"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"workbench.settings.enableNaturalLanguageSearch"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"telemetry.enableCrashReporter"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"workbench.enableExperiments"</span>: <span class="hljs-literal">false</span>,
    <span class="hljs-string">"go.lintOnSave"</span>: <span class="hljs-string">"off"</span>
}
</code></pre>', 1, '2017-04-07 10:17:50', '2019-07-04 09:56:02', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('20', '3', '1', 0, 3, 'Linux 各目录的作用', 'linux-dir', '<p>Linux 各目录的作用</p>
<p><code>/bin</code>bin是binary的缩写。这个目录沿袭了UNIX系统的结构，存放着使用者最经常使用的命令。例如<code>cp、ls、cat</code>，等等。</p>
<p><code>/boot</code>这里存放的是启动Linux时使用的一些核心文件。</p>
<p><code>/dev</code>dev是device（设备）的缩写。这个目录下是所有Linux的外部设备，其功能类似DOS下的.sys和Win下的.vxd。在Linux中设备和文件是用同种方法访问的。例如：<code>/dev/hda</code>代表第一个物理IDE硬盘。</p>
', 'Linux 各目录的作用

`/bin`bin是binary的缩写。这个目录沿袭了UNIX系统的结构，存放着使用者最经常使用的命令。例如`cp、ls、cat`，等等。

`/boot`这里存放的是启动Linux时使用的一些核心文件。

`/dev`dev是device（设备）的缩写。这个目录下是所有Linux的外部设备，其功能类似DOS下的.sys和Win下的.vxd。在Linux中设备和文件是用同种方法访问的。例如：`/dev/hda`代表第一个物理IDE硬盘。
<!--more-->
`/etc`这个目录用来存放系统管理所需要的配置文件和子目录。

`/home`用户的主目录，比如说有个用户叫zxyslt，那他的主目录就是`/home/zxyslt`也可以用`~zxyslt`表示。

`/lib`这个目录里存放着系统最基本的动态链接共享库，其作用类似于Windows里的.dll文件。几乎所有的应用程序都须要用到这些共享库。

`/lost+found`这个目录平时是空的，当系统不正常关机后，这里就成了一些无家可归的文件的避难所。对了，有点类似于DOS下的.chk文件。

`/mnt`这个目录是空的，系统提供这个目录是让用户临时挂载别的文件系统。

`/proc`这个目录是一个虚拟的目录，它是系统内存的映射，我们可以通过直接访问这个目录来获取系统信息。也就是说，这个目录的内容不在硬盘上而是在内存里。

`/root`系统管理员（也叫超级用户）的主目录。

`/sbin`s就是Super User的意思，也就是说这里存放的是系统管理员使用的管理程序。

`/tmp`这个目录不用说，一定是用来存放一些临时文件的地方了。

`/var`这个目录中存放着那些不断在扩充着的东西，为了保持/usr的相对稳定，那些经常被修改的目录可以放在这个目录下，实际上许多系统管理员都是这样干的。顺带说一下系统的日志文件就在`/var/log`目录中。 

`/usr`这是最庞大的目录，我们要用到的应用程序和文件几乎都存放在这个目录下。其中包含以下子目录；

`/usr/X11R6`存放X-Window的目录；

`/usr/bin`存放着许多应用程序；

`/usr/sbin`给超级用户使用的一些管理程序就放在这里；

`/usr/doc`这是Linux文档的大本营；

`/usr/include`Linux下开发和编译应用程序需要的头文件，在这里查找；

`/usr/lib`存放一些常用的动态链接共享库和静态档案库；

`/usr/local`这是提供给一般用户的/usr目录，在这里安装软件最适合；

`/usr/man`man在Linux中是帮助的同义词，这里就是帮助文档的存放目录；

`/usr/src`Linux开放的源代码就存在这个目录 ；

 ', '<div class="toc"></div><p>Linux 各目录的作用</p>
<p><code>/bin</code>bin是binary的缩写。这个目录沿袭了UNIX系统的结构，存放着使用者最经常使用的命令。例如<code>cp、ls、cat</code>，等等。</p>
<p><code>/boot</code>这里存放的是启动Linux时使用的一些核心文件。</p>
<p><code>/dev</code>dev是device（设备）的缩写。这个目录下是所有Linux的外部设备，其功能类似DOS下的.sys和Win下的.vxd。在Linux中设备和文件是用同种方法访问的。例如：<code>/dev/hda</code>代表第一个物理IDE硬盘。
<!--more-->
<code>/etc</code>这个目录用来存放系统管理所需要的配置文件和子目录。</p>
<p><code>/home</code>用户的主目录，比如说有个用户叫zxyslt，那他的主目录就是<code>/home/zxyslt</code>也可以用<code>~zxyslt</code>表示。</p>
<p><code>/lib</code>这个目录里存放着系统最基本的动态链接共享库，其作用类似于Windows里的.dll文件。几乎所有的应用程序都须要用到这些共享库。</p>
<p><code>/lost+found</code>这个目录平时是空的，当系统不正常关机后，这里就成了一些无家可归的文件的避难所。对了，有点类似于DOS下的.chk文件。</p>
<p><code>/mnt</code>这个目录是空的，系统提供这个目录是让用户临时挂载别的文件系统。</p>
<p><code>/proc</code>这个目录是一个虚拟的目录，它是系统内存的映射，我们可以通过直接访问这个目录来获取系统信息。也就是说，这个目录的内容不在硬盘上而是在内存里。</p>
<p><code>/root</code>系统管理员（也叫超级用户）的主目录。</p>
<p><code>/sbin</code>s就是Super User的意思，也就是说这里存放的是系统管理员使用的管理程序。</p>
<p><code>/tmp</code>这个目录不用说，一定是用来存放一些临时文件的地方了。</p>
<p><code>/var</code>这个目录中存放着那些不断在扩充着的东西，为了保持/usr的相对稳定，那些经常被修改的目录可以放在这个目录下，实际上许多系统管理员都是这样干的。顺带说一下系统的日志文件就在<code>/var/log</code>目录中。 </p>
<p><code>/usr</code>这是最庞大的目录，我们要用到的应用程序和文件几乎都存放在这个目录下。其中包含以下子目录；</p>
<p><code>/usr/X11R6</code>存放X-Window的目录；</p>
<p><code>/usr/bin</code>存放着许多应用程序；</p>
<p><code>/usr/sbin</code>给超级用户使用的一些管理程序就放在这里；</p>
<p><code>/usr/doc</code>这是Linux文档的大本营；</p>
<p><code>/usr/include</code>Linux下开发和编译应用程序需要的头文件，在这里查找；</p>
<p><code>/usr/lib</code>存放一些常用的动态链接共享库和静态档案库；</p>
<p><code>/usr/local</code>这是提供给一般用户的/usr目录，在这里安装软件最适合；</p>
<p><code>/usr/man</code>man在Linux中是帮助的同义词，这里就是帮助文档的存放目录；</p>
<p><code>/usr/src</code>Linux开放的源代码就存在这个目录 ；</p>
', 0, '2017-08-07 09:45:50', '2017-08-08 09:08:30', 1, 0, '"{\"template\":\"\",\"push_sites\":[]}"');
INSERT INTO "public"."post" VALUES ('21', '3', '1', 0, 3, ' windows子系统下安装GO语言环境', 'win-sub-sys-go', '<h2 id="windows-go-">windows子系统下安装GO语言环境</h2>
<ol>
<li>下载go<pre><code class="hljs lang-awk">wget -c https:<span class="hljs-regexp">//</span>storage.googleapis.com<span class="hljs-regexp">/golang/g</span>o1.<span class="hljs-number">8.3</span>.linux-amd64.tar.gz
</code></pre></li>
<li>解压文件至<code>/usr/local</code><pre><code class="hljs lang-stylus">tar -C /usr/local -xzf go1.<span class="hljs-number">8.3</span><span class="hljs-selector-class">.linux-amd64</span><span class="hljs-selector-class">.tar</span><span class="hljs-selector-class">.gz</span>
</code></pre></li>
</ol>
', '## windows子系统下安装GO语言环境
1. 下载go
```
wget -c https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
```
2. 解压文件至`/usr/local`
```
tar -C /usr/local -xzf go1.8.3.linux-amd64.tar.gz
```
<!--more-->
3. 设置环境变量  
```
cd ~ 
vim .profile```
在文件最后添加   
```
export PATH=$PATH:/usr/local/go/bin
```   
保存退出
4. 让设置生效
```
. .profile
```
5. 查看是否安装成功
```
go version
```
6. 新建`gopath` 目录
```
mkdir gopath
```
7. 添加环境变量
```
export GOPATH=/usr/local/gopath
export PATH=$PATH:$GOPATH/bin
```
8. 测试
```
go env
```
9. 安装`git`
```
sudo apt-get install git git-core git-doc
```

[环境变量配置](http://www.cnblogs.com/haore147/p/3633116.html)', '<div class="toc"><ul>
<li><a href="#toc-698">windows子系统下安装GO语言环境</a></li>
</ul>
</div><h2><a id="toc-698" class="anchor" href="#toc-698"></a>windows子系统下安装GO语言环境</h2>
<ol>
<li>下载go<pre><code class="hljs lang-awk">wget -c https:<span class="hljs-regexp">//</span>storage.googleapis.com<span class="hljs-regexp">/golang/g</span>o1.<span class="hljs-number">8.3</span>.linux-amd64.tar.gz
</code></pre></li>
<li>解压文件至<code>/usr/local</code><pre><code class="hljs lang-stylus">tar -C /usr/local -xzf go1.<span class="hljs-number">8.3</span><span class="hljs-selector-class">.linux-amd64</span><span class="hljs-selector-class">.tar</span><span class="hljs-selector-class">.gz</span>
</code></pre><!--more--></li>
<li>设置环境变量  <pre><code class="hljs lang-vim"><span class="hljs-keyword">cd</span> ~ 
<span class="hljs-keyword">vim</span> .<span class="hljs-keyword">profile</span>
</code></pre>在文件最后添加   <pre><code class="hljs lang-elixir">export PATH=<span class="hljs-variable">$PATH</span><span class="hljs-symbol">:/usr/local/go/bin</span>
</code></pre>保存退出</li>
<li>让设置生效<pre><code class="hljs lang-stylus">. <span class="hljs-selector-class">.profile</span>
</code></pre></li>
<li>查看是否安装成功<pre><code class="hljs lang-vim"><span class="hljs-keyword">go</span> <span class="hljs-keyword">version</span>
</code></pre></li>
<li>新建<code>gopath</code> 目录<pre><code class="hljs lang-arduino"><span class="hljs-built_in">mkdir</span> gopath
</code></pre></li>
<li>添加环境变量<pre><code class="hljs lang-bash"><span class="hljs-built_in">export</span> GOPATH=/usr/<span class="hljs-built_in">local</span>/gopath
<span class="hljs-built_in">export</span> PATH=<span class="hljs-variable">$PATH</span>:<span class="hljs-variable">$GOPATH</span>/bin
</code></pre></li>
<li>测试<pre><code class="hljs lang-dockerfile">go <span class="hljs-keyword">env</span>
</code></pre></li>
<li>安装<code>git</code><pre><code class="hljs lang-actionscript">sudo apt-<span class="hljs-keyword">get</span> install git git-core git-doc
</code></pre></li>
</ol>
<p><a href="http://www.cnblogs.com/haore147/p/3633116.html">环境变量配置</a></p>
', 0, '2017-08-08 08:55:34', '2017-11-06 09:01:11', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('22', '1', '1', 0, 3, 'go tool pprof', 'go-tool-pprof', '<ol>
<li>加入代码<pre><code class="hljs lang-go"><span class="hljs-keyword">import</span> _ <span class="hljs-string">"net/http/pprof"</span>
<span class="hljs-keyword">go</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
     log.Println(http.ListenAndServe(<span class="hljs-string">"localhost:6060"</span>, <span class="hljs-literal">nil</span>))
}()
</code></pre></li>
<li>编译并运行</li>
<li>新窗口打开命令行  </li>
</ol>
', '1. 加入代码
```
import _ "net/http/pprof"
go func() {
		log.Println(http.ListenAndServe("localhost:6060", nil))
}()
```
2. 编译并运行
3. 新窗口打开命令行  
<!--more-->
** 内存对象分配的相关情况 **
```
go tool pprof -alloc_space  http://localhost:6060/debug/pprof/heap
``` 
**正在使用的一些内存相关信息    **
```
go tool pprof -inuse_space http://127.0.0.1:6060/debug/pprof/heap
```
4.  `pprof`模式输入`web`
5. 效果图  
![alt](/static/upload/20170809/wB66oV7-Qk6fW1EbFMiGnekr.png)', '<div class="toc"></div><ol>
<li>加入代码<pre><code class="hljs lang-go"><span class="hljs-keyword">import</span> _ <span class="hljs-string">"net/http/pprof"</span>
<span class="hljs-keyword">go</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
     log.Println(http.ListenAndServe(<span class="hljs-string">"localhost:6060"</span>, <span class="hljs-literal">nil</span>))
}()
</code></pre></li>
<li>编译并运行</li>
<li>新窗口打开命令行  <!--more-->
<strong> 内存对象分配的相关情况 </strong><pre><code class="hljs lang-vim"><span class="hljs-keyword">go</span> tool pprof -alloc_space  http://localhos<span class="hljs-variable">t:6060</span>/<span class="hljs-keyword">debug</span>/pprof/heap
</code></pre><strong>正在使用的一些内存相关信息    </strong><pre><code class="hljs lang-crystal">go tool pprof -inuse_space <span class="hljs-symbol">http:</span>/<span class="hljs-regexp">/127.0.0.1:6060/debug</span><span class="hljs-regexp">/pprof/heap</span>
</code></pre></li>
<li><code>pprof</code>模式输入<code>web</code></li>
<li>效果图<br><img src="/static/upload/20170809/wB66oV7-Qk6fW1EbFMiGnekr.png" alt="alt"></li>
</ol>
', 1, '2017-08-09 07:37:36', '2017-11-04 12:09:05', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('23', '3', '1', 0, 3, 'NSSM - the Non-Sucking Service Manager', 'nssm', '<p>NSSM </p>
<blockquote>
<p>把<code>exe</code>程序作为<code>windows</code>服务,开机启动</p>
</blockquote>
<p><a href="http://www.nssm.cc/">下载地址</a></p>
<p>之前使用的是vbs脚本</p>
<pre><code class="hljs lang-routeros"><span class="hljs-builtin-name">set</span> wscriptObj = CreateObject(<span class="hljs-string">"Wscript.Shell"</span>)   

wscriptObj.<span class="hljs-builtin-name">run</span> <span class="hljs-string">"xxx.exe"</span>,0  
</code></pre>', 'NSSM 

> 把`exe`程序作为`windows`服务,开机启动

[下载地址](http://www.nssm.cc/)

之前使用的是vbs脚本
```
set wscriptObj = CreateObject("Wscript.Shell")   

wscriptObj.run "xxx.exe",0  
```
<!--more-->
> 0 参数表示不显示黑窗体
存在问题是必须手动连接远程桌面`mstsc`

**NSSM 真正的 PowerBoot**

### command line.

####  Service installation

```
nssm install <servicename>

nssm install <servicename> <program>

nssm install <servicename> <program> [<arguments>]
```

#### Service removal
```
nssm remove

nssm remove <servicename>
```


#### Starting and stopping a service
```
nssm start <servicename>

nssm stop <servicename>

nssm restart <servicename>
```
#### Querying a service''s status
```
nssm status <servicename>
```', '<div class="toc"><ul>
<li><a href="#toc-20a">command line.</a><ul>
<li><a href="#serviceinstallation">Service installation</a></li>
<li><a href="#serviceremoval">Service removal</a></li>
<li><a href="#startingandstoppingaservice">Starting and stopping a service</a></li>
<li><a href="#toc-996">Querying a service&#39;s status</a></li>
</ul>
</li>
</ul>
</div><p>NSSM </p>
<blockquote>
<p>把<code>exe</code>程序作为<code>windows</code>服务,开机启动</p>
</blockquote>
<p><a href="http://www.nssm.cc/">下载地址</a></p>
<p>之前使用的是vbs脚本</p>
<pre><code class="hljs lang-gams"><span class="hljs-keyword">set</span> wscriptObj <span class="hljs-comment">= CreateObject(</span><span class="hljs-comment">"Wscript.Shell"</span><span class="hljs-comment">)</span>   

wscriptObj.run <span class="hljs-comment">"xxx.exe"</span><span class="hljs-comment">,0</span>
</code></pre><!--more-->
<blockquote>
<p>0 参数表示不显示黑窗体
存在问题是必须手动连接远程桌面<code>mstsc</code></p>
</blockquote>
<p><strong>NSSM 真正的 PowerBoot</strong></p>
<h3><a id="toc-20a" class="anchor" href="#toc-20a"></a>command line.</h3>
<h4><a id="serviceinstallation" class="anchor" href="#serviceinstallation"></a>Service installation</h4>
<pre><code class="hljs lang-fsharp">nssm install &lt;servicename&gt;

nssm install &lt;servicename&gt; &lt;program&gt;

nssm install &lt;servicename&gt; &lt;program&gt; <span class="hljs-meta">[&lt;arguments&gt;]</span>
</code></pre><h4><a id="serviceremoval" class="anchor" href="#serviceremoval"></a>Service removal</h4>
<pre><code class="hljs lang-vim">nssm <span class="hljs-built_in">remove</span>

nssm <span class="hljs-built_in">remove</span> <span class="hljs-symbol">&lt;servicename&gt;</span>
</code></pre><h4><a id="startingandstoppingaservice" class="anchor" href="#startingandstoppingaservice"></a>Starting and stopping a service</h4>
<pre><code class="hljs lang-vim">nssm start <span class="hljs-symbol">&lt;servicename&gt;</span>

nssm <span class="hljs-keyword">stop</span> <span class="hljs-symbol">&lt;servicename&gt;</span>

nssm restart <span class="hljs-symbol">&lt;servicename&gt;</span>
</code></pre><h4><a id="toc-996" class="anchor" href="#toc-996"></a>Querying a service&#39;s status</h4>
<pre><code class="hljs lang-xml">nssm status <span class="hljs-tag">&lt;<span class="hljs-name">servicename</span>&gt;</span>
</code></pre>', 0, '2017-09-04 11:51:31', '2017-09-04 11:52:25', 1, 0, '"{\"template\":\"\",\"push_sites\":[]}"');
INSERT INTO "public"."post" VALUES ('24', '1', '1', 0, 3, 'Regular Expression', 'regular-expression', '<h2 id="regular-expression">Regular Expression</h2>
<blockquote>
<p>常简写为regex、regexp或RE），计算机科学的一个概念。
通常被用来检索、替换那些符合某个模式(规则)的文本</p>
</blockquote>
<h3 id="-">元字符</h3>
<ul>
<li><p><code>.</code> 匹配除&quot;\r\n&quot;之外的任何单个字符;要匹配包括&quot;\r\n&quot;在内的任何字符，请使用像&quot;[\s\S]&quot;的模式.</p>
</li>
<li><p><code>x|y</code>匹配x或y;&quot;z|food&quot;能匹配&quot;z&quot;或&quot;food&quot;;&quot;[zf]ood&quot;则匹配&quot;zood&quot;或&quot;food&quot;.</p>
</li>
<li><p><code>[xyz]</code> 字符集合匹配所包含的任意一个字符;&quot;[abc]&quot;可以匹配&quot;plain&quot;中的&quot;a&quot;.  </p>
</li>
<li><p><code>[^xyz]</code> 负值字符集合匹配未包含的任意字符;&quot;[^abc]&quot;可以匹配&quot;plain&quot;中的&quot;plin&quot;.  </p>
</li>
<li><p><code>[a-z]</code> 字符范围匹配指定范围内的任意字符;&quot;[a-z]&quot;可以匹配&quot;a&quot;到&quot;z&quot;范围内的任意小写字母字符.  </p>
</li>
</ul>
', '## Regular Expression
> 常简写为regex、regexp或RE），计算机科学的一个概念。
通常被用来检索、替换那些符合某个模式(规则)的文本

### 元字符
- `.` 匹配除"\r\n"之外的任何单个字符;要匹配包括"\r\n"在内的任何字符，请使用像"[\s\S]"的模式.

- `x|y`匹配x或y;"z|food"能匹配"z"或"food";"[zf]ood"则匹配"zood"或"food".

- `[xyz]` 字符集合匹配所包含的任意一个字符;"[abc]"可以匹配"plain"中的"a".  

- ` [^xyz]` 负值字符集合匹配未包含的任意字符;"[^abc]"可以匹配"plain"中的"plin".  

- `[a-z]` 字符范围匹配指定范围内的任意字符;"[a-z]"可以匹配"a"到"z"范围内的任意小写字母字符.  

<!--more-->
- `\perl Perl`预定义字符族
- `\PERL` 反向Perl预定义字符族
> Perl字符族  
 1. `\d` == [0-9] 匹配一个数字字符
 2. `\D` == [^0-9] 匹配一个非数字字符
 3. `\s` == [\t\n\f\r~~\v~~] 匹配任何不可见字符(空格,制表符,换页符) (golang)
 4. `\S` == [^\t\n\f\r~~\v~~ ] 匹配任何可见字符 (golang)
 5. `\w` ~~?~~== [0-9A-Za-z_] 匹配包括下划线的任何单词字符 (golang)
 6. `\W` ~~?~~== [^0-9A-Za-z_] 匹配任何非单词字符 (golang)

### 次数
- `*`匹配前面的子表达式任意次;`zo*`能匹配"z"，也能匹配"zo"以及"zoo"。*等价于o{0,}

- `+`匹配前面的子表达式一次或多次(大于等于1次）;"zo+"能匹配"zo"以及"zoo"，但不能匹配"z"。+等价于{1,}

- `?`匹配前面的子表达式零次或一次;"do(es)?"可以匹配"do"或"does"中的"do"。?等价于{0,1}

- `{n}`n是一个非负整数。匹配确定的n次;"o{2}"不能匹配"Bob"中的"o"，但是能匹配"food"中的两个o

- `{n,}`n是一个非负整数。至少匹配n次;"o{2,}"不能匹配"Bob"中的"o"，但能匹配"foooood"中的所有o
"o{1,}"等价于"o+"。"o{0,}"则等价于"o*"。

- `{n,m}`m和n均为非负整数，其中n<=m最少匹配n次且最多匹配m次;"o{1,3}"将匹配"fooooood"中的前三个o为一组，后三个o为一组
"o{0,1}"等价于"o?"。在逗号和两个数之间**不能**有空格

### 模式
- `?`当该字符紧跟在任何一个其他限制符(*,+,?，{n}，{n,}，{n,m})后面时，匹配模式是非贪婪的.

### 边界
- `^`匹配输入字符串的开始位置;如果设置了RegExp对象的Multiline属性，^也匹配"\n"或"\r"之后的位置。

- `$`匹配输入字符串的结束位置;如果设置了RegExp对象的Multiline属性，$也匹配"\n"或"\r"之前的位置。

- `\b`匹配一个单词边界，也就是指单词和空格间的位置;"er\b"可以匹配"never"中的"er"，但不能匹配"verb"中的"er"。

- `\B`匹配非单词边界;"er\B"能匹配"verb"中的"er"，但不能匹配"never"中的"er"。

###  组
- `()`将( 和 ) 之间的表达式定义为”组”(group)，并且将匹配这个表达式的字符保存到一个临时区域;(一个正则表达式中最多可以保存9个)，它们可以用符号(\,$)加数字0-9来引用[golang中室友二维数组获取,其中**二维切片**的第一个(下标0)标识所有匹配从第二个(下标1)表示组]

### Golang中使用
- `func Compile(expr string) (*Regexp, error)`  
>Compile解析并返回一个正则表达式。如果成功返回，该Regexp就可用于匹配文本

- `func MustCompile(str string) *Regexp`
> MustCompile类似Compile但会在解析失败时panic，主要用于全局正则表达式变量的安全初始化  

- `Find(All)?(String)?(Submatch)?(Index)?`
>''All''该方法会返回输入中所有互不重叠的匹配结果  
''String''出现了,匹配对象为字符串，否则应该是[]byte类型，返回值和匹配对象的类型是对应的  
''Submatch''出现了,返回值是表示正则表达式中成功的组匹配（子匹配/次级匹配）的切片   

-  `func (re *Regexp) Match(b []byte) bool`
> Match检查b中是否存在匹配pattern的子序列

- `func (re *Regexp) MatchString(s string) bool`
> MatchString类似Match，但匹配对象是字符串

- `func (re *Regexp) FindAllString(s string, n int) []string`
> 返回正则表达式re在s中的所有不重叠的匹配结果的[]string切片。  
如果没有匹配到，会返回nil  
N表示s [0,n) n<0表示整个s中查找

- `func(re*Regexp) FindAllStringSubmatch(s string, n int) [][]string`
> 返回正则表达式re在s中的所有不重叠的匹配结果及其对应的(可能有的)分组匹配的结果的[][]string切片

- `func (re *Regexp) Split(s string, n int) []string` 
> Split将re在s中匹配到的结果作为分隔符将s分割成多个字符串，并返回这些正则匹配结果之间的字符串的切片

- `func (re *Regexp) ReplaceAllString(src, repl string) string`
> 返回src的一个拷贝，将src中所有re的匹配结果都替换为repl。  
在替换时，repl中的''$''符号会按照Expand方法的规则进行解释  
和替换，例如$1会被替换为第一个分组匹配结果  ', '<div class="toc"><ul>
<li><a href="#regularexpression">Regular Expression</a><ul>
<li><a href="#toc-d10">元字符</a></li>
<li><a href="#toc-f96">次数</a></li>
<li><a href="#toc-f07">模式</a></li>
<li><a href="#toc-0bd">边界</a></li>
<li><a href="#toc-442">组</a></li>
<li><a href="#toc-c63">Golang中使用</a></li>
</ul>
</li>
</ul>
</div><h2><a id="regularexpression" class="anchor" href="#regularexpression"></a>Regular Expression</h2>
<blockquote>
<p>常简写为regex、regexp或RE），计算机科学的一个概念。
通常被用来检索、替换那些符合某个模式(规则)的文本</p>
</blockquote>
<h3><a id="toc-d10" class="anchor" href="#toc-d10"></a>元字符</h3>
<ul>
<li><p><code>.</code> 匹配除&quot;\r\n&quot;之外的任何单个字符;要匹配包括&quot;\r\n&quot;在内的任何字符，请使用像&quot;[\s\S]&quot;的模式.</p>
</li>
<li><p><code>x|y</code>匹配x或y;&quot;z|food&quot;能匹配&quot;z&quot;或&quot;food&quot;;&quot;[zf]ood&quot;则匹配&quot;zood&quot;或&quot;food&quot;.</p>
</li>
<li><p><code>[xyz]</code> 字符集合匹配所包含的任意一个字符;&quot;[abc]&quot;可以匹配&quot;plain&quot;中的&quot;a&quot;.  </p>
</li>
<li><p><code>[^xyz]</code> 负值字符集合匹配未包含的任意字符;&quot;[^abc]&quot;可以匹配&quot;plain&quot;中的&quot;plin&quot;.  </p>
</li>
<li><p><code>[a-z]</code> 字符范围匹配指定范围内的任意字符;&quot;[a-z]&quot;可以匹配&quot;a&quot;到&quot;z&quot;范围内的任意小写字母字符.  </p>
</li>
</ul>
<!--more-->
<ul>
<li><code>\perl Perl</code>预定义字符族</li>
<li><code>\PERL</code> 反向Perl预定义字符族<blockquote>
<p>Perl字符族  </p>
<ol>
<li><code>\d</code> == [0-9] 匹配一个数字字符</li>
<li><code>\D</code> == [^0-9] 匹配一个非数字字符</li>
<li><code>\s</code> == [\t\n\f\r<del>\v</del>] 匹配任何不可见字符(空格,制表符,换页符) (golang)</li>
<li><code>\S</code> == [^\t\n\f\r<del>\v</del> ] 匹配任何可见字符 (golang)</li>
<li><code>\w</code> <del>?</del>== [0-9A-Za-z_] 匹配包括下划线的任何单词字符 (golang)</li>
<li><code>\W</code> <del>?</del>== [^0-9A-Za-z_] 匹配任何非单词字符 (golang)</li>
</ol>
</blockquote>
</li>
</ul>
<h3><a id="toc-f96" class="anchor" href="#toc-f96"></a>次数</h3>
<ul>
<li><p><code>*</code>匹配前面的子表达式任意次;<code>zo*</code>能匹配&quot;z&quot;，也能匹配&quot;zo&quot;以及&quot;zoo&quot;。*等价于o{0,}</p>
</li>
<li><p><code>+</code>匹配前面的子表达式一次或多次(大于等于1次）;&quot;zo+&quot;能匹配&quot;zo&quot;以及&quot;zoo&quot;，但不能匹配&quot;z&quot;。+等价于{1,}</p>
</li>
<li><p><code>?</code>匹配前面的子表达式零次或一次;&quot;do(es)?&quot;可以匹配&quot;do&quot;或&quot;does&quot;中的&quot;do&quot;。?等价于{0,1}</p>
</li>
<li><p><code>{n}</code>n是一个非负整数。匹配确定的n次;&quot;o{2}&quot;不能匹配&quot;Bob&quot;中的&quot;o&quot;，但是能匹配&quot;food&quot;中的两个o</p>
</li>
<li><p><code>{n,}</code>n是一个非负整数。至少匹配n次;&quot;o{2,}&quot;不能匹配&quot;Bob&quot;中的&quot;o&quot;，但能匹配&quot;foooood&quot;中的所有o
&quot;o{1,}&quot;等价于&quot;o+&quot;。&quot;o{0,}&quot;则等价于&quot;o*&quot;。</p>
</li>
<li><p><code>{n,m}</code>m和n均为非负整数，其中n&lt;=m最少匹配n次且最多匹配m次;&quot;o{1,3}&quot;将匹配&quot;fooooood&quot;中的前三个o为一组，后三个o为一组
&quot;o{0,1}&quot;等价于&quot;o?&quot;。在逗号和两个数之间<strong>不能</strong>有空格</p>
</li>
</ul>
<h3><a id="toc-f07" class="anchor" href="#toc-f07"></a>模式</h3>
<ul>
<li><code>?</code>当该字符紧跟在任何一个其他限制符(*,+,?，{n}，{n,}，{n,m})后面时，匹配模式是非贪婪的.</li>
</ul>
<h3><a id="toc-0bd" class="anchor" href="#toc-0bd"></a>边界</h3>
<ul>
<li><p><code>^</code>匹配输入字符串的开始位置;如果设置了RegExp对象的Multiline属性，^也匹配&quot;\n&quot;或&quot;\r&quot;之后的位置。</p>
</li>
<li><p><code>$</code>匹配输入字符串的结束位置;如果设置了RegExp对象的Multiline属性，$也匹配&quot;\n&quot;或&quot;\r&quot;之前的位置。</p>
</li>
<li><p><code>\b</code>匹配一个单词边界，也就是指单词和空格间的位置;&quot;er\b&quot;可以匹配&quot;never&quot;中的&quot;er&quot;，但不能匹配&quot;verb&quot;中的&quot;er&quot;。</p>
</li>
<li><p><code>\B</code>匹配非单词边界;&quot;er\B&quot;能匹配&quot;verb&quot;中的&quot;er&quot;，但不能匹配&quot;never&quot;中的&quot;er&quot;。</p>
</li>
</ul>
<h3><a id="toc-442" class="anchor" href="#toc-442"></a>组</h3>
<ul>
<li><code>()</code>将( 和 ) 之间的表达式定义为”组”(group)，并且将匹配这个表达式的字符保存到一个临时区域;(一个正则表达式中最多可以保存9个)，它们可以用符号(\,$)加数字0-9来引用[golang中室友二维数组获取,其中<strong>二维切片</strong>的第一个(下标0)标识所有匹配从第二个(下标1)表示组]</li>
</ul>
<h3><a id="toc-c63" class="anchor" href="#toc-c63"></a>Golang中使用</h3>
<ul>
<li><p><code>func Compile(expr string) (*Regexp, error)</code>  </p>
<blockquote>
<p>Compile解析并返回一个正则表达式。如果成功返回，该Regexp就可用于匹配文本</p>
</blockquote>
</li>
<li><p><code>func MustCompile(str string) *Regexp</code></p>
<blockquote>
<p>MustCompile类似Compile但会在解析失败时panic，主要用于全局正则表达式变量的安全初始化  </p>
</blockquote>
</li>
<li><p><code>Find(All)?(String)?(Submatch)?(Index)?</code></p>
<blockquote>
<p>&#39;All&#39;该方法会返回输入中所有互不重叠的匹配结果<br>&#39;String&#39;出现了,匹配对象为字符串，否则应该是[]byte类型，返回值和匹配对象的类型是对应的<br>&#39;Submatch&#39;出现了,返回值是表示正则表达式中成功的组匹配（子匹配/次级匹配）的切片   </p>
</blockquote>
</li>
<li><p><code>func (re *Regexp) Match(b []byte) bool</code></p>
<blockquote>
<p>Match检查b中是否存在匹配pattern的子序列</p>
</blockquote>
</li>
<li><p><code>func (re *Regexp) MatchString(s string) bool</code></p>
<blockquote>
<p>MatchString类似Match，但匹配对象是字符串</p>
</blockquote>
</li>
<li><p><code>func (re *Regexp) FindAllString(s string, n int) []string</code></p>
<blockquote>
<p>返回正则表达式re在s中的所有不重叠的匹配结果的[]string切片。<br>如果没有匹配到，会返回nil<br>N表示s [0,n) n&lt;0表示整个s中查找</p>
</blockquote>
</li>
<li><p><code>func(re*Regexp) FindAllStringSubmatch(s string, n int) [][]string</code></p>
<blockquote>
<p>返回正则表达式re在s中的所有不重叠的匹配结果及其对应的(可能有的)分组匹配的结果的[][]string切片</p>
</blockquote>
</li>
<li><p><code>func (re *Regexp) Split(s string, n int) []string</code> </p>
<blockquote>
<p>Split将re在s中匹配到的结果作为分隔符将s分割成多个字符串，并返回这些正则匹配结果之间的字符串的切片</p>
</blockquote>
</li>
<li><p><code>func (re *Regexp) ReplaceAllString(src, repl string) string</code></p>
<blockquote>
<p>返回src的一个拷贝，将src中所有re的匹配结果都替换为repl。<br>在替换时，repl中的&#39;$&#39;符号会按照Expand方法的规则进行解释<br>和替换，例如$1会被替换为第一个分组匹配结果  </p>
</blockquote>
</li>
</ul>
', 1, '2017-10-14 15:13:28', '2018-07-21 10:32:52', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('25', '3', '1', 0, 3, 'xorm 备份sql文件还原失败解决记录', 'fix-xorm-bak-sql', '<h3 id="-">起因</h3>
<ul>
<li><p>今天被通知发现一个网站没有显示数据</p>
</li>
<li><p>查看原因,服务器上被新部署了<code>php</code>网站如下</p>
<p>  <img src="/static/upload/20171107/bqpJ0axwSkLrRW2Sg1Qxdhcy.png" alt="alt"></p>
</li>
<li><p>部署的为某<code>CMS</code>如</p>
</li>
</ul>
', '### 起因
- 今天被通知发现一个网站没有显示数据

- 查看原因,服务器上被新部署了`php`网站如下

    ![alt](/static/upload/20171107/bqpJ0axwSkLrRW2Sg1Qxdhcy.png)

- 部署的为某`CMS`如
<!--more-->下

    ![alt](/static/upload/20171107/DPh9SApsbEVgwDxr9EwkK-lU.png)
- 集成环境为`phpStudy`如下

    ![alt](/static/upload/20171107/eA4G0QwJpk4HlzRCuonCTBHl.png)
- 检查发现 `mysql` ,`nginx` 被替换，原来数据库数据消失(被删除)
- 准备采用自动备份的数据库文件(每一周备份一次保存最近一个月的数据)进行还原
  发现无法直接利用`xorm`所备份的`sql`文件，错误提示为语法错误
 > 其中包括采用`xorm`自带的还原方式
- 写了一段代码`fix`备份所产生的语法问题

### 代码如下
```
package main

import (
	"bytes"
	"flag"
	"fmt"
	"io/ioutil"
)

var (
	in  string
	out string
)

func init() {
	flag.StringVar(&in, `i`, ``, `Use -i <sql file src path eg:in.sql>`)
	flag.StringVar(&out, `o`, ``, `Use -o <sql file dest path eg:out.sql>`)
}

func main() {
	flag.Parse()
	if len(in) == 0 {
		fmt.Println(`Use -i <sql file src path eg:in.sql>`)
		return
	}
	if len(out) == 0 {
		fmt.Println(`Use -o <sql file dest path eg:out.sql>`)
		return
	}
	buf, err := ioutil.ReadFile(in)
	if err != nil {
		fmt.Println(err.Error())
		return
	}
	buf = bytes.Replace(buf, []byte("\r\n"), []byte(" "), -1)
	buf = bytes.Replace(buf, []byte(" +0800 CST"), []byte(""), -1)
	err = ioutil.WriteFile(out, buf, 0777)
	if err != nil {
		fmt.Println(err.Error())
		return
	}
}

```
### 使用方式
```
fix.exe -i back.sql -o out.sql
```', '<div class="toc"><ul>
<li><a href="#toc-968">起因</a></li>
<li><a href="#toc-72a">代码如下</a></li>
<li><a href="#toc-a65">使用方式</a></li>
</ul>
</div><h3><a id="toc-968" class="anchor" href="#toc-968"></a>起因</h3>
<ul>
<li><p>今天被通知发现一个网站没有显示数据</p>
</li>
<li><p>查看原因,服务器上被新部署了<code>php</code>网站如下</p>
<p>  <img src="/static/upload/20171107/bqpJ0axwSkLrRW2Sg1Qxdhcy.png" alt="alt"></p>
</li>
<li><p>部署的为某<code>CMS</code>如
<!--more-->下</p>
<p>  <img src="/static/upload/20171107/DPh9SApsbEVgwDxr9EwkK-lU.png" alt="alt"></p>
</li>
<li><p>集成环境为<code>phpStudy</code>如下</p>
<p>  <img src="/static/upload/20171107/eA4G0QwJpk4HlzRCuonCTBHl.png" alt="alt"></p>
</li>
<li>检查发现 <code>mysql</code> ,<code>nginx</code> 被替换，原来数据库数据消失(被删除)</li>
<li>准备采用自动备份的数据库文件(每一周备份一次保存最近一个月的数据)进行还原
发现无法直接利用<code>xorm</code>所备份的<code>sql</code>文件，错误提示为语法错误<blockquote>
<p>其中包括采用<code>xorm</code>自带的还原方式</p>
</blockquote>
</li>
<li>写了一段代码<code>fix</code>备份所产生的语法问题</li>
</ul>
<h3><a id="toc-72a" class="anchor" href="#toc-72a"></a>代码如下</h3>
<pre><code class="hljs lang-stata">package main

import (
    <span class="hljs-string">"bytes"</span>
    <span class="hljs-string">"flag"</span>
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"io/ioutil"</span>
)

<span class="hljs-keyword">var</span> (
    <span class="hljs-keyword">in</span>  <span class="hljs-built_in">string</span>
    <span class="hljs-keyword">out</span> <span class="hljs-built_in">string</span>
)

func init() {
    flag.StringVar(&amp;<span class="hljs-keyword">in</span>, `i`, ``, `<span class="hljs-keyword">Use</span> -i &lt;sql <span class="hljs-keyword">file</span> src path eg:<span class="hljs-keyword">in</span>.sql&gt;`)
    flag.StringVar(&amp;<span class="hljs-keyword">out</span>, `o`, ``, `<span class="hljs-keyword">Use</span> -o &lt;sql <span class="hljs-keyword">file</span> dest path eg:<span class="hljs-keyword">out</span>.sql&gt;`)
}

func main() {
    flag.<span class="hljs-keyword">Parse</span>()
    <span class="hljs-keyword">if</span> len(<span class="hljs-keyword">in</span>) == 0 {
        fmt.Println(`<span class="hljs-keyword">Use</span> -i &lt;sql <span class="hljs-keyword">file</span> src path eg:<span class="hljs-keyword">in</span>.sql&gt;`)
        <span class="hljs-built_in">return</span>
    }
    <span class="hljs-keyword">if</span> len(<span class="hljs-keyword">out</span>) == 0 {
        fmt.Println(`<span class="hljs-keyword">Use</span> -o &lt;sql <span class="hljs-keyword">file</span> dest path eg:<span class="hljs-keyword">out</span>.sql&gt;`)
        <span class="hljs-built_in">return</span>
    }
    buf, <span class="hljs-keyword">err</span> := ioutil.ReadFile(<span class="hljs-keyword">in</span>)
    <span class="hljs-keyword">if</span> <span class="hljs-keyword">err</span> != nil {
        fmt.Println(<span class="hljs-keyword">err</span>.<span class="hljs-keyword">Error</span>())
        <span class="hljs-built_in">return</span>
    }
    buf = bytes.<span class="hljs-keyword">Replace</span>(buf, []byte(<span class="hljs-string">"\r\n"</span>), []byte(<span class="hljs-string">" "</span>), -1)
    buf = bytes.<span class="hljs-keyword">Replace</span>(buf, []byte(<span class="hljs-string">" +0800 CST"</span>), []byte(<span class="hljs-string">""</span>), -1)
    <span class="hljs-keyword">err</span> = ioutil.WriteFile(<span class="hljs-keyword">out</span>, buf, 0777)
    <span class="hljs-keyword">if</span> <span class="hljs-keyword">err</span> != nil {
        fmt.Println(<span class="hljs-keyword">err</span>.<span class="hljs-keyword">Error</span>())
        <span class="hljs-built_in">return</span>
    }
}

</code></pre><h3><a id="toc-a65" class="anchor" href="#toc-a65"></a>使用方式</h3>
<pre><code class="hljs lang-stylus">fix<span class="hljs-selector-class">.exe</span> -<span class="hljs-selector-tag">i</span> back<span class="hljs-selector-class">.sql</span> -o out<span class="hljs-selector-class">.sql</span>
</code></pre>', 1, '2017-11-07 20:07:56', '2018-03-11 11:33:56', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('26', '1', '1', 0, 3, 'git使用', 'git', '<h2 id="-">安装</h2>
<ul>
<li>windows <a href="https://git-for-windows.github.io/">git-for-windows</a></li>
<li>ubuntu <code>sudo apt-get install git</code></li>
</ul>
<h2 id="-">配置信息</h2>
<h3 id="-">必须配置</h3>
<pre><code class="hljs lang-stylus"><span class="hljs-comment">// 配置用户名</span>
git config --global user<span class="hljs-selector-class">.name</span> <span class="hljs-string">"zxysilent"</span>
<span class="hljs-comment">//配置用户邮箱</span>
git config --global user<span class="hljs-selector-class">.email</span> <span class="hljs-string">"zxysilent@outlook.com"</span>
</code></pre>', '## 安装
-  windows [git-for-windows](https://git-for-windows.github.io/)
- ubuntu `sudo apt-get install git  `

## 配置信息
### 必须配置
~~~
// 配置用户名
git config --global user.name "zxysilent"
//配置用户邮箱
git config --global user.email "zxysilent@outlook.com"
~~~
<!--more-->
>  `--global` 表示你这台机器上所有的Git仓库都会使用这个配置   


### 其他配置
~~~
$ git config --list
~~~
比如`git config core.ignorecase false `设置大小写敏感
## 关系图
![alt](/static/upload/20171110/hC6J5jgPE8-mixAQRpQR23Bx.png)

>  Workspace:工作区  
>  Index/Stage:暂存区  
>  Repository:本地仓库  
>  Remote:远程仓库

## 基本Git使用
### 版本跟踪
1. 选择一个文件夹  
![alt](/static/upload/20171110/Ohl5oZeTTazra37NnOjeihMu.png)
2. 使用`git init`命令把这个目录变成Git可以管理的仓库
~~~
git init  
Initialized empty Git repository in D:/App/Github/zxyslt/.git/ 
~~~
> 当前目录下会自动创建一个**隐藏的**.git的目录，这个目录是Git来跟踪管理版本库的，**不要自己修改这个目录里面的文件**，因为修改了文件可能产生不可预知的问题! 比如把Git仓库给破坏了。
3. 用`vscode` or `notepad++` **不是Windows自带的notepad** 添加测试文件`a.txt`写上一点数据aaaaaa  

    -  用`git add a.txt`把文件a.txt添加到暂存区(Index/Stage)
    ~~~
    $ git add a.txt
    ~~~
    > 命令行中执行命令后没有提示信息一般代表**成功**  

    - 用`git commit -m "备注信息"`把暂存区的内容添加到本地仓库(Repository)
    ~~~
     $ git commit -m "write aaaaaa"
    [master (root-commit) caac3d8] write aaaaaa
     1 file changed, 1 insertion(+)
     create mode 100644 a.txt
    ~~~
    > 注释为中文可能发生意外(Please refer to Baidu!)
    - 用`git status`查看工作区的状态(Workspace)
    ~~~
    $ git status
    On branch master
    nothing to commit, working tree clean
    ~~~
    - 修改文件`a.txt`添加一行bbbbbb 保存  
      用`git status`查看工作区的状态  
        ~~~
       $ git status
       On branch master
       Changes not staged for commit:
           (use "git add <file>..." to update what will be committed)
           (use "git checkout -- <file>..." to discard changes in working directory)
            modified:   a.txt
       no changes added to commit (use "git add" and/or "git commit -a")
    ~~~
    用 `git diff` or `git diff a.txt `查看文件变化
    ~~~
    $ git diff a.txt
    diff --git a/a.txt b/a.txt
    index 90b4516..85553e8 100644
    --- a/a.txt
    +++ b/a.txt
       @@ -1 +1,2 @@
         aaaaaa
        +bbbbbb
    ~~~
    - 用`git add a.txt`把文件a.txt添加到暂存区然后用`git status`查看工作区的状态
    ~~~
    $ git status
    On branch master
    Changes to be committed:
     (use "git reset HEAD <file>..." to unstage)
        modified:   a.txt
    ~~~
    - 用`git commit -m "备注信息"`把暂存区的内容添加到本地仓库 
    ~~~
    $ git commit -m "append bbbbbb"
    [master 1baf46d] append bbbbbb
     1 file changed, 1 insertion(+)
    ~~~
    - 用`git log`查看提交记录  
    ~~~
    $ git log
    commit 1baf46dea014d993843137d3bf0aa56fe448699a (HEAD -> master)
    Author: zxysilent <zxysilent@foxmail.com>
    Date:   Fri Nov 10 21:18:13 2017 +0800
        append bbbbbb
    commit caac3d8a845500c95f70499b40710826fcd644af
    Author: zxysilent <zxysilent@foxmail.com>
    Date:   Fri Nov 10 21:00:34 2017 +0800
        write aaaaaa
    ~~~

 - 用`git log --pretty=oneline`查看简要提交记录
    ~~~
    $ git log --pretty=oneline
    1baf46dea014d993843137d3bf0aa56fe448699a (HEAD -> master) append bbbbbb
    caac3d8a845500c95f70499b40710826fcd644af write aaaaaa
    ~~~
    > 每一次提交就是一个版本  **commit_id**

#### 小结
- `git init` 初始化一个仓库
-  `git add file` 添加文件到暂存区
- `git commit -m "注释信息"` 把暂存区文件添加到仓库(一次提交为一个版本)
- `git status` 查看工作区状态信息
- `git diff ` or `git diff  <file>` 查看文件变化信息
- `git log`查看提交记录  
- `git log --pretty=oneline`查看简要提交记录

### 后悔药
1. 修改文件a.txt添加一行cccccc保存
    - 用`git add a.txt`添加到暂存区
    - 用`git commit -m "append cccccc"`提交到版本库
2.  用`git log `查看版本记录
    ~~~
    $ git log
    commit cccb318a93f00cd0dd092c8385354e0d34f3d226 (HEAD -> master)
    Author: zxysilent <zxysilent@foxmail.com>
    Date:   Fri Nov 10 21:50:35 2017 +0800
        append cccccc
    commit 1baf46dea014d993843137d3bf0aa56fe448699a
    Author: zxysilent <zxysilent@foxmail.com>
    Date:   Fri Nov 10 21:18:13 2017 +0800
        append bbbbbb
    commit caac3d8a845500c95f70499b40710826fcd644af
    Author: zxysilent <zxysilent@foxmail.com>
    Date:   Fri Nov 10 21:00:34 2017 +0800
        write aaaaaa
    ~~~  
2. 用`git reset  --hard HEAD^` 把当前的版本回退到上一个版本(**with two dashes**)
    ~~~
    $ git reset --hard HEAD^
    HEAD is now at 1baf46d append bbbbbb
    ~~~
> 要回退到上上个版本只需把`HEAD^`改成`HEAD^^`以此类推。  
> 如果要回退到前100个版本的话，可以使用`git reset  –hard HEAD~100`即可  
> 更多信息Please refer to Baidu!
3. 用`git reset --hard commit_id` 把当前的版本切换到指定版本
    ~~~
    $ git reset --hard caac3d8
    HEAD is now at caac3d8 write aaaaaa
    ~~~
    > 一般输入**前7个**就可以了  

5. 用`git log `查看版本记录
    ~~~
    $ git log
    commit caac3d8a845500c95f70499b40710826fcd644af
    Author: zxysilent <zxysilent@foxmail.com>
    Date:   Fri Nov 10 21:00:34 2017 +0800
        write aaaaaa
    ~~~  
**其他提交信息不见了，不见了**
5. 用`git reflog `查看每次操作版本的记录
~~~
    $ git reflog
    caac3d8 (HEAD -> master) HEAD@{0}: reset: moving to caac3d8
    1baf46d HEAD@{1}: reset: moving to HEAD^
    cccb318 HEAD@{2}: commit: append cccccc
    1baf46d HEAD@{3}: commit: append bbbbbb
    caac3d8 (HEAD -> master) HEAD@{4}: commit (initial): write aaaaaa
~~~
> 看到了熟悉的版本号又可以用`git reset --hard commit_id`切换到指定版本  

#### 小结
-  `git log` 查看提交记录
- `git reset --hard HEAD^` 把当前的版本回退到上一个版本
- `git reflog` 查看每次操作版本的记录
- `git reset --hard commit_id` 把当前的版本切换到指定版本  

### 撤销修改
#### 情形A(工作区)
1. 修改文件a.txt添加一行dddeee保存并用`git status`查看工作区信息
    ~~~
    $ git status
    On branch master
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
            modified:   a.txt
    no changes added to commit (use "git add" and/or "git commit -a")
    ~~~
**突然意识到** 天啦不是应该dddddd  
此处有重点**  (use "git checkout -- <file>..." to discard changes in working directory)**
2. 用`git checkout -- a.txt` 丢弃工作区  
~~~
    $ git checkout -- a.txt
~~~
查看文件发现dddeee消失了  
**注意这里有两种情况：**
> 一种是`a.txt`自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；  
> 一种是`a.txt`已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。  
> 总之，`git checkout -- <file>`就是让这个文件回到最近一次`git commit`或`git add`时的状态。

#### 情形B(暂存区)
1. 修改文件a.txt添加一行fffggg保存然后用`git add a.txt`添加到暂存区再用`git status`查看工作区信息
    ~~~
    $ git status
    On branch master
    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)
            modified:   a.txt
    ~~~
此处又有重点**  (use "git reset HEAD <file>..." to unstage)**
> Index/Stage:暂存区  
> 要多看提示信息
2. 用`git reset HEAD  a.txt` 暂存区的修改撤销掉  
    ~~~
   $ git reset head a.txt
   Unstaged changes after reset:
   M       a.txt
    ~~~
3. 用`git status`查看工作区信息
    ~~~
    $ git status
    On branch master
    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
            modified:   a.txt
    no changes added to commit (use "git add" and/or "git commit -a")
    ~~~
> 现在暂存区是干净的，工作区有修改  
> `git checkout -- <file>` 丢弃工作区

#### 情形C
> 版本库？  
> `git reset --hard commit_id`为所欲为

#### 小结
- 工作区修改**未**提交 `git checkout -- <file>` 工作区撤销到**版本库**一样
- 工作区修改**已经**提交 `git checkout -- <file>` 工作区撤销到**暂存区**一样
- 工作区修改**已经**提交 ``git reset HEAD  a.txt` 暂存区的修改撤销掉  
- `git reset --hard commit_id` 把当前的版本切换到指定版本

### 删除文件
1. 添加t.txt文件写上一点数据tttttt添加到暂存区(`git add t.txt`)并且提交到版本库(`git commit -m "备注信息"`)
    ~~~
    git add t.txt
    $ git commit -m "add t.txt"
    [master 2d0d9fa] add t.txt
     1 file changed, 1 insertion(+)
     create mode 100644 t.txt
    ~~~
2. 删除t.txt并用`git status`查看工作区信息
    ~~~
    $ git status
    On branch master
    Changes not staged for commit:
      (use "git add/rm <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)
            deleted:    t.txt
    no changes added to commit (use "git add" and/or "git commit -a")
    ~~~
此处有重点
  > (use "git add/rm <file>..." to update what will be committed)  
 > (use "git checkout -- <file>..." to discard changes in working directory)  

 -  用`git checkout -- <file>` 撤销删除
    ~~~
    $ git checkout -- t.txt
    ~~~
- 用 `git add/rm <file>`  并用 `git commit -m "备注信息"` 从版本库中删除
    ~~~
    $ git rm t.txt
    rm ''t.txt''
    $ git commit -m "delete t.txt"
    [master 3b3b9f2] delete t.txt
     1 file changed, 1 deletion(-)
     delete mode 100644 t.txt
    ~~~

#### 小结
- `git rm <file>` and `git commit -m "备注信息"`从版本库删除
- 误删除 `git checkout -- <file>` 撤销删除', '<div class="toc"><ul>
<li><a href="#toc-e65">安装</a></li>
<li><a href="#toc-09e">配置信息</a><ul>
<li><a href="#toc-a68">必须配置</a></li>
<li><a href="#toc-9ab">其他配置</a></li>
</ul>
</li>
<li><a href="#toc-1fb">关系图</a></li>
<li><a href="#toc-997">基本Git使用</a><ul>
<li><a href="#toc-565">版本跟踪</a><ul>
<li><a href="#toc-5db">小结</a></li>
</ul>
</li>
<li><a href="#toc-a6e">后悔药</a><ul>
<li><a href="#toc-5db">小结</a></li>
</ul>
</li>
<li><a href="#toc-a44">撤销修改</a><ul>
<li><a href="#toc-2c2">情形A(工作区)</a></li>
<li><a href="#toc-448">情形B(暂存区)</a></li>
<li><a href="#toc-cd3">情形C</a></li>
<li><a href="#toc-5db">小结</a></li>
</ul>
</li>
<li><a href="#toc-535">删除文件</a><ul>
<li><a href="#toc-5db">小结</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div><h2><a id="toc-e65" class="anchor" href="#toc-e65"></a>安装</h2>
<ul>
<li>windows <a href="https://git-for-windows.github.io/">git-for-windows</a></li>
<li>ubuntu <code>sudo apt-get install git</code></li>
</ul>
<h2><a id="toc-09e" class="anchor" href="#toc-09e"></a>配置信息</h2>
<h3><a id="toc-a68" class="anchor" href="#toc-a68"></a>必须配置</h3>
<pre><code class="hljs lang-stylus"><span class="hljs-comment">// 配置用户名</span>
git config --global user<span class="hljs-selector-class">.name</span> <span class="hljs-string">"zxysilent"</span>
<span class="hljs-comment">//配置用户邮箱</span>
git config --global user<span class="hljs-selector-class">.email</span> <span class="hljs-string">"zxysilent@outlook.com"</span>
</code></pre><!--more-->
<blockquote>
<p> <code>--global</code> 表示你这台机器上所有的Git仓库都会使用这个配置   </p>
</blockquote>
<h3><a id="toc-9ab" class="anchor" href="#toc-9ab"></a>其他配置</h3>
<pre><code class="hljs lang-routeros">$ git<span class="hljs-built_in"> config </span>--list
</code></pre><p>比如<code>git config core.ignorecase false</code>设置大小写敏感</p>
<h2><a id="toc-1fb" class="anchor" href="#toc-1fb"></a>关系图</h2>
<p><img src="/static/upload/20171110/hC6J5jgPE8-mixAQRpQR23Bx.png" alt="alt"></p>
<blockquote>
<p> Workspace:工作区<br> Index/Stage:暂存区<br> Repository:本地仓库<br> Remote:远程仓库</p>
</blockquote>
<h2><a id="toc-997" class="anchor" href="#toc-997"></a>基本Git使用</h2>
<h3><a id="toc-565" class="anchor" href="#toc-565"></a>版本跟踪</h3>
<ol>
<li>选择一个文件夹<br><img src="/static/upload/20171110/Ohl5oZeTTazra37NnOjeihMu.png" alt="alt"></li>
<li>使用<code>git init</code>命令把这个目录变成Git可以管理的仓库<pre><code class="hljs lang-groovy">git init  
Initialized empty Git repository <span class="hljs-keyword">in</span> <span class="hljs-string">D:</span><span class="hljs-regexp">/App/</span>Github<span class="hljs-regexp">/zxyslt/</span>.git/ 
</code></pre><blockquote>
<p>当前目录下会自动创建一个<strong>隐藏的</strong>.git的目录，这个目录是Git来跟踪管理版本库的，<strong>不要自己修改这个目录里面的文件</strong>，因为修改了文件可能产生不可预知的问题! 比如把Git仓库给破坏了。</p>
</blockquote>
</li>
<li><p>用<code>vscode</code> or <code>notepad++</code> <strong>不是Windows自带的notepad</strong> 添加测试文件<code>a.txt</code>写上一点数据aaaaaa  </p>
<ul>
<li><p>用<code>git add a.txt</code>把文件a.txt添加到暂存区(Index/Stage)</p>
<pre><code class="hljs lang-stylus">$ git add <span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
</code></pre><blockquote>
<p>命令行中执行命令后没有提示信息一般代表<strong>成功</strong>  </p>
</blockquote>
</li>
<li><p>用<code>git commit -m &quot;备注信息&quot;</code>把暂存区的内容添加到本地仓库(Repository)</p>
<pre><code class="hljs lang-sql">$ git <span class="hljs-keyword">commit</span> -m <span class="hljs-string">"write aaaaaa"</span>
[<span class="hljs-keyword">master</span> (root-<span class="hljs-keyword">commit</span>) caac3d8] write aaaaaa
<span class="hljs-number">1</span> <span class="hljs-keyword">file</span> <span class="hljs-keyword">changed</span>, <span class="hljs-number">1</span> insertion(+)
<span class="hljs-keyword">create</span> <span class="hljs-keyword">mode</span> <span class="hljs-number">100644</span> a.txt
</code></pre><blockquote>
<p>注释为中文可能发生意外(Please refer to Baidu!)</p>
</blockquote>
</li>
<li>用<code>git status</code>查看工作区的状态(Workspace)<pre><code class="hljs lang-pgsql">$ git status
<span class="hljs-keyword">On</span> branch master
<span class="hljs-keyword">nothing</span> <span class="hljs-keyword">to</span> <span class="hljs-keyword">commit</span>, working tree clean
</code></pre></li>
<li>修改文件<code>a.txt</code>添加一行bbbbbb 保存<br>用<code>git status</code>查看工作区的状态  <pre><code class="hljs lang-sql"> $ git status
 On branch master
 Changes not staged for <span class="hljs-keyword">commit</span>:
     (<span class="hljs-keyword">use</span> <span class="hljs-string">"git add &lt;file&gt;..."</span> <span class="hljs-keyword">to</span> <span class="hljs-keyword">update</span> what will be committed)
     (<span class="hljs-keyword">use</span> <span class="hljs-string">"git checkout -- &lt;file&gt;..."</span> <span class="hljs-keyword">to</span> discard changes <span class="hljs-keyword">in</span> working <span class="hljs-keyword">directory</span>)
      modified:   a.txt
 <span class="hljs-keyword">no</span> changes added <span class="hljs-keyword">to</span> <span class="hljs-keyword">commit</span> (<span class="hljs-keyword">use</span> <span class="hljs-string">"git add"</span> <span class="hljs-keyword">and</span>/<span class="hljs-keyword">or</span> <span class="hljs-string">"git commit -a"</span>)
</code></pre>用 <code>git diff</code> or <code>git diff a.txt</code>查看文件变化<pre><code class="hljs lang-stylus">$ git diff <span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
diff --git a/<span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span> b/<span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
index <span class="hljs-number">90</span>b4516..<span class="hljs-number">85553</span>e8 <span class="hljs-number">100644</span>
--- a/<span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
+++ b/<span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
 @@ -<span class="hljs-number">1</span> +<span class="hljs-number">1</span>,<span class="hljs-number">2</span> @@
   aaaaaa
  +bbbbbb
</code></pre></li>
<li>用<code>git add a.txt</code>把文件a.txt添加到暂存区然后用<code>git status</code>查看工作区的状态<pre><code class="hljs lang-stylus">$ git status
On branch master
Changes to be committed:
(use <span class="hljs-string">"git reset HEAD &lt;file&gt;..."</span> to unstage)
  modified:   <span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
</code></pre></li>
<li>用<code>git commit -m &quot;备注信息&quot;</code>把暂存区的内容添加到本地仓库 <pre><code class="hljs lang-lsl">$ git commit -m <span class="hljs-string">"append bbbbbb"</span>
[master <span class="hljs-number">1</span>baf46d] append bbbbbb
<span class="hljs-number">1</span> file <span class="hljs-section">changed</span>, <span class="hljs-number">1</span> insertion(+)
</code></pre></li>
<li>用<code>git log</code>查看提交记录  <pre><code class="hljs lang-angelscript">$ git log
commit <span class="hljs-number">1</span>baf46dea014d993843137d3bf0aa56fe448699a (HEAD -&gt; master)
Author: zxysilent &lt;<span class="hljs-symbol">zxysilent@</span>foxmail.com&gt;
Date:   Fri Nov <span class="hljs-number">10</span> <span class="hljs-number">21</span>:<span class="hljs-number">18</span>:<span class="hljs-number">13</span> <span class="hljs-number">2017</span> +<span class="hljs-number">0800</span>
  append bbbbbb
commit caac3d8a845500c95f70499b40710826fcd644af
Author: zxysilent &lt;<span class="hljs-symbol">zxysilent@</span>foxmail.com&gt;
Date:   Fri Nov <span class="hljs-number">10</span> <span class="hljs-number">21</span>:<span class="hljs-number">00</span>:<span class="hljs-number">34</span> <span class="hljs-number">2017</span> +<span class="hljs-number">0800</span>
  write aaaaaa
</code></pre></li>
</ul>
<ul>
<li>用<code>git log --pretty=oneline</code>查看简要提交记录<pre><code class="hljs lang-livecodeserver">$ git <span class="hljs-built_in">log</span> <span class="hljs-comment">--pretty=oneline</span>
<span class="hljs-number">1</span>baf46dea014d993843137d3bf0aa56fe448699a (HEAD -&gt; master) append bbbbbb
caac3d8a845500c95f70499b40710826fcd644af <span class="hljs-built_in">write</span> aaaaaa
</code></pre><blockquote>
<p>每一次提交就是一个版本  <strong>commit_id</strong></p>
</blockquote>
</li>
</ul>
</li>
</ol>
<h4><a id="toc-5db" class="anchor" href="#toc-5db"></a>小结</h4>
<ul>
<li><code>git init</code> 初始化一个仓库</li>
<li><code>git add file</code> 添加文件到暂存区</li>
<li><code>git commit -m &quot;注释信息&quot;</code> 把暂存区文件添加到仓库(一次提交为一个版本)</li>
<li><code>git status</code> 查看工作区状态信息</li>
<li><code>git diff</code> or <code>git diff  &lt;file&gt;</code> 查看文件变化信息</li>
<li><code>git log</code>查看提交记录  </li>
<li><code>git log --pretty=oneline</code>查看简要提交记录</li>
</ul>
<h3><a id="toc-a6e" class="anchor" href="#toc-a6e"></a>后悔药</h3>
<ol>
<li>修改文件a.txt添加一行cccccc保存<ul>
<li>用<code>git add a.txt</code>添加到暂存区</li>
<li>用<code>git commit -m &quot;append cccccc&quot;</code>提交到版本库</li>
</ul>
</li>
<li>用<code>git log</code>查看版本记录<pre><code class="hljs lang-angelscript">$ git log
commit cccb318a93f00cd0dd092c8385354e0d34f3d226 (HEAD -&gt; master)
Author: zxysilent &lt;<span class="hljs-symbol">zxysilent@</span>foxmail.com&gt;
Date:   Fri Nov <span class="hljs-number">10</span> <span class="hljs-number">21</span>:<span class="hljs-number">50</span>:<span class="hljs-number">35</span> <span class="hljs-number">2017</span> +<span class="hljs-number">0800</span>
    append cccccc
commit <span class="hljs-number">1</span>baf46dea014d993843137d3bf0aa56fe448699a
Author: zxysilent &lt;<span class="hljs-symbol">zxysilent@</span>foxmail.com&gt;
Date:   Fri Nov <span class="hljs-number">10</span> <span class="hljs-number">21</span>:<span class="hljs-number">18</span>:<span class="hljs-number">13</span> <span class="hljs-number">2017</span> +<span class="hljs-number">0800</span>
    append bbbbbb
commit caac3d8a845500c95f70499b40710826fcd644af
Author: zxysilent &lt;<span class="hljs-symbol">zxysilent@</span>foxmail.com&gt;
Date:   Fri Nov <span class="hljs-number">10</span> <span class="hljs-number">21</span>:<span class="hljs-number">00</span>:<span class="hljs-number">34</span> <span class="hljs-number">2017</span> +<span class="hljs-number">0800</span>
    write aaaaaa
</code></pre></li>
<li>用<code>git reset  --hard HEAD^</code> 把当前的版本回退到上一个版本(<strong>with two dashes</strong>)<pre><code class="hljs lang-sql"> $ git <span class="hljs-keyword">reset</span> <span class="hljs-comment">--hard HEAD^</span>
 <span class="hljs-keyword">HEAD</span> <span class="hljs-keyword">is</span> <span class="hljs-keyword">now</span> <span class="hljs-keyword">at</span> <span class="hljs-number">1</span>baf46d append bbbbbb
</code></pre><blockquote>
<p>要回退到上上个版本只需把<code>HEAD^</code>改成<code>HEAD^^</code>以此类推。<br>如果要回退到前100个版本的话，可以使用<code>git reset  –hard HEAD~100</code>即可<br>更多信息Please refer to Baidu!</p>
</blockquote>
</li>
<li><p>用<code>git reset --hard commit_id</code> 把当前的版本切换到指定版本</p>
<pre><code class="hljs lang-sql"> $ git <span class="hljs-keyword">reset</span> <span class="hljs-comment">--hard caac3d8</span>
 <span class="hljs-keyword">HEAD</span> <span class="hljs-keyword">is</span> <span class="hljs-keyword">now</span> <span class="hljs-keyword">at</span> caac3d8 write aaaaaa
</code></pre><blockquote>
<p>一般输入<strong>前7个</strong>就可以了  </p>
</blockquote>
</li>
<li><p>用<code>git log</code>查看版本记录</p>
<pre><code class="hljs lang-angelscript"> $ git log
 commit caac3d8a845500c95f70499b40710826fcd644af
 Author: zxysilent &lt;<span class="hljs-symbol">zxysilent@</span>foxmail.com&gt;
 Date:   Fri Nov <span class="hljs-number">10</span> <span class="hljs-number">21</span>:<span class="hljs-number">00</span>:<span class="hljs-number">34</span> <span class="hljs-number">2017</span> +<span class="hljs-number">0800</span>
     write aaaaaa
</code></pre><p><strong>其他提交信息不见了，不见了</strong></p>
</li>
<li>用<code>git reflog</code>查看每次操作版本的记录<pre><code class="hljs lang-angelscript"> $ git <span class="hljs-built_in">ref</span>log
 caac3d8 (HEAD -&gt; master) <span class="hljs-symbol">HEAD@</span>{<span class="hljs-number">0</span>}: reset: moving to caac3d8
 <span class="hljs-number">1</span>baf46d <span class="hljs-symbol">HEAD@</span>{<span class="hljs-number">1</span>}: reset: moving to HEAD^
 cccb318 <span class="hljs-symbol">HEAD@</span>{<span class="hljs-number">2</span>}: commit: append cccccc
 <span class="hljs-number">1</span>baf46d <span class="hljs-symbol">HEAD@</span>{<span class="hljs-number">3</span>}: commit: append bbbbbb
 caac3d8 (HEAD -&gt; master) <span class="hljs-symbol">HEAD@</span>{<span class="hljs-number">4</span>}: commit (initial): write aaaaaa
</code></pre><blockquote>
<p>看到了熟悉的版本号又可以用<code>git reset --hard commit_id</code>切换到指定版本  </p>
</blockquote>
</li>
</ol>
<h4><a id="toc-5db" class="anchor" href="#toc-5db"></a>小结</h4>
<ul>
<li><code>git log</code> 查看提交记录</li>
<li><code>git reset --hard HEAD^</code> 把当前的版本回退到上一个版本</li>
<li><code>git reflog</code> 查看每次操作版本的记录</li>
<li><code>git reset --hard commit_id</code> 把当前的版本切换到指定版本  </li>
</ul>
<h3><a id="toc-a44" class="anchor" href="#toc-a44"></a>撤销修改</h3>
<h4><a id="toc-2c2" class="anchor" href="#toc-2c2"></a>情形A(工作区)</h4>
<ol>
<li>修改文件a.txt添加一行dddeee保存并用<code>git status</code>查看工作区信息<pre><code class="hljs lang-sql"> $ git status
 On branch master
 Changes not staged for <span class="hljs-keyword">commit</span>:
   (<span class="hljs-keyword">use</span> <span class="hljs-string">"git add &lt;file&gt;..."</span> <span class="hljs-keyword">to</span> <span class="hljs-keyword">update</span> what will be committed)
   (<span class="hljs-keyword">use</span> <span class="hljs-string">"git checkout -- &lt;file&gt;..."</span> <span class="hljs-keyword">to</span> discard changes <span class="hljs-keyword">in</span> working <span class="hljs-keyword">directory</span>)
         modified:   a.txt
 <span class="hljs-keyword">no</span> changes added <span class="hljs-keyword">to</span> <span class="hljs-keyword">commit</span> (<span class="hljs-keyword">use</span> <span class="hljs-string">"git add"</span> <span class="hljs-keyword">and</span>/<span class="hljs-keyword">or</span> <span class="hljs-string">"git commit -a"</span>)
</code></pre><strong>突然意识到</strong> 天啦不是应该dddddd<br>此处有重点<strong>  (use &quot;git checkout -- <file>...&quot; to discard changes in working directory)</strong></li>
<li>用<code>git checkout -- a.txt</code> 丢弃工作区  <pre><code class="hljs lang-stylus"> $ git checkout -- <span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
</code></pre>查看文件发现dddeee消失了<br><strong>注意这里有两种情况：</strong><blockquote>
<p>一种是<code>a.txt</code>自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态；<br>一种是<code>a.txt</code>已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态。<br>总之，<code>git checkout -- &lt;file&gt;</code>就是让这个文件回到最近一次<code>git commit</code>或<code>git add</code>时的状态。</p>
</blockquote>
</li>
</ol>
<h4><a id="toc-448" class="anchor" href="#toc-448"></a>情形B(暂存区)</h4>
<ol>
<li>修改文件a.txt添加一行fffggg保存然后用<code>git add a.txt</code>添加到暂存区再用<code>git status</code>查看工作区信息<pre><code class="hljs lang-stylus"> $ git status
 On branch master
 Changes to be committed:
   (use <span class="hljs-string">"git reset HEAD &lt;file&gt;..."</span> to unstage)
         modified:   <span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
</code></pre>此处又有重点<strong>  (use &quot;git reset HEAD <file>...&quot; to unstage)</strong><blockquote>
<p>Index/Stage:暂存区<br>要多看提示信息</p>
</blockquote>
</li>
<li>用<code>git reset HEAD  a.txt</code> 暂存区的修改撤销掉  <pre><code class="hljs lang-stylus">$ git reset head <span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
Unstaged changes after reset:
M       <span class="hljs-selector-tag">a</span><span class="hljs-selector-class">.txt</span>
</code></pre></li>
<li>用<code>git status</code>查看工作区信息<pre><code class="hljs lang-sql"> $ git status
 On branch master
 Changes not staged for <span class="hljs-keyword">commit</span>:
   (<span class="hljs-keyword">use</span> <span class="hljs-string">"git add &lt;file&gt;..."</span> <span class="hljs-keyword">to</span> <span class="hljs-keyword">update</span> what will be committed)
   (<span class="hljs-keyword">use</span> <span class="hljs-string">"git checkout -- &lt;file&gt;..."</span> <span class="hljs-keyword">to</span> discard changes <span class="hljs-keyword">in</span> working <span class="hljs-keyword">directory</span>)
         modified:   a.txt
 <span class="hljs-keyword">no</span> changes added <span class="hljs-keyword">to</span> <span class="hljs-keyword">commit</span> (<span class="hljs-keyword">use</span> <span class="hljs-string">"git add"</span> <span class="hljs-keyword">and</span>/<span class="hljs-keyword">or</span> <span class="hljs-string">"git commit -a"</span>)
</code></pre><blockquote>
<p>现在暂存区是干净的，工作区有修改<br><code>git checkout -- &lt;file&gt;</code> 丢弃工作区</p>
</blockquote>
</li>
</ol>
<h4><a id="toc-cd3" class="anchor" href="#toc-cd3"></a>情形C</h4>
<blockquote>
<p>版本库？<br><code>git reset --hard commit_id</code>为所欲为</p>
</blockquote>
<h4><a id="toc-5db" class="anchor" href="#toc-5db"></a>小结</h4>
<ul>
<li>工作区修改<strong>未</strong>提交 <code>git checkout -- &lt;file&gt;</code> 工作区撤销到<strong>版本库</strong>一样</li>
<li>工作区修改<strong>已经</strong>提交 <code>git checkout -- &lt;file&gt;</code> 工作区撤销到<strong>暂存区</strong>一样</li>
<li>工作区修改<strong>已经</strong>提交 <code></code>git reset HEAD  a.txt` 暂存区的修改撤销掉  </li>
<li><code>git reset --hard commit_id</code> 把当前的版本切换到指定版本</li>
</ul>
<h3><a id="toc-535" class="anchor" href="#toc-535"></a>删除文件</h3>
<ol>
<li>添加t.txt文件写上一点数据tttttt添加到暂存区(<code>git add t.txt</code>)并且提交到版本库(<code>git commit -m &quot;备注信息&quot;</code>)<pre><code class="hljs lang-sql"> git add t.txt
 $ git <span class="hljs-keyword">commit</span> -m <span class="hljs-string">"add t.txt"</span>
 [<span class="hljs-keyword">master</span> <span class="hljs-number">2</span>d0d9fa] <span class="hljs-keyword">add</span> t.txt
  <span class="hljs-number">1</span> <span class="hljs-keyword">file</span> <span class="hljs-keyword">changed</span>, <span class="hljs-number">1</span> insertion(+)
  <span class="hljs-keyword">create</span> <span class="hljs-keyword">mode</span> <span class="hljs-number">100644</span> t.txt
</code></pre></li>
<li><p>删除t.txt并用<code>git status</code>查看工作区信息</p>
<pre><code class="hljs lang-sql"> $ git status
 On branch master
 Changes not staged for <span class="hljs-keyword">commit</span>:
   (<span class="hljs-keyword">use</span> <span class="hljs-string">"git add/rm &lt;file&gt;..."</span> <span class="hljs-keyword">to</span> <span class="hljs-keyword">update</span> what will be committed)
   (<span class="hljs-keyword">use</span> <span class="hljs-string">"git checkout -- &lt;file&gt;..."</span> <span class="hljs-keyword">to</span> discard changes <span class="hljs-keyword">in</span> working <span class="hljs-keyword">directory</span>)
         deleted:    t.txt
 <span class="hljs-keyword">no</span> changes added <span class="hljs-keyword">to</span> <span class="hljs-keyword">commit</span> (<span class="hljs-keyword">use</span> <span class="hljs-string">"git add"</span> <span class="hljs-keyword">and</span>/<span class="hljs-keyword">or</span> <span class="hljs-string">"git commit -a"</span>)
</code></pre><p>此处有重点</p>
<blockquote>
<p>(use &quot;git add/rm <file>...&quot; to update what will be committed)<br>(use &quot;git checkout -- <file>...&quot; to discard changes in working directory)  </p>
</blockquote>
<ul>
<li>用<code>git checkout -- &lt;file&gt;</code> 撤销删除<pre><code class="hljs lang-stylus">$ git checkout -- t<span class="hljs-selector-class">.txt</span>
</code></pre></li>
</ul>
</li>
<li>用 <code>git add/rm &lt;file&gt;</code>  并用 <code>git commit -m &quot;备注信息&quot;</code> 从版本库中删除<pre><code class="hljs lang-sql">  $ git rm t.txt
  rm ''t.txt''
  $ git <span class="hljs-keyword">commit</span> -m <span class="hljs-string">"delete t.txt"</span>
  [<span class="hljs-keyword">master</span> <span class="hljs-number">3</span>b3b9f2] <span class="hljs-keyword">delete</span> t.txt
   <span class="hljs-number">1</span> <span class="hljs-keyword">file</span> <span class="hljs-keyword">changed</span>, <span class="hljs-number">1</span> deletion(-)
   <span class="hljs-keyword">delete</span> <span class="hljs-keyword">mode</span> <span class="hljs-number">100644</span> t.txt
</code></pre></li>
</ol>
<h4><a id="toc-5db" class="anchor" href="#toc-5db"></a>小结</h4>
<ul>
<li><code>git rm &lt;file&gt;</code> and <code>git commit -m &quot;备注信息&quot;</code>从版本库删除</li>
<li>误删除 <code>git checkout -- &lt;file&gt;</code> 撤销删除</li>
</ul>
', 1, '2017-11-10 21:20:08', '2019-02-21 17:09:41', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('3', '0', '1', 1, 3, '友链', 'links', '', '[⛈](/dashboard/)

[⛏](/page/tool)

[动态网站](/cate/goweb)

[python](/cate/python)', '<p><a href="/dashboard/" target="_blank">⛈</a></p>
<p><a href="/page/tool" target="_blank">⛏</a></p>
<p><a href="/cate/goweb" target="_blank">动态网站</a></p>
<p><a href="/cate/python" target="_blank">python</a></p>
', 0, '2017-04-07 10:31:06', '2018-09-10 12:13:53', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('30', '1', '1', 0, 3, '使用visual studio express 写c语言', 'vs-express-c', '<h3 id="-">相关工具</h3>
<p>下载地址<br><a href="https://pan.baidu.com/s/1kWz99p9">https://pan.baidu.com/s/1kWz99p9</a><br><a href="https://pan.baidu.com/s/1kWz99p9">点击下载工具</a><br><a href="https://pan.baidu.com/s/1kWz99p9">视频操作记录</a></p>
<blockquote>
<p>包括之前的资料</p>
</blockquote>
<p><img src="/static/upload/20180301/GOyOYTiO8bzlBDwCcsc15KHh.png" alt="alt"></p>
<h3 id="-">软件安装</h3>
', '### 相关工具
下载地址  
https://pan.baidu.com/s/1kWz99p9   
[点击下载工具](https://pan.baidu.com/s/1kWz99p9)   
[视频操作记录](https://pan.baidu.com/s/1kWz99p9)
> 包括之前的资料

![alt](/static/upload/20180301/GOyOYTiO8bzlBDwCcsc15KHh.png)
### 软件安装
<!--more-->
- 选择合适的地方  
![alt](/static/upload/20180301/9dVZp-WIg8Nq1xUzHV13_sqq.png)
- 点击安装然后等待
- 安装完成选择启动  
![alt](/static/upload/20180301/2FXuxP3VQQU0N7MFRr_aWeiI.png)
![alt](/static/upload/20180301/b-m6eS29FLH1lvTEiBQ4bzp-.png)
>没有账号不登陆

    **注意**  
由于之前我已经安装过可能第一次安装会出现不一样的地方
>若出现设置开发环境请选择常规开发  
>若出现设置文档请选择无


### 软件设置-可跳过(强迫症请进)
- 设置字体  
![alt](/static/upload/20180301/55egT2s4NHSlwXYKOrHVBl5D.png)
![alt](/static/upload/20180301/f476aBqOH8lYAe8KS4VE9X2s.png)
- 其他设置  
![alt](/static/upload/20180301/0J-z8g3G3srQd9JcD1kVpnUU.png)
![alt](/static/upload/20180301/M9z4laQHxwHgmrRspE5bDsMT.png)
### 写c语言
- 新建项目  
![alt](/static/upload/20180301/SK7G_OZZYypqdjINX4EgWIOe.png)
- 项目配置  
![alt](/static/upload/20180301/POfxAteYsZ_opZFyC045vb8v.png)
![alt](/static/upload/20180301/OT7pnAcru-8mT9IeZvXzpY26.png)
![alt](/static/upload/20180301/ElMWbhArxoROmfgSOemqUdDF.png)
- 新建代码页面  
![alt](/static/upload/20180301/-Qm6FyIDW7k85kbe0WpM00Zr.png)

- 第一次代码  
```
#include "stdio.h"
// 智能提示很丰富
// 一个基本的框架
int main(){
	// 标准的例子
	printf("hello world");
	return 0;
}
```
**注意**
> ctrl + f5 运行

### 其它
- **当需要获取输入的时候请添加一个宏**
```
// 定义一个宏 取消警告 则可以运行书上例子
#define _CRT_SECURE_NO_WARNINGS
```
- 完整示例  
```
// 定义一个宏 取消警告 则可以运行书上例子
#define _CRT_SECURE_NO_WARNINGS
// 引入标准库
#include "stdio.h"
// 智能提示很丰富
// 一个基本的框架
int main(){
	// 定义一个变量
	int ipt;
	printf("请输入一个数字:");
	// 获取输入
	scanf("%d",&ipt);
	printf("你输入的是:%d", ipt);
	// 可能有时候会出现警告导致编译失败 
	// 标准的例子
	printf("hello world");
	return 0;
}
```', '<div class="toc"><ul>
<li><a href="#toc-3f3">相关工具</a></li>
<li><a href="#toc-6aa">软件安装</a></li>
<li><a href="#toc-8a5">软件设置-可跳过(强迫症请进)</a></li>
<li><a href="#toc-dac">写c语言</a></li>
<li><a href="#toc-5a0">其它</a></li>
</ul>
</div><h3><a id="toc-3f3" class="anchor" href="#toc-3f3"></a>相关工具</h3>
<p>下载地址<br><a href="https://pan.baidu.com/s/1kWz99p9">https://pan.baidu.com/s/1kWz99p9</a><br><a href="https://pan.baidu.com/s/1kWz99p9">点击下载工具</a><br><a href="https://pan.baidu.com/s/1kWz99p9">视频操作记录</a></p>
<blockquote>
<p>包括之前的资料</p>
</blockquote>
<p><img src="/static/upload/20180301/GOyOYTiO8bzlBDwCcsc15KHh.png" alt="alt"></p>
<h3><a id="toc-6aa" class="anchor" href="#toc-6aa"></a>软件安装</h3>
<!--more-->
<ul>
<li>选择合适的地方<br><img src="/static/upload/20180301/9dVZp-WIg8Nq1xUzHV13_sqq.png" alt="alt"></li>
<li>点击安装然后等待</li>
<li><p>安装完成选择启动<br><img src="/static/upload/20180301/2FXuxP3VQQU0N7MFRr_aWeiI.png" alt="alt">
<img src="/static/upload/20180301/b-m6eS29FLH1lvTEiBQ4bzp-.png" alt="alt"></p>
<blockquote>
<p>没有账号不登陆</p>
</blockquote>
<p>  <strong>注意</strong><br>由于之前我已经安装过可能第一次安装会出现不一样的地方</p>
<blockquote>
<p>若出现设置开发环境请选择常规开发<br>若出现设置文档请选择无</p>
</blockquote>
</li>
</ul>
<h3><a id="toc-8a5" class="anchor" href="#toc-8a5"></a>软件设置-可跳过(强迫症请进)</h3>
<ul>
<li>设置字体<br><img src="/static/upload/20180301/55egT2s4NHSlwXYKOrHVBl5D.png" alt="alt">
<img src="/static/upload/20180301/f476aBqOH8lYAe8KS4VE9X2s.png" alt="alt"></li>
<li>其他设置<br><img src="/static/upload/20180301/0J-z8g3G3srQd9JcD1kVpnUU.png" alt="alt">
<img src="/static/upload/20180301/M9z4laQHxwHgmrRspE5bDsMT.png" alt="alt"><h3><a id="toc-dac" class="anchor" href="#toc-dac"></a>写c语言</h3>
</li>
<li>新建项目<br><img src="/static/upload/20180301/SK7G_OZZYypqdjINX4EgWIOe.png" alt="alt"></li>
<li>项目配置<br><img src="/static/upload/20180301/POfxAteYsZ_opZFyC045vb8v.png" alt="alt">
<img src="/static/upload/20180301/OT7pnAcru-8mT9IeZvXzpY26.png" alt="alt">
<img src="/static/upload/20180301/ElMWbhArxoROmfgSOemqUdDF.png" alt="alt"></li>
<li><p>新建代码页面<br><img src="/static/upload/20180301/-Qm6FyIDW7k85kbe0WpM00Zr.png" alt="alt"></p>
</li>
<li><p>第一次代码  </p>
<pre><code class="hljs lang-cpp"><span class="hljs-meta">#<span class="hljs-meta-keyword">include</span> <span class="hljs-meta-string">"stdio.h"</span></span>
<span class="hljs-comment">// 智能提示很丰富</span>
<span class="hljs-comment">// 一个基本的框架</span>
<span class="hljs-function"><span class="hljs-keyword">int</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span>{
  <span class="hljs-comment">// 标准的例子</span>
  <span class="hljs-built_in">printf</span>(<span class="hljs-string">"hello world"</span>);
  <span class="hljs-keyword">return</span> <span class="hljs-number">0</span>;
}
</code></pre><p><strong>注意</strong></p>
<blockquote>
<p>ctrl + f5 运行</p>
</blockquote>
</li>
</ul>
<h3><a id="toc-5a0" class="anchor" href="#toc-5a0"></a>其它</h3>
<ul>
<li><strong>当需要获取输入的时候请添加一个宏</strong><pre><code class="hljs lang-cpp"><span class="hljs-comment">// 定义一个宏 取消警告 则可以运行书上例子</span>
<span class="hljs-meta">#<span class="hljs-meta-keyword">define</span> _CRT_SECURE_NO_WARNINGS</span>
</code></pre></li>
<li>完整示例  <pre><code class="hljs lang-cpp"><span class="hljs-comment">// 定义一个宏 取消警告 则可以运行书上例子</span>
<span class="hljs-meta">#<span class="hljs-meta-keyword">define</span> _CRT_SECURE_NO_WARNINGS</span>
<span class="hljs-comment">// 引入标准库</span>
<span class="hljs-meta">#<span class="hljs-meta-keyword">include</span> <span class="hljs-meta-string">"stdio.h"</span></span>
<span class="hljs-comment">// 智能提示很丰富</span>
<span class="hljs-comment">// 一个基本的框架</span>
<span class="hljs-function"><span class="hljs-keyword">int</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span>{
  <span class="hljs-comment">// 定义一个变量</span>
  <span class="hljs-keyword">int</span> ipt;
  <span class="hljs-built_in">printf</span>(<span class="hljs-string">"请输入一个数字:"</span>);
  <span class="hljs-comment">// 获取输入</span>
  <span class="hljs-built_in">scanf</span>(<span class="hljs-string">"%d"</span>,&amp;ipt);
  <span class="hljs-built_in">printf</span>(<span class="hljs-string">"你输入的是:%d"</span>, ipt);
  <span class="hljs-comment">// 可能有时候会出现警告导致编译失败 </span>
  <span class="hljs-comment">// 标准的例子</span>
  <span class="hljs-built_in">printf</span>(<span class="hljs-string">"hello world"</span>);
  <span class="hljs-keyword">return</span> <span class="hljs-number">0</span>;
}
</code></pre></li>
</ul>
', 1, '2018-03-01 17:13:55', '2018-09-20 15:01:10', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('31', '3', '1', 0, 3, 'Server Side Include', 'ssi', '<h2 id="description">description</h2>
<p>服务器端嵌入或者叫服务器端包含，是Server Side Include的简写。SSI技术通过在文档中加入SSI指令，让服务器端在输出文档之前解析SSI指令，并把解析完的结果和文档一同输出给客户端。</p>
<h2 id="nginx-ssi">Nginx配置SSI</h2>
', '## description
服务器端嵌入或者叫服务器端包含，是Server Side Include的简写。SSI技术通过在文档中加入SSI指令，让服务器端在输出文档之前解析SSI指令，并把解析完的结果和文档一同输出给客户端。
## Nginx配置SSI

<!--more-->
```
server {  
    listen  10.3.9.27:80;  
    server_name  www.zxysilent.com;  
    location / {  
        ssi on;  
        ssi_silent_errors on;  
        ssi_types text/shtml;  
        index index.shtml;  
        root /usr/local/web/wwwroot;  
        expires 30d;  
        access_log      /data/logs/ www.zxysilent.com-access_log main;  
    }  
}  
```
## 使用SSI

### base
格式：```<!-- #指令名称 参数="参数值">```

eg： ```<!--#include file="info.htm"-->```

说明：```<!-- -->```是HTML语法中表示注释，当WEB服务器不支持SSI时，会忽略这些信息。

```#include``` 为SSI指令之一。
```file``` 为```include```的参数， ```info.htm```为参数值，在本指令中指将要包含的文档名。

**注意**
前面与```#```号间无空格，只有SSI指令与参数间存在空格。
SSI指令是大小写敏感的，因此参数必须是小写才会起作用。


### include
> 把其它文档插入到当前被解析的文档中

```
<!--#include file="file_name_extension"--> 
```
file 指定包含文件相对于本文档的位置
```
<!--#include virtual="/path/file_name_extension"-->
```
virtual 指定相对于服务器文档根目录的位置

- file 文件名是一个相对路径，该路径相对于使用 #include 指令的文档所在的目录。被包含文件可以在同一级目录或其子目录中，但不能在上一级目录中。如表示当前目录下的的```naver.html```文档，则为```file="naver.html```。
- virtual 文件名是 Web 站点上的虚拟目录的完整路径。如表示相对于服务器文档根目录下```inc```目录下的```naver.html```文件；则为        ```virtual="/inc/naver.html"```
**注意** 文件名称必须带有扩展名。

### echo
> 将环境变量插入到页面中

```
<!--#echo var="变量名称"-->
```
eg
```
<!--#echo var="DOCUMENT_NAME"--> 本文档名称
<!--#echo var="DATE_LOCAL"--> 现在时间
<!--#echo var="REMOTE_ADDR"--> 你的IP地址

```
### flastmod 
> 显示指定文件的最后修改日期

```
<!--#flastmod file="file_name_extension"--> 
<!--#flastmod virtual="/path/file_name_extension"-->
```

### fsize
> 显示文件的大小

```
<!--#fsize file="文件名称"-->
```
### exec
> 将某一外部程序的输出插入到页面中。可插入CGI程序或者是常规应用程序的输入，这取决于使用的参数是cmd还是cgi

```
<!--#exec cmd="file_name_extension"-->
```
cmd 常规应用程序
```
<!--#exec cgi="file_name_extension"-->
```
CGI脚本程序
eg
```
<!--#exec cmd="dir /b"--> 将会显示当前目录下文件列表
<!--#exec cgi="/cgi-bin/demo.cgi"--> 将会执行CGI程序demo.cgi。
```
### config
>  指定返回给客户端浏览器的错误信息、日期和文件大小的格式

```
<!--#config errmsg="自定义错误信息"-->
```
 errmsg 自定义SSI执行错误信息，可以为任何你喜欢的方式。
```
<!--#config sizefmt="显示单位"-->
```
sizefmt 文件大小显示方式，默认为字节方式("bytes")可以改为千字节方式("abbrev")
```
<!--#config timefmt="显示格式"-->
```
> timefmt 时间显示方式，最灵活的配置属性。

eg
- 显示一个不存在文件的大小
```
<!--#config errmsg="服务器执行错误，请联系管理员"-->
<!--#fsize file="noexist.htm"-->
```
- 以千字节方式显示文件大小
```
<!--#config sizefmt="abbrev"-->  
<!--#fsizefile="news.htm"-->
```
- 以特定的时间格式显示时间
```
<!--#config timefmt="%Y年/%m月%d日 星期%W 北京时间%H:%M:%s，%Y年已过去了%j天 今天是%Y年的第%U个星期"-->
<!--#echo var="DATE_LOCAL"--> 显示今天是星期几，几月，时区
```

时间格式

```
%a 一周中某天的缩写（例如，Mon）。
%A 一周中某天的全称（例如，Monday）。
%b 月份的缩写（例如，Feb）。
%B 月份的全称（例如，February）。
%c 当地的日期和时间的表示（例如，05/06/91 12:51:32）。
%d 以十进制数字表示的一个月中的某天 (01-31)。
%H 24 小时格式 (00-23)。
%I 12 小时格式 (01-12)。
%j 以十进制数字表示一年中的某天 (001-366)。
%m 以十进制数字表示的月份 (01-12)。
%M 以十进制数字表示的分 (00-59)。
%p 当地的上午或下午指示符（例如，PM）。
%S 以十进制数字表示的秒 (00-59)。
%U 以十进制数字表示一年中的某一周，星期日作为一周的开始 (00-51)。
%w 以十进制数字表示一周中的某一天，星期天是第一天 (0-6)。
%W 以十进制数字表示一年中的某一天，星期一作为一周的开始 (00-51)。
%x 当地的日期表示（例如，05/06/91）。
%X 当地的时间表示（例如，12:51:32）。
%y 以十进制数字表示的不带有世纪的年（例如，69）。
%Y 以十进制数字表示的带有世纪的年（例如，1969）。
%z, %Z 时区全称或缩写；如果不知道时区，则没有字符。
```', '<div class="toc"><ul>
<li><a href="#description">description</a></li>
<li><a href="#toc-47a">Nginx配置SSI</a></li>
<li><a href="#toc-88c">使用SSI</a><ul>
<li><a href="#base">base</a></li>
<li><a href="#include">include</a></li>
<li><a href="#echo">echo</a></li>
<li><a href="#flastmod">flastmod</a></li>
<li><a href="#fsize">fsize</a></li>
<li><a href="#exec">exec</a></li>
<li><a href="#config">config</a></li>
</ul>
</li>
</ul>
</div><h2><a id="description" class="anchor" href="#description"></a>description</h2>
<p>服务器端嵌入或者叫服务器端包含，是Server Side Include的简写。SSI技术通过在文档中加入SSI指令，让服务器端在输出文档之前解析SSI指令，并把解析完的结果和文档一同输出给客户端。</p>
<h2><a id="toc-47a" class="anchor" href="#toc-47a"></a>Nginx配置SSI</h2>
<!--more-->
<pre><code class="hljs lang-nginx"><span class="hljs-section">server</span> {  
    <span class="hljs-attribute">listen</span>  <span class="hljs-number">10.3.9.27:80</span>;  
    <span class="hljs-attribute">server_name</span>  www.zxysilent.com;  
    <span class="hljs-attribute">location</span> / {  
        <span class="hljs-attribute">ssi</span> <span class="hljs-literal">on</span>;  
        <span class="hljs-attribute">ssi_silent_errors</span> <span class="hljs-literal">on</span>;  
        <span class="hljs-attribute">ssi_types</span> text/shtml;  
        <span class="hljs-attribute">index</span> index.shtml;  
        <span class="hljs-attribute">root</span> /usr/local/web/wwwroot;  
        <span class="hljs-attribute">expires</span> <span class="hljs-number">30d</span>;  
        <span class="hljs-attribute">access_log</span>      /data/logs/ www.zxysilent.com-access_log main;  
    }  
}  
</code></pre><h2><a id="toc-88c" class="anchor" href="#toc-88c"></a>使用SSI</h2>
<h3><a id="base" class="anchor" href="#base"></a>base</h3>
<p>格式：<code>&lt;!-- #指令名称 参数=&quot;参数值&quot;&gt;</code></p>
<p>eg： <code>&lt;!--#include file=&quot;info.htm&quot;--&gt;</code></p>
<p>说明：<code>&lt;!-- --&gt;</code>是HTML语法中表示注释，当WEB服务器不支持SSI时，会忽略这些信息。</p>
<p><code>#include</code> 为SSI指令之一。
<code>file</code> 为<code>include</code>的参数， <code>info.htm</code>为参数值，在本指令中指将要包含的文档名。</p>
<p><strong>注意</strong>
前面与<code>#</code>号间无空格，只有SSI指令与参数间存在空格。
SSI指令是大小写敏感的，因此参数必须是小写才会起作用。</p>
<h3><a id="include" class="anchor" href="#include"></a>include</h3>
<blockquote>
<p>把其它文档插入到当前被解析的文档中</p>
</blockquote>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#include file="file_name_extension"--&gt;</span> 
</code></pre><p>file 指定包含文件相对于本文档的位置</p>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#include virtual="/path/file_name_extension"--&gt;</span>
</code></pre><p>virtual 指定相对于服务器文档根目录的位置</p>
<ul>
<li>file 文件名是一个相对路径，该路径相对于使用 #include 指令的文档所在的目录。被包含文件可以在同一级目录或其子目录中，但不能在上一级目录中。如表示当前目录下的的<code>naver.html</code>文档，则为<code>file=&quot;naver.html</code>。</li>
<li>virtual 文件名是 Web 站点上的虚拟目录的完整路径。如表示相对于服务器文档根目录下<code>inc</code>目录下的<code>naver.html</code>文件；则为        <code>virtual=&quot;/inc/naver.html&quot;</code>
<strong>注意</strong> 文件名称必须带有扩展名。</li>
</ul>
<h3><a id="echo" class="anchor" href="#echo"></a>echo</h3>
<blockquote>
<p>将环境变量插入到页面中</p>
</blockquote>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#echo var="变量名称"--&gt;</span>
</code></pre><p>eg</p>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#echo var="DOCUMENT_NAME"--&gt;</span> 本文档名称
<span class="hljs-comment">&lt;!--#echo var="DATE_LOCAL"--&gt;</span> 现在时间
<span class="hljs-comment">&lt;!--#echo var="REMOTE_ADDR"--&gt;</span> 你的IP地址

</code></pre><h3><a id="flastmod" class="anchor" href="#flastmod"></a>flastmod</h3>
<blockquote>
<p>显示指定文件的最后修改日期</p>
</blockquote>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#flastmod file="file_name_extension"--&gt;</span> 
<span class="hljs-comment">&lt;!--#flastmod virtual="/path/file_name_extension"--&gt;</span>
</code></pre><h3><a id="fsize" class="anchor" href="#fsize"></a>fsize</h3>
<blockquote>
<p>显示文件的大小</p>
</blockquote>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#fsize file="文件名称"--&gt;</span>
</code></pre><h3><a id="exec" class="anchor" href="#exec"></a>exec</h3>
<blockquote>
<p>将某一外部程序的输出插入到页面中。可插入CGI程序或者是常规应用程序的输入，这取决于使用的参数是cmd还是cgi</p>
</blockquote>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#exec cmd="file_name_extension"--&gt;</span>
</code></pre><p>cmd 常规应用程序</p>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#exec cgi="file_name_extension"--&gt;</span>
</code></pre><p>CGI脚本程序
eg</p>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#exec cmd="dir /b"--&gt;</span> 将会显示当前目录下文件列表
<span class="hljs-comment">&lt;!--#exec cgi="/cgi-bin/demo.cgi"--&gt;</span> 将会执行CGI程序demo.cgi。
</code></pre><h3><a id="config" class="anchor" href="#config"></a>config</h3>
<blockquote>
<p> 指定返回给客户端浏览器的错误信息、日期和文件大小的格式</p>
</blockquote>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#config errmsg="自定义错误信息"--&gt;</span>
</code></pre><p> errmsg 自定义SSI执行错误信息，可以为任何你喜欢的方式。</p>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#config sizefmt="显示单位"--&gt;</span>
</code></pre><p>sizefmt 文件大小显示方式，默认为字节方式(&quot;bytes&quot;)可以改为千字节方式(&quot;abbrev&quot;)</p>
<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#config timefmt="显示格式"--&gt;</span>
</code></pre><blockquote>
<p>timefmt 时间显示方式，最灵活的配置属性。</p>
</blockquote>
<p>eg</p>
<ul>
<li>显示一个不存在文件的大小<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#config errmsg="服务器执行错误，请联系管理员"--&gt;</span>
<span class="hljs-comment">&lt;!--#fsize file="noexist.htm"--&gt;</span>
</code></pre></li>
<li>以千字节方式显示文件大小<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#config sizefmt="abbrev"--&gt;</span>  
<span class="hljs-comment">&lt;!--#fsizefile="news.htm"--&gt;</span>
</code></pre></li>
<li>以特定的时间格式显示时间<pre><code class="hljs lang-xml"><span class="hljs-comment">&lt;!--#config timefmt="%Y年/%m月%d日 星期%W 北京时间%H:%M:%s，%Y年已过去了%j天 今天是%Y年的第%U个星期"--&gt;</span>
<span class="hljs-comment">&lt;!--#echo var="DATE_LOCAL"--&gt;</span> 显示今天是星期几，几月，时区
</code></pre></li>
</ul>
<p>时间格式</p>
<pre><code class="hljs lang-mojolicious"><span class="xml"></span><span class="perl">%a 一周中某天的缩写（例如，Mon）。</span><span class="xml">
</span><span class="perl">%A 一周中某天的全称（例如，Monday）。</span><span class="xml">
</span><span class="perl">%b 月份的缩写（例如，Feb）。</span><span class="xml">
</span><span class="perl">%B 月份的全称（例如，February）。</span><span class="xml">
</span><span class="perl">%c 当地的日期和时间的表示（例如，<span class="hljs-number">05</span>/<span class="hljs-number">06</span>/<span class="hljs-number">91</span> <span class="hljs-number">12</span>:<span class="hljs-number">51</span>:<span class="hljs-number">32</span>）。</span><span class="xml">
</span><span class="perl">%d 以十进制数字表示的一个月中的某天 (<span class="hljs-number">01</span>-<span class="hljs-number">31</span>)。</span><span class="xml">
</span><span class="perl">%H <span class="hljs-number">24</span> 小时格式 (<span class="hljs-number">00</span>-<span class="hljs-number">23</span>)。</span><span class="xml">
</span><span class="perl">%I <span class="hljs-number">12</span> 小时格式 (<span class="hljs-number">01</span>-<span class="hljs-number">12</span>)。</span><span class="xml">
</span><span class="perl">%j 以十进制数字表示一年中的某天 (<span class="hljs-number">001</span>-<span class="hljs-number">366</span>)。</span><span class="xml">
</span><span class="perl">%m 以十进制数字表示的月份 (<span class="hljs-number">01</span>-<span class="hljs-number">12</span>)。</span><span class="xml">
</span><span class="perl">%M 以十进制数字表示的分 (<span class="hljs-number">00</span>-<span class="hljs-number">59</span>)。</span><span class="xml">
</span><span class="perl">%p 当地的上午或下午指示符（例如，PM）。</span><span class="xml">
</span><span class="perl">%S 以十进制数字表示的秒 (<span class="hljs-number">00</span>-<span class="hljs-number">59</span>)。</span><span class="xml">
</span><span class="perl">%U 以十进制数字表示一年中的某一周，星期日作为一周的开始 (<span class="hljs-number">00</span>-<span class="hljs-number">51</span>)。</span><span class="xml">
</span><span class="perl">%w 以十进制数字表示一周中的某一天，星期天是第一天 (<span class="hljs-number">0</span>-<span class="hljs-number">6</span>)。</span><span class="xml">
</span><span class="perl">%W 以十进制数字表示一年中的某一天，星期一作为一周的开始 (<span class="hljs-number">00</span>-<span class="hljs-number">51</span>)。</span><span class="xml">
</span><span class="perl">%x 当地的日期表示（例如，<span class="hljs-number">05</span>/<span class="hljs-number">06</span>/<span class="hljs-number">91</span>）。</span><span class="xml">
</span><span class="perl">%X 当地的时间表示（例如，<span class="hljs-number">12</span>:<span class="hljs-number">51</span>:<span class="hljs-number">32</span>）。</span><span class="xml">
</span><span class="perl">%y 以十进制数字表示的不带有世纪的年（例如，<span class="hljs-number">69</span>）。</span><span class="xml">
</span><span class="perl">%Y 以十进制数字表示的带有世纪的年（例如，<span class="hljs-number">1969</span>）。</span><span class="xml">
</span><span class="perl">%z, %Z 时区全称或缩写；如果不知道时区，则没有字符。</span><span class="xml">
</span></code></pre>', 1, '2018-03-11 16:41:34', '2018-03-12 12:02:23', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('34', '3', '1', 0, 3, 'javascriptDOM操作', 'javascript-dom', '<h2 id="1-">1.创建元素</h2>
<blockquote>
<p> 创建元素：document.createElement()</p>
</blockquote>
<p>使用document.createElement()可以创建新元素。这个方法只接受一个参数，即要创建元素的标签名。这个标签名在HTML文档中不区分大小写，在XHTML中区分大小写。</p>
<blockquote>
<p>var div = document.createElement(&quot;div&quot;);</p>
</blockquote>
<p>使用createElement()方法创建新元素的同时，也为新元素设置了ownerDocument属性，可以操作元素的特性。</p>
', '## 1.创建元素
>  创建元素：document.createElement()

使用document.createElement()可以创建新元素。这个方法只接受一个参数，即要创建元素的标签名。这个标签名在HTML文档中不区分大小写，在XHTML中区分大小写。

> var div = document.createElement("div");

使用createElement()方法创建新元素的同时，也为新元素设置了ownerDocument属性，可以操作元素的特性。

<!--more-->
~~~
div.id = "myDiv";
div.className = "div1";
~~~
此时，新元素尚未被添加到文档树中，因此设置各种特性均不会影响浏览器的显示。要添加到文档树，可用appendChild()、insertBefore()、replaceChild()。

`document.body.appendChild(div);`

当把元素添加到文档树中后，这时这个元素做的任何修改都会实时地反应到浏览器中。

在IE中可以为createElement()方法传入完整的元素标签和属性。(只在IE中兼容)

`var div = document.createElement("<div id=\"mydiv\" class=\"div1\"></div>");`

不能再标签里加其他元素节点或者文本节点，如下的方式和上面的得出的节点一样

`var div = document.createElement("<div id=\"mydiv\" class=\"div1\">12212</div>"); `


> 创建文本节点 ：document.createTextNode

使用document.createTextNode()来创建文本节点，这个方法接受一个参数：要插入节点的文本。与设置已有文本节点的值一样，作为参数的文本将按照HTML或XML的格式进行编码。

`document.createTextNode("121212");`
可以添加多个文本节点。假如两个文本节点时相邻的同胞节点，那么两个文本节点会连起来，中间不会有空格。

## 2.节点关系
（IE9以前不将换行和空格看做文本节点，其他浏览器会）

文本关系如下：

~~~
<div id="div1">
    <div id="div2">2</div>
    <div id="div3">3</div>
    <div id="div4">4</div>
</div>
~~~
> 父节点：parentNode

parentNode是指定节点的父节点.一个元素节点的父节点可能是一个元素(Element )节点,也可能是一个文档(Document )节点,或者是个文档碎片(DocumentFragment)节点.
每一个节点都有一个parentNode属性。

对于下面的节点类型: Attr, Document, DocumentFragment, Entity, Notation,其parentNode属性返回null。如果当前节点刚刚被创建,还没有被插入到DOM树中,则该节点的parentNode属性也返回null。

~~~
<script type="text/javascript">
    var child2 = document.getElementById("div2");
    var parent = child2.parentNode;
</script>
~~~
> 子节点：childNodes

childNodes 返回包含指定节点的子节点的集合，该集合为实时更新的集合（live collection）。
实时更新就是对节点元素的任意修改都会立即反映到结果里。

~~~
<script type="text/javascript">
    var child2 = document.getElementById("div2");
    var parent = child2.parentNode;
    var allChilds = parent.childNodes;
    console.log(allChilds.length) // IE下是3，其他浏览器是7
    
    var nodeAdd = document.createElement("div");
    var textAdd = document.createTextNode("这是添加的文本节点");
    nodeAdd.appendChild(textAdd);
    parent.appendChild(nodeAdd);
    console.log(allChilds.length);// IE下是4，其他浏览器是8
</script>
~~~
> 兄弟节点：nextSibling，previousSibling

nextSibling返回某节点的下一个兄弟节点，previousSibling返回某节点的上一个兄弟节点，没有的话返回null。
注意：可能因为元素换行的原因返回的是text节点。

~~~
<script type="text/javascript">
    var child3 = document.getElementById("div3");
    var next = child3.nextSibling;
    var previous = child3.previousSibling;
    console.log(next); // IE下返回div4，其他返回text
    console.log(previous)  // IE下返回div2，其他返回text
</script>
~~~
> 第一个或最后一个子节点：firstChild、lastChild

firstChild返回node的子节点中的第一个节点的引用，没有返回null
lastChild返回node的子节点中的最后一个节点的引用，没有返回null

~~~
<script type="text/javascript">
    var child3 = document.getElementById("div3");
    var parent = child3.parentNode;
    var first = parent.firstChild; // IE是div2，其他是text
    var last = parent.lastChild; // IE是div4，其他是text
</script>
~~~
## 3.节点元素关系
只算元素，不算文本节点。

以下三个方法用法和节点关系完全一样，只是这三个方法只看元素节点，不管因为空格、换行造成的文本节点或者手动加上去的文本节点。
> children： 返回所有元素子节点（IE5+、ff3.5、opera3、chrome，但在IE8及以下会将注释节点看成一个元素节点）

以下两个IE9+才支持
> nextElementSibling：返回元素的下一个兄弟元素节点
> previousElementSibling: 返回元素的上一个兄弟元素节点

## 4.节点操作
> appendChild()

appendChild()用于向childNodes列表的末尾添加一个节点，并且返回这个新增的节点。
如果传入到appendChild()里的节点已经是文档的一部分了，那结果就是将节点从原来的位置转移到新位置，任何一个节点不能同时出现在文档中的多个位置。

~~~
    var returnNode = someNode.appendChild(someNode.firstChild); // 返回第一个节点
    console.log(returnNode === someNode.firstChild); // false
    console.log(returnNode === someNode.lastChild); // true
~~~
> insetBefore()

insetBefore()可以将节点插入到某个特定的位置。这个方法接受两个参数：要插入的节点和作为参照的节点。
插入节点后，被插入的节点变成参照节点的前一个同胞节点，同时被方法返回。 如果参照节点是null，则与appendChild()执行相同的操作。

~~~
    // 插入后成为最后一个子节点
    var returnNode = someNode.insetBefore(newNode, null);
    console.log(returnNode === someNode.lastChild); // true

    // 插入后成为第一个子节点
    var returnNode = someNode.insetBefore(newNode, someNode.firstChild);
    console.log(returnNode === newNode); // true
    console.log(returnNode === someNode.firstChild); // true

    // 插入到最后一个子节点的前面
    var returnNode = someNode.insetBefore(newNode, someNode.lastChild);
    console.log(returnNode === someNode.childNodes[someNode.childnodes.length - 2]) // true
~~~
> 替换节点： replaceChild()

replaceChild()接受两个参数：要插入的节点和要被替换的节点。被替换的节点将由这个方法返回并从文档中被移除，同时由要插入的节点占据其位置。

~~~
  // 替换第一个子节点
    var returnNode = someNode.replaceChild(newNode, someNode.firstChild);

~~~

使用replaceChild()后，被替换的节点的所有关系指针都会被复制到插入的节点上面。

> 删除节点：removeChild()

该方法移除节点，接受一个参数，即要移除的节点，同时该方法返回被移除的节点。只能是一个节点，不能是一组节点。

~~~
 // 移除第一个子节点
    var returnNode = someNode.removeChild(newNode, someNode.firstChild);
~~~

> 克隆节点：cloneNode(true/false)

返回调用该方法的节点的一个副本。参数表示是否采用深度克隆,如果为true,则该节点的所有后代节点也都会被克隆,如果为false,则只克隆该节点本身，文本或者换行、空格这些不会复制，因为他们都是一个textNode。

**注意** : 在DOM4规范中(实现于Gecko 13.0(Firefox 13.0 / Thunderbird 13.0 / SeaMonkey 2.10) , 查看 bug 698391),deep是一个可选参数. 如果省略的话, deep参数的默认值为true,也就是说,深度克隆是默认的.如果想使用浅克隆, 你需要将该参数指定为false。

在旧版本的浏览器中, 你始终需要指定deep参数。

克隆一个元素节点会拷贝它所有的属性以及属性值,当然也就包括了属性上绑定的事件(比如onclick="alert(1)"),但不会拷贝那些使用addEventListener()方法或者node.onclick = fn这种用JavaScript动态绑定的事件。

注意:为了防止一个文档中出现两个ID重复的元素,使用cloneNode()方法克隆的节点在需要时应该指定另外一个与原ID值不同的ID
~~~
    var div1 = document.getElementById("div1");
    var cloneHtml = div1.cloneNode(true);
    document.body.appendChild(cloneHtml);
~~~
## 5.元素选择
HTML代码示例：

~~~
    <div id="div1">
        <p id="div2" class="one" name="nameone">2</p>
        <div id="div3">3</div>
        <div id="div4" name="div2">4</div>
    </div>
~~~
> querySelector、querySelectorAll(IE8及以上)

Selectors API通过匹配一组选择器的方式来为从DOM中检索Element节点提供一些简单快捷的方法，这比过去必须要在javascript代码中用循环来查找某个你想要的特定元素更快一些。
该规范对于使用Document,DocumentFragment和Element接口的对象都增了两种新方法：

> querySelector

返回节点子树内与之相匹配的第一个Element节点。如果没有匹配的节点，则返回null。

> querySelectorAll

返回一个包含节点子树内所有与之相匹配的Element节点列表，如果没有相匹配的，则返回一个空节点列表。 
**注意**：由 querySelector()、querySelectorAll()返回的节点列表不是动态实时的（非live Collection）。这和其他DOM查询方法返回动态实时节点列表不一样。

选择器方法接受一个或多个用逗号分隔的选择器来确定需要被返回的元素。例如，要选择文档中所有CSS的类(class)是warning或者note的段落(p)元素,可以这样写：

`var special = document.querySelectorAll( "p.warning, p.note" );`
也可以通过ID来查询，例如：

`var el = document.querySelector( "#main, #basic, #exclamation" );`
执行上面的代码后，el就包含了文档中元素的ID是main，basic或exclamation的所有元素中的第一个元素。

querySelector() and querySelectorAll() 里可以使用任何CSS选择器，他们都不是live Collection：

~~~
 var notLive = document.querySelectorAll("p");
    console.log(notLive);
    document.getElementById("div1").removeChild(document.getElementById("div2"));
    console.log(notLive);
    // 上面两个输出都是输出 `p#div2.one`的引用，没有因为删除了`p`标签而使`notLive`的结果发生变化。
~~~
> getElementById()

返回一个匹配特定 ID的元素。id是大小写敏感的字符串，代表了所要查找的元素的唯一ID，如果没有则返回null。
如果新建一个元素，还没有插入到文档中，则不能通过该方法获取到。

~~~
    var notLive = document.getElementById("div2");
    console.log(notLive.innerHTML);
    document.getElementById("div1").removeChild(document.getElementById("div2"));
    console.log(notLive.innerHTML);
    // 上面输出都是2，说明getElementById()也是**非**live collection
~~~

> getElementsByTagName()

document.getElementsByTagName() 方法返回一个实时的包含具有给出标签名的元素们的HTMLCollection。指定的元素的子树会被搜索，包括元素自己。返回的 list 是实时的（live collection），意味着它会随着DOM树的变化自动更新。因此，如果对同一个元素，使用相同的参数，是不需要多次调用document.getElementsByTagName() 的。

Element.getElementsByTagName()的搜索被限制为指定元素的后代而不是document

~~~
  var live = document.getElementsByTagName("p");
    console.log(live[0].innerHTML);
    document.getElementById("div1").removeChild(document.getElementById("div2"));
    console.log(live[0].innerHTML);
    // 第一个输出2，第二个报错，因为无法引用到p标签
~~~
> getElementsByName()

该方法返回一个实时的nodelist collection，包含文档中所有name属性匹配的标签。这是一个 live collection。
**注意**：在IE和opera下，如果某个元素1的name和另一个元素2的id重合，且元素2在元素1的前面，则getElementsByName()会取到元素2。
~~~
    var live = document.getElementsByName("div2");
    console.log(live[0].innerHTML);
    document.getElementById("div1").removeChild(document.getElementById("div2"));
    console.log(live[0].innerHTML);
    // chrome下：全部输出4
    // IE下： 第一个输出2，第二个报错。
~~~
> getElementsByClassName()

该方法返回一个即时更新的（live） HTMLCollection，包含了所有拥有指定 class 的子元素。当在 document 对象上调用此方法时，会检索整个文档，包括根元素。(IE9以下不支持)

要匹配多个class，则className用空格分开。

~~~
getElementsByClassName("class1 class2");
    var live = document.getElementsByClassName("one");
    console.log(live[0].innerHTML);
    document.getElementById("div1").removeChild(document.getElementById("div2"));
    console.log(live[0].innerHTML);
    // 第一个返回2，第二个报错
~~~
## 6.属性操作
> setAttribute()

添加一个新属性（attribute）到元素上，或改变元素上已经存在的属性的值。

当在 HTML 文档中的 HTML 元素上调用 setAttribute() 方法时，该方法会将其属性名称（attribute name）参数小写化。

如果指定的属性已经存在，则其值变为传递的值。如果不存在，则创建指定的属性。也可指定为null。如果设置为null，最好使用removeAttribute()。
~~~

    var div2 = document.getElementById("div2");
    div2.setAttribute("class", "new_class");
    div2.setAttribute("id", "new_id");
~~~
**注意**：在IE7下，修改了元素的class，如果已有class，则会出现两个class，通过setAttribute()添加的不生效；如果没有class，则添加上class，但这个添加上去的class的样式不会生效。


> removeAttribute()

该方法用于移除元素的属性。
~~~
    var div2 = document.getElementById("div2");
    div2.removeAttribute("class");
~~~
**注意**：IE7下无法移除 class 属性

> getAttribute()

该方法返回元素上指定属性（attribute）的值。如果指定的属性不存在，则返回 null 或 "" （空字符串）（IE5+都返回null）。

~~~
    var div2 = document.getElementById("div2");
    var attr = div2.getAttribute("class");
    console.log(attr);
~~~
**注意**：IE7下不能正确返回class，返回的是null，其他正常。

> hasAttribute()

hasAttribute() 返回一个布尔值，指示该元素是否包含有指定的属性（attribute）。

**注意**：IE7不支持该方法。

> 自定义属性data-*

html5里有一个data-*去设置获取元素的自定义属性值。

`<div id="div1" data-aa="11">`
利用div1.dataset可以获得一个DOMStringMap，包含了元素的所有data-*。
使用div1.dataset.aa就可以获取11的值。
同样，通过设置div1.dataset.bb = "22"就可以设置一个自定义属性值。
在不兼容的浏览器里，就使用getAttribute和setAttribute

~~~
    var div1 = document.getElementById("div1");
    var a = null;
    if (div1.dataset) {
        a = div1.dataset.aa;
        div1.dataset.bb = "222";
    } else {
        a = div1.getAttribute("data-aa");
        div1.setAttribute("data-bb", "2222");
    }
    console.log(a);
~~~
## 7.事件
> addEventListener()

addEventListener()将指定的事件监听器注册到目标对象上，当目标对象触发制定的事件时，指定的回调函数就会触发。目标对象可以是 文档上的元素、 document、 window 或者XMLHttpRequest(比如onreadystatechange事件)。

IE8及以下不支持此方法且只有事件冒泡没有事件捕获。IE9开始支持此方法，也就有了事件捕获。
~~~

    var div1 = document.getElementById("div1");
    div1.addEventListener("click", listener, false);
    function listener() {
        console.log(''test'');
    }
    
    var cloneHtml = div1.cloneNode(true);
    document.body.appendChild(cloneHtml);
~~~
第一个参数是事件名，第二个是回调函数，第三个参数为true表示捕获，false表示冒泡。

~~~
    var div1 = document.getElementById("div1");
    div1.addEventListener("click", listener1, true/fasle);
    function listener1() {
        console.log(''test1'');
    }

    var div2 = document.getElementById("div2");
    div2.addEventListener("click", listener2, true/fasle);
    function listener2() {
        console.log(''test2'');
    }
~~~
有一点要注意的是，当对某一个元素1既绑定了捕获事件，又绑定了冒泡事件时：
当这个元素1并不是触发事件的那个元素2时，则触发顺序会按照先 捕获 后 冒泡 的顺序触发；
当这个元素1就是最底层的触发事件的元素时，则这个元素没有捕获和冒泡的区别，谁先绑定就先触发谁。

    var div2 = document.getElementById("div2");
    
    div2.addEventListener("click", listener2, true);
    function listener2() {
        console.log(''test2'');
    }

    div2.addEventListener("click", listener1, false);
    function listener1() {
        console.log(''test1'');
    }
    // 按绑定顺序执行，两个`addEventLister()`颠倒过来则执行顺序也变化
    // 如果再对`div1`绑定一个捕获、一个冒泡，则会先触发捕获 再 触发冒泡，与绑定顺序无关
> removeEventListener()

与addEventListener()绑定事件对应的就是移除已绑定的事件。第三个参数的布尔值代表解绑的是捕获事件还是冒泡事件。两个事件互不相关。
~~~

    var div2 = document.getElementById("div2"); 
    div2.addEventListener("click", listener2, true);
    function listener2() {
        console.log(''test2'');
    }
    div2.removeEventListener("click", listener2, true);
~~~
**注意**：只能通过removeEventListener()解绑有名字的函数，对于绑定的匿名函数无法解除绑定。

    div2.addEventListener("click", function(){
        console.log(''test'');
        console.log(this);
    }, true);

    div2.removeEventListener("click", function() {
        console.log("test");
    }, true);
    div2.onclick = null;
    // 点击div2依然打印出test
**注意**：这里this指向触发事件的元素自身。

> attachEvent()、detachEvent()

IE8及以下使用这两个方法绑定和解绑事件，当然，IE9+也支持这个事件。但这个方法绑定的事件默认为冒泡也只有冒泡。

~~~
    // 这里需要在事件前加 on
    div2.attachEvent("onclick", listener1);
    function listener1() {
        console.log(''test'');
        console.log(this);
    }
    div2.detachEvent("onclick", listener1);
~~~
和addEventListener()一样，也不能解绑匿名函数。
**注意**：这里this指向 window。

阻止默认事件和冒泡
标准事件和IE事件中的阻止默认事件和冒泡事件也有很大区别。

    var div2 = document.getElementById("div2");
    if (div2.addEventListener) {
        div2.addEventListener("click", function(e) {
            e.preventDefault(); // 阻止默认事件
            e.stopPropagation(); // 阻止冒泡
            console.log(e.target.innerHTML);
        }, false);
    } else {
        div2.attachEvent("onclick", function() {
            var e = window.event;
            e.returnValue = false; // 阻止默认事件
            e.cancelBubble = true; // 阻止冒泡
            console.log(e.srcElement.innerHTML);
        });
    }
IE8及以下的event是绑定在window上的。（我的IE11里，仿真到IE7、IE8也可以取到标准事件里的 e 对象，估计是升级到IE11的原因）。

> 自定义事件：createEvent()

createEvent()用于创建一个新的 event ，而后这个 event 必须调用它的 init() 方法进行初始化。最后就可以在目标元素上使用dispatchEvent()调用新创建的event事件了。

createEvent()的参数一般有：UIEvents、MouseEvents、MutationEvents、HTMLEvents、Event(s)等等，分别有对应的init()方法。HTMLEvents、Event(s)对应的都是initEvent()方法。

> initEvent(type, bubbles, cancelable)

type表示自定义的事件类型，bubbles表示是否冒泡，cancelable表示是否阻止默认事件。

target.dispatchEvent(ev)
target就是要触发自定义事件的DOM元素
~~~
        var div1 = document.getElementById("div1");
        div1.addEventListener("message", function(){
            console.log(''test'');
        }, false);

        var div2 = document.getElementById("div2");
        div2.addEventListener("message", function(e){
            console.log(this);
            console.log(e);
        }, false);
        var ev = document.createEvent("Event");
        ev.initEvent("message", false, true); // 起泡参数变为true，div1的事件就会触发
        div2.dispatchEvent(ev);
~~~
## 8.获取元素相关计算后的值
> getComputedStyle()、currentStyle()

当我们想获取元素计算后实际呈现在页面上的各个值，就用这两个方法。IE8及以下用currentStyle(),IE9+及其他标准浏览器用getComputedStyle()。
~~~
    var div2 = document.getElementById("div2");
    var result = "";
    if (window.getComputedStyle) {
        result = (window || document.defaultView).getComputedStyle(div2, null)[''cssFloat''];
    } else {
        result = div2.currentStyle["styleFloat"];
    }
    console.log(result);
    // document.defaultView返回document对象所关联的window
~~~
**注意**：这两个方法在不同的浏览器里差距也很大。
比如float属性：
getComputedStyle： IE9以上需要用cssFloat，其他标准的用float
currentStyle： IE8及以下可用styleFloat或者float。

比如height属性：
假如未设置height值，标准浏览器里能计算出高度值，而currentStyle计算出来是auto。

上面的例子getComputedStyle是用键值去访问的，也可用getPropertyValue()去访问。（IE8、IE7不支持）

`result = (window || document.defaultView).getComputedStyle(div2, null).getPropertyValue("float");`
> getBoundingClientRect()、getClientRects()

getBoundingClientRect()该方法获得页面中某个元素的上、右、下、左分别相对浏览器视窗的位置。getBoundingClientRect是DOM元素到浏览器可视范围的距离（到浏览器顶部而不是文档顶部）。该函数返回一个Object对象，该对象有6个属性：top,lef,right,bottom,width,height；这里的top、left和css中的理解很相似，width、height是元素自身的宽高，但是right，bottom和css中的理解有点不一样。right是指元素右边界距窗口最左边的距离，bottom是指元素下边界距窗口最上面的距离。

> getClientRects()是返回一个ClientRectList集合。  


~~~
    var div1 = document.getElementById("div1");
    var rects1 = div1.getClientRects();
    var rects2 = div1.getBoundingClientRect();
    console.log(rects1[0].top);
    console.log(rects2.top);
~~~', '<div class="toc"><ul>
<li><a href="#toc-602">1.创建元素</a></li>
<li><a href="#toc-91b">2.节点关系</a></li>
<li><a href="#toc-b2d">3.节点元素关系</a></li>
<li><a href="#toc-32d">4.节点操作</a></li>
<li><a href="#toc-758">5.元素选择</a></li>
<li><a href="#toc-d2f">6.属性操作</a></li>
<li><a href="#toc-d57">7.事件</a></li>
<li><a href="#toc-fbe">8.获取元素相关计算后的值</a></li>
</ul>
</div><h2><a id="toc-602" class="anchor" href="#toc-602"></a>1.创建元素</h2>
<blockquote>
<p> 创建元素：document.createElement()</p>
</blockquote>
<p>使用document.createElement()可以创建新元素。这个方法只接受一个参数，即要创建元素的标签名。这个标签名在HTML文档中不区分大小写，在XHTML中区分大小写。</p>
<blockquote>
<p>var div = document.createElement(&quot;div&quot;);</p>
</blockquote>
<p>使用createElement()方法创建新元素的同时，也为新元素设置了ownerDocument属性，可以操作元素的特性。</p>
<!--more-->
<pre><code class="hljs lang-mipsasm"><span class="hljs-keyword">div.id </span>= <span class="hljs-string">"myDiv"</span><span class="hljs-comment">;</span>
<span class="hljs-keyword">div.className </span>= <span class="hljs-string">"div1"</span><span class="hljs-comment">;</span>
</code></pre><p>此时，新元素尚未被添加到文档树中，因此设置各种特性均不会影响浏览器的显示。要添加到文档树，可用appendChild()、insertBefore()、replaceChild()。</p>
<p><code>document.body.appendChild(div);</code></p>
<p>当把元素添加到文档树中后，这时这个元素做的任何修改都会实时地反应到浏览器中。</p>
<p>在IE中可以为createElement()方法传入完整的元素标签和属性。(只在IE中兼容)</p>
<p><code>var div = document.createElement(&quot;&lt;div id=\&quot;mydiv\&quot; class=\&quot;div1\&quot;&gt;&lt;/div&gt;&quot;);</code></p>
<p>不能再标签里加其他元素节点或者文本节点，如下的方式和上面的得出的节点一样</p>
<p><code>var div = document.createElement(&quot;&lt;div id=\&quot;mydiv\&quot; class=\&quot;div1\&quot;&gt;12212&lt;/div&gt;&quot;);</code></p>
<blockquote>
<p>创建文本节点 ：document.createTextNode</p>
</blockquote>
<p>使用document.createTextNode()来创建文本节点，这个方法接受一个参数：要插入节点的文本。与设置已有文本节点的值一样，作为参数的文本将按照HTML或XML的格式进行编码。</p>
<p><code>document.createTextNode(&quot;121212&quot;);</code>
可以添加多个文本节点。假如两个文本节点时相邻的同胞节点，那么两个文本节点会连起来，中间不会有空格。</p>
<h2><a id="toc-91b" class="anchor" href="#toc-91b"></a>2.节点关系</h2>
<p>（IE9以前不将换行和空格看做文本节点，其他浏览器会）</p>
<p>文本关系如下：</p>
<pre><code class="hljs lang-applescript">&lt;<span class="hljs-keyword">div</span> <span class="hljs-built_in">id</span>=<span class="hljs-string">"div1"</span>&gt;
    &lt;<span class="hljs-keyword">div</span> <span class="hljs-built_in">id</span>=<span class="hljs-string">"div2"</span>&gt;<span class="hljs-number">2</span>&lt;/<span class="hljs-keyword">div</span>&gt;
    &lt;<span class="hljs-keyword">div</span> <span class="hljs-built_in">id</span>=<span class="hljs-string">"div3"</span>&gt;<span class="hljs-number">3</span>&lt;/<span class="hljs-keyword">div</span>&gt;
    &lt;<span class="hljs-keyword">div</span> <span class="hljs-built_in">id</span>=<span class="hljs-string">"div4"</span>&gt;<span class="hljs-number">4</span>&lt;/<span class="hljs-keyword">div</span>&gt;
&lt;/<span class="hljs-keyword">div</span>&gt;
</code></pre><blockquote>
<p>父节点：parentNode</p>
</blockquote>
<p>parentNode是指定节点的父节点.一个元素节点的父节点可能是一个元素(Element )节点,也可能是一个文档(Document )节点,或者是个文档碎片(DocumentFragment)节点.
每一个节点都有一个parentNode属性。</p>
<p>对于下面的节点类型: Attr, Document, DocumentFragment, Entity, Notation,其parentNode属性返回null。如果当前节点刚刚被创建,还没有被插入到DOM树中,则该节点的parentNode属性也返回null。</p>
<pre><code class="hljs lang-xml"><span class="hljs-tag">&lt;<span class="hljs-name">script</span> <span class="hljs-attr">type</span>=<span class="hljs-string">"text/javascript"</span>&gt;</span><span class="javascript">
    <span class="hljs-keyword">var</span> child2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);
    <span class="hljs-keyword">var</span> parent = child2.parentNode;
</span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
</code></pre><blockquote>
<p>子节点：childNodes</p>
</blockquote>
<p>childNodes 返回包含指定节点的子节点的集合，该集合为实时更新的集合（live collection）。
实时更新就是对节点元素的任意修改都会立即反映到结果里。</p>
<pre><code class="hljs lang-xml"><span class="hljs-tag">&lt;<span class="hljs-name">script</span> <span class="hljs-attr">type</span>=<span class="hljs-string">"text/javascript"</span>&gt;</span><span class="javascript">
    <span class="hljs-keyword">var</span> child2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);
    <span class="hljs-keyword">var</span> parent = child2.parentNode;
    <span class="hljs-keyword">var</span> allChilds = parent.childNodes;
    <span class="hljs-built_in">console</span>.log(allChilds.length) <span class="hljs-comment">// IE下是3，其他浏览器是7</span>

    <span class="hljs-keyword">var</span> nodeAdd = <span class="hljs-built_in">document</span>.createElement(<span class="hljs-string">"div"</span>);
    <span class="hljs-keyword">var</span> textAdd = <span class="hljs-built_in">document</span>.createTextNode(<span class="hljs-string">"这是添加的文本节点"</span>);
    nodeAdd.appendChild(textAdd);
    parent.appendChild(nodeAdd);
    <span class="hljs-built_in">console</span>.log(allChilds.length);<span class="hljs-comment">// IE下是4，其他浏览器是8</span>
</span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
</code></pre><blockquote>
<p>兄弟节点：nextSibling，previousSibling</p>
</blockquote>
<p>nextSibling返回某节点的下一个兄弟节点，previousSibling返回某节点的上一个兄弟节点，没有的话返回null。
注意：可能因为元素换行的原因返回的是text节点。</p>
<pre><code class="hljs lang-xml"><span class="hljs-tag">&lt;<span class="hljs-name">script</span> <span class="hljs-attr">type</span>=<span class="hljs-string">"text/javascript"</span>&gt;</span><span class="javascript">
    <span class="hljs-keyword">var</span> child3 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div3"</span>);
    <span class="hljs-keyword">var</span> next = child3.nextSibling;
    <span class="hljs-keyword">var</span> previous = child3.previousSibling;
    <span class="hljs-built_in">console</span>.log(next); <span class="hljs-comment">// IE下返回div4，其他返回text</span>
    <span class="hljs-built_in">console</span>.log(previous)  <span class="hljs-comment">// IE下返回div2，其他返回text</span>
</span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
</code></pre><blockquote>
<p>第一个或最后一个子节点：firstChild、lastChild</p>
</blockquote>
<p>firstChild返回node的子节点中的第一个节点的引用，没有返回null
lastChild返回node的子节点中的最后一个节点的引用，没有返回null</p>
<pre><code class="hljs lang-xml"><span class="hljs-tag">&lt;<span class="hljs-name">script</span> <span class="hljs-attr">type</span>=<span class="hljs-string">"text/javascript"</span>&gt;</span><span class="javascript">
    <span class="hljs-keyword">var</span> child3 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div3"</span>);
    <span class="hljs-keyword">var</span> parent = child3.parentNode;
    <span class="hljs-keyword">var</span> first = parent.firstChild; <span class="hljs-comment">// IE是div2，其他是text</span>
    <span class="hljs-keyword">var</span> last = parent.lastChild; <span class="hljs-comment">// IE是div4，其他是text</span>
</span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
</code></pre><h2><a id="toc-b2d" class="anchor" href="#toc-b2d"></a>3.节点元素关系</h2>
<p>只算元素，不算文本节点。</p>
<p>以下三个方法用法和节点关系完全一样，只是这三个方法只看元素节点，不管因为空格、换行造成的文本节点或者手动加上去的文本节点。</p>
<blockquote>
<p>children： 返回所有元素子节点（IE5+、ff3.5、opera3、chrome，但在IE8及以下会将注释节点看成一个元素节点）</p>
</blockquote>
<p>以下两个IE9+才支持</p>
<blockquote>
<p>nextElementSibling：返回元素的下一个兄弟元素节点
previousElementSibling: 返回元素的上一个兄弟元素节点</p>
</blockquote>
<h2><a id="toc-32d" class="anchor" href="#toc-32d"></a>4.节点操作</h2>
<blockquote>
<p>appendChild()</p>
</blockquote>
<p>appendChild()用于向childNodes列表的末尾添加一个节点，并且返回这个新增的节点。
如果传入到appendChild()里的节点已经是文档的一部分了，那结果就是将节点从原来的位置转移到新位置，任何一个节点不能同时出现在文档中的多个位置。</p>
<pre><code class="hljs lang-jboss-cli">    var returnNode = someNode.appendChild<span class="hljs-params">(someNode.firstChild)</span>; <span class="hljs-string">//</span> 返回第一个节点
    console.log<span class="hljs-params">(<span class="hljs-attr">returnNode</span> === someNode.firstChild)</span>; <span class="hljs-string">//</span> <span class="hljs-literal">false</span>
    console.log<span class="hljs-params">(<span class="hljs-attr">returnNode</span> === someNode.lastChild)</span>; <span class="hljs-string">//</span> <span class="hljs-literal">true</span>
</code></pre><blockquote>
<p>insetBefore()</p>
</blockquote>
<p>insetBefore()可以将节点插入到某个特定的位置。这个方法接受两个参数：要插入的节点和作为参照的节点。
插入节点后，被插入的节点变成参照节点的前一个同胞节点，同时被方法返回。 如果参照节点是null，则与appendChild()执行相同的操作。</p>
<pre><code class="hljs lang-haxe">    <span class="hljs-comment">// 插入后成为最后一个子节点</span>
    <span class="hljs-keyword">var</span> returnNode = someNode.insetBefore(<span class="hljs-keyword">new</span><span class="hljs-type">Node</span>, <span class="hljs-literal">null</span>);
    console.log(returnNode === someNode.lastChild); <span class="hljs-comment">// true</span>

    <span class="hljs-comment">// 插入后成为第一个子节点</span>
    <span class="hljs-keyword">var</span> returnNode = someNode.insetBefore(<span class="hljs-keyword">new</span><span class="hljs-type">Node</span>, someNode.firstChild);
    console.log(returnNode === <span class="hljs-keyword">new</span><span class="hljs-type">Node</span>); <span class="hljs-comment">// true</span>
    console.log(returnNode === someNode.firstChild); <span class="hljs-comment">// true</span>

    <span class="hljs-comment">// 插入到最后一个子节点的前面</span>
    <span class="hljs-keyword">var</span> returnNode = someNode.insetBefore(<span class="hljs-keyword">new</span><span class="hljs-type">Node</span>, someNode.lastChild);
    console.log(returnNode === someNode.childNodes[someNode.childnodes.length - <span class="hljs-number">2</span>]) <span class="hljs-comment">// true</span>
</code></pre><blockquote>
<p>替换节点： replaceChild()</p>
</blockquote>
<p>replaceChild()接受两个参数：要插入的节点和要被替换的节点。被替换的节点将由这个方法返回并从文档中被移除，同时由要插入的节点占据其位置。</p>
<pre><code class="hljs lang-haxe">  <span class="hljs-comment">// 替换第一个子节点</span>
    <span class="hljs-keyword">var</span> returnNode = someNode.replaceChild(<span class="hljs-keyword">new</span><span class="hljs-type">Node</span>, someNode.firstChild);

</code></pre><p>使用replaceChild()后，被替换的节点的所有关系指针都会被复制到插入的节点上面。</p>
<blockquote>
<p>删除节点：removeChild()</p>
</blockquote>
<p>该方法移除节点，接受一个参数，即要移除的节点，同时该方法返回被移除的节点。只能是一个节点，不能是一组节点。</p>
<pre><code class="hljs lang-haxe"> <span class="hljs-comment">// 移除第一个子节点</span>
    <span class="hljs-keyword">var</span> returnNode = someNode.removeChild(<span class="hljs-keyword">new</span><span class="hljs-type">Node</span>, someNode.firstChild);
</code></pre><blockquote>
<p>克隆节点：cloneNode(true/false)</p>
</blockquote>
<p>返回调用该方法的节点的一个副本。参数表示是否采用深度克隆,如果为true,则该节点的所有后代节点也都会被克隆,如果为false,则只克隆该节点本身，文本或者换行、空格这些不会复制，因为他们都是一个textNode。</p>
<p><strong>注意</strong> : 在DOM4规范中(实现于Gecko 13.0(Firefox 13.0 / Thunderbird 13.0 / SeaMonkey 2.10) , 查看 bug 698391),deep是一个可选参数. 如果省略的话, deep参数的默认值为true,也就是说,深度克隆是默认的.如果想使用浅克隆, 你需要将该参数指定为false。</p>
<p>在旧版本的浏览器中, 你始终需要指定deep参数。</p>
<p>克隆一个元素节点会拷贝它所有的属性以及属性值,当然也就包括了属性上绑定的事件(比如onclick=&quot;alert(1)&quot;),但不会拷贝那些使用addEventListener()方法或者node.onclick = fn这种用JavaScript动态绑定的事件。</p>
<p>注意:为了防止一个文档中出现两个ID重复的元素,使用cloneNode()方法克隆的节点在需要时应该指定另外一个与原ID值不同的ID</p>
<pre><code class="hljs lang-dart">    <span class="hljs-keyword">var</span> div1 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>);
    <span class="hljs-keyword">var</span> cloneHtml = div1.cloneNode(<span class="hljs-keyword">true</span>);
    <span class="hljs-built_in">document</span>.body.appendChild(cloneHtml);
</code></pre><h2><a id="toc-758" class="anchor" href="#toc-758"></a>5.元素选择</h2>
<p>HTML代码示例：</p>
<pre><code class="hljs lang-applescript">    &lt;<span class="hljs-keyword">div</span> <span class="hljs-built_in">id</span>=<span class="hljs-string">"div1"</span>&gt;
        &lt;p <span class="hljs-built_in">id</span>=<span class="hljs-string">"div2"</span> <span class="hljs-built_in">class</span>=<span class="hljs-string">"one"</span> <span class="hljs-built_in">name</span>=<span class="hljs-string">"nameone"</span>&gt;<span class="hljs-number">2</span>&lt;/p&gt;
        &lt;<span class="hljs-keyword">div</span> <span class="hljs-built_in">id</span>=<span class="hljs-string">"div3"</span>&gt;<span class="hljs-number">3</span>&lt;/<span class="hljs-keyword">div</span>&gt;
        &lt;<span class="hljs-keyword">div</span> <span class="hljs-built_in">id</span>=<span class="hljs-string">"div4"</span> <span class="hljs-built_in">name</span>=<span class="hljs-string">"div2"</span>&gt;<span class="hljs-number">4</span>&lt;/<span class="hljs-keyword">div</span>&gt;
    &lt;/<span class="hljs-keyword">div</span>&gt;
</code></pre><blockquote>
<p>querySelector、querySelectorAll(IE8及以上)</p>
</blockquote>
<p>Selectors API通过匹配一组选择器的方式来为从DOM中检索Element节点提供一些简单快捷的方法，这比过去必须要在javascript代码中用循环来查找某个你想要的特定元素更快一些。
该规范对于使用Document,DocumentFragment和Element接口的对象都增了两种新方法：</p>
<blockquote>
<p>querySelector</p>
</blockquote>
<p>返回节点子树内与之相匹配的第一个Element节点。如果没有匹配的节点，则返回null。</p>
<blockquote>
<p>querySelectorAll</p>
</blockquote>
<p>返回一个包含节点子树内所有与之相匹配的Element节点列表，如果没有相匹配的，则返回一个空节点列表。 
<strong>注意</strong>：由 querySelector()、querySelectorAll()返回的节点列表不是动态实时的（非live Collection）。这和其他DOM查询方法返回动态实时节点列表不一样。</p>
<p>选择器方法接受一个或多个用逗号分隔的选择器来确定需要被返回的元素。例如，要选择文档中所有CSS的类(class)是warning或者note的段落(p)元素,可以这样写：</p>
<p><code>var special = document.querySelectorAll( &quot;p.warning, p.note&quot; );</code>
也可以通过ID来查询，例如：</p>
<p><code>var el = document.querySelector( &quot;#main, #basic, #exclamation&quot; );</code>
执行上面的代码后，el就包含了文档中元素的ID是main，basic或exclamation的所有元素中的第一个元素。</p>
<p>querySelector() and querySelectorAll() 里可以使用任何CSS选择器，他们都不是live Collection：</p>
<pre><code class="hljs lang-coffeescript"> var notLive = <span class="hljs-built_in">document</span>.querySelectorAll(<span class="hljs-string">"p"</span>);
    <span class="hljs-built_in">console</span>.log(notLive);
    <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>).removeChild(<span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>));
    <span class="hljs-built_in">console</span>.log(notLive);
    <span class="hljs-regexp">//</span> 上面两个输出都是输出 `<span class="javascript">p#div2.one</span>`的引用，没有因为删除了`<span class="javascript">p</span>`标签而使`<span class="javascript">notLive</span>`的结果发生变化。
</code></pre><blockquote>
<p>getElementById()</p>
</blockquote>
<p>返回一个匹配特定 ID的元素。id是大小写敏感的字符串，代表了所要查找的元素的唯一ID，如果没有则返回null。
如果新建一个元素，还没有插入到文档中，则不能通过该方法获取到。</p>
<pre><code class="hljs lang-javascript">    <span class="hljs-keyword">var</span> notLive = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);
    <span class="hljs-built_in">console</span>.log(notLive.innerHTML);
    <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>).removeChild(<span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>));
    <span class="hljs-built_in">console</span>.log(notLive.innerHTML);
    <span class="hljs-comment">// 上面输出都是2，说明getElementById()也是**非**live collection</span>
</code></pre><blockquote>
<p>getElementsByTagName()</p>
</blockquote>
<p>document.getElementsByTagName() 方法返回一个实时的包含具有给出标签名的元素们的HTMLCollection。指定的元素的子树会被搜索，包括元素自己。返回的 list 是实时的（live collection），意味着它会随着DOM树的变化自动更新。因此，如果对同一个元素，使用相同的参数，是不需要多次调用document.getElementsByTagName() 的。</p>
<p>Element.getElementsByTagName()的搜索被限制为指定元素的后代而不是document</p>
<pre><code class="hljs lang-javascript">  <span class="hljs-keyword">var</span> live = <span class="hljs-built_in">document</span>.getElementsByTagName(<span class="hljs-string">"p"</span>);
    <span class="hljs-built_in">console</span>.log(live[<span class="hljs-number">0</span>].innerHTML);
    <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>).removeChild(<span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>));
    <span class="hljs-built_in">console</span>.log(live[<span class="hljs-number">0</span>].innerHTML);
    <span class="hljs-comment">// 第一个输出2，第二个报错，因为无法引用到p标签</span>
</code></pre><blockquote>
<p>getElementsByName()</p>
</blockquote>
<p>该方法返回一个实时的nodelist collection，包含文档中所有name属性匹配的标签。这是一个 live collection。
<strong>注意</strong>：在IE和opera下，如果某个元素1的name和另一个元素2的id重合，且元素2在元素1的前面，则getElementsByName()会取到元素2。</p>
<pre><code class="hljs lang-javascript">    <span class="hljs-keyword">var</span> live = <span class="hljs-built_in">document</span>.getElementsByName(<span class="hljs-string">"div2"</span>);
    <span class="hljs-built_in">console</span>.log(live[<span class="hljs-number">0</span>].innerHTML);
    <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>).removeChild(<span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>));
    <span class="hljs-built_in">console</span>.log(live[<span class="hljs-number">0</span>].innerHTML);
    <span class="hljs-comment">// chrome下：全部输出4</span>
    <span class="hljs-comment">// IE下： 第一个输出2，第二个报错。</span>
</code></pre><blockquote>
<p>getElementsByClassName()</p>
</blockquote>
<p>该方法返回一个即时更新的（live） HTMLCollection，包含了所有拥有指定 class 的子元素。当在 document 对象上调用此方法时，会检索整个文档，包括根元素。(IE9以下不支持)</p>
<p>要匹配多个class，则className用空格分开。</p>
<pre><code class="hljs lang-javascript">getElementsByClassName(<span class="hljs-string">"class1 class2"</span>);
    <span class="hljs-keyword">var</span> live = <span class="hljs-built_in">document</span>.getElementsByClassName(<span class="hljs-string">"one"</span>);
    <span class="hljs-built_in">console</span>.log(live[<span class="hljs-number">0</span>].innerHTML);
    <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>).removeChild(<span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>));
    <span class="hljs-built_in">console</span>.log(live[<span class="hljs-number">0</span>].innerHTML);
    <span class="hljs-comment">// 第一个返回2，第二个报错</span>
</code></pre><h2><a id="toc-d2f" class="anchor" href="#toc-d2f"></a>6.属性操作</h2>
<blockquote>
<p>setAttribute()</p>
</blockquote>
<p>添加一个新属性（attribute）到元素上，或改变元素上已经存在的属性的值。</p>
<p>当在 HTML 文档中的 HTML 元素上调用 setAttribute() 方法时，该方法会将其属性名称（attribute name）参数小写化。</p>
<p>如果指定的属性已经存在，则其值变为传递的值。如果不存在，则创建指定的属性。也可指定为null。如果设置为null，最好使用removeAttribute()。</p>
<pre><code class="hljs lang-mipsasm">
    var <span class="hljs-keyword">div2 </span>= document.getElementById(<span class="hljs-string">"div2"</span>)<span class="hljs-comment">;</span>
    <span class="hljs-keyword">div2.setAttribute("class", </span><span class="hljs-string">"new_class"</span>)<span class="hljs-comment">;</span>
    <span class="hljs-keyword">div2.setAttribute("id", </span><span class="hljs-string">"new_id"</span>)<span class="hljs-comment">;</span>
</code></pre><p><strong>注意</strong>：在IE7下，修改了元素的class，如果已有class，则会出现两个class，通过setAttribute()添加的不生效；如果没有class，则添加上class，但这个添加上去的class的样式不会生效。</p>
<blockquote>
<p>removeAttribute()</p>
</blockquote>
<p>该方法用于移除元素的属性。</p>
<pre><code class="hljs lang-abnf">    var div2 = document.getElementById(<span class="hljs-string">"div2"</span>)<span class="hljs-comment">;</span>
    div2.removeAttribute(<span class="hljs-string">"class"</span>)<span class="hljs-comment">;</span>
</code></pre><p><strong>注意</strong>：IE7下无法移除 class 属性</p>
<blockquote>
<p>getAttribute()</p>
</blockquote>
<p>该方法返回元素上指定属性（attribute）的值。如果指定的属性不存在，则返回 null 或 &quot;&quot; （空字符串）（IE5+都返回null）。</p>
<pre><code class="hljs lang-javascript">    <span class="hljs-keyword">var</span> div2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);
    <span class="hljs-keyword">var</span> attr = div2.getAttribute(<span class="hljs-string">"class"</span>);
    <span class="hljs-built_in">console</span>.log(attr);
</code></pre><p><strong>注意</strong>：IE7下不能正确返回class，返回的是null，其他正常。</p>
<blockquote>
<p>hasAttribute()</p>
</blockquote>
<p>hasAttribute() 返回一个布尔值，指示该元素是否包含有指定的属性（attribute）。</p>
<p><strong>注意</strong>：IE7不支持该方法。</p>
<blockquote>
<p>自定义属性data-*</p>
</blockquote>
<p>html5里有一个data-*去设置获取元素的自定义属性值。</p>
<p><code>&lt;div id=&quot;div1&quot; data-aa=&quot;11&quot;&gt;</code>
利用div1.dataset可以获得一个DOMStringMap，包含了元素的所有data-*。
使用div1.dataset.aa就可以获取11的值。
同样，通过设置div1.dataset.bb = &quot;22&quot;就可以设置一个自定义属性值。
在不兼容的浏览器里，就使用getAttribute和setAttribute</p>
<pre><code class="hljs lang-mipsasm">    var <span class="hljs-keyword">div1 </span>= document.getElementById(<span class="hljs-string">"div1"</span>)<span class="hljs-comment">;</span>
    var a = null<span class="hljs-comment">;</span>
    if (<span class="hljs-keyword">div1.dataset) </span>{
        a = <span class="hljs-keyword">div1.dataset.aa;
</span>        <span class="hljs-keyword">div1.dataset.bb </span>= <span class="hljs-string">"222"</span><span class="hljs-comment">;</span>
    } else {
        a = <span class="hljs-keyword">div1.getAttribute("data-aa");
</span>        <span class="hljs-keyword">div1.setAttribute("data-bb", </span><span class="hljs-string">"2222"</span>)<span class="hljs-comment">;</span>
    }
    console.log(a)<span class="hljs-comment">;</span>
</code></pre><h2><a id="toc-d57" class="anchor" href="#toc-d57"></a>7.事件</h2>
<blockquote>
<p>addEventListener()</p>
</blockquote>
<p>addEventListener()将指定的事件监听器注册到目标对象上，当目标对象触发制定的事件时，指定的回调函数就会触发。目标对象可以是 文档上的元素、 document、 window 或者XMLHttpRequest(比如onreadystatechange事件)。</p>
<p>IE8及以下不支持此方法且只有事件冒泡没有事件捕获。IE9开始支持此方法，也就有了事件捕获。</p>
<pre><code class="hljs lang-javascript">
    <span class="hljs-keyword">var</span> div1 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>);
    div1.addEventListener(<span class="hljs-string">"click"</span>, listener, <span class="hljs-literal">false</span>);
    <span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">listener</span>(<span class="hljs-params"></span>) </span>{
        <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test''</span>);
    }

    <span class="hljs-keyword">var</span> cloneHtml = div1.cloneNode(<span class="hljs-literal">true</span>);
    <span class="hljs-built_in">document</span>.body.appendChild(cloneHtml);
</code></pre><p>第一个参数是事件名，第二个是回调函数，第三个参数为true表示捕获，false表示冒泡。</p>
<pre><code class="hljs lang-javascript">    <span class="hljs-keyword">var</span> div1 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>);
    div1.addEventListener(<span class="hljs-string">"click"</span>, listener1, <span class="hljs-literal">true</span>/fasle);
    <span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">listener1</span>(<span class="hljs-params"></span>) </span>{
        <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test1''</span>);
    }

    <span class="hljs-keyword">var</span> div2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);
    div2.addEventListener(<span class="hljs-string">"click"</span>, listener2, <span class="hljs-literal">true</span>/fasle);
    <span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">listener2</span>(<span class="hljs-params"></span>) </span>{
        <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test2''</span>);
    }
</code></pre><p>有一点要注意的是，当对某一个元素1既绑定了捕获事件，又绑定了冒泡事件时：
当这个元素1并不是触发事件的那个元素2时，则触发顺序会按照先 捕获 后 冒泡 的顺序触发；
当这个元素1就是最底层的触发事件的元素时，则这个元素没有捕获和冒泡的区别，谁先绑定就先触发谁。</p>
<pre><code class="hljs lang-javascript"><span class="hljs-keyword">var</span> div2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);

div2.addEventListener(<span class="hljs-string">"click"</span>, listener2, <span class="hljs-literal">true</span>);
<span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">listener2</span>(<span class="hljs-params"></span>) </span>{
    <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test2''</span>);
}

div2.addEventListener(<span class="hljs-string">"click"</span>, listener1, <span class="hljs-literal">false</span>);
<span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">listener1</span>(<span class="hljs-params"></span>) </span>{
    <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test1''</span>);
}
<span class="hljs-comment">// 按绑定顺序执行，两个`addEventLister()`颠倒过来则执行顺序也变化</span>
<span class="hljs-comment">// 如果再对`div1`绑定一个捕获、一个冒泡，则会先触发捕获 再 触发冒泡，与绑定顺序无关</span>
</code></pre><blockquote>
<p>removeEventListener()</p>
</blockquote>
<p>与addEventListener()绑定事件对应的就是移除已绑定的事件。第三个参数的布尔值代表解绑的是捕获事件还是冒泡事件。两个事件互不相关。</p>
<pre><code class="hljs lang-javascript">
    <span class="hljs-keyword">var</span> div2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>); 
    div2.addEventListener(<span class="hljs-string">"click"</span>, listener2, <span class="hljs-literal">true</span>);
    <span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">listener2</span>(<span class="hljs-params"></span>) </span>{
        <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test2''</span>);
    }
    div2.removeEventListener(<span class="hljs-string">"click"</span>, listener2, <span class="hljs-literal">true</span>);
</code></pre><p><strong>注意</strong>：只能通过removeEventListener()解绑有名字的函数，对于绑定的匿名函数无法解除绑定。</p>
<pre><code class="hljs lang-javascript">div2.addEventListener(<span class="hljs-string">"click"</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
    <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test''</span>);
    <span class="hljs-built_in">console</span>.log(<span class="hljs-keyword">this</span>);
}, <span class="hljs-literal">true</span>);

div2.removeEventListener(<span class="hljs-string">"click"</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>) </span>{
    <span class="hljs-built_in">console</span>.log(<span class="hljs-string">"test"</span>);
}, <span class="hljs-literal">true</span>);
div2.onclick = <span class="hljs-literal">null</span>;
<span class="hljs-comment">// 点击div2依然打印出test</span>
</code></pre><p><strong>注意</strong>：这里this指向触发事件的元素自身。</p>
<blockquote>
<p>attachEvent()、detachEvent()</p>
</blockquote>
<p>IE8及以下使用这两个方法绑定和解绑事件，当然，IE9+也支持这个事件。但这个方法绑定的事件默认为冒泡也只有冒泡。</p>
<pre><code class="hljs lang-javascript">    <span class="hljs-comment">// 这里需要在事件前加 on</span>
    div2.attachEvent(<span class="hljs-string">"onclick"</span>, listener1);
    <span class="hljs-function"><span class="hljs-keyword">function</span> <span class="hljs-title">listener1</span>(<span class="hljs-params"></span>) </span>{
        <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test''</span>);
        <span class="hljs-built_in">console</span>.log(<span class="hljs-keyword">this</span>);
    }
    div2.detachEvent(<span class="hljs-string">"onclick"</span>, listener1);
</code></pre><p>和addEventListener()一样，也不能解绑匿名函数。
<strong>注意</strong>：这里this指向 window。</p>
<p>阻止默认事件和冒泡
标准事件和IE事件中的阻止默认事件和冒泡事件也有很大区别。</p>
<pre><code class="hljs lang-javascript"><span class="hljs-keyword">var</span> div2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);
<span class="hljs-keyword">if</span> (div2.addEventListener) {
    div2.addEventListener(<span class="hljs-string">"click"</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">e</span>) </span>{
        e.preventDefault(); <span class="hljs-comment">// 阻止默认事件</span>
        e.stopPropagation(); <span class="hljs-comment">// 阻止冒泡</span>
        <span class="hljs-built_in">console</span>.log(e.target.innerHTML);
    }, <span class="hljs-literal">false</span>);
} <span class="hljs-keyword">else</span> {
    div2.attachEvent(<span class="hljs-string">"onclick"</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>) </span>{
        <span class="hljs-keyword">var</span> e = <span class="hljs-built_in">window</span>.event;
        e.returnValue = <span class="hljs-literal">false</span>; <span class="hljs-comment">// 阻止默认事件</span>
        e.cancelBubble = <span class="hljs-literal">true</span>; <span class="hljs-comment">// 阻止冒泡</span>
        <span class="hljs-built_in">console</span>.log(e.srcElement.innerHTML);
    });
}
</code></pre><p>IE8及以下的event是绑定在window上的。（我的IE11里，仿真到IE7、IE8也可以取到标准事件里的 e 对象，估计是升级到IE11的原因）。</p>
<blockquote>
<p>自定义事件：createEvent()</p>
</blockquote>
<p>createEvent()用于创建一个新的 event ，而后这个 event 必须调用它的 init() 方法进行初始化。最后就可以在目标元素上使用dispatchEvent()调用新创建的event事件了。</p>
<p>createEvent()的参数一般有：UIEvents、MouseEvents、MutationEvents、HTMLEvents、Event(s)等等，分别有对应的init()方法。HTMLEvents、Event(s)对应的都是initEvent()方法。</p>
<blockquote>
<p>initEvent(type, bubbles, cancelable)</p>
</blockquote>
<p>type表示自定义的事件类型，bubbles表示是否冒泡，cancelable表示是否阻止默认事件。</p>
<p>target.dispatchEvent(ev)
target就是要触发自定义事件的DOM元素</p>
<pre><code class="hljs lang-javascript">        <span class="hljs-keyword">var</span> div1 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>);
        div1.addEventListener(<span class="hljs-string">"message"</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
            <span class="hljs-built_in">console</span>.log(<span class="hljs-string">''test''</span>);
        }, <span class="hljs-literal">false</span>);

        <span class="hljs-keyword">var</span> div2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);
        div2.addEventListener(<span class="hljs-string">"message"</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">e</span>)</span>{
            <span class="hljs-built_in">console</span>.log(<span class="hljs-keyword">this</span>);
            <span class="hljs-built_in">console</span>.log(e);
        }, <span class="hljs-literal">false</span>);
        <span class="hljs-keyword">var</span> ev = <span class="hljs-built_in">document</span>.createEvent(<span class="hljs-string">"Event"</span>);
        ev.initEvent(<span class="hljs-string">"message"</span>, <span class="hljs-literal">false</span>, <span class="hljs-literal">true</span>); <span class="hljs-comment">// 起泡参数变为true，div1的事件就会触发</span>
        div2.dispatchEvent(ev);
</code></pre><h2><a id="toc-fbe" class="anchor" href="#toc-fbe"></a>8.获取元素相关计算后的值</h2>
<blockquote>
<p>getComputedStyle()、currentStyle()</p>
</blockquote>
<p>当我们想获取元素计算后实际呈现在页面上的各个值，就用这两个方法。IE8及以下用currentStyle(),IE9+及其他标准浏览器用getComputedStyle()。</p>
<pre><code class="hljs lang-coffeescript">    var div2 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div2"</span>);
    var result = <span class="hljs-string">""</span>;
    <span class="hljs-keyword">if</span> (<span class="hljs-built_in">window</span>.getComputedStyle) {
        result = (<span class="hljs-built_in">window</span> || <span class="hljs-built_in">document</span>.defaultView).getComputedStyle(div2, <span class="hljs-literal">null</span>)[<span class="hljs-string">''cssFloat''</span>];
    } <span class="hljs-keyword">else</span> {
        result = div2.currentStyle[<span class="hljs-string">"styleFloat"</span>];
    }
    <span class="hljs-built_in">console</span>.log(result);
    <span class="hljs-regexp">//</span> <span class="hljs-built_in">document</span>.defaultView返回<span class="hljs-built_in">document</span>对象所关联的<span class="hljs-built_in">window</span>
</code></pre><p><strong>注意</strong>：这两个方法在不同的浏览器里差距也很大。
比如float属性：
getComputedStyle： IE9以上需要用cssFloat，其他标准的用float
currentStyle： IE8及以下可用styleFloat或者float。</p>
<p>比如height属性：
假如未设置height值，标准浏览器里能计算出高度值，而currentStyle计算出来是auto。</p>
<p>上面的例子getComputedStyle是用键值去访问的，也可用getPropertyValue()去访问。（IE8、IE7不支持）</p>
<p><code>result = (window || document.defaultView).getComputedStyle(div2, null).getPropertyValue(&quot;float&quot;);</code></p>
<blockquote>
<p>getBoundingClientRect()、getClientRects()</p>
</blockquote>
<p>getBoundingClientRect()该方法获得页面中某个元素的上、右、下、左分别相对浏览器视窗的位置。getBoundingClientRect是DOM元素到浏览器可视范围的距离（到浏览器顶部而不是文档顶部）。该函数返回一个Object对象，该对象有6个属性：top,lef,right,bottom,width,height；这里的top、left和css中的理解很相似，width、height是元素自身的宽高，但是right，bottom和css中的理解有点不一样。right是指元素右边界距窗口最左边的距离，bottom是指元素下边界距窗口最上面的距离。</p>
<blockquote>
<p>getClientRects()是返回一个ClientRectList集合。  </p>
</blockquote>
<pre><code class="hljs lang-javascript">    <span class="hljs-keyword">var</span> div1 = <span class="hljs-built_in">document</span>.getElementById(<span class="hljs-string">"div1"</span>);
    <span class="hljs-keyword">var</span> rects1 = div1.getClientRects();
    <span class="hljs-keyword">var</span> rects2 = div1.getBoundingClientRect();
    <span class="hljs-built_in">console</span>.log(rects1[<span class="hljs-number">0</span>].top);
    <span class="hljs-built_in">console</span>.log(rects2.top);
</code></pre>', 1, '2017-12-22 00:00:00', '2018-07-23 16:16:13', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('35', '3', '1', 0, 3, 'nodejs操作mysql', 'node-mysql', '<h1 id="-">安装</h1>
<p><code>$ npm install mysql</code></p>
<h1 id="-">更新&amp;修复</h1>
<p><code>$ npm install felixge/node-mysql</code></p>
<h1 id="-">引用</h1>
<p>code</p>
<pre><code class="hljs lang-javascript"><span class="hljs-comment">//引用</span>
<span class="hljs-keyword">var</span> mysql = <span class="hljs-built_in">require</span>(<span class="hljs-string">''mysql''</span>);
</code></pre>', '# 安装
`$ npm install mysql`

# 更新&修复
`$ npm install felixge/node-mysql`
# 引用
code
~~~
//引用
var mysql = require(''mysql'');
~~~

<!--more-->
# 建立连接
 code
~~~
//创建连接
var connection = mysql.createConnection({
    host: ''localhost'', //主机名称
    user: ''root'', //用户名
    password: ''root'', //密码
    database: ''xj2014'' //数据库
});
~~~
# 操作数据
code
~~~
//执行操作
connection.query(''SELECT * from userinfo limit 0,1'', function(err, rows, fields) {
    console.log(err);
    console.info(rows);
    console.log(fields);
});
~~~

# 完整示例
~~~
//引用
var mysql = require(''mysql'');
//创建连接
var connection = mysql.createConnection({
    host: ''localhost'', //主机名称
    user: ''root'', //用户名
    password: ''root'', //密码
    database: ''xj2014'' //数据库
});
//连接
connection.connect();
//执行操作
connection.query(''SELECT * from userinfo limit 0,1'', function(err, rows, fields) {
    console.log(err);
    console.info(rows);
    console.log(fields);
});
//关闭连接
connection.end();
~~~

## 查询
带参数查询
~~~
//引用
var mysql = require(''mysql'');
//创建连接
var connection = mysql.createConnection({
    host: ''localhost'', //主机名称
    user: ''root'', //用户名
    password: ''root'', //密码
    database: ''xj2014'' //数据库
});
//连接
connection.connect();
//执行操作
connection.query(''SELECT * from userinfo where name=?'', ["小银银"], function(err, rows) {
    if (err == null) {
        console.info(rows);
    } else {
        console.log("error info:" + err);
    }

});
//关闭连接
connection.end();
~~~

## 其他操作
修改 ，删除 ，添加 第二个参数会包含相关的操作信息
~~~
//引用
var mysql = require(''mysql'');
//创建连接
var connection = mysql.createConnection({
    host: ''localhost'', //主机名称
    user: ''root'', //用户名
    password: ''root'', //密码
    database: ''xj2014'' //数据库
});
//连接
connection.connect();
//执行操作
connection.query(''update userinfo set name=? where id=93'', ["小银银"], function(err, rows) {
    if (err == null) {
        console.info(rows); //包含相关信息
    } else {
        console.log("error info:" + err);
    }

});
//关闭连接
connection.end();
~~~
', '<div class="toc"><ul>
<li><a href="#toc-e65">安装</a></li>
<li><a href="#toc-742">更新&amp;修复</a></li>
<li><a href="#toc-3b6">引用</a></li>
<li><a href="#toc-224">建立连接</a></li>
<li><a href="#toc-e1a">操作数据</a></li>
<li><a href="#toc-2f4">完整示例</a><ul>
<li><a href="#toc-bee">查询</a></li>
<li><a href="#toc-6d8">其他操作</a></li>
</ul>
</li>
</ul>
</div><h1><a id="toc-e65" class="anchor" href="#toc-e65"></a>安装</h1>
<p><code>$ npm install mysql</code></p>
<h1><a id="toc-742" class="anchor" href="#toc-742"></a>更新&amp;修复</h1>
<p><code>$ npm install felixge/node-mysql</code></p>
<h1><a id="toc-3b6" class="anchor" href="#toc-3b6"></a>引用</h1>
<p>code</p>
<pre><code class="hljs lang-javascript"><span class="hljs-comment">//引用</span>
<span class="hljs-keyword">var</span> mysql = <span class="hljs-built_in">require</span>(<span class="hljs-string">''mysql''</span>);
</code></pre><!--more-->
<h1><a id="toc-224" class="anchor" href="#toc-224"></a>建立连接</h1>
<p> code</p>
<pre><code class="hljs lang-1c"><span class="hljs-comment">//创建连接</span>
var connection = mysql.createConnection({
    host: ''localhost'', <span class="hljs-comment">//主机名称</span>
    user: ''root'', <span class="hljs-comment">//用户名</span>
    password: ''root'', <span class="hljs-comment">//密码</span>
    database: ''xj<span class="hljs-number">2014</span>'' <span class="hljs-comment">//数据库</span>
});
</code></pre><h1><a id="toc-e1a" class="anchor" href="#toc-e1a"></a>操作数据</h1>
<p>code</p>
<pre><code class="hljs lang-javascript"><span class="hljs-comment">//执行操作</span>
connection.query(<span class="hljs-string">''SELECT * from userinfo limit 0,1''</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">err, rows, fields</span>) </span>{
    <span class="hljs-built_in">console</span>.log(err);
    <span class="hljs-built_in">console</span>.info(rows);
    <span class="hljs-built_in">console</span>.log(fields);
});
</code></pre><h1><a id="toc-2f4" class="anchor" href="#toc-2f4"></a>完整示例</h1>
<pre><code class="hljs lang-javascript"><span class="hljs-comment">//引用</span>
<span class="hljs-keyword">var</span> mysql = <span class="hljs-built_in">require</span>(<span class="hljs-string">''mysql''</span>);
<span class="hljs-comment">//创建连接</span>
<span class="hljs-keyword">var</span> connection = mysql.createConnection({
    <span class="hljs-attr">host</span>: <span class="hljs-string">''localhost''</span>, <span class="hljs-comment">//主机名称</span>
    user: <span class="hljs-string">''root''</span>, <span class="hljs-comment">//用户名</span>
    password: <span class="hljs-string">''root''</span>, <span class="hljs-comment">//密码</span>
    database: <span class="hljs-string">''xj2014''</span> <span class="hljs-comment">//数据库</span>
});
<span class="hljs-comment">//连接</span>
connection.connect();
<span class="hljs-comment">//执行操作</span>
connection.query(<span class="hljs-string">''SELECT * from userinfo limit 0,1''</span>, <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">err, rows, fields</span>) </span>{
    <span class="hljs-built_in">console</span>.log(err);
    <span class="hljs-built_in">console</span>.info(rows);
    <span class="hljs-built_in">console</span>.log(fields);
});
<span class="hljs-comment">//关闭连接</span>
connection.end();
</code></pre><h2><a id="toc-bee" class="anchor" href="#toc-bee"></a>查询</h2>
<p>带参数查询</p>
<pre><code class="hljs lang-javascript"><span class="hljs-comment">//引用</span>
<span class="hljs-keyword">var</span> mysql = <span class="hljs-built_in">require</span>(<span class="hljs-string">''mysql''</span>);
<span class="hljs-comment">//创建连接</span>
<span class="hljs-keyword">var</span> connection = mysql.createConnection({
    <span class="hljs-attr">host</span>: <span class="hljs-string">''localhost''</span>, <span class="hljs-comment">//主机名称</span>
    user: <span class="hljs-string">''root''</span>, <span class="hljs-comment">//用户名</span>
    password: <span class="hljs-string">''root''</span>, <span class="hljs-comment">//密码</span>
    database: <span class="hljs-string">''xj2014''</span> <span class="hljs-comment">//数据库</span>
});
<span class="hljs-comment">//连接</span>
connection.connect();
<span class="hljs-comment">//执行操作</span>
connection.query(<span class="hljs-string">''SELECT * from userinfo where name=?''</span>, [<span class="hljs-string">"小银银"</span>], <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">err, rows</span>) </span>{
    <span class="hljs-keyword">if</span> (err == <span class="hljs-literal">null</span>) {
        <span class="hljs-built_in">console</span>.info(rows);
    } <span class="hljs-keyword">else</span> {
        <span class="hljs-built_in">console</span>.log(<span class="hljs-string">"error info:"</span> + err);
    }

});
<span class="hljs-comment">//关闭连接</span>
connection.end();
</code></pre><h2><a id="toc-6d8" class="anchor" href="#toc-6d8"></a>其他操作</h2>
<p>修改 ，删除 ，添加 第二个参数会包含相关的操作信息</p>
<pre><code class="hljs lang-javascript"><span class="hljs-comment">//引用</span>
<span class="hljs-keyword">var</span> mysql = <span class="hljs-built_in">require</span>(<span class="hljs-string">''mysql''</span>);
<span class="hljs-comment">//创建连接</span>
<span class="hljs-keyword">var</span> connection = mysql.createConnection({
    <span class="hljs-attr">host</span>: <span class="hljs-string">''localhost''</span>, <span class="hljs-comment">//主机名称</span>
    user: <span class="hljs-string">''root''</span>, <span class="hljs-comment">//用户名</span>
    password: <span class="hljs-string">''root''</span>, <span class="hljs-comment">//密码</span>
    database: <span class="hljs-string">''xj2014''</span> <span class="hljs-comment">//数据库</span>
});
<span class="hljs-comment">//连接</span>
connection.connect();
<span class="hljs-comment">//执行操作</span>
connection.query(<span class="hljs-string">''update userinfo set name=? where id=93''</span>, [<span class="hljs-string">"小银银"</span>], <span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">err, rows</span>) </span>{
    <span class="hljs-keyword">if</span> (err == <span class="hljs-literal">null</span>) {
        <span class="hljs-built_in">console</span>.info(rows); <span class="hljs-comment">//包含相关信息</span>
    } <span class="hljs-keyword">else</span> {
        <span class="hljs-built_in">console</span>.log(<span class="hljs-string">"error info:"</span> + err);
    }

});
<span class="hljs-comment">//关闭连接</span>
connection.end();
</code></pre>', 1, '2018-03-11 17:36:54', '2018-03-11 17:36:54', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('36', '3', '1', 0, 3, 'nginx location rewrite 等配置', 'nginx-rule', '<h2 id="-">命令</h2>
<pre><code class="hljs lang-haml">sudo nginx #打开 nginx
nginx -s reload|reopen|stop|quit  #重新加载配置|重启|停止|退出 nginx
nginx -t   #测试配置是否有语法错误
nginx [-?hvVtq] [-s signal] [-c filename] [-p prefix] [-g directives]

-<span class="ruby">?,-h           : 打开帮助信息
</span>-<span class="ruby">v              : 显示版本信息并退出
</span>-<span class="ruby">V              : 显示版本和配置选项信息，然后退出
</span>-<span class="ruby">t              : 检测配置文件是否有语法错误，然后退出
</span>-<span class="ruby">q              : 在检测配置文件期间屏蔽非错误信息
</span>-<span class="ruby">s signal       : 给一个 nginx 主进程发送信号：stop（停止）, quit（退出）, reopen（重启）, reload（重新加载配置文件）
</span>-<span class="ruby">p prefix       : 设置前缀路径
</span>-<span class="ruby">c filename     : 设置配置文件
</span>-<span class="ruby">g directives   : 设置配置文件外的全局指令
</span></code></pre>', '## 命令
```
sudo nginx #打开 nginx
nginx -s reload|reopen|stop|quit  #重新加载配置|重启|停止|退出 nginx
nginx -t   #测试配置是否有语法错误
nginx [-?hvVtq] [-s signal] [-c filename] [-p prefix] [-g directives]

-?,-h           : 打开帮助信息
-v              : 显示版本信息并退出
-V              : 显示版本和配置选项信息，然后退出
-t              : 检测配置文件是否有语法错误，然后退出
-q              : 在检测配置文件期间屏蔽非错误信息
-s signal       : 给一个 nginx 主进程发送信号：stop（停止）, quit（退出）, reopen（重启）, reload（重新加载配置文件）
-p prefix       : 设置前缀路径
-c filename     : 设置配置文件
-g directives   : 设置配置文件外的全局指令
```
<!--more--> 
## location
`location [=|~|~*|^~] /uri/ { … }`  
`=`开头表示精确匹配
如 A 中只匹配根目录结尾的请求，后面不能带任何字符串    
`~` 开头表示区分大小写的正则匹配  
`~*` 开头表示不区分大小写的正则匹配  
`^~` 开头表示uri以某个常规字符串开头，不是正则匹配  
`/ `通用匹配, 如果没有其它匹配,任何请求都会匹配到  
> (location =) > (location 完整路径) > (location ^~ 路径) > (location ~,~* 正则顺序) > (location 部分起始路径) > (/)

<!--more-->
#### location例子
```
#直接匹配网站根，通过域名访问网站首页比较频繁，使用这个会加速处理。
#这里是直接转发给后端应用服务器了，也可以是一个静态首页
# 第一个必选规则
location = / {
    proxy_pass http://tomcat:8080/index
}
```
```
# 第二个必选规则是处理静态文件请求，这是nginx作为http服务器的强项
# 有两种配置模式，目录匹配或后缀匹配,任选其一或搭配使用
location ^~ /static/ {
    root /webroot/static/;
}
location ~* \.(gif|jpg|jpeg|png|css|js|ico)$ {
    root /webroot/res/;
}
```
```
#第三个规则就是通用规则，用来转发动态请求到后端应用服务器
#非静态文件请求就默认是动态请求
location / {
    proxy_pass http://tomcat:8080/
}
```
```
location = / {
    # 只匹配 / 查询。
}
```
```
location / {
    # 匹配任何查询，因为所有请求都已 / 开头。但是正则表达式规则和长的块规则将被优先和查询匹配。
}
```
```
location ^~ /images/ {
     # 匹配任何已 /images/ 开头的任何查询并且停止搜索。任何正则表达式将不会被测试。
}
```
```
location ~*.(gif|jpg|jpeg)$ {
     # 匹配任何已 gif、jpg 或 jpeg 结尾的请求。
}
```
```
location ~*.(gif|jpg|swf)$ {
     # 允许域名
      valid_referers none blocked imgs.xxx.cn imgx.yyy.cn;
      if ($invalid_referer) {
              #防盗链
              rewrite ^/ http://$host/logo.png;
      }
}
```
valid_referers
语法：valid_referers [none|blocked|server_names]   
默认值：no   
使用字段：server, location   
这个指令在referer头的基础上为 $invalid_referer 变量赋值，其值为0或1。  
可以使用这个指令来实现防盗链功能，如果valid_referers列表中没有Referer头的值， $invalid_referer将被设置为1。  
参数可以使如下形式：  
 - none意为不存在的Referer头  
 - blocked意为根据防火墙伪装Referer头，如：“Referer: XXXXXXX”。  
 - server_names为一个或多个服务器的列表，0.5.33版本以后可以在名称中使用“*”通配符。  

```
add_header Access-Control-Allow-Origin *;  
add_header Access-Control-Allow-Headers Content-Type;   
add_header Access-Control-Allow-Methods GET,POST,OPTIONS;  
add_header Access-Control-Allow-Credentials true;  
```
允许跨域

## rewrite
 使用nginx提供的全局变量或自己设置的变量，结合正则表达式和标志位实现url重写以及重定向。  
  rewrite只能放在server{},location{},if{}中，并且只能对域名后边的除去传递的参数外的字符串起作用.  
  例如 `http://seanlook.com/a/we/index.php?id=1&u=str` 只对`/a/we/index.php`重写。  
  语法`rewrite regex replacement [flag]`;
> rewrite和location功能有点像，都能实现跳转，主要区别在于rewrite是在同一域名内更改获取资源的路径，而location是对一类路径做控制访问或反向代理，可以proxy_pass到其他机器。

很多情况下rewrite也会写在location里，它们的执行顺序是：
1. 执行server块的rewrite指令  
2. 执行location匹配
3. 执行选定的location中的rewrite指令

如果其中某步URI被重写，则重新循环执行1-3，直到找到真实存在的文件；循环超过10次，则返回500 Internal Server Error错误。

flag标志位
- `last `: 表示完成rewrite
- `break` : 停止执行当前虚拟主机的后续rewrite指令集
- `redirect` : 返回302临时重定向，地址栏会显示跳转后的地址
- `permanent` : 返回301永久重定向，地址栏会显示跳转后的地址

因为301和302不能简单的只返回状态码，还必须有重定向的URL，这就是return指令无法返回301,302的原因了。

last 和 break 区别有点难以理解： 
- last一般写在server和if中，而break一般使用在location中
- last不终止重写后的url匹配，即新的url会再从server走一遍匹配流程，而break终止重写后的匹配
- break和last都能组织继续执行后面的rewrite指令
### if指令与全局变量
#### if判断指令
语法为`if(condition){...}`，对给定的条件condition进行判断。  
如果为真，大括号内的rewrite指令将被执行。    
`condition`可以是如下任何内容：  
- 当表达式只是一个变量时，如果值为空或任何以0开头的字符串都会当做false
- 直接比较变量和内容时，使用=或!= 
- `~`正则表达式匹配，`~*`不区分大小写的匹配，`!~`区分大小写的不匹配  
`-f`和`!-f`用来判断是否存在文件  
`-d`和`!-d`用来判断是否存在目录  
`-e`和`!-e`用来判断是否存在文件或目录  
`-x`和`!-x`用来判断文件是否可执行  
例如：
```
if ($http_user_agent ~ MSIE) {
    rewrite ^(.*)$ /msie/$1 break;
} //如果UA包含"MSIE"，rewrite请求到/msid/目录下
```
```
if ($http_cookie ~* "id=([^;]+)(?:;|$)") {
    set $id $1;
 } //如果cookie匹配正则，设置变量$id等于正则引用部分
```
```
if ($request_method = POST) {
    return 405;
} //如果提交方法为POST，则返回状态405（Method not allowed）。return不能返回301,302
```
```
if ($slow) {
    limit_rate 10k;
} //限速，$slow可以通过 set 指令设置
```
```
if (!-f $request_filename){
    break;
    proxy_pass  http://127.0.0.1; 
} //如果请求的文件名存在，则反向代理到localhost 。这里的break也是停止rewrite检查
```
```
if ($args ~ post=140){
    rewrite ^ http://example.com/ permanent;
} //如果query string中包含"post=140"，永久重定向到example.com
```
#### 全局变量
- `$args` ： #这个变量等于请求行中的参数，同$query_string 
- `$content_length`  ： 请求头中的Content-length字段。
- `$content_type`  ： 请求头中的Content-Type字段。
- `$document_root`  ： 当前请求在root指令中指定的值。
- `$host`  ： 请求主机头字段，否则为服务器名称。
- `$http_user_agent`  ： 客户端agent信息
- `$http_cookie`  ： 客户端cookie信息
- `$limit_rate`  ： 这个变量可以限制连接速率。
- `$request_method`  ： 客户端请求的动作，通常为GET或POST。
- `$remote_addr`  ： 客户端的IP地址。
- `$remote_port`  ： 客户端的端口。
- `$remote_user`  ： 已经经过Auth Basic Module验证的用户名。
- `$request_filename`  ： 当前请求的文件路径，由root或alias指令与URI请求生成。
- `$scheme`  ： HTTP方法（如http，https）。
- `$server_protocol ` ： 请求使用的协议，通常是HTTP/1.0或HTTP/1.1。
- `$server_addr`  ： 服务器地址，在完成一次系统调用后可以确定这个值。
- `$server_name`  ： 服务器名称。
- `$server_port`  ： 请求到达服务器的端口号。
- `$request_uri`  ： 包含请求参数的原始URI，不包含主机名，如：”/foo/bar.php?arg=baz”。
- `$uri`  ： 不带请求参数的当前URI，$uri不包含主机名，如”/foo/bar.html”。
- `$document_uri`  ： 与$uri相同。
  
**如**`http://localhost:81/test1/test2/test.php`
- $host：localhost
- $server_port：81
- $request_uri：http://localhost:88/test1/test2/test.php
- $document_uri：/test1/test2/test.php
- $document_root：/var/www/html
- $request_filename：/var/www/html/test1/test2/test.php
#### 常用正则
- `.` ： 匹配除换行符以外的任意字符
- `?` ： 重复0次或1次
`- +` ： 重复1次或更多次
- `*` ： 重复0次或更多次
- `\d` ：匹配数字
- `^` ： 匹配字符串的开始
- `$` ： 匹配字符串的介绍
- `{n}` ： 重复n次
- `{n,}` ： 重复n次或更多次
- `[c]` ： 匹配单个字符c
- `[a-z] `： 匹配a-z小写字母的任意一个
> 小括号()之间匹配的内容，可以在后面通过$1来引用，$2表示的是前面第二个()里的内容。

### 负载均衡
- 轮询（默认）   
每个请求按时间顺序逐一分配到不同的后端服务器，如果后端服务器`down`掉，能自动剔除。
```
upstream backend  {
    server 192.168.1.2;
    server 127.0.0.1:82;
}
```
- weight  
指定轮询几率，weight和访问比率成正比，用于后端服务器性能不均的 
情况。
```
upstream backend  {
    server 127.0.0.1:81 weight=3;
    server 127.0.0.1:82 weight=7;
}
```
权重越高，在被访问的概率越大，如上例，分别是30%，70%。
- ip_hash  
每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。
```
upstream backend  {
    ip_hash;
    server 127.0.0.1:81;
    server 127.0.0.1:82;
}
```
- 代理demo
```
 upstream  backend  { 
              #ip_hash; 
              server   127.0.0.1:81 max_fails=2 fail_timeout=30s ;  
              server   127.0.0.1:82 max_fails=5 fail_timeout=10s ;  
    }
  # 虚拟主机配置
    server {
        listen       80;
        server_name  www.example.com;
        root   /root/www;
        charset utf-8;
        access_log  logs/host.access.log  main;
        #对 / 所有做负载均衡+反向代理
        location / {
            root   /root/www;;
            index  index.html index.htm;
            proxy_pass        http://backend;  
            proxy_redirect off;
            # 其他配置
            # 后端的Web服务器可以通过X-Forwarded-For获取用户真实IP
            proxy_set_header  Host  $host;
            proxy_set_header  X-Real-IP  $remote_addr;  
            proxy_set_header  X-Forwarded-For  $proxy_add_x_forwarded_for;
            proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
        }
```

### rewrite例子
```
location ^~ /api/ {  
            default_type application/json;  
            if (!-f $request_filename){  
                rewrite "^/api/(.*)$" /api/$1.json;  
                break;
            }   
        }  
```
去掉后缀名访问文件
```
http {
    # 定义image日志格式
    log_format imagelog ''[$time_local] '' $image_file '' '' $image_type '' '' $body_bytes_sent '' '' $status;
    # 开启重写日志
    rewrite_log on;
    server {
        root /home/www;
        location / {
                # 重写规则信息
                error_log logs/rewrite.log notice; 
                # 注意这里要用‘’单引号引起来，避免{}
                rewrite ''^/images/([a-z]{2})/([a-z0-9]{5})/(.*)\.(png|jpg|gif)$'' /data?file=$3.$4;
                # 注意不能在上面这条规则后面加上“last”参数，否则下面的set指令不会执行
                set $image_file $3;
                set $image_type $4;
        }

        location /data {
                # 指定针对图片的日志格式，来分析图片类型和大小
                access_log logs/images.log mian;
                root /data/images;
                # 应用前面定义的变量。判断首先文件在不在，不在再判断目录在不在，如果还不在就跳转到最后一个url里
                try_files /$arg_file /image404.html;
        }
        location = /image404.html {
                # 图片不存在返回特定的信息
                return 404 "image not found\n";
        }
}
```
对形如`/images/ef/uh7b3/test.png`的请求，  重写到`/data?file=test.png`，于是匹配到`location /data`，先看/data/images/test.png文件存不存在，如果存在则正常响应，如果不存在则重写tryfiles到新的image404 location，直接返回404状态码。


`rewrite ^/images/(.*)_(\d+)x(\d+)\.(png|jpg|gif)$ /resizer/$1.$4?width=$2&height=$3? last;`  
对形如`/images/bla_500x400.jpg`的文件请求，重写到`/resizer/bla.jpg?width=500&height=400`地址，并会继续尝试匹配location。', '<div class="toc"><ul>
<li><a href="#toc-ddf">命令</a></li>
<li><a href="#location">location</a><ul>
<li><a href="#toc-668">location例子</a></li>
</ul>
</li>
<li><a href="#rewrite">rewrite</a><ul>
<li><a href="#toc-93c">if指令与全局变量</a><ul>
<li><a href="#toc-f57">if判断指令</a></li>
<li><a href="#toc-fcf">全局变量</a></li>
<li><a href="#toc-f5f">常用正则</a></li>
</ul>
</li>
<li><a href="#toc-4ea">负载均衡</a></li>
<li><a href="#toc-e08">rewrite例子</a></li>
</ul>
</li>
</ul>
</div><h2><a id="toc-ddf" class="anchor" href="#toc-ddf"></a>命令</h2>
<pre><code class="hljs lang-haml">sudo nginx #打开 nginx
nginx -s reload|reopen|stop|quit  #重新加载配置|重启|停止|退出 nginx
nginx -t   #测试配置是否有语法错误
nginx [-?hvVtq] [-s signal] [-c filename] [-p prefix] [-g directives]

-<span class="ruby">?,-h           : 打开帮助信息
</span>-<span class="ruby">v              : 显示版本信息并退出
</span>-<span class="ruby">V              : 显示版本和配置选项信息，然后退出
</span>-<span class="ruby">t              : 检测配置文件是否有语法错误，然后退出
</span>-<span class="ruby">q              : 在检测配置文件期间屏蔽非错误信息
</span>-<span class="ruby">s signal       : 给一个 nginx 主进程发送信号：stop（停止）, quit（退出）, reopen（重启）, reload（重新加载配置文件）
</span>-<span class="ruby">p prefix       : 设置前缀路径
</span>-<span class="ruby">c filename     : 设置配置文件
</span>-<span class="ruby">g directives   : 设置配置文件外的全局指令
</span></code></pre><!--more--> 
<h2><a id="location" class="anchor" href="#location"></a>location</h2>
<p><code>location [=|~|~*|^~] /uri/ { … }</code><br><code>=</code>开头表示精确匹配
如 A 中只匹配根目录结尾的请求，后面不能带任何字符串<br><code>~</code> 开头表示区分大小写的正则匹配<br><code>~*</code> 开头表示不区分大小写的正则匹配<br><code>^~</code> 开头表示uri以某个常规字符串开头，不是正则匹配<br><code>/</code>通用匹配, 如果没有其它匹配,任何请求都会匹配到  </p>
<blockquote>
<p>(location =) &gt; (location 完整路径) &gt; (location ^~ 路径) &gt; (location ~,~* 正则顺序) &gt; (location 部分起始路径) &gt; (/)</p>
</blockquote>
<!--more-->
<h4><a id="toc-668" class="anchor" href="#toc-668"></a>location例子</h4>
<pre><code class="hljs lang-vala"><span class="hljs-meta">#直接匹配网站根，通过域名访问网站首页比较频繁，使用这个会加速处理。</span>
<span class="hljs-meta">#这里是直接转发给后端应用服务器了，也可以是一个静态首页</span>
<span class="hljs-meta"># 第一个必选规则</span>
location = / {
    proxy_pass http:<span class="hljs-comment">//tomcat:8080/index</span>
}
</code></pre><pre><code class="hljs lang-crmsh"><span class="hljs-comment"># 第二个必选规则是处理静态文件请求，这是nginx作为http服务器的强项</span>
<span class="hljs-comment"># 有两种配置模式，目录匹配或后缀匹配,任选其一或搭配使用</span>
<span class="hljs-keyword">location</span> <span class="hljs-title">^~ /static</span>/ {
    root /webroot/static/;
}
<span class="hljs-keyword">location</span> <span class="hljs-title">~* \.(gif</span>|jpg|jpeg|png|css|js|ico)$ {
    root /webroot/res/;
}
</code></pre><pre><code class="hljs lang-crmsh"><span class="hljs-comment">#第三个规则就是通用规则，用来转发动态请求到后端应用服务器</span>
<span class="hljs-comment">#非静态文件请求就默认是动态请求</span>
<span class="hljs-keyword">location</span> <span class="hljs-title">/ {
    proxy_pass</span> http://tomcat:<span class="hljs-number">8080</span>/
}
</code></pre><pre><code class="hljs lang-makefile">location = / {
    <span class="hljs-comment"># 只匹配 / 查询。</span>
}
</code></pre><pre><code class="hljs lang-crmsh"><span class="hljs-keyword">location</span> <span class="hljs-title">/ {
    # 匹配任何查询，因为所有请求都已 / 开头。但是正则表达式规则和长的块规则将被优先和查询匹配。
}
</span></code></pre><pre><code class="hljs lang-crmsh"><span class="hljs-keyword">location</span> <span class="hljs-title">^~ /images</span>/ {
     <span class="hljs-comment"># 匹配任何已 /images/ 开头的任何查询并且停止搜索。任何正则表达式将不会被测试。</span>
}
</code></pre><pre><code class="hljs lang-crmsh"><span class="hljs-keyword">location</span> <span class="hljs-title">~*.(gif</span>|jpg|jpeg)$ {
     <span class="hljs-comment"># 匹配任何已 gif、jpg 或 jpeg 结尾的请求。</span>
}
</code></pre><pre><code class="hljs lang-nginx"><span class="hljs-attribute">location</span> ~*.(gif|jpg|swf)$ {
     <span class="hljs-comment"># 允许域名</span>
      <span class="hljs-attribute">valid_referers</span> <span class="hljs-literal">none</span> <span class="hljs-literal">blocked</span> imgs.xxx.cn imgx.yyy.cn;
      <span class="hljs-attribute">if</span> (<span class="hljs-variable">$invalid_referer</span>) {
              <span class="hljs-comment">#防盗链</span>
              <span class="hljs-attribute">rewrite</span><span class="hljs-regexp"> ^/</span> http://<span class="hljs-variable">$host</span>/logo.png;
      }
}
</code></pre><p>valid_referers
语法：valid_referers [none|blocked|server_names]<br>默认值：no<br>使用字段：server, location<br>这个指令在referer头的基础上为 $invalid_referer 变量赋值，其值为0或1。<br>可以使用这个指令来实现防盗链功能，如果valid_referers列表中没有Referer头的值， $invalid_referer将被设置为1。<br>参数可以使如下形式：  </p>
<ul>
<li>none意为不存在的Referer头  </li>
<li>blocked意为根据防火墙伪装Referer头，如：“Referer: XXXXXXX”。  </li>
<li>server_names为一个或多个服务器的列表，0.5.33版本以后可以在名称中使用“*”通配符。  </li>
</ul>
<pre><code class="hljs lang-mipsasm"><span class="hljs-keyword">add_header </span>Access-Control-Allow-<span class="hljs-keyword">Origin </span>*<span class="hljs-comment">;  </span>
<span class="hljs-keyword">add_header </span>Access-Control-Allow-Headers Content-Type<span class="hljs-comment">;   </span>
<span class="hljs-keyword">add_header </span>Access-Control-Allow-Methods GET,POST,OPTIONS<span class="hljs-comment">;  </span>
<span class="hljs-keyword">add_header </span>Access-Control-Allow-Credentials true<span class="hljs-comment">;  </span>
</code></pre><p>允许跨域</p>
<h2><a id="rewrite" class="anchor" href="#rewrite"></a>rewrite</h2>
<p> 使用nginx提供的全局变量或自己设置的变量，结合正则表达式和标志位实现url重写以及重定向。<br>  rewrite只能放在server{},location{},if{}中，并且只能对域名后边的除去传递的参数外的字符串起作用.<br>  例如 <code>http://seanlook.com/a/we/index.php?id=1&amp;u=str</code> 只对<code>/a/we/index.php</code>重写。<br>  语法<code>rewrite regex replacement [flag]</code>;</p>
<blockquote>
<p>rewrite和location功能有点像，都能实现跳转，主要区别在于rewrite是在同一域名内更改获取资源的路径，而location是对一类路径做控制访问或反向代理，可以proxy_pass到其他机器。</p>
</blockquote>
<p>很多情况下rewrite也会写在location里，它们的执行顺序是：</p>
<ol>
<li>执行server块的rewrite指令  </li>
<li>执行location匹配</li>
<li>执行选定的location中的rewrite指令</li>
</ol>
<p>如果其中某步URI被重写，则重新循环执行1-3，直到找到真实存在的文件；循环超过10次，则返回500 Internal Server Error错误。</p>
<p>flag标志位</p>
<ul>
<li><code>last</code>: 表示完成rewrite</li>
<li><code>break</code> : 停止执行当前虚拟主机的后续rewrite指令集</li>
<li><code>redirect</code> : 返回302临时重定向，地址栏会显示跳转后的地址</li>
<li><code>permanent</code> : 返回301永久重定向，地址栏会显示跳转后的地址</li>
</ul>
<p>因为301和302不能简单的只返回状态码，还必须有重定向的URL，这就是return指令无法返回301,302的原因了。</p>
<p>last 和 break 区别有点难以理解： </p>
<ul>
<li>last一般写在server和if中，而break一般使用在location中</li>
<li>last不终止重写后的url匹配，即新的url会再从server走一遍匹配流程，而break终止重写后的匹配</li>
<li>break和last都能组织继续执行后面的rewrite指令<h3><a id="toc-93c" class="anchor" href="#toc-93c"></a>if指令与全局变量</h3>
<h4><a id="toc-f57" class="anchor" href="#toc-f57"></a>if判断指令</h4>
语法为<code>if(condition){...}</code>，对给定的条件condition进行判断。<br>如果为真，大括号内的rewrite指令将被执行。<br><code>condition</code>可以是如下任何内容：  </li>
<li>当表达式只是一个变量时，如果值为空或任何以0开头的字符串都会当做false</li>
<li>直接比较变量和内容时，使用=或!= </li>
<li><code>~</code>正则表达式匹配，<code>~*</code>不区分大小写的匹配，<code>!~</code>区分大小写的不匹配<br><code>-f</code>和<code>!-f</code>用来判断是否存在文件<br><code>-d</code>和<code>!-d</code>用来判断是否存在目录<br><code>-e</code>和<code>!-e</code>用来判断是否存在文件或目录<br><code>-x</code>和<code>!-x</code>用来判断文件是否可执行<br>例如：<pre><code class="hljs lang-awk"><span class="hljs-keyword">if</span> (<span class="hljs-variable">$http_user_agent</span> ~ MSIE) {
  rewrite ^(.*)$ <span class="hljs-regexp">/msie/</span><span class="hljs-variable">$1</span> <span class="hljs-keyword">break</span>;
} <span class="hljs-regexp">//</span>如果UA包含<span class="hljs-string">"MSIE"</span>，rewrite请求到<span class="hljs-regexp">/msid/</span>目录下
</code></pre><pre><code class="hljs lang-awk"><span class="hljs-keyword">if</span> (<span class="hljs-variable">$http_cookie</span> ~* <span class="hljs-string">"id=([^;]+)(?:;|$)"</span>) {
  set <span class="hljs-variable">$id</span> <span class="hljs-variable">$1</span>;
} <span class="hljs-regexp">//</span>如果cookie匹配正则，设置变量<span class="hljs-variable">$id</span>等于正则引用部分
</code></pre><pre><code class="hljs lang-autoit"><span class="hljs-keyword">if</span> ($request_method = POST) {
  <span class="hljs-keyword">return</span> <span class="hljs-number">405</span><span class="hljs-comment">;</span>
} //如果提交方法为POST，则返回状态<span class="hljs-number">405</span>（Method <span class="hljs-literal">not</span> allowed）。<span class="hljs-keyword">return</span>不能返回<span class="hljs-number">301</span>,<span class="hljs-number">302</span>
</code></pre><pre><code class="hljs lang-awk"><span class="hljs-keyword">if</span> (<span class="hljs-variable">$slow</span>) {
  limit_rate <span class="hljs-number">10</span>k;
} <span class="hljs-regexp">//</span>限速，<span class="hljs-variable">$slow</span>可以通过 set 指令设置
</code></pre><pre><code class="hljs lang-awk"><span class="hljs-keyword">if</span> (!-f <span class="hljs-variable">$request_filename</span>){
  <span class="hljs-keyword">break</span>;
  proxy_pass  http:<span class="hljs-regexp">//</span><span class="hljs-number">127.0</span>.<span class="hljs-number">0.1</span>; 
} <span class="hljs-regexp">//</span>如果请求的文件名存在，则反向代理到localhost 。这里的<span class="hljs-keyword">break</span>也是停止rewrite检查
</code></pre><pre><code class="hljs lang-maxima"><span class="hljs-keyword">if</span> ($<span class="hljs-built_in">args</span> ~ post=<span class="hljs-number">140</span>){
  rewrite ^ http://<span class="hljs-built_in">example</span>.com/ <span class="hljs-built_in">permanent</span>;
} //如果query <span class="hljs-built_in">string</span>中包含<span class="hljs-string">"post=140"</span>，永久重定向到<span class="hljs-built_in">example</span>.com
</code></pre><h4><a id="toc-fcf" class="anchor" href="#toc-fcf"></a>全局变量</h4>
</li>
<li><code>$args</code> ： #这个变量等于请求行中的参数，同$query_string </li>
<li><code>$content_length</code>  ： 请求头中的Content-length字段。</li>
<li><code>$content_type</code>  ： 请求头中的Content-Type字段。</li>
<li><code>$document_root</code>  ： 当前请求在root指令中指定的值。</li>
<li><code>$host</code>  ： 请求主机头字段，否则为服务器名称。</li>
<li><code>$http_user_agent</code>  ： 客户端agent信息</li>
<li><code>$http_cookie</code>  ： 客户端cookie信息</li>
<li><code>$limit_rate</code>  ： 这个变量可以限制连接速率。</li>
<li><code>$request_method</code>  ： 客户端请求的动作，通常为GET或POST。</li>
<li><code>$remote_addr</code>  ： 客户端的IP地址。</li>
<li><code>$remote_port</code>  ： 客户端的端口。</li>
<li><code>$remote_user</code>  ： 已经经过Auth Basic Module验证的用户名。</li>
<li><code>$request_filename</code>  ： 当前请求的文件路径，由root或alias指令与URI请求生成。</li>
<li><code>$scheme</code>  ： HTTP方法（如http，https）。</li>
<li><code>$server_protocol</code> ： 请求使用的协议，通常是HTTP/1.0或HTTP/1.1。</li>
<li><code>$server_addr</code>  ： 服务器地址，在完成一次系统调用后可以确定这个值。</li>
<li><code>$server_name</code>  ： 服务器名称。</li>
<li><code>$server_port</code>  ： 请求到达服务器的端口号。</li>
<li><code>$request_uri</code>  ： 包含请求参数的原始URI，不包含主机名，如：”/foo/bar.php?arg=baz”。</li>
<li><code>$uri</code>  ： 不带请求参数的当前URI，$uri不包含主机名，如”/foo/bar.html”。</li>
<li><code>$document_uri</code>  ： 与$uri相同。</li>
</ul>
<p><strong>如</strong><code>http://localhost:81/test1/test2/test.php</code></p>
<ul>
<li>$host：localhost</li>
<li>$server_port：81</li>
<li>$request_uri：<a href="http://localhost:88/test1/test2/test.php">http://localhost:88/test1/test2/test.php</a></li>
<li>$document_uri：/test1/test2/test.php</li>
<li>$document_root：/var/www/html</li>
<li>$request_filename：/var/www/html/test1/test2/test.php<h4><a id="toc-f5f" class="anchor" href="#toc-f5f"></a>常用正则</h4>
</li>
<li><code>.</code> ： 匹配除换行符以外的任意字符</li>
<li><code>?</code> ： 重复0次或1次
<code>- +</code> ： 重复1次或更多次</li>
<li><code>*</code> ： 重复0次或更多次</li>
<li><code>\d</code> ：匹配数字</li>
<li><code>^</code> ： 匹配字符串的开始</li>
<li><code>$</code> ： 匹配字符串的介绍</li>
<li><code>{n}</code> ： 重复n次</li>
<li><code>{n,}</code> ： 重复n次或更多次</li>
<li><code>[c]</code> ： 匹配单个字符c</li>
<li><code>[a-z]</code>： 匹配a-z小写字母的任意一个<blockquote>
<p>小括号()之间匹配的内容，可以在后面通过$1来引用，$2表示的是前面第二个()里的内容。</p>
</blockquote>
</li>
</ul>
<h3><a id="toc-4ea" class="anchor" href="#toc-4ea"></a>负载均衡</h3>
<ul>
<li>轮询（默认）<br>每个请求按时间顺序逐一分配到不同的后端服务器，如果后端服务器<code>down</code>掉，能自动剔除。<pre><code class="hljs lang-routeros">upstream backend  {
 <span class="hljs-built_in"> server </span>192.168.1.2;
 <span class="hljs-built_in"> server </span>127.0.0.1:82;
}
</code></pre></li>
<li>weight<br>指定轮询几率，weight和访问比率成正比，用于后端服务器性能不均的 
情况。<pre><code class="hljs lang-routeros">upstream backend  {
 <span class="hljs-built_in"> server </span>127.0.0.1:81 <span class="hljs-attribute">weight</span>=3;
 <span class="hljs-built_in"> server </span>127.0.0.1:82 <span class="hljs-attribute">weight</span>=7;
}
</code></pre>权重越高，在被访问的概率越大，如上例，分别是30%，70%。</li>
<li>ip_hash<br>每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。<pre><code class="hljs lang-routeros">upstream backend  {
  ip_hash;
 <span class="hljs-built_in"> server </span>127.0.0.1:81;
 <span class="hljs-built_in"> server </span>127.0.0.1:82;
}
</code></pre></li>
<li>代理demo<pre><code class="hljs lang-puppet">upstream  <span class="hljs-keyword">backend</span>  { 
            <span class="hljs-comment">#ip_hash; </span>
            server   <span class="hljs-number">127.0</span>.<span class="hljs-number">0</span>.<span class="hljs-number">1</span>:<span class="hljs-number">81</span> max_fails=<span class="hljs-number">2</span> fail_timeout=<span class="hljs-number">30</span>s ;  
            server   <span class="hljs-number">127.0</span>.<span class="hljs-number">0</span>.<span class="hljs-number">1</span>:<span class="hljs-number">82</span> max_fails=<span class="hljs-number">5</span> fail_timeout=<span class="hljs-number">10</span>s ;  
  }
# 虚拟主机配置
  <span class="hljs-keyword">server</span> {
      listen       <span class="hljs-number">80</span>;
      server_name  www.example.com;
      <span class="hljs-literal">root</span>   /<span class="hljs-literal">root</span>/www;
      charset utf-<span class="hljs-number">8</span>;
      access_log  logs/host.access.log  <span class="hljs-keyword">main</span>;
      <span class="hljs-comment">#对 / 所有做负载均衡+反向代理</span>
      location / {
          <span class="hljs-literal">root</span>   /<span class="hljs-literal">root</span>/www;;
          index  index.html index.htm;
          proxy_pass        http://backend;  
          proxy_redirect off;
          <span class="hljs-comment"># 其他配置</span>
          <span class="hljs-comment"># 后端的Web服务器可以通过X-Forwarded-For获取用户真实IP</span>
          proxy_set_header  Host  <span class="hljs-variable">$host</span>;
          proxy_set_header  X-Real-IP  <span class="hljs-variable">$remote_addr</span>;  
          proxy_set_header  X-Forwarded-For  <span class="hljs-variable">$proxy_add_x_forwarded_for</span>;
          proxy_next_upstream error timeout invalid_header http_50<span class="hljs-number">0</span> http_502 http_503 http_504;
      }
</code></pre></li>
</ul>
<h3><a id="toc-e08" class="anchor" href="#toc-e08"></a>rewrite例子</h3>
<pre><code class="hljs lang-ruby">location ^~ <span class="hljs-regexp">/api/</span> {  
            default_type application/json;  
            <span class="hljs-keyword">if</span> (!-f $request_filename){  
                rewrite <span class="hljs-string">"^/api/(.*)$"</span> /api/$1.json;  
                <span class="hljs-keyword">break</span>;
            }   
        }  
</code></pre><p>去掉后缀名访问文件</p>
<pre><code class="hljs lang-nginx"><span class="hljs-section">http</span> {
    <span class="hljs-comment"># 定义image日志格式</span>
    <span class="hljs-attribute">log_format</span> imagelog <span class="hljs-string">''[<span class="hljs-variable">$time_local</span>] ''</span> <span class="hljs-variable">$image_file</span> <span class="hljs-string">'' ''</span> <span class="hljs-variable">$image_type</span> <span class="hljs-string">'' ''</span> <span class="hljs-variable">$body_bytes_sent</span> <span class="hljs-string">'' ''</span> <span class="hljs-variable">$status</span>;
    <span class="hljs-comment"># 开启重写日志</span>
    <span class="hljs-attribute">rewrite_log</span> <span class="hljs-literal">on</span>;
    <span class="hljs-section">server</span> {
        <span class="hljs-attribute">root</span> /home/www;
        <span class="hljs-attribute">location</span> / {
                <span class="hljs-comment"># 重写规则信息</span>
                <span class="hljs-attribute">error_log</span> logs/rewrite.log <span class="hljs-literal">notice</span>; 
                <span class="hljs-comment"># 注意这里要用‘’单引号引起来，避免{}</span>
                <span class="hljs-attribute">rewrite</span> <span class="hljs-string">''^/images/([a-z]{2})/([a-z0-9]{5})/(.*)\.(png|jpg|gif)$''</span> /data?file=<span class="hljs-variable">$3</span>.<span class="hljs-variable">$4</span>;
                <span class="hljs-comment"># 注意不能在上面这条规则后面加上“last”参数，否则下面的set指令不会执行</span>
                <span class="hljs-attribute">set</span> <span class="hljs-variable">$image_file</span> <span class="hljs-variable">$3</span>;
                <span class="hljs-attribute">set</span> <span class="hljs-variable">$image_type</span> <span class="hljs-variable">$4</span>;
        }

        <span class="hljs-attribute">location</span> /data {
                <span class="hljs-comment"># 指定针对图片的日志格式，来分析图片类型和大小</span>
                <span class="hljs-attribute">access_log</span> logs/images.log mian;
                <span class="hljs-attribute">root</span> /data/images;
                <span class="hljs-comment"># 应用前面定义的变量。判断首先文件在不在，不在再判断目录在不在，如果还不在就跳转到最后一个url里</span>
                <span class="hljs-attribute">try_files</span> /<span class="hljs-variable">$arg_file</span> /image404.html;
        }
        <span class="hljs-attribute">location</span> = /image404.html {
                <span class="hljs-comment"># 图片不存在返回特定的信息</span>
                <span class="hljs-attribute">return</span> <span class="hljs-number">404</span> <span class="hljs-string">"image not found\n"</span>;
        }
}
</code></pre><p>对形如<code>/images/ef/uh7b3/test.png</code>的请求，  重写到<code>/data?file=test.png</code>，于是匹配到<code>location /data</code>，先看/data/images/test.png文件存不存在，如果存在则正常响应，如果不存在则重写tryfiles到新的image404 location，直接返回404状态码。</p>
<p><code>rewrite ^/images/(.*)_(\d+)x(\d+)\.(png|jpg|gif)$ /resizer/$1.$4?width=$2&amp;height=$3? last;</code><br>对形如<code>/images/bla_500x400.jpg</code>的文件请求，重写到<code>/resizer/bla.jpg?width=500&amp;height=400</code>地址，并会继续尝试匹配location。</p>
', 1, '2018-03-12 09:49:42', '2018-11-14 08:20:21', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('37', '5', '1', 0, 3, 'numpy', 'python-numpy', '<h2 id="-">基本概念</h2>
<p>官网 <a href="https://docs.scipy.org/doc/">https://docs.scipy.org/doc/</a><br>numpy的主要对象是同种元素的多维数组。<br>这是一个所有的元素都是一种类型、通过一个正整数元组索引的元素表格(通常是元素是数字)。<br>在numpy中维度(dimensions)叫做轴(axis)，轴的个数叫做秩(rank)。  </p>
<ul>
<li>eg：<pre><code class="hljs lang-json">[<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>]
</code></pre>秩为1的数组，只有一个轴、轴长为3。</li>
</ul>
', '## 基本概念
官网 [https://docs.scipy.org/doc/](https://docs.scipy.org/doc/)  
numpy的主要对象是同种元素的多维数组。  
这是一个所有的元素都是一种类型、通过一个正整数元组索引的元素表格(通常是元素是数字)。  
在numpy中维度(dimensions)叫做轴(axis)，轴的个数叫做秩(rank)。  
- eg：
```
[1, 2, 3]
```
秩为1的数组，只有一个轴、轴长为3。
<!--more-->
-  eg：
```
[[ 1.  0.  0.]
 [ 0.  1.  2.]]
```
秩为2(它有两个维度).第一个维度长度为2，第二个维度长度为3。

numpy的数组类被称作ndarray。通常被称作数组。注意numpy.array和标准Python库类array.array并不相同，后者只处理一维数组和提供少量功能。更多重要ndarray对象属性有：

- ndarray.ndim
数组轴的个数，轴的个数被称作秩

- ndarray.shape
数组的维度。这是一个指示数组在每个维度上大小的整数元组。  
eg:一个2行3列的矩阵，它的shape属性将是(2,3),这个元组的长度是秩，即维度或者ndim属性

- ndarray.size
数组元素的总个数，等于shape属性中元组元素的乘积。

- ndarray.dtype
一个用来描述数组中元素类型的对象。

- ndarray.itemsize
数组中每个元素的**字节**大小。  
eg:
```  python
import numpy as np
arr = np.arange(15).reshape(3, 5)
print("arr", arr)
print("shape", arr.shape)  # (3,5)
print("dtype", arr.dtype)  # (int32)
print("size", arr.size)  # 15
print("type", type(arr))  # <class ''nu py.ndarray''>
```

## 创建数组
- 使用array函数从常规的Python列表和元组创造数组。  
 所创建的数组类型由原序列中的元素类型推导而来。
```  python
import numpy as np
arr = np.array([1, 2, 3, 4])
# [1, 2, 3, 4]
print(arr)
```
- 可以在创建时显示指定类型
```  python
import numpy as np
arr = np.array([1, 2, 3, 4],dtype=np.float32)
# [1. 2. 3. 4.]
print(arr)
```
- `zeros`创建一个全是0的数组  
参数：zeros(shape, dtype = float, order = ''C'')
```  python
import numpy as np
arr = np.zeros((2,3))
print(arr)
#float64
print(arr.dtype) 
```
- `ones`创建一个全1的数组  
参数：ones(shape, dtype=None, order=''C'')
```  python
import numpy as np
arr = np.ones((2,3))
print(arr)
 #float64
print(arr.dtype)
```
- `empty`创建一个内容随机并且依赖与内存状态的数组  
参数：empty(shape, dtype = float, order = ''C'') 
```  python
import numpy as np
arr = np.empty((2,3))
print(arr)
#float64
print(arr.dtype)
```
- `arange`函数返回数组  
参数：arange(start = None, stop = None, step = None, dtype = None)   
由于有限的浮点数精度，通常无法预测获得的元素个数。
```  python
import numpy as np
arr = np.arange(10,40,10)
#[10 20 30]
print(arr)
#int32
print(arr.dtype)
```
- `linspace`  返回数组  
参数：linspace(start, stop, num=50, endpoint=True, retstep=False, dtype=None)
``` python
import numpy as np
arr = np.linspace(0,9,10)
#[0. 1. 2. 3. 4. 5. 6. 7. 8. 9.]
print(arr)
#float64
print(arr.dtype)
```

### random 类
numpy中利用random类获取随机数．  

#### random()　  
生成随机浮点数  
默认为生成一个随机的浮点数，范围是在0.0~1.0之间，也可以通过参数size设置返回数据的size。
``` python
import numpy as np
# 生成一个随机的浮点数
r = np.random.random()
# 0.6590899579137934
print (r)
''''''
[[0.89269339 0.56326053 0.79697541]
 [0.69644276 0.17902598 0.0084224 ]]
''''''
# 指定size
print(np.random.random(size=(2,3)))
```
#### randint()   
产生随机整数  
参数: randint(low, high=None, size=None, dtype=’l’) 如果 high为None（默认值），则结果为[0，low ]  
默认随机生一个整数int类型，可以指定这个整数的范围。
``` python 
import numpy as np
# 产生 0-4 一个
print(np.random.randint(4))
# 产生 2-4 一个
print(np.random.randint(2,4))
# 产生 1-5 两个
print(np.random.randint(low=1,high=5,size=2))
# 产生 0-5 三个
print(np.random.randint(5, size=3))
# 产生 0-10 2行3列（2*3）
print(np.random.randint(10, size=(2, 3)))
```

#### normal() 　
高斯分布  
参数: normal(loc=0.0, scale=1.0, size=None) loc：均值，scale：标准差，size：抽取样本的size 。  
```  python
import numpy as np
import matplotlib.pyplot as plt
y=np.random.normal(0,1,5000)
print(y)
# 直方图
# 100个分块
plt.hist(y,bins=100)
plt.show()
```
![alt](/static/upload/20180822/upload_efbfccdda454dacdb16c7541aa7aa3b5.png)

#### randn()   
正态分布产生一个浮点数或N维浮点数组
参数：randn(d0, d1, ..., dn)
``` python
import numpy as np
import matplotlib.pyplot as plt
y=np.random.randn(1000)
# 直方图
# 100个分块
plt.hist(y,bins=100)
plt.show()
```
![alt](/static/upload/20180822/upload_96778132faf635854b11346d51194e1a.png)
#### standard_normal
标准正态分布产生一个浮点数或N维浮点数组
参数：standard_normal(size=None)
``` python
import numpy as np
import matplotlib.pyplot as plt
y=np.random.standard_normal((2000,1))
# 直方图
# 100个分块
plt.hist(y,bins=100)
plt.show()
```
![alt](/static/upload/20180823/upload_cbf61b419ba24a5da29f2b9a19eed3d6.png)

#### rand()　  
生成[0, 1) 间随机数
``` python
import numpy as np
# 0.7758272442386239
print(np.random.rand())
''''''
[[0.07675678 0.72700556 0.31372113]
 [0.19674323 0.3332258  0.49691272]]
''''''
print(np.random.rand(2,3))
```
#### shuffle()  　
随机打乱序列将序列的所有元素随机排序 
``` python
import numpy as np
x=np.arange(10)
# [0 1 2 3 4 5 6 7 8 9]
print(x)
np.random.shuffle(x)
# 并没有产生新的数组
# [7 6 1 9 3 8 4 2 5 0]
print(x)
```
#### choice()   
随机选取序列的一个元素，可以从序列(字符串、列表、元组等)中随机选取，返回一个列表，元组或字符串的随机项。
``` python
import numpy as np
x=np.arange(10)
# [0 1 2 3 4 5 6 7 8 9]
print(x)
# 5
print(np.random.choice(x))
# 输出6个小于5的元素  
# [1 3 2 2 1 1]
print(np.random.choice(5, 6))
import numpy as np
# 每个条目出现的概率。如果没有就均匀分布
# [0 3 2]
print(np.random.choice(5, 3, p=[0.1, 0, 0.3, 0.6, 0]))
x = [''a'', ''b'', ''c'', ''d'']
# [''a'' ''c'']
print(np.random.choice(x, 2, p=[0.1, 0, 0.9, 0]))
```

#### RandomState()  
 指定种子值，如不设置种子值时,np.random.randint(10)可能产生0-10内的任意整数，且每次产生的数字可能是任意一种。  
 设置种子值后,np.random.RandomState(0).randint(10)可能产生0-10内的任意整数，如果种子值不变则每次运行程序产生的数字一样。    
``` python
import numpy as np

print(np.random.RandomState(0).randint(10))
print(np.random.RandomState(2).randint(10))
print(np.random.randint(10))

```

## 基本运算
 数组的算术运算是**按元素**的。新的数组被创建并且被结果填充。  
  ```  python
import numpy as np
a = np.array([1, 3, 5, 7, 9])
b = np.array([2, 4, 6, 8, 10])
# +
print(a+b)
# -
print(a-b)
# *
print(a*b)
# /
print(a/b)
# ^ **平方
print(b**2)
# %
print(b % 3)
# 并没有产生新的数组
print(''------'')
b += 2
print(b)
# -=
b -= 2
print(b)
# *=
b *= 2
print(b)
```

## 通用函数(ufunc)
numpy提供常见的数学函数如`sin`,`cos`和`exp`叫作“通用函数”(ufunc)。  
这些函数作用按数组的元素运算，产生一个数组作为输出。
``` python
import numpy as np
x =np.arange(5)
# [0 1 2 3 4]
print(x)

# [ 0.          0.84147098  0.90929743  0.14112001 -0.7568025 ]
print(np.sin(x))
# [ 1.          0.54030231 -0.41614684 -0.9899925  -0.65364362]
print(np.cos(x))
# [0.         1.         1.41421356 1.73205081 2.        ]
print(np.sqrt(x))
# [ 1.          2.71828183  7.3890561  20.08553692 54.59815003]
print(np.exp(x))
```

## 索引，切片和迭
索引模式：start:stop:step
- 一维数组可以被索引、切片和迭代，就像列表和其它Python序列。
- 多维数组可以每个轴有一个索引。这些索引由一个逗号分割的元组给出。
- 当少于轴数的索引被提供时，确失的索引被认为是整个切片。
- 迭代多维数组是就第一个轴而言的。
- 对每个数组中元素进行运算，可以使用flat属性，该属性是数组元素的一个迭代器。

``` python
import numpy as np
x=np.arange(10)**2
# [ 0  1  4  9 16 25 36 49 64 81]
print(x)
# 1
print(x[1])
# [1 4]
print(x[1:3])
# [1 9] 
print(x[1:5:2])#start:stop:step

idx=[1,2,3]
# [1 4 9]
print(x[idx])
for item in x :
    print(item)
#--------------
m=np.arange(20).reshape(4,5)**2
''''''
[[  0   1   4   9  16]
 [ 25  36  49  64  81]
 [100 121 144 169 196]
 [225 256 289 324 361]]
''''''
print(m)
# 多维索引
# 169
print(m[2,3])
''''''
[[  9]
 [ 64]
 [169]]
''''''
print(m[0:3,3:4])# 0,1,2 行 3列
# [225 256 289 324 361]
print(m[-1])

for item in m.flat:
    print(item)
```

## 形状操作
- reshape函数改变参数形状并返回它，而resize函数改变数组自身

```python
import numpy as np

x = np.arange(12)
# [ 0  1  2  3  4  5  6  7  8  9 10 11]
print(x)
# (12,)
print(x.shape)
# reshape函数改变参数形状并返回它，而resize函数改变数组自身。
# 返回新的数组
print(x.reshape(3, 4))
x.resize(3, 4)
print(x)
x.shape = (3, 4)
print(x)
# [ 0  1  2  3  4  5  6  7  8  9 10 11]
print(x.ravel())

a = np.array([[1, 2],
              [3, 4]])
b = np.array([[5, 6],
              [7, 8]])
''''''
[[1 2]
 [3 4]
 [5 6]
 [7 8]]
''''''
print(np.vstack((a, b)))
''''''
[[1 2 5 6]
 [3 4 7 8]]
''''''
print(np.hstack((a, b)))
```

### 布尔数组索引

``` python
import numpy as np

x = np.arange(12).reshape(3, 4)
''''''
[[ 0  1  2  3]
 [ 4  5  6  7]
 [ 8  9 10 11]]
''''''
print(x)
y = x > 6
''''''
[[False False False False]
 [False False False  True]
 [ True  True  True  True]]
''''''
print(y)

x[y]=100
''''''
[[  0   1   2   3]
 [  4   5   6 100]
 [100 100 100 100]]
''''''
print(x)
```

## ref
> 方法

| numpy方法 | 解释 |
| --- | :-: |
| np.dtype | 指定当前numpy对象的整体数据类型 |
| np.itemsize | 对象中每个元素的大小, 单位字节 |
| np.size | 对象元素的个数, 相当于np.shape中的n*m值 |
| np.shape | 轴, 查看数组形状, 对于矩阵, n行m列 |
| np.ndim | 秩 |
| np.isnan(list) | 筛选出nan值 |
| np.iscomplex(list) | 筛选出非复数 |
| ~ | 取补运算符 |
| np.array(数组, dtype=np.bool) | 自定义数组类型 |
| np.astype(np.bool) | 转换数组类型 |
| np.mat() | 将python 列表转化成矩阵 |
| np.mat().getA() | 将matrix对象转成ndarray对象 |
| np.matrix() | 同上 |
| np.asmatrix() | 将ndarray对象转成matrix对象 |
| np.tile() | 重复某个数组。比如tile(A,n)，功能是将数组A重复n次，构成一个新的数组|
| np.I | 矩阵求逆 |
| np.T | 矩阵转置, 行变列, 列变行, 对角线翻转矩阵 |
| np.tolist() | 转换成python列表, 用于和python原生结合写程序 |
| np.multiply(x, y) | 矩阵x 矩阵y相乘 |
| np.unique() | 数组驱虫, 并且从小到大生成一个新的数组 |
| np.arange | 同python range() |
| np.arange(24).reshape((2, 3, 4)) | 创建一个2维3行4列的数组, 必须能被给定的长度除开, 可以索引和切片 |
| np.arange(24).resize((2, 3, 4)) | 同上, 会修改原值 |
| np.linspace(x, y, z) | 等间距生成, x起始, y截止, z步长 |
| np.ones(x) | 生成都是x的数组, 可传递三维数组, 几行几列, 具体的个数 |
| np.zeros(x) | 生成都是0的数组 |
| np.full([x, y], z) | 自定义模板数组, 生成x行y列都是z的数组 |
| np.eye(x) | 创建一个正方的x*x单位的矩阵, 对角线为1, 其余为0 |
| np.flatten() | 数组降维, 不改变 原值 |
| np.random.rand(x, y, z) | 生成一个一维x随机数或生成x*y的随机数组 |
| np.random.randn(x, y) | 正态分布随机数 |
| np.random.randint(low, high, (shape)) | 整数随机数 |
| np.random.normal(loc, scale, (size)) | 从指定正态分布中抽取样本, loc为概率分布的均匀值, 标准差scale |
| np.random.seed(s) | 给一个随机数字固定 |
| np.randomunifrom(low, high, (size)) | 均匀分布的数组, 有小数 |
| np.random.shuffle(a) | 将数组a的第0轴(最外维度)进行随机排列(洗牌), 改变数组a, 行边列不变 |
| np.random.permutation(a) | 同上, 不改变数组a |
| np.random.choice(a, size=None, replace=False, p=数组a/np.sum(b)) | 从一维数组a中以概率p抽取元素，形成size形状新数组，replace表示是否可以重用元素，默认为False，p为抽取概率,本位置越高,抽取概率越高 |
| np.sum(axis=None) | 求和, axis=0为列, 1为行 |
| np.argsort() | 矩阵每个元素坐标排序 |
| np.sort(axix=None) | 从小打大排序 |
| -np.sort(axis=None) | 从大到小排序 |
| np.sort_values(‘字段’, ascending=False) | 排序,升序排列 |
| np.mean(axis=None) | 平均数 |
| np.average(axis=None,weights=None) | 加权平均，weights加权值，不设为等权重,例子[10, 5, 1],每列分别X10,X5,X1在/(10+5+1) |
| np.var(axis=None) | 方差：各数与平均数之差的平方的平均数 |
| np.std(axis=None) | 标准差:方差平方根 |
| np.min(axis=None) | 最小值 |
| np.argmin(axis=None) | 求数组中最小值的坐标 |
| np.median(axis=None) | 中位数 |
| np.ptp(axis=None) | 元素最大值与最小值的差 |
| np.cumsum() | 累加,cumsum和cumprod之类的方法不聚合，产生一个中间结果组成的数组,默认一维数组,1为按原样 |
| np.cumprod() | 累乘 |
| np.count_nonzero(arr > 0) | 计数非0值个数,布尔值会被强制转换为1和0，可以使用sum()对布尔型数组中的True值计数 |
| np.bools.any() | 测试数组中是否存在一个或多个True |
| np.bools.all() | 数组中所有值是否都是True, 测试有没有空值 |


>  类型

| np.dtype类型 | 解释 |
| --- | --- |
| np.bool | 布尔值 |
| np.int | 整型 |
| np.float | 浮点型 |
| np.complex | 复数 |
| np.object | 对象 |
| np.string_ | ASCII字符 |
| np.unicode_ | Unicode所有字符, 字节数平台决定 |', '<div class="toc"><ul>
<li><a href="#toc-e2d">基本概念</a></li>
<li><a href="#toc-894">创建数组</a><ul>
<li><a href="#toc-81e">random 类</a><ul>
<li><a href="#random-">random()</a></li>
<li><a href="#randint-">randint()</a></li>
<li><a href="#normal-">normal()</a></li>
<li><a href="#randn-">randn()</a></li>
<li><a href="#standard_normal">standard_normal</a></li>
<li><a href="#rand-">rand()</a></li>
<li><a href="#shuffle-">shuffle()</a></li>
<li><a href="#choice-">choice()</a></li>
<li><a href="#randomstate-">RandomState()</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#toc-54d">基本运算</a></li>
<li><a href="#toc-e1e">通用函数(ufunc)</a></li>
<li><a href="#toc-286">索引，切片和迭</a></li>
<li><a href="#toc-344">形状操作</a><ul>
<li><a href="#toc-ff4">布尔数组索引</a></li>
</ul>
</li>
<li><a href="#ref">ref</a></li>
</ul>
</div><h2><a id="toc-e2d" class="anchor" href="#toc-e2d"></a>基本概念</h2>
<p>官网 <a href="https://docs.scipy.org/doc/">https://docs.scipy.org/doc/</a><br>numpy的主要对象是同种元素的多维数组。<br>这是一个所有的元素都是一种类型、通过一个正整数元组索引的元素表格(通常是元素是数字)。<br>在numpy中维度(dimensions)叫做轴(axis)，轴的个数叫做秩(rank)。  </p>
<ul>
<li>eg：<pre><code class="hljs lang-json">[<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>]
</code></pre>秩为1的数组，只有一个轴、轴长为3。<!--more--></li>
<li>eg：<pre><code class="hljs lang-json">[[ <span class="hljs-number">1.</span>  <span class="hljs-number">0.</span>  <span class="hljs-number">0.</span>]
[ <span class="hljs-number">0.</span>  <span class="hljs-number">1.</span>  <span class="hljs-number">2.</span>]]
</code></pre>秩为2(它有两个维度).第一个维度长度为2，第二个维度长度为3。</li>
</ul>
<p>numpy的数组类被称作ndarray。通常被称作数组。注意numpy.array和标准Python库类array.array并不相同，后者只处理一维数组和提供少量功能。更多重要ndarray对象属性有：</p>
<ul>
<li><p>ndarray.ndim
数组轴的个数，轴的个数被称作秩</p>
</li>
<li><p>ndarray.shape
数组的维度。这是一个指示数组在每个维度上大小的整数元组。<br>eg:一个2行3列的矩阵，它的shape属性将是(2,3),这个元组的长度是秩，即维度或者ndim属性</p>
</li>
<li><p>ndarray.size
数组元素的总个数，等于shape属性中元组元素的乘积。</p>
</li>
<li><p>ndarray.dtype
一个用来描述数组中元素类型的对象。</p>
</li>
<li><p>ndarray.itemsize
数组中每个元素的<strong>字节</strong>大小。<br>eg:</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
arr = np.arange(<span class="hljs-number">15</span>).reshape(<span class="hljs-number">3</span>, <span class="hljs-number">5</span>)
print(<span class="hljs-string">"arr"</span>, arr)
print(<span class="hljs-string">"shape"</span>, arr.shape)  <span class="hljs-comment"># (3,5)</span>
print(<span class="hljs-string">"dtype"</span>, arr.dtype)  <span class="hljs-comment"># (int32)</span>
print(<span class="hljs-string">"size"</span>, arr.size)  <span class="hljs-comment"># 15</span>
print(<span class="hljs-string">"type"</span>, type(arr))  <span class="hljs-comment"># &lt;class ''nu py.ndarray''&gt;</span>
</code></pre>
</li>
</ul>
<h2><a id="toc-894" class="anchor" href="#toc-894"></a>创建数组</h2>
<ul>
<li>使用array函数从常规的Python列表和元组创造数组。<br>所创建的数组类型由原序列中的元素类型推导而来。<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
arr = np.array([<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>, <span class="hljs-number">4</span>])
<span class="hljs-comment"># [1, 2, 3, 4]</span>
print(arr)
</code></pre>
</li>
<li>可以在创建时显示指定类型<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
arr = np.array([<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>, <span class="hljs-number">4</span>],dtype=np.float32)
<span class="hljs-comment"># [1. 2. 3. 4.]</span>
print(arr)
</code></pre>
</li>
<li><code>zeros</code>创建一个全是0的数组<br>参数：zeros(shape, dtype = float, order = &#39;C&#39;)<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
arr = np.zeros((<span class="hljs-number">2</span>,<span class="hljs-number">3</span>))
print(arr)
<span class="hljs-comment">#float64</span>
print(arr.dtype) 
</code></pre>
</li>
<li><code>ones</code>创建一个全1的数组<br>参数：ones(shape, dtype=None, order=&#39;C&#39;)<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
arr = np.ones((<span class="hljs-number">2</span>,<span class="hljs-number">3</span>))
print(arr)
<span class="hljs-comment">#float64</span>
print(arr.dtype)
</code></pre>
</li>
<li><code>empty</code>创建一个内容随机并且依赖与内存状态的数组<br>参数：empty(shape, dtype = float, order = &#39;C&#39;) <pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
arr = np.empty((<span class="hljs-number">2</span>,<span class="hljs-number">3</span>))
print(arr)
<span class="hljs-comment">#float64</span>
print(arr.dtype)
</code></pre>
</li>
<li><code>arange</code>函数返回数组<br>参数：arange(start = None, stop = None, step = None, dtype = None)<br>由于有限的浮点数精度，通常无法预测获得的元素个数。<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
arr = np.arange(<span class="hljs-number">10</span>,<span class="hljs-number">40</span>,<span class="hljs-number">10</span>)
<span class="hljs-comment">#[10 20 30]</span>
print(arr)
<span class="hljs-comment">#int32</span>
print(arr.dtype)
</code></pre>
</li>
<li><code>linspace</code>  返回数组<br>参数：linspace(start, stop, num=50, endpoint=True, retstep=False, dtype=None)<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
arr = np.linspace(<span class="hljs-number">0</span>,<span class="hljs-number">9</span>,<span class="hljs-number">10</span>)
<span class="hljs-comment">#[0. 1. 2. 3. 4. 5. 6. 7. 8. 9.]</span>
print(arr)
<span class="hljs-comment">#float64</span>
print(arr.dtype)
</code></pre>
</li>
</ul>
<h3><a id="toc-81e" class="anchor" href="#toc-81e"></a>random 类</h3>
<p>numpy中利用random类获取随机数．  </p>
<h4><a id="random-" class="anchor" href="#random-"></a>random()　</h4>
<p>生成随机浮点数<br>默认为生成一个随机的浮点数，范围是在0.0~1.0之间，也可以通过参数size设置返回数据的size。</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
<span class="hljs-comment"># 生成一个随机的浮点数</span>
r = np.random.random()
<span class="hljs-comment"># 0.6590899579137934</span>
<span class="hljs-keyword">print</span> (r)
<span class="hljs-string">''''''
[[0.89269339 0.56326053 0.79697541]
 [0.69644276 0.17902598 0.0084224 ]]
''''''</span>
<span class="hljs-comment"># 指定size</span>
print(np.random.random(size=(<span class="hljs-number">2</span>,<span class="hljs-number">3</span>)))
</code></pre>
<h4><a id="randint-" class="anchor" href="#randint-"></a>randint()</h4>
<p>产生随机整数<br>参数: randint(low, high=None, size=None, dtype=’l’) 如果 high为None（默认值），则结果为[0，low ]<br>默认随机生一个整数int类型，可以指定这个整数的范围。</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
<span class="hljs-comment"># 产生 0-4 一个</span>
print(np.random.randint(<span class="hljs-number">4</span>))
<span class="hljs-comment"># 产生 2-4 一个</span>
print(np.random.randint(<span class="hljs-number">2</span>,<span class="hljs-number">4</span>))
<span class="hljs-comment"># 产生 1-5 两个</span>
print(np.random.randint(low=<span class="hljs-number">1</span>,high=<span class="hljs-number">5</span>,size=<span class="hljs-number">2</span>))
<span class="hljs-comment"># 产生 0-5 三个</span>
print(np.random.randint(<span class="hljs-number">5</span>, size=<span class="hljs-number">3</span>))
<span class="hljs-comment"># 产生 0-10 2行3列（2*3）</span>
print(np.random.randint(<span class="hljs-number">10</span>, size=(<span class="hljs-number">2</span>, <span class="hljs-number">3</span>)))
</code></pre>
<h4><a id="normal-" class="anchor" href="#normal-"></a>normal() 　</h4>
<p>高斯分布<br>参数: normal(loc=0.0, scale=1.0, size=None) loc：均值，scale：标准差，size：抽取样本的size 。  </p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
<span class="hljs-keyword">import</span> matplotlib.pyplot <span class="hljs-keyword">as</span> plt
y=np.random.normal(<span class="hljs-number">0</span>,<span class="hljs-number">1</span>,<span class="hljs-number">5000</span>)
print(y)
<span class="hljs-comment"># 直方图</span>
<span class="hljs-comment"># 100个分块</span>
plt.hist(y,bins=<span class="hljs-number">100</span>)
plt.show()
</code></pre>
<p><img src="/static/upload/20180822/upload_efbfccdda454dacdb16c7541aa7aa3b5.png" alt="alt"></p>
<h4><a id="randn-" class="anchor" href="#randn-"></a>randn()</h4>
<p>正态分布产生一个浮点数或N维浮点数组
参数：randn(d0, d1, ..., dn)</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
<span class="hljs-keyword">import</span> matplotlib.pyplot <span class="hljs-keyword">as</span> plt
y=np.random.randn(<span class="hljs-number">1000</span>)
<span class="hljs-comment"># 直方图</span>
<span class="hljs-comment"># 100个分块</span>
plt.hist(y,bins=<span class="hljs-number">100</span>)
plt.show()
</code></pre>
<p><img src="/static/upload/20180822/upload_96778132faf635854b11346d51194e1a.png" alt="alt"></p>
<h4><a id="standard_normal" class="anchor" href="#standard_normal"></a>standard_normal</h4>
<p>标准正态分布产生一个浮点数或N维浮点数组
参数：standard_normal(size=None)</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
<span class="hljs-keyword">import</span> matplotlib.pyplot <span class="hljs-keyword">as</span> plt
y=np.random.standard_normal((<span class="hljs-number">2000</span>,<span class="hljs-number">1</span>))
<span class="hljs-comment"># 直方图</span>
<span class="hljs-comment"># 100个分块</span>
plt.hist(y,bins=<span class="hljs-number">100</span>)
plt.show()
</code></pre>
<p><img src="/static/upload/20180823/upload_cbf61b419ba24a5da29f2b9a19eed3d6.png" alt="alt"></p>
<h4><a id="rand-" class="anchor" href="#rand-"></a>rand()　</h4>
<p>生成[0, 1) 间随机数</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
<span class="hljs-comment"># 0.7758272442386239</span>
print(np.random.rand())
<span class="hljs-string">''''''
[[0.07675678 0.72700556 0.31372113]
 [0.19674323 0.3332258  0.49691272]]
''''''</span>
print(np.random.rand(<span class="hljs-number">2</span>,<span class="hljs-number">3</span>))
</code></pre>
<h4><a id="shuffle-" class="anchor" href="#shuffle-"></a>shuffle()  　</h4>
<p>随机打乱序列将序列的所有元素随机排序 </p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
x=np.arange(<span class="hljs-number">10</span>)
<span class="hljs-comment"># [0 1 2 3 4 5 6 7 8 9]</span>
print(x)
np.random.shuffle(x)
<span class="hljs-comment"># 并没有产生新的数组</span>
<span class="hljs-comment"># [7 6 1 9 3 8 4 2 5 0]</span>
print(x)
</code></pre>
<h4><a id="choice-" class="anchor" href="#choice-"></a>choice()</h4>
<p>随机选取序列的一个元素，可以从序列(字符串、列表、元组等)中随机选取，返回一个列表，元组或字符串的随机项。</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
x=np.arange(<span class="hljs-number">10</span>)
<span class="hljs-comment"># [0 1 2 3 4 5 6 7 8 9]</span>
print(x)
<span class="hljs-comment"># 5</span>
print(np.random.choice(x))
<span class="hljs-comment"># 输出6个小于5的元素  </span>
<span class="hljs-comment"># [1 3 2 2 1 1]</span>
print(np.random.choice(<span class="hljs-number">5</span>, <span class="hljs-number">6</span>))
<span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
<span class="hljs-comment"># 每个条目出现的概率。如果没有就均匀分布</span>
<span class="hljs-comment"># [0 3 2]</span>
print(np.random.choice(<span class="hljs-number">5</span>, <span class="hljs-number">3</span>, p=[<span class="hljs-number">0.1</span>, <span class="hljs-number">0</span>, <span class="hljs-number">0.3</span>, <span class="hljs-number">0.6</span>, <span class="hljs-number">0</span>]))
x = [<span class="hljs-string">''a''</span>, <span class="hljs-string">''b''</span>, <span class="hljs-string">''c''</span>, <span class="hljs-string">''d''</span>]
<span class="hljs-comment"># [''a'' ''c'']</span>
print(np.random.choice(x, <span class="hljs-number">2</span>, p=[<span class="hljs-number">0.1</span>, <span class="hljs-number">0</span>, <span class="hljs-number">0.9</span>, <span class="hljs-number">0</span>]))
</code></pre>
<h4><a id="randomstate-" class="anchor" href="#randomstate-"></a>RandomState()</h4>
<p> 指定种子值，如不设置种子值时,np.random.randint(10)可能产生0-10内的任意整数，且每次产生的数字可能是任意一种。<br> 设置种子值后,np.random.RandomState(0).randint(10)可能产生0-10内的任意整数，如果种子值不变则每次运行程序产生的数字一样。    </p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np

print(np.random.RandomState(<span class="hljs-number">0</span>).randint(<span class="hljs-number">10</span>))
print(np.random.RandomState(<span class="hljs-number">2</span>).randint(<span class="hljs-number">10</span>))
print(np.random.randint(<span class="hljs-number">10</span>))

</code></pre>
<h2><a id="toc-54d" class="anchor" href="#toc-54d"></a>基本运算</h2>
<p> 数组的算术运算是<strong>按元素</strong>的。新的数组被创建并且被结果填充。  </p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
a = np.array([<span class="hljs-number">1</span>, <span class="hljs-number">3</span>, <span class="hljs-number">5</span>, <span class="hljs-number">7</span>, <span class="hljs-number">9</span>])
b = np.array([<span class="hljs-number">2</span>, <span class="hljs-number">4</span>, <span class="hljs-number">6</span>, <span class="hljs-number">8</span>, <span class="hljs-number">10</span>])
<span class="hljs-comment"># +</span>
print(a+b)
<span class="hljs-comment"># -</span>
print(a-b)
<span class="hljs-comment"># *</span>
print(a*b)
<span class="hljs-comment"># /</span>
print(a/b)
<span class="hljs-comment"># ^ **平方</span>
print(b**<span class="hljs-number">2</span>)
<span class="hljs-comment"># %</span>
print(b % <span class="hljs-number">3</span>)
<span class="hljs-comment"># 并没有产生新的数组</span>
print(<span class="hljs-string">''------''</span>)
b += <span class="hljs-number">2</span>
print(b)
<span class="hljs-comment"># -=</span>
b -= <span class="hljs-number">2</span>
print(b)
<span class="hljs-comment"># *=</span>
b *= <span class="hljs-number">2</span>
print(b)
</code></pre>
<h2><a id="toc-e1e" class="anchor" href="#toc-e1e"></a>通用函数(ufunc)</h2>
<p>numpy提供常见的数学函数如<code>sin</code>,<code>cos</code>和<code>exp</code>叫作“通用函数”(ufunc)。<br>这些函数作用按数组的元素运算，产生一个数组作为输出。</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
x =np.arange(<span class="hljs-number">5</span>)
<span class="hljs-comment"># [0 1 2 3 4]</span>
print(x)

<span class="hljs-comment"># [ 0.          0.84147098  0.90929743  0.14112001 -0.7568025 ]</span>
print(np.sin(x))
<span class="hljs-comment"># [ 1.          0.54030231 -0.41614684 -0.9899925  -0.65364362]</span>
print(np.cos(x))
<span class="hljs-comment"># [0.         1.         1.41421356 1.73205081 2.        ]</span>
print(np.sqrt(x))
<span class="hljs-comment"># [ 1.          2.71828183  7.3890561  20.08553692 54.59815003]</span>
print(np.exp(x))
</code></pre>
<h2><a id="toc-286" class="anchor" href="#toc-286"></a>索引，切片和迭</h2>
<p>索引模式：start:stop:step</p>
<ul>
<li>一维数组可以被索引、切片和迭代，就像列表和其它Python序列。</li>
<li>多维数组可以每个轴有一个索引。这些索引由一个逗号分割的元组给出。</li>
<li>当少于轴数的索引被提供时，确失的索引被认为是整个切片。</li>
<li>迭代多维数组是就第一个轴而言的。</li>
<li>对每个数组中元素进行运算，可以使用flat属性，该属性是数组元素的一个迭代器。</li>
</ul>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
x=np.arange(<span class="hljs-number">10</span>)**<span class="hljs-number">2</span>
<span class="hljs-comment"># [ 0  1  4  9 16 25 36 49 64 81]</span>
print(x)
<span class="hljs-comment"># 1</span>
print(x[<span class="hljs-number">1</span>])
<span class="hljs-comment"># [1 4]</span>
print(x[<span class="hljs-number">1</span>:<span class="hljs-number">3</span>])
<span class="hljs-comment"># [1 9] </span>
print(x[<span class="hljs-number">1</span>:<span class="hljs-number">5</span>:<span class="hljs-number">2</span>])<span class="hljs-comment">#start:stop:step</span>

idx=[<span class="hljs-number">1</span>,<span class="hljs-number">2</span>,<span class="hljs-number">3</span>]
<span class="hljs-comment"># [1 4 9]</span>
print(x[idx])
<span class="hljs-keyword">for</span> item <span class="hljs-keyword">in</span> x :
    print(item)
<span class="hljs-comment">#--------------</span>
m=np.arange(<span class="hljs-number">20</span>).reshape(<span class="hljs-number">4</span>,<span class="hljs-number">5</span>)**<span class="hljs-number">2</span>
<span class="hljs-string">''''''
[[  0   1   4   9  16]
 [ 25  36  49  64  81]
 [100 121 144 169 196]
 [225 256 289 324 361]]
''''''</span>
print(m)
<span class="hljs-comment"># 多维索引</span>
<span class="hljs-comment"># 169</span>
print(m[<span class="hljs-number">2</span>,<span class="hljs-number">3</span>])
<span class="hljs-string">''''''
[[  9]
 [ 64]
 [169]]
''''''</span>
print(m[<span class="hljs-number">0</span>:<span class="hljs-number">3</span>,<span class="hljs-number">3</span>:<span class="hljs-number">4</span>])<span class="hljs-comment"># 0,1,2 行 3列</span>
<span class="hljs-comment"># [225 256 289 324 361]</span>
print(m[<span class="hljs-number">-1</span>])

<span class="hljs-keyword">for</span> item <span class="hljs-keyword">in</span> m.flat:
    print(item)
</code></pre>
<h2><a id="toc-344" class="anchor" href="#toc-344"></a>形状操作</h2>
<ul>
<li>reshape函数改变参数形状并返回它，而resize函数改变数组自身</li>
</ul>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np

x = np.arange(<span class="hljs-number">12</span>)
<span class="hljs-comment"># [ 0  1  2  3  4  5  6  7  8  9 10 11]</span>
print(x)
<span class="hljs-comment"># (12,)</span>
print(x.shape)
<span class="hljs-comment"># reshape函数改变参数形状并返回它，而resize函数改变数组自身。</span>
<span class="hljs-comment"># 返回新的数组</span>
print(x.reshape(<span class="hljs-number">3</span>, <span class="hljs-number">4</span>))
x.resize(<span class="hljs-number">3</span>, <span class="hljs-number">4</span>)
print(x)
x.shape = (<span class="hljs-number">3</span>, <span class="hljs-number">4</span>)
print(x)
<span class="hljs-comment"># [ 0  1  2  3  4  5  6  7  8  9 10 11]</span>
print(x.ravel())

a = np.array([[<span class="hljs-number">1</span>, <span class="hljs-number">2</span>],
              [<span class="hljs-number">3</span>, <span class="hljs-number">4</span>]])
b = np.array([[<span class="hljs-number">5</span>, <span class="hljs-number">6</span>],
              [<span class="hljs-number">7</span>, <span class="hljs-number">8</span>]])
<span class="hljs-string">''''''
[[1 2]
 [3 4]
 [5 6]
 [7 8]]
''''''</span>
print(np.vstack((a, b)))
<span class="hljs-string">''''''
[[1 2 5 6]
 [3 4 7 8]]
''''''</span>
print(np.hstack((a, b)))
</code></pre>
<h3><a id="toc-ff4" class="anchor" href="#toc-ff4"></a>布尔数组索引</h3>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np

x = np.arange(<span class="hljs-number">12</span>).reshape(<span class="hljs-number">3</span>, <span class="hljs-number">4</span>)
<span class="hljs-string">''''''
[[ 0  1  2  3]
 [ 4  5  6  7]
 [ 8  9 10 11]]
''''''</span>
print(x)
y = x &gt; <span class="hljs-number">6</span>
<span class="hljs-string">''''''
[[False False False False]
 [False False False  True]
 [ True  True  True  True]]
''''''</span>
print(y)

x[y]=<span class="hljs-number">100</span>
<span class="hljs-string">''''''
[[  0   1   2   3]
 [  4   5   6 100]
 [100 100 100 100]]
''''''</span>
print(x)
</code></pre>
<h2><a id="ref" class="anchor" href="#ref"></a>ref</h2>
<blockquote>
<p>方法</p>
</blockquote>
<table>
<thead>
<tr>
<th>numpy方法</th>
<th style="text-align:center">解释</th>
</tr>
</thead>
<tbody>
<tr>
<td>np.dtype</td>
<td style="text-align:center">指定当前numpy对象的整体数据类型</td>
</tr>
<tr>
<td>np.itemsize</td>
<td style="text-align:center">对象中每个元素的大小, 单位字节</td>
</tr>
<tr>
<td>np.size</td>
<td style="text-align:center">对象元素的个数, 相当于np.shape中的n*m值</td>
</tr>
<tr>
<td>np.shape</td>
<td style="text-align:center">轴, 查看数组形状, 对于矩阵, n行m列</td>
</tr>
<tr>
<td>np.ndim</td>
<td style="text-align:center">秩</td>
</tr>
<tr>
<td>np.isnan(list)</td>
<td style="text-align:center">筛选出nan值</td>
</tr>
<tr>
<td>np.iscomplex(list)</td>
<td style="text-align:center">筛选出非复数</td>
</tr>
<tr>
<td>~</td>
<td style="text-align:center">取补运算符</td>
</tr>
<tr>
<td>np.array(数组, dtype=np.bool)</td>
<td style="text-align:center">自定义数组类型</td>
</tr>
<tr>
<td>np.astype(np.bool)</td>
<td style="text-align:center">转换数组类型</td>
</tr>
<tr>
<td>np.mat()</td>
<td style="text-align:center">将python 列表转化成矩阵</td>
</tr>
<tr>
<td>np.mat().getA()</td>
<td style="text-align:center">将matrix对象转成ndarray对象</td>
</tr>
<tr>
<td>np.matrix()</td>
<td style="text-align:center">同上</td>
</tr>
<tr>
<td>np.asmatrix()</td>
<td style="text-align:center">将ndarray对象转成matrix对象</td>
</tr>
<tr>
<td>np.tile()</td>
<td style="text-align:center">重复某个数组。比如tile(A,n)，功能是将数组A重复n次，构成一个新的数组</td>
</tr>
<tr>
<td>np.I</td>
<td style="text-align:center">矩阵求逆</td>
</tr>
<tr>
<td>np.T</td>
<td style="text-align:center">矩阵转置, 行变列, 列变行, 对角线翻转矩阵</td>
</tr>
<tr>
<td>np.tolist()</td>
<td style="text-align:center">转换成python列表, 用于和python原生结合写程序</td>
</tr>
<tr>
<td>np.multiply(x, y)</td>
<td style="text-align:center">矩阵x 矩阵y相乘</td>
</tr>
<tr>
<td>np.unique()</td>
<td style="text-align:center">数组驱虫, 并且从小到大生成一个新的数组</td>
</tr>
<tr>
<td>np.arange</td>
<td style="text-align:center">同python range()</td>
</tr>
<tr>
<td>np.arange(24).reshape((2, 3, 4))</td>
<td style="text-align:center">创建一个2维3行4列的数组, 必须能被给定的长度除开, 可以索引和切片</td>
</tr>
<tr>
<td>np.arange(24).resize((2, 3, 4))</td>
<td style="text-align:center">同上, 会修改原值</td>
</tr>
<tr>
<td>np.linspace(x, y, z)</td>
<td style="text-align:center">等间距生成, x起始, y截止, z步长</td>
</tr>
<tr>
<td>np.ones(x)</td>
<td style="text-align:center">生成都是x的数组, 可传递三维数组, 几行几列, 具体的个数</td>
</tr>
<tr>
<td>np.zeros(x)</td>
<td style="text-align:center">生成都是0的数组</td>
</tr>
<tr>
<td>np.full([x, y], z)</td>
<td style="text-align:center">自定义模板数组, 生成x行y列都是z的数组</td>
</tr>
<tr>
<td>np.eye(x)</td>
<td style="text-align:center">创建一个正方的x*x单位的矩阵, 对角线为1, 其余为0</td>
</tr>
<tr>
<td>np.flatten()</td>
<td style="text-align:center">数组降维, 不改变 原值</td>
</tr>
<tr>
<td>np.random.rand(x, y, z)</td>
<td style="text-align:center">生成一个一维x随机数或生成x*y的随机数组</td>
</tr>
<tr>
<td>np.random.randn(x, y)</td>
<td style="text-align:center">正态分布随机数</td>
</tr>
<tr>
<td>np.random.randint(low, high, (shape))</td>
<td style="text-align:center">整数随机数</td>
</tr>
<tr>
<td>np.random.normal(loc, scale, (size))</td>
<td style="text-align:center">从指定正态分布中抽取样本, loc为概率分布的均匀值, 标准差scale</td>
</tr>
<tr>
<td>np.random.seed(s)</td>
<td style="text-align:center">给一个随机数字固定</td>
</tr>
<tr>
<td>np.randomunifrom(low, high, (size))</td>
<td style="text-align:center">均匀分布的数组, 有小数</td>
</tr>
<tr>
<td>np.random.shuffle(a)</td>
<td style="text-align:center">将数组a的第0轴(最外维度)进行随机排列(洗牌), 改变数组a, 行边列不变</td>
</tr>
<tr>
<td>np.random.permutation(a)</td>
<td style="text-align:center">同上, 不改变数组a</td>
</tr>
<tr>
<td>np.random.choice(a, size=None, replace=False, p=数组a/np.sum(b))</td>
<td style="text-align:center">从一维数组a中以概率p抽取元素，形成size形状新数组，replace表示是否可以重用元素，默认为False，p为抽取概率,本位置越高,抽取概率越高</td>
</tr>
<tr>
<td>np.sum(axis=None)</td>
<td style="text-align:center">求和, axis=0为列, 1为行</td>
</tr>
<tr>
<td>np.argsort()</td>
<td style="text-align:center">矩阵每个元素坐标排序</td>
</tr>
<tr>
<td>np.sort(axix=None)</td>
<td style="text-align:center">从小打大排序</td>
</tr>
<tr>
<td>-np.sort(axis=None)</td>
<td style="text-align:center">从大到小排序</td>
</tr>
<tr>
<td>np.sort_values(‘字段’, ascending=False)</td>
<td style="text-align:center">排序,升序排列</td>
</tr>
<tr>
<td>np.mean(axis=None)</td>
<td style="text-align:center">平均数</td>
</tr>
<tr>
<td>np.average(axis=None,weights=None)</td>
<td style="text-align:center">加权平均，weights加权值，不设为等权重,例子[10, 5, 1],每列分别X10,X5,X1在/(10+5+1)</td>
</tr>
<tr>
<td>np.var(axis=None)</td>
<td style="text-align:center">方差：各数与平均数之差的平方的平均数</td>
</tr>
<tr>
<td>np.std(axis=None)</td>
<td style="text-align:center">标准差:方差平方根</td>
</tr>
<tr>
<td>np.min(axis=None)</td>
<td style="text-align:center">最小值</td>
</tr>
<tr>
<td>np.argmin(axis=None)</td>
<td style="text-align:center">求数组中最小值的坐标</td>
</tr>
<tr>
<td>np.median(axis=None)</td>
<td style="text-align:center">中位数</td>
</tr>
<tr>
<td>np.ptp(axis=None)</td>
<td style="text-align:center">元素最大值与最小值的差</td>
</tr>
<tr>
<td>np.cumsum()</td>
<td style="text-align:center">累加,cumsum和cumprod之类的方法不聚合，产生一个中间结果组成的数组,默认一维数组,1为按原样</td>
</tr>
<tr>
<td>np.cumprod()</td>
<td style="text-align:center">累乘</td>
</tr>
<tr>
<td>np.count_nonzero(arr &gt; 0)</td>
<td style="text-align:center">计数非0值个数,布尔值会被强制转换为1和0，可以使用sum()对布尔型数组中的True值计数</td>
</tr>
<tr>
<td>np.bools.any()</td>
<td style="text-align:center">测试数组中是否存在一个或多个True</td>
</tr>
<tr>
<td>np.bools.all()</td>
<td style="text-align:center">数组中所有值是否都是True, 测试有没有空值</td>
</tr>
</tbody>
</table>
<blockquote>
<p> 类型</p>
</blockquote>
<table>
<thead>
<tr>
<th>np.dtype类型</th>
<th>解释</th>
</tr>
</thead>
<tbody>
<tr>
<td>np.bool</td>
<td>布尔值</td>
</tr>
<tr>
<td>np.int</td>
<td>整型</td>
</tr>
<tr>
<td>np.float</td>
<td>浮点型</td>
</tr>
<tr>
<td>np.complex</td>
<td>复数</td>
</tr>
<tr>
<td>np.object</td>
<td>对象</td>
</tr>
<tr>
<td>np.string_</td>
<td>ASCII字符</td>
</tr>
<tr>
<td>np.unicode_</td>
<td>Unicode所有字符, 字节数平台决定</td>
</tr>
</tbody>
</table>
', 1, '2018-08-01 16:00:55', '2018-08-23 10:28:49', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('38', '1', '1', 0, 3, 'js简单验证码处理', 'js-code', '<p><strong>注意</strong>只针对简单验证码（仅仅数字和英文字母，方向不变并且噪点较少）</p>
<h3 id="-">获取特征</h3>
<ul>
<li>通过<code>canvas</code>获取页面图片</li>
<li>切割每一个字符获取元数据(一维数组rgba)</li>
<li>灰度化+二值化获取每个像素点的信息</li>
<li>提取可能出现的所有字符的特征信息</li>
</ul>
', '**注意**只针对简单验证码（仅仅数字和英文字母，方向不变并且噪点较少）

### 获取特征
- 通过`canvas`获取页面图片
- 切割每一个字符获取元数据(一维数组rgba)
- 灰度化+二值化获取每个像素点的信息
- 提取可能出现的所有字符的特征信息
<!--more-->

### 目标识别
- 通过`canvas`获取页面图片
- 切割每一个字符获取元数据(一维数组rgba)
- 灰度化+二值化获取每个像素点的信息
- 匹配当前的特征信息和已有记录
- 取最大匹配作为当前的识别结果

### 识别代码
```
//获取目标图片
let image = document.querySelector("#form1 img");
//创建canvas
let canvas = document.createElement("canvas");
//获取2d上下文
let ctx = canvas.getContext("2d");
//获取的特征信息 0-9
let feature = [
  "111100011110000001110011000100011000110111000000111000000111000000111001000110001000110001100000011110001111111111111111111111111111111111111111000000000000000000000000000",
  "111111001111100001111000001100000011100110011111100011111100011111100111111100111111000111111000111011001111111111111111111111111111111111111111000000000000000000000000000",
  "111000011110000001100011000100011000111111001111110001111100011111000111110001111100011010000000001000000001111111111111111111110111111111111111000000000000000000000000000",
  "111000011110000001110011000111111000111111001111100011111100011111110001111111001001110001000000011100000111111111111111111111111111111111111111000000000000000000000000000",
  "111111000111110001111110001111100001111000001110010011100010011000110011000000000000000001111100111111100111111111111111111111111111111111111111000000000000000000000000000",
  "100000000110010000110011111100011111100000011100000001100110001111111001000111001000110001100000011110000111111111110111111111111111111111111111000000000000000000000000000",
  "111100011110000001110011001100011111100000011100000001100011001100111001100111001100110001100000011110000111111111111111111110111111110111111111000000000000000000000000000",
  "100000000100000000111111000111110001111100011111100111111000111111001111110001111110011111110011011100011111111111111111111111111111111111111111000000000000000000000000000",
  "111000011110000001100011000100111000100011001110000011100000011100110001000111001000110001100000011110000111111111111111111111111111111111111111000000000000000000000000000",
  "111000011110000001100011001100111000100111000100111000100000001110000001111110001000110111000000011100001111111111111111111111111111111111111111000000000000000000000000000"
];
//结果容器
let codeArr = [];
//canvas大小设置为图片大小
canvas.width = image.width;
canvas.height = image.height;
//canvas插入到页面
document.body.appendChild(canvas);
//将图片绘制到canvas
ctx.drawImage(image, 0, 0);
//切割5个字符
for (let idx = 0; idx < 5; idx++) {
  //getImageData(x,y,width,height)
  //获取特定区域的图片的一维数据 每4个为一个像素点(分别为rgba)
  let pixels = ctx.getImageData(9 * idx + 6, 6, 9, 19).data;
  //当前字符的特征容器
  let currArr = [];
  //i+=4 rgba
  for (let i = 0, length = pixels.length; i < length; i += 4) {
    // 获取当前像素点的二值信息
    currArr.push(
      pixels[i] * 0.3 + pixels[i + 1] * 0.59 + pixels[i + 2] * 0.11 >= 128
        ? "1"
        : "0"
    );
  }
  //遍历已有的特征信息
  //返回每个特征信息的对应索引的匹配度
  //eg 10010111
  //   10101010
  //对应位置相同的个数当前为016三个位置则返回3
  let curr = feature.map(function(val) {
    return currArr.filter(function(v, index) {
      return val[index] === v;
    }).length;
  });
  //获取最大匹配度并把识别的字符保存到容器
  //Math.max.apply(null, curr) 获取curr中最大的数
  codeArr.push(curr.indexOf(Math.max.apply(null, curr)));
}
let code = codeArr.join("");
console.log(code);
//把识别的值写入输入框
document.querySelector("#CheckCode").value = code;
```', '<div class="toc"><ul>
<li><a href="#toc-288">获取特征</a></li>
<li><a href="#toc-314">目标识别</a></li>
<li><a href="#toc-f0f">识别代码</a></li>
</ul>
</div><p><strong>注意</strong>只针对简单验证码（仅仅数字和英文字母，方向不变并且噪点较少）</p>
<h3><a id="toc-288" class="anchor" href="#toc-288"></a>获取特征</h3>
<ul>
<li>通过<code>canvas</code>获取页面图片</li>
<li>切割每一个字符获取元数据(一维数组rgba)</li>
<li>灰度化+二值化获取每个像素点的信息</li>
<li>提取可能出现的所有字符的特征信息<!--more-->
</li>
</ul>
<h3><a id="toc-314" class="anchor" href="#toc-314"></a>目标识别</h3>
<ul>
<li>通过<code>canvas</code>获取页面图片</li>
<li>切割每一个字符获取元数据(一维数组rgba)</li>
<li>灰度化+二值化获取每个像素点的信息</li>
<li>匹配当前的特征信息和已有记录</li>
<li>取最大匹配作为当前的识别结果</li>
</ul>
<h3><a id="toc-f0f" class="anchor" href="#toc-f0f"></a>识别代码</h3>
<pre><code class="hljs lang-javascript"><span class="hljs-comment">//获取目标图片</span>
<span class="hljs-keyword">let</span> image = <span class="hljs-built_in">document</span>.querySelector(<span class="hljs-string">"#form1 img"</span>);
<span class="hljs-comment">//创建canvas</span>
<span class="hljs-keyword">let</span> canvas = <span class="hljs-built_in">document</span>.createElement(<span class="hljs-string">"canvas"</span>);
<span class="hljs-comment">//获取2d上下文</span>
<span class="hljs-keyword">let</span> ctx = canvas.getContext(<span class="hljs-string">"2d"</span>);
<span class="hljs-comment">//获取的特征信息 0-9</span>
<span class="hljs-keyword">let</span> feature = [
  <span class="hljs-string">"111100011110000001110011000100011000110111000000111000000111000000111001000110001000110001100000011110001111111111111111111111111111111111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"111111001111100001111000001100000011100110011111100011111100011111100111111100111111000111111000111011001111111111111111111111111111111111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"111000011110000001100011000100011000111111001111110001111100011111000111110001111100011010000000001000000001111111111111111111110111111111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"111000011110000001110011000111111000111111001111100011111100011111110001111111001001110001000000011100000111111111111111111111111111111111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"111111000111110001111110001111100001111000001110010011100010011000110011000000000000000001111100111111100111111111111111111111111111111111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"100000000110010000110011111100011111100000011100000001100110001111111001000111001000110001100000011110000111111111110111111111111111111111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"111100011110000001110011001100011111100000011100000001100011001100111001100111001100110001100000011110000111111111111111111110111111110111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"100000000100000000111111000111110001111100011111100111111000111111001111110001111110011111110011011100011111111111111111111111111111111111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"111000011110000001100011000100111000100011001110000011100000011100110001000111001000110001100000011110000111111111111111111111111111111111111111000000000000000000000000000"</span>,
  <span class="hljs-string">"111000011110000001100011001100111000100111000100111000100000001110000001111110001000110111000000011100001111111111111111111111111111111111111111000000000000000000000000000"</span>
];
<span class="hljs-comment">//结果容器</span>
<span class="hljs-keyword">let</span> codeArr = [];
<span class="hljs-comment">//canvas大小设置为图片大小</span>
canvas.width = image.width;
canvas.height = image.height;
<span class="hljs-comment">//canvas插入到页面</span>
<span class="hljs-built_in">document</span>.body.appendChild(canvas);
<span class="hljs-comment">//将图片绘制到canvas</span>
ctx.drawImage(image, <span class="hljs-number">0</span>, <span class="hljs-number">0</span>);
<span class="hljs-comment">//切割5个字符</span>
<span class="hljs-keyword">for</span> (<span class="hljs-keyword">let</span> idx = <span class="hljs-number">0</span>; idx &lt; <span class="hljs-number">5</span>; idx++) {
  <span class="hljs-comment">//getImageData(x,y,width,height)</span>
  <span class="hljs-comment">//获取特定区域的图片的一维数据 每4个为一个像素点(分别为rgba)</span>
  <span class="hljs-keyword">let</span> pixels = ctx.getImageData(<span class="hljs-number">9</span> * idx + <span class="hljs-number">6</span>, <span class="hljs-number">6</span>, <span class="hljs-number">9</span>, <span class="hljs-number">19</span>).data;
  <span class="hljs-comment">//当前字符的特征容器</span>
  <span class="hljs-keyword">let</span> currArr = [];
  <span class="hljs-comment">//i+=4 rgba</span>
  <span class="hljs-keyword">for</span> (<span class="hljs-keyword">let</span> i = <span class="hljs-number">0</span>, length = pixels.length; i &lt; length; i += <span class="hljs-number">4</span>) {
    <span class="hljs-comment">// 获取当前像素点的二值信息</span>
    currArr.push(
      pixels[i] * <span class="hljs-number">0.3</span> + pixels[i + <span class="hljs-number">1</span>] * <span class="hljs-number">0.59</span> + pixels[i + <span class="hljs-number">2</span>] * <span class="hljs-number">0.11</span> &gt;= <span class="hljs-number">128</span>
        ? <span class="hljs-string">"1"</span>
        : <span class="hljs-string">"0"</span>
    );
  }
  <span class="hljs-comment">//遍历已有的特征信息</span>
  <span class="hljs-comment">//返回每个特征信息的对应索引的匹配度</span>
  <span class="hljs-comment">//eg 10010111</span>
  <span class="hljs-comment">//   10101010</span>
  <span class="hljs-comment">//对应位置相同的个数当前为016三个位置则返回3</span>
  <span class="hljs-keyword">let</span> curr = feature.map(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">val</span>) </span>{
    <span class="hljs-keyword">return</span> currArr.filter(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">v, index</span>) </span>{
      <span class="hljs-keyword">return</span> val[index] === v;
    }).length;
  });
  <span class="hljs-comment">//获取最大匹配度并把识别的字符保存到容器</span>
  <span class="hljs-comment">//Math.max.apply(null, curr) 获取curr中最大的数</span>
  codeArr.push(curr.indexOf(<span class="hljs-built_in">Math</span>.max.apply(<span class="hljs-literal">null</span>, curr)));
}
<span class="hljs-keyword">let</span> code = codeArr.join(<span class="hljs-string">""</span>);
<span class="hljs-built_in">console</span>.log(code);
<span class="hljs-comment">//把识别的值写入输入框</span>
<span class="hljs-built_in">document</span>.querySelector(<span class="hljs-string">"#CheckCode"</span>).value = code;
</code></pre>', 1, '2018-03-12 17:15:02', '2018-03-12 18:28:31', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('39', '1', '1', 0, 3, 'go-遗传算法-简单实现', 'ga-simple', '<p>ga(genetic algorithm)遗传算法<br>求<code>x+10*sin(5*x)+7*cos(4*x) 在[0,9]</code>的最大值  </p>
', 'ga(genetic algorithm)遗传算法  
求`x+10*sin(5*x)+7*cos(4*x) 在[0,9]`的最大值  
<!--more-->
代码  
core
```
package core

import (
	"math"
	"math/rand"
	"time"
)

// Ga 遗传算法
type Ga struct {
	// 染色体长度
	Length int
	// 种群数量
	Count int
	// 种群
	Population []int
	//retain 适应度
	retain float64
	// 幸运者
	random float64
	// 变异几率
	mutation float64
}

func init() {
	rand.Seed(time.Now().UnixNano()) //利用当前时间的UNIX时间戳初始化rand包
}

// NewGa 初始化
func NewGa(length, count int, retain, random, mutation float64) Ga {
	ga := Ga{
		Length:   length,
		Count:    count,
		retain:   retain,
		random:   random,
		mutation: mutation,
	}
	ga.Population = make([]int, count)
	for i := 0; i < count; i++ {
		tmp := 0
		// 随机生成染色体
		for j := 0; j < length; j++ {
			tmp |= (1 << uint(j)) * rand.Intn(2)
		}
		ga.Population[i] = tmp
	}
	return ga
}

// Evolve 进化
func (ga *Ga) Evolve() {
	// 选择
	ga.Selection()
	// 繁衍
	ga.Crossover()
	// 变异
	ga.Mutation()
}

// Selection 选择
func (ga *Ga) Selection() {
	// 计算适应度
	fit := ga.Fitness()
	// 排序适应度
	for i := 0; i < ga.Count-1; i++ {
		for j := i + 1; j < ga.Count; j++ {
			if fit[i] <= fit[j] {
				fit[i], fit[j] = fit[j], fit[i]
				// 种群与适应度统一
				ga.Population[i], ga.Population[j] = ga.Population[j], ga.Population[i]
			}
		}
	}
	// 选择适应度强的染色体
	flag := int(float64(len(fit)) * ga.retain)
	parents := ga.Population[:flag]
	for _, v := range ga.Population[flag:] {
		if rand.Float64() < ga.random {
			parents = append(parents, v)
		}
	}
	ga.Population = parents
}

// Fitness 计算适应度
func (ga Ga) Fitness() []float64 {
	t := 1 << uint(ga.Length)
	f := make([]float64, 0, ga.Count)
	for idx := 0; idx < ga.Count; idx++ {
		gf := float64(ga.Population[idx]) * 9.0 / float64(t)
		// 计算函数值
		f = append(f, gf+10*math.Sin(5*gf)+7*math.Cos(4*gf))
	}
	return f
}

// Crossover 繁衍
func (ga *Ga) Crossover() {
	pLen := len(ga.Population)
	// 需要的子代数量
	targetCount := ga.Count - pLen
	// 子代种群
	children := make([]int, 0, targetCount)
	for targetCount > 0 {
		male := rand.Intn(pLen)
		female := rand.Intn(pLen)
		if male != female {
			targetCount--
			// 随机交叉点
			crossPos := rand.Intn(ga.Length)
			// 生成掩码
			mask := 0
			for i := 0; i < crossPos; i++ {
				mask |= (1 << uint(i))
			}
			male = ga.Population[male]
			female = ga.Population[female]
			// 孩子获得父亲在交叉点之前的基因，和目前交叉点之后的基因
			child := ((male & mask) | (female &^ mask)) & (1<<uint(ga.Length) - 1)
			children = append(children, child)
		}
	}
	// 经过繁殖后的新种群
	ga.Population = append(ga.Population, children...)
}

// Mutation 变异
func (ga Ga) Mutation() {
	for idx := 0; idx < ga.Count; idx++ {
		if rand.Float64() < ga.mutation {
			r := rand.Intn(ga.Length)
			ga.Population[idx] ^= 1 << (uint(r))
		}
	}
}

// Resutl 结果
func (ga *Ga) Resutl() float64 {
	// 计算适应度
	fit := ga.Fitness()
	// 排序适应度
	for i := 0; i < ga.Count-1; i++ {
		for j := i + 1; j < ga.Count; j++ {
			if fit[i] <= fit[j] {
				fit[i], fit[j] = fit[j], fit[i]
				// 种群与适应度统一
				ga.Population[i], ga.Population[j] = ga.Population[j], ga.Population[i]
			}
		}
	}
	t := 1 << uint(ga.Length)
	return float64(ga.Population[0]) * 9.0 / float64(t)
}

```

main
```
package main

import (
	"fmt"
	"ga/core"
)

func main() {
	ga := core.NewGa(17, 600, 0.2, 0.5, 0.01)
	for i := 0; i < 400; i++ {
		ga.Evolve()
	}
	fmt.Println(ga.Resutl())
}

```', '<div class="toc"></div><p>ga(genetic algorithm)遗传算法<br>求<code>x+10*sin(5*x)+7*cos(4*x) 在[0,9]</code>的最大值<br><!--more-->
代码<br>core</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> core

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"math"</span>
    <span class="hljs-string">"math/rand"</span>
    <span class="hljs-string">"time"</span>
)

<span class="hljs-comment">// Ga 遗传算法</span>
<span class="hljs-keyword">type</span> Ga <span class="hljs-keyword">struct</span> {
    <span class="hljs-comment">// 染色体长度</span>
    Length <span class="hljs-keyword">int</span>
    <span class="hljs-comment">// 种群数量</span>
    Count <span class="hljs-keyword">int</span>
    <span class="hljs-comment">// 种群</span>
    Population []<span class="hljs-keyword">int</span>
    <span class="hljs-comment">//retain 适应度</span>
    retain <span class="hljs-keyword">float64</span>
    <span class="hljs-comment">// 幸运者</span>
    random <span class="hljs-keyword">float64</span>
    <span class="hljs-comment">// 变异几率</span>
    mutation <span class="hljs-keyword">float64</span>
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">init</span><span class="hljs-params">()</span></span> {
    rand.Seed(time.Now().UnixNano()) <span class="hljs-comment">//利用当前时间的UNIX时间戳初始化rand包</span>
}

<span class="hljs-comment">// NewGa 初始化</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">NewGa</span><span class="hljs-params">(length, count <span class="hljs-keyword">int</span>, retain, random, mutation <span class="hljs-keyword">float64</span>)</span> <span class="hljs-title">Ga</span></span> {
    ga := Ga{
        Length:   length,
        Count:    count,
        retain:   retain,
        random:   random,
        mutation: mutation,
    }
    ga.Population = <span class="hljs-built_in">make</span>([]<span class="hljs-keyword">int</span>, count)
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; count; i++ {
        tmp := <span class="hljs-number">0</span>
        <span class="hljs-comment">// 随机生成染色体</span>
        <span class="hljs-keyword">for</span> j := <span class="hljs-number">0</span>; j &lt; length; j++ {
            tmp |= (<span class="hljs-number">1</span> &lt;&lt; <span class="hljs-keyword">uint</span>(j)) * rand.Intn(<span class="hljs-number">2</span>)
        }
        ga.Population[i] = tmp
    }
    <span class="hljs-keyword">return</span> ga
}

<span class="hljs-comment">// Evolve 进化</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(ga *Ga)</span> <span class="hljs-title">Evolve</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">// 选择</span>
    ga.Selection()
    <span class="hljs-comment">// 繁衍</span>
    ga.Crossover()
    <span class="hljs-comment">// 变异</span>
    ga.Mutation()
}

<span class="hljs-comment">// Selection 选择</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(ga *Ga)</span> <span class="hljs-title">Selection</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">// 计算适应度</span>
    fit := ga.Fitness()
    <span class="hljs-comment">// 排序适应度</span>
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; ga.Count<span class="hljs-number">-1</span>; i++ {
        <span class="hljs-keyword">for</span> j := i + <span class="hljs-number">1</span>; j &lt; ga.Count; j++ {
            <span class="hljs-keyword">if</span> fit[i] &lt;= fit[j] {
                fit[i], fit[j] = fit[j], fit[i]
                <span class="hljs-comment">// 种群与适应度统一</span>
                ga.Population[i], ga.Population[j] = ga.Population[j], ga.Population[i]
            }
        }
    }
    <span class="hljs-comment">// 选择适应度强的染色体</span>
    flag := <span class="hljs-keyword">int</span>(<span class="hljs-keyword">float64</span>(<span class="hljs-built_in">len</span>(fit)) * ga.retain)
    parents := ga.Population[:flag]
    <span class="hljs-keyword">for</span> _, v := <span class="hljs-keyword">range</span> ga.Population[flag:] {
        <span class="hljs-keyword">if</span> rand.Float64() &lt; ga.random {
            parents = <span class="hljs-built_in">append</span>(parents, v)
        }
    }
    ga.Population = parents
}

<span class="hljs-comment">// Fitness 计算适应度</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(ga Ga)</span> <span class="hljs-title">Fitness</span><span class="hljs-params">()</span> []<span class="hljs-title">float64</span></span> {
    t := <span class="hljs-number">1</span> &lt;&lt; <span class="hljs-keyword">uint</span>(ga.Length)
    f := <span class="hljs-built_in">make</span>([]<span class="hljs-keyword">float64</span>, <span class="hljs-number">0</span>, ga.Count)
    <span class="hljs-keyword">for</span> idx := <span class="hljs-number">0</span>; idx &lt; ga.Count; idx++ {
        gf := <span class="hljs-keyword">float64</span>(ga.Population[idx]) * <span class="hljs-number">9.0</span> / <span class="hljs-keyword">float64</span>(t)
        <span class="hljs-comment">// 计算函数值</span>
        f = <span class="hljs-built_in">append</span>(f, gf+<span class="hljs-number">10</span>*math.Sin(<span class="hljs-number">5</span>*gf)+<span class="hljs-number">7</span>*math.Cos(<span class="hljs-number">4</span>*gf))
    }
    <span class="hljs-keyword">return</span> f
}

<span class="hljs-comment">// Crossover 繁衍</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(ga *Ga)</span> <span class="hljs-title">Crossover</span><span class="hljs-params">()</span></span> {
    pLen := <span class="hljs-built_in">len</span>(ga.Population)
    <span class="hljs-comment">// 需要的子代数量</span>
    targetCount := ga.Count - pLen
    <span class="hljs-comment">// 子代种群</span>
    children := <span class="hljs-built_in">make</span>([]<span class="hljs-keyword">int</span>, <span class="hljs-number">0</span>, targetCount)
    <span class="hljs-keyword">for</span> targetCount &gt; <span class="hljs-number">0</span> {
        male := rand.Intn(pLen)
        female := rand.Intn(pLen)
        <span class="hljs-keyword">if</span> male != female {
            targetCount--
            <span class="hljs-comment">// 随机交叉点</span>
            crossPos := rand.Intn(ga.Length)
            <span class="hljs-comment">// 生成掩码</span>
            mask := <span class="hljs-number">0</span>
            <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; crossPos; i++ {
                mask |= (<span class="hljs-number">1</span> &lt;&lt; <span class="hljs-keyword">uint</span>(i))
            }
            male = ga.Population[male]
            female = ga.Population[female]
            <span class="hljs-comment">// 孩子获得父亲在交叉点之前的基因，和目前交叉点之后的基因</span>
            child := ((male &amp; mask) | (female &amp;^ mask)) &amp; (<span class="hljs-number">1</span>&lt;&lt;<span class="hljs-keyword">uint</span>(ga.Length) - <span class="hljs-number">1</span>)
            children = <span class="hljs-built_in">append</span>(children, child)
        }
    }
    <span class="hljs-comment">// 经过繁殖后的新种群</span>
    ga.Population = <span class="hljs-built_in">append</span>(ga.Population, children...)
}

<span class="hljs-comment">// Mutation 变异</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(ga Ga)</span> <span class="hljs-title">Mutation</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">for</span> idx := <span class="hljs-number">0</span>; idx &lt; ga.Count; idx++ {
        <span class="hljs-keyword">if</span> rand.Float64() &lt; ga.mutation {
            r := rand.Intn(ga.Length)
            ga.Population[idx] ^= <span class="hljs-number">1</span> &lt;&lt; (<span class="hljs-keyword">uint</span>(r))
        }
    }
}

<span class="hljs-comment">// Resutl 结果</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(ga *Ga)</span> <span class="hljs-title">Resutl</span><span class="hljs-params">()</span> <span class="hljs-title">float64</span></span> {
    <span class="hljs-comment">// 计算适应度</span>
    fit := ga.Fitness()
    <span class="hljs-comment">// 排序适应度</span>
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; ga.Count<span class="hljs-number">-1</span>; i++ {
        <span class="hljs-keyword">for</span> j := i + <span class="hljs-number">1</span>; j &lt; ga.Count; j++ {
            <span class="hljs-keyword">if</span> fit[i] &lt;= fit[j] {
                fit[i], fit[j] = fit[j], fit[i]
                <span class="hljs-comment">// 种群与适应度统一</span>
                ga.Population[i], ga.Population[j] = ga.Population[j], ga.Population[i]
            }
        }
    }
    t := <span class="hljs-number">1</span> &lt;&lt; <span class="hljs-keyword">uint</span>(ga.Length)
    <span class="hljs-keyword">return</span> <span class="hljs-keyword">float64</span>(ga.Population[<span class="hljs-number">0</span>]) * <span class="hljs-number">9.0</span> / <span class="hljs-keyword">float64</span>(t)
}

</code></pre><p>main</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"ga/core"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    ga := core.NewGa(<span class="hljs-number">17</span>, <span class="hljs-number">600</span>, <span class="hljs-number">0.2</span>, <span class="hljs-number">0.5</span>, <span class="hljs-number">0.01</span>)
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">400</span>; i++ {
        ga.Evolve()
    }
    fmt.Println(ga.Resutl())
}

</code></pre>', 1, '2018-03-12 19:16:20', '2018-03-19 13:20:53', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('4', '0', '1', 1, 3, '关于', 'about', '<h3 id="-">曾**</h3>
<ul>
<li><p>毕业于西华师范大学信息与计算科学专业  </p>
</li>
<li><p>家居四川省达州市大竹县</p>
</li>
<li><p>爱好看书<code>&amp;</code>写代码<code>&amp;</code>学习新东西</p>
</li>
</ul>
<h3 id="-">工作|经历</h3>
<ul>
<li><p>2019年：西华师范大学网络中心工作<code>&amp;</code> 西华师范大学数学与信息学院担任动态网站设计课程老师[2016级-信息管理专业]</p>
</li>
<li><p>2018年：西华师范大学网络中心工作<code>&amp;</code> 西华师范大学数学与信息学院担任动态网站设计课程老师[2016级]</p>
</li>
<li><p>2017年：四川省灵图科技有限公司工作<code>&amp;</code> 西华师范大学数学与信息学院担任动态网站设计课程老师[2015级]</p>
</li>
<li><p>2016年：自主创业<code>&amp;</code>西华师范大学数学与信息学院担任网站设计课程老师[2014级]</p>
</li>
<li><p>2015年：四川省逸升教育科技有限责任公司工作 </p>
</li>
<li><p>2013年 - 2015年：学校认真学习</p>
</li>
</ul>
<h3 id="-">项目经验</h3>
<h5 id="-">部分网站可能外网无法访问</h5>
<blockquote>
<p>包括以下，但不是全部  </p>
</blockquote>
<ul>
<li><p><a href="http://www.yinghaihang.net">英华业教育(网课学习系统)</a></p>
</li>
<li><p><a href="http://pgzx.cwnu.edu.cn/">西华师范大学教学督导与评估</a></p>
</li>
<li><p><a href="http://bkpj.xcc.edu.cn/">西昌学院本科教学工作审核评建网</a></p>
</li>
<li><p><a href="http://bkpj.xcc.edu.cn:8080/">西昌学院本科教学工作审核评建支撑材料网</a></p>
</li>
<li><p><a href="http://fl.cwnu.edu.cn/">西华师范大学外国语学院官网</a></p>
</li>
<li><p><a href="http://doc.kc.zxysilent.com/go-web-dev/356028">网站开发教程[go mysql]</a></p>
</li>
<li><p><a href="http://sjc.cwnu.edu.cn/">西华师范大学新闻传播学院官网</a></p>
</li>
<li><p><a href="http://mi.cwnu.edu.cn/">西华师范大学数学与信息学院</a></p>
</li>
<li><p><a href="http://eie.cwnu.edu.cn/">西华师范大学电子信息工程学院官网</a></p>
</li>
<li><p><a href="http://job.cwnu.edu.cn:81/">西华师范大学招生就业处</a></p>
</li>
<li><p><a href="http://pei.cwnu.edu.cn/">西华师范大学物理与空间科学学院官网</a></p>
</li>
<li><p><a href="http://fgmdb.cwnu.edu.cn/">西华师范大学发展规划与目标管理督查办公室</a></p>
</li>
<li><p><a href="http://art.cwnu.edu.cn/">西华师范大学美术学院官网</a></p>
</li>
<li><p><a href="http://doc.kc.zxysilent.com/ja/208236">网站开发教程[nodejs mysql]</a></p>
</li>
<li><p><a href="http://xhxd.lintul.com/">西华师范大学校友管理系统</a></p>
</li>
<li><p><a href="http://acct.scsanti.com/">三体教育会计在线测试/模考系统</a>(已下线)</p>
</li>
<li><p><a href="http://study.scysedu.com/">四川省逸升教育科技有限责任公司在线学习平台</a>(已经更新为新版本)</p>
</li>
<li><p><a href="http://erp.scysedu.com/">四川省逸升教育科技有限责任公司教务管理平台</a>(已经更新为新版本)</p>
</li>
<li><p><a href="http://mng.cwnu.edu.cn">西华师范大学管理学院官网</a> </p>
</li>
</ul>
<h3 id="-">略懂一二</h3>
<p>更新于 201711</p>
<p><img src="/static/upload/20171105/fqh3Mk2VZquY5emNBswEO501.png" alt="alt">
<img src="/static/upload/20171105/vY8akon14vyh0lGBO77lrXFN.png" alt="alt"></p>
<h3 id="-">证书</h3>
<ul>
<li><p>2017年 第三届四川省 “互联网+”大学生创新创业大赛铜奖</p>
</li>
<li><p>2017年（第10届）中国大学生计算机设计大赛·国家二等奖</p>
</li>
<li><p>2016年（第9届）中国大学生计算机设计大赛·国家二等奖</p>
</li>
</ul>
<h3 id="-">联系我？</h3>
<ul>
<li><p>QQ：76387097  </p>
</li>
<li><p>Email： zxysilent#gmail.com (#换成@)</p>
</li>
<li><p>Github：<a href="https://github.com/zxysilent">https://github.com/zxysilent</a></p>
</li>
</ul>
', '### 曾**
- 毕业于西华师范大学信息与计算科学专业  

- 家居四川省达州市大竹县

- 爱好看书`&`写代码`&`学习新东西

### 工作|经历
- 2019年：西华师范大学网络中心工作`&` 西华师范大学数学与信息学院担任动态网站设计课程老师[2016级-信息管理专业]

- 2018年：西华师范大学网络中心工作`&` 西华师范大学数学与信息学院担任动态网站设计课程老师[2016级]

- 2017年：四川省灵图科技有限公司工作`&` 西华师范大学数学与信息学院担任动态网站设计课程老师[2015级]

- 2016年：自主创业`&`西华师范大学数学与信息学院担任网站设计课程老师[2014级]

- 2015年：四川省逸升教育科技有限责任公司工作 

- 2013年 - 2015年：学校认真学习

### 项目经验
##### 部分网站可能外网无法访问
> 包括以下，但不是全部  

- [英华业教育(网课学习系统)](http://www.yinghaihang.net)

- [西华师范大学教学督导与评估](http://pgzx.cwnu.edu.cn/)

- [西昌学院本科教学工作审核评建网](http://bkpj.xcc.edu.cn/)

- [西昌学院本科教学工作审核评建支撑材料网](http://bkpj.xcc.edu.cn:8080/)

- [西华师范大学外国语学院官网](http://fl.cwnu.edu.cn/)

- [网站开发教程[go mysql]](http://doc.kc.zxysilent.com/go-web-dev/356028)

- [西华师范大学新闻传播学院官网](http://sjc.cwnu.edu.cn/)

- [西华师范大学数学与信息学院](http://mi.cwnu.edu.cn/)

- [西华师范大学电子信息工程学院官网](http://eie.cwnu.edu.cn/)

- [西华师范大学招生就业处](http://job.cwnu.edu.cn:81/)

- [西华师范大学物理与空间科学学院官网](http://pei.cwnu.edu.cn/)

- [西华师范大学发展规划与目标管理督查办公室](http://fgmdb.cwnu.edu.cn/)

- [西华师范大学美术学院官网](http://art.cwnu.edu.cn/)

- [网站开发教程[nodejs mysql]](http://doc.kc.zxysilent.com/ja/208236)

- [西华师范大学校友管理系统](http://xhxd.lintul.com/)

- [三体教育会计在线测试/模考系统](http://acct.scsanti.com/)(已下线)

- [四川省逸升教育科技有限责任公司在线学习平台](http://study.scysedu.com/)(已经更新为新版本)

- [四川省逸升教育科技有限责任公司教务管理平台](http://erp.scysedu.com/)(已经更新为新版本)

- [西华师范大学管理学院官网](http://mng.cwnu.edu.cn) 

### 略懂一二
更新于 201711

![alt](/static/upload/20171105/fqh3Mk2VZquY5emNBswEO501.png)
![alt](/static/upload/20171105/vY8akon14vyh0lGBO77lrXFN.png)
### 证书
- 2017年 第三届四川省 “互联网+”大学生创新创业大赛铜奖

- 2017年（第10届）中国大学生计算机设计大赛·国家二等奖

- 2016年（第9届）中国大学生计算机设计大赛·国家二等奖

### 联系我？
- QQ：76387097  

- Email： zxysilent#gmail.com (#换成@)

- Github：https://github.com/zxysilent', '<h3 id="-">曾**</h3>
<ul>
<li><p>毕业于西华师范大学信息与计算科学专业  </p>
</li>
<li><p>家居四川省达州市大竹县</p>
</li>
<li><p>爱好看书<code>&amp;</code>写代码<code>&amp;</code>学习新东西</p>
</li>
</ul>
<h3 id="-">工作|经历</h3>
<ul>
<li><p>2019年：西华师范大学网络中心工作<code>&amp;</code> 西华师范大学数学与信息学院担任动态网站设计课程老师[2016级-信息管理专业]</p>
</li>
<li><p>2018年：西华师范大学网络中心工作<code>&amp;</code> 西华师范大学数学与信息学院担任动态网站设计课程老师[2016级]</p>
</li>
<li><p>2017年：四川省灵图科技有限公司工作<code>&amp;</code> 西华师范大学数学与信息学院担任动态网站设计课程老师[2015级]</p>
</li>
<li><p>2016年：自主创业<code>&amp;</code>西华师范大学数学与信息学院担任网站设计课程老师[2014级]</p>
</li>
<li><p>2015年：四川省逸升教育科技有限责任公司工作 </p>
</li>
<li><p>2013年 - 2015年：学校认真学习</p>
</li>
</ul>
<h3 id="-">项目经验</h3>
<h5 id="-">部分网站可能外网无法访问</h5>
<blockquote>
<p>包括以下，但不是全部  </p>
</blockquote>
<ul>
<li><p><a href="http://www.yinghaihang.net">英华业教育(网课学习系统)</a></p>
</li>
<li><p><a href="http://pgzx.cwnu.edu.cn/">西华师范大学教学督导与评估</a></p>
</li>
<li><p><a href="http://bkpj.xcc.edu.cn/">西昌学院本科教学工作审核评建网</a></p>
</li>
<li><p><a href="http://bkpj.xcc.edu.cn:8080/">西昌学院本科教学工作审核评建支撑材料网</a></p>
</li>
<li><p><a href="http://fl.cwnu.edu.cn/">西华师范大学外国语学院官网</a></p>
</li>
<li><p><a href="http://doc.kc.zxysilent.com/go-web-dev/356028">网站开发教程[go mysql]</a></p>
</li>
<li><p><a href="http://sjc.cwnu.edu.cn/">西华师范大学新闻传播学院官网</a></p>
</li>
<li><p><a href="http://mi.cwnu.edu.cn/">西华师范大学数学与信息学院</a></p>
</li>
<li><p><a href="http://eie.cwnu.edu.cn/">西华师范大学电子信息工程学院官网</a></p>
</li>
<li><p><a href="http://job.cwnu.edu.cn:81/">西华师范大学招生就业处</a></p>
</li>
<li><p><a href="http://pei.cwnu.edu.cn/">西华师范大学物理与空间科学学院官网</a></p>
</li>
<li><p><a href="http://fgmdb.cwnu.edu.cn/">西华师范大学发展规划与目标管理督查办公室</a></p>
</li>
<li><p><a href="http://art.cwnu.edu.cn/">西华师范大学美术学院官网</a></p>
</li>
<li><p><a href="http://doc.kc.zxysilent.com/ja/208236">网站开发教程[nodejs mysql]</a></p>
</li>
<li><p><a href="http://xhxd.lintul.com/">西华师范大学校友管理系统</a></p>
</li>
<li><p><a href="http://acct.scsanti.com/">三体教育会计在线测试/模考系统</a>(已下线)</p>
</li>
<li><p><a href="http://study.scysedu.com/">四川省逸升教育科技有限责任公司在线学习平台</a>(已经更新为新版本)</p>
</li>
<li><p><a href="http://erp.scysedu.com/">四川省逸升教育科技有限责任公司教务管理平台</a>(已经更新为新版本)</p>
</li>
<li><p><a href="http://mng.cwnu.edu.cn">西华师范大学管理学院官网</a> </p>
</li>
</ul>
<h3 id="-">略懂一二</h3>
<p>更新于 201711</p>
<p><img src="/static/upload/20171105/fqh3Mk2VZquY5emNBswEO501.png" alt="alt">
<img src="/static/upload/20171105/vY8akon14vyh0lGBO77lrXFN.png" alt="alt"></p>
<h3 id="-">证书</h3>
<ul>
<li><p>2017年 第三届四川省 “互联网+”大学生创新创业大赛铜奖</p>
</li>
<li><p>2017年（第10届）中国大学生计算机设计大赛·国家二等奖</p>
</li>
<li><p>2016年（第9届）中国大学生计算机设计大赛·国家二等奖</p>
</li>
</ul>
<h3 id="-">联系我？</h3>
<ul>
<li><p>QQ：76387097  </p>
</li>
<li><p>Email： zxysilent#gmail.com (#换成@)</p>
</li>
<li><p>Github：<a href="https://github.com/zxysilent">https://github.com/zxysilent</a></p>
</li>
</ul>
', 1, '2017-04-07 10:31:28', '2019-05-14 18:03:51', 1, 0, '{"template":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('48', '4', '1', 0, 3, 'goweb-01-基础知识', 'goweb-01', '<h2 id="-">网站运作流程</h2>
<p>当我们在浏览器地址栏输入
<a href="http://mi.cwnu.edu.cn">http://mi.cwnu.edu.cn</a>
并回车后到底发生了什么</p>
', '## 网站运作流程

当我们在浏览器地址栏输入
[http://mi.cwnu.edu.cn](http://mi.cwnu.edu.cn)
并回车后到底发生了什么
<!--more-->
### 输入设备
1. 键盘
2. 触屏

### 地址栏
1. 正确地址

2. 非正确地址(搜索)
**url** https://sub.host.com:8080/p/a/t/h?query=string#hash

### DNS(Domain Name System)
1. 浏览器
2. host
3. 路由器/交换机
4. 顶级域名服务器

### IP地址

### 建立连接
1. 3握手
2. 4挥手

### 发送请求(Request)
1. get
2. post 
3. xxx

### 服务器响应(Response)
http 状态码

### 浏览器处理请求
1. 解析(HTML，CSS，JS )
2. 渲染——构建 DOM 树 -> 渲染 -> 布局 -> 绘制

## http协议
> 无状态的,本身并不能支持服务端保存客户端的状态信息

### cookie
1. 如果客户端支持Cookie，Web Server在返回Response的时候，在Response的Header部分，加入一个“set-cookie: jsessionid=XXXX”header属性，把jsessionid放在Cookie里传到客户端。 
2. 客户端会把Cookie存放在本地文件里，下一次访问Web Server的时候，再把Cookie的信息放到HTTP Request的“Cookie”header属性里面，这样jsessionid就随着HTTP Request返回给Web Server。

### session
1. 当一个用户向服务器发送第一个请求时，服务器为其建立一个session，并为此session创建一个标识号；
2. 这个用户随后的所有请求都应包括这个标识号。服务器会校对这个标识号以判断请求属于哪个session。

## http头信息

> HTTP请求头提供了关于请求，响应或者其他的发送实体的信息。  
> HTTP的头信息包括通用头、请求头、响应头和实体头四个部分。每个头域由一个域名，冒号>（:）和域值三部分组成。

1. 通用头标：即可用于请求，也可用于响应，是作为一个整体而不是特定资源与事务相关联。
2. 请求头标：允许客户端传递关于自身的信息和希望的响应形式。
3. 响应头标：服务器和于传递自身信息的响应。
4. 实体头标：定义被传送资源的信息。即可用于请求，也可用于响应。

### Request
常见头信息

| Header | 解释 | 示例 |  
| --- | --- | --- |  
| Accept | 指定客户端能够接收的内容类型 | Accept: text/plain, text/html |  
| Accept-Charset | 浏览器可以接受的字符编码集。 | Accept-Charset: iso-8859-5 |  
| Accept-Encoding | 指定浏览器可以支持的web服务器返回内容压缩编码类型。 | Accept-Encoding: compress, gzip |  
| Accept-Language | 浏览器可接受的语言 | Accept-Language: en,zh |
| Authorization | HTTP授权的授权证书 | Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ== |
| Cache-Control | 指定请求和响应遵循的缓存机制 | Cache-Control: no-cache |
| Connection | 表示是否需要持久连接。（HTTP 1.1默认进行持久连接） | Connection: close |
| Cookie | HTTP请求发送时，会把保存在该请求域名下的所有cookie值一起发送给web服务器。 | Cookie: $Version=1; Skin=new; |
| Content-Length | 请求的内容长度 | Content-Length: 348 |
| Content-Type | 请求的与实体对应的MIME信息 | Content-Type: application/x-www-form-urlencoded |
| Date | 请求发送的日期和时间 | Date: Tue, 15 Nov 2010 08:12:31 GMT |
| Host | 指定请求的服务器的域名和端口号 | Host:blog.zxysilent.com |
| Referer | 先前网页的地址，当前请求网页紧随其后,即来路 | Referer: https://blog.zxysilent.com/ |
| Upgrade | 向服务器指定某种传输协议以便服务器进行转换（如果支持） | Upgrade: HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11 |
| User-Agent | User-Agent的内容包含发出请求的用户信息 | User-Agent: Mozilla/5.0 (Linux; X11) |

### Response
常见头信息

| Header | 解释 | 示例 |
| --- | --- | --- |
| Cache-Control | 告诉所有的缓存机制是否可以缓存及哪种类型 | Cache-Control: no-cache |
| Content-Encoding | web服务器支持的返回内容压缩编码类型。 | Content-Encoding: gzip |
| Content-Language | 响应体的语言 | Content-Language: en,zh |
| Content-Length | 响应体的长度 | Content-Length: 348 |
| Content-Location | 请求资源可替代的备用的另一地址 | Content-Location: /index.htm |
| Content-Type | 返回内容的MIME类型 | Content-Type: text/html; charset=utf-8 |
| Expires | 响应过期的日期和时间 | Expires: Thu, 01 Dec 2010 16:00:00 GMT |
| Location | 用来重定向接收方到非请求URL的位置来完成请求或标识新的资源 | Location: https://blog.zxysilent.com/ |
| Server | web服务器软件名称 | Server: Apache/1.3.27 (Unix) (Red-Hat/Linux) |
| Set-Cookie | 设置Http Cookie | Set-Cookie: UserID=JohnDoe; Max-Age=3600; Version=1 |

### MIME 
> (Multipurpose Internet Mail Extensions) 是描述消息内容类型的因特网标准

一些MIME  

| 扩展名 | 类型/子类型 |
| --- | --- |
| css | text/css |
| doc | application/msword |
| htm | text/html |
| html | text/html |
| jpeg | image/jpeg |
| jpg | image/jpeg |
| js | application/x-javascript |
|json|application/json|
| mp3 | audio/mpeg |
| mp4 | video/mp4 |
| pdf | application/pdf |
| ppt | application/vnd.ms-powerpoint |
| svg | image/svg+xml |
| txt | text/plain |
| xls | application/vnd.ms-excel |
| zip | application/zip |

## http状态码

### 一览众山小
1xx 用于指定客户端应相应的某些动作。 
2xx 用于表示请求成功。 
3xx 用于已经移动的文件并且常被包含在定位头信息中指定新的地址信息。 
4xx 用于指出客户端的错误。 
5xx 用于指出服务器错误。

### 常见状态码
#### 10x
- 101 Switching Protocols
  服务器将遵从客户的请求转换到另外一种协议。

#### 20x
- 200 OK
  一切正常，对GET和POST请求的应答文档跟在后面。

#### 30x 
- 301 Moved Permanently 
  客户请求的文档在其他地方，新的URL在Location头中给出，浏览器应该自动地访问新的URL。
- 302 Found
  类似于301，但新的URL应该被视为临时性的替代，而不是永久性的。
-  304 Not Modified
  客户端有缓冲的文档并发出了一个条件性的请求（一般是提供If-Modified-Since头表示客户只想比指定日期更新的文档）。服务器告诉客户，原来缓存的数据还可以继续使用。

#### 40x
- 400 Bad Request
  请求出现语法错误。
- 401 Unauthorized
  客户试图未经授权访问受密码保护的页面(没有权限)。
- 403 Forbidden
 表示资源不可用。服务器理解客户的请求，但拒绝处理它。
- 404 Not Found
  无法找到指定位置的资源。
- 405 Method Not Allowed
  请求方法（GET、POST、HEAD、Delete、PUT、TRACE等）对指定的资源不适用。

#### 50x
- 500 Internal Server Error
  服务器遇到了意料不到的情况，不能完成客户的请求。
- 501 Not Implemented
  服务器不支持实现请求所需要的功能。例如，客户发出了一个服务器不支持的PUT请求。
- 502 Bad Gateway
  服务器作为网关或者代理时，为了完成请求访问下一个服务器，但该服务器返回了非法的应答。
- 503 Service Unavailable
  服务器由于维护或者负载过重未能应答。
- 504 Gateway Timeout
  由作为代理或网关的服务器使用，表示不能及时地从远程服务器获得应答。
  
  > 101,200,301,302,404,503
  ## 调试？（debug）
![alt](/static/upload/20180712/upload_e011db73f04c1284d6d7dcb552f055b8.png)
 ![alt](/static/upload/20180712/upload_ff66bbedd946cbdd85b30187b7002706.png)
  
  ### Elements
  页面元素
  ### Console
  console.log/xxx()
  ### Network
![alt](/static/upload/20180712/upload_0f1af672169c7821809cafbba200aabe.png)
  ### Application
![alt](/static/upload/20180712/upload_e70aca28a199261bf3e0b879425514dc.png)

## GET/POST
### GET 方法
**注意**，查询字符串（名称/值对）是在 GET 请求的 URL 中发送的：
/p/a/t/h?name1=value1&name2=value2

1. GET 请求可被缓存 
2. GET 请求保留在浏览器历史记录中
3. GET 请求可被收藏为书签
4. GET 请求不应在处理敏感数据时使用
5. GET 请求有长度限制

### POST 方法

**注意**，查询字符串（名称/值对）是在 POST 请求的 HTTP 消息主体中发送的：
name1=value1&name2=value2
1. POST 请求不会被缓存
2. POST 请求不会保留在浏览器历史记录中
3. POST 不能被收藏为书签
4. POST 请求对数据长度没有要求

|   | GET | POST |
| --- | --- |--- |
| 后退按钮/刷新 | 无害 | 数据会被重新提交（浏览器应该告知用户数据会被重新提交）。 |
| 书签 | 可收藏为书签 | 不可收藏为书签 |
| 缓存 | 能被缓存 | 不能缓存 |
| 编码类型 | application/x-www-form-urlencoded | application/x-www-form-urlencoded 或 multipart/form-data。为二进制数据使用多重编码。 |
| 历史 | 参数保留在浏览器历史中。 | 参数不会保存在浏览器历史中。 |
| 对数据长度的限制 | 是的。当发送数据时，GET 方法向 URL 添加数据；URL 的长度是受限制的 | 无限制。 |
| 对数据类型的限制 | 文本（base64-img） | 没有限制。也允许二进制数据。 |
| 安全性 | 与 POST 相比，GET 的安全性较差，因为所发送的数据是 URL 的一部分。在发送密码或其他敏感信息时绝不要使用 GET ！ | POST 比 GET 更安全，因为参数不会被保存在浏览器历史或 web 服务器日志中。 |
| 可见性 | 数据在 URL 中对所有人都是可见的。 | 数据不会显示在 URL 中。 |

## 其他 

| 序号 | 方法 | 描述 |
| --- | --- |--- |
| 1 | GET | 请求指定的页面信息，并返回实体主体。 |
| 2 | HEAD | 类似于get请求，只不过返回的响应中没有具体的内容，用于获取报头 |
| 3 | POST | 向指定资源提交数据进行处理请求（例如提交表单或者上传文件）。数据被包含在请求体中。POST请求可能会导致新的资源的建立和/或已有资源的修改。 |
| 4 | PUT | 从客户端向服务器传送的数据取代指定的文档的内容。 |
| 5 | DELETE | 请求服务器删除指定的页面。 |
| 6 | CONNECT | HTTP/1.1协议中预留给能够将连接改为管道方式的代理服务器。 |
| 7 | OPTIONS | 允许客户端查看服务器的性能。 |
| 8 | TRACE | 回显服务器收到的请求，主要用于测试或诊断。 |
  ## 页面展示？
  ### 传统方式
  - 服务器生成完整的html
  - 验证
  - 传输
  ### web2.0
  Ajax', '<div class="toc"><ul>
<li><a href="#toc-892">网站运作流程</a><ul>
<li><a href="#toc-0a9">输入设备</a></li>
<li><a href="#toc-b76">地址栏</a></li>
<li><a href="#dns-domainnamesystem">DNS(Domain Name System)</a></li>
<li><a href="#toc-d2b">IP地址</a></li>
<li><a href="#toc-224">建立连接</a></li>
<li><a href="#toc-a86">发送请求(Request)</a></li>
<li><a href="#toc-104">服务器响应(Response)</a></li>
<li><a href="#toc-ff2">浏览器处理请求</a></li>
</ul>
</li>
<li><a href="#toc-2ec">http协议</a><ul>
<li><a href="#cookie">cookie</a></li>
<li><a href="#session">session</a></li>
</ul>
</li>
<li><a href="#toc-432">http头信息</a><ul>
<li><a href="#request">Request</a></li>
<li><a href="#response">Response</a></li>
<li><a href="#mime">MIME</a></li>
</ul>
</li>
<li><a href="#toc-540">http状态码</a><ul>
<li><a href="#toc-1ef">一览众山小</a></li>
<li><a href="#toc-9f1">常见状态码</a><ul>
<li><a href="#10x">10x</a></li>
<li><a href="#20x">20x</a></li>
<li><a href="#30x">30x</a></li>
<li><a href="#40x">40x</a></li>
<li><a href="#50x">50x</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#toc-c5f">调试？（debug）</a><ul>
<li><a href="#elements">Elements</a></li>
<li><a href="#console">Console</a></li>
<li><a href="#network">Network</a></li>
<li><a href="#application">Application</a></li>
</ul>
</li>
<li><a href="#toc-ba8">GET/POST</a><ul>
<li><a href="#toc-5cf">GET 方法</a></li>
<li><a href="#toc-ad5">POST 方法</a></li>
</ul>
</li>
<li><a href="#toc-0d9">其他</a></li>
<li><a href="#toc-382">页面展示？</a><ul>
<li><a href="#toc-a22">传统方式</a></li>
<li><a href="#toc-4d2">web2.0</a></li>
</ul>
</li>
</ul>
</div><h2><a id="toc-892" class="anchor" href="#toc-892"></a>网站运作流程</h2>
<p>当我们在浏览器地址栏输入
<a href="http://mi.cwnu.edu.cn">http://mi.cwnu.edu.cn</a>
并回车后到底发生了什么
<!--more--></p>
<h3><a id="toc-0a9" class="anchor" href="#toc-0a9"></a>输入设备</h3>
<ol>
<li>键盘</li>
<li>触屏</li>
</ol>
<h3><a id="toc-b76" class="anchor" href="#toc-b76"></a>地址栏</h3>
<ol>
<li><p>正确地址</p>
</li>
<li><p>非正确地址(搜索)
<strong>url</strong> <a href="https://sub.host.com:8080/p/a/t/h?query=string#hash">https://sub.host.com:8080/p/a/t/h?query=string#hash</a></p>
</li>
</ol>
<h3><a id="dns-domainnamesystem" class="anchor" href="#dns-domainnamesystem"></a>DNS(Domain Name System)</h3>
<ol>
<li>浏览器</li>
<li>host</li>
<li>路由器/交换机</li>
<li>顶级域名服务器</li>
</ol>
<h3><a id="toc-d2b" class="anchor" href="#toc-d2b"></a>IP地址</h3>
<h3><a id="toc-224" class="anchor" href="#toc-224"></a>建立连接</h3>
<ol>
<li>3握手</li>
<li>4挥手</li>
</ol>
<h3><a id="toc-a86" class="anchor" href="#toc-a86"></a>发送请求(Request)</h3>
<ol>
<li>get</li>
<li>post </li>
<li>xxx</li>
</ol>
<h3><a id="toc-104" class="anchor" href="#toc-104"></a>服务器响应(Response)</h3>
<p>http 状态码</p>
<h3><a id="toc-ff2" class="anchor" href="#toc-ff2"></a>浏览器处理请求</h3>
<ol>
<li>解析(HTML，CSS，JS )</li>
<li>渲染——构建 DOM 树 -&gt; 渲染 -&gt; 布局 -&gt; 绘制</li>
</ol>
<h2><a id="toc-2ec" class="anchor" href="#toc-2ec"></a>http协议</h2>
<blockquote>
<p>无状态的,本身并不能支持服务端保存客户端的状态信息</p>
</blockquote>
<h3><a id="cookie" class="anchor" href="#cookie"></a>cookie</h3>
<ol>
<li>如果客户端支持Cookie，Web Server在返回Response的时候，在Response的Header部分，加入一个“set-cookie: jsessionid=XXXX”header属性，把jsessionid放在Cookie里传到客户端。 </li>
<li>客户端会把Cookie存放在本地文件里，下一次访问Web Server的时候，再把Cookie的信息放到HTTP Request的“Cookie”header属性里面，这样jsessionid就随着HTTP Request返回给Web Server。</li>
</ol>
<h3><a id="session" class="anchor" href="#session"></a>session</h3>
<ol>
<li>当一个用户向服务器发送第一个请求时，服务器为其建立一个session，并为此session创建一个标识号；</li>
<li>这个用户随后的所有请求都应包括这个标识号。服务器会校对这个标识号以判断请求属于哪个session。</li>
</ol>
<h2><a id="toc-432" class="anchor" href="#toc-432"></a>http头信息</h2>
<blockquote>
<p>HTTP请求头提供了关于请求，响应或者其他的发送实体的信息。<br>HTTP的头信息包括通用头、请求头、响应头和实体头四个部分。每个头域由一个域名，冒号&gt;（:）和域值三部分组成。</p>
</blockquote>
<ol>
<li>通用头标：即可用于请求，也可用于响应，是作为一个整体而不是特定资源与事务相关联。</li>
<li>请求头标：允许客户端传递关于自身的信息和希望的响应形式。</li>
<li>响应头标：服务器和于传递自身信息的响应。</li>
<li>实体头标：定义被传送资源的信息。即可用于请求，也可用于响应。</li>
</ol>
<h3><a id="request" class="anchor" href="#request"></a>Request</h3>
<p>常见头信息</p>
<table>
<thead>
<tr>
<th>Header</th>
<th>解释</th>
<th>示例</th>
</tr>
</thead>
<tbody>
<tr>
<td>Accept</td>
<td>指定客户端能够接收的内容类型</td>
<td>Accept: text/plain, text/html</td>
</tr>
<tr>
<td>Accept-Charset</td>
<td>浏览器可以接受的字符编码集。</td>
<td>Accept-Charset: iso-8859-5</td>
</tr>
<tr>
<td>Accept-Encoding</td>
<td>指定浏览器可以支持的web服务器返回内容压缩编码类型。</td>
<td>Accept-Encoding: compress, gzip</td>
</tr>
<tr>
<td>Accept-Language</td>
<td>浏览器可接受的语言</td>
<td>Accept-Language: en,zh</td>
</tr>
<tr>
<td>Authorization</td>
<td>HTTP授权的授权证书</td>
<td>Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==</td>
</tr>
<tr>
<td>Cache-Control</td>
<td>指定请求和响应遵循的缓存机制</td>
<td>Cache-Control: no-cache</td>
</tr>
<tr>
<td>Connection</td>
<td>表示是否需要持久连接。（HTTP 1.1默认进行持久连接）</td>
<td>Connection: close</td>
</tr>
<tr>
<td>Cookie</td>
<td>HTTP请求发送时，会把保存在该请求域名下的所有cookie值一起发送给web服务器。</td>
<td>Cookie: $Version=1; Skin=new;</td>
</tr>
<tr>
<td>Content-Length</td>
<td>请求的内容长度</td>
<td>Content-Length: 348</td>
</tr>
<tr>
<td>Content-Type</td>
<td>请求的与实体对应的MIME信息</td>
<td>Content-Type: application/x-www-form-urlencoded</td>
</tr>
<tr>
<td>Date</td>
<td>请求发送的日期和时间</td>
<td>Date: Tue, 15 Nov 2010 08:12:31 GMT</td>
</tr>
<tr>
<td>Host</td>
<td>指定请求的服务器的域名和端口号</td>
<td>Host:blog.zxysilent.com</td>
</tr>
<tr>
<td>Referer</td>
<td>先前网页的地址，当前请求网页紧随其后,即来路</td>
<td>Referer: <a href="https://blog.zxysilent.com/">https://blog.zxysilent.com/</a></td>
</tr>
<tr>
<td>Upgrade</td>
<td>向服务器指定某种传输协议以便服务器进行转换（如果支持）</td>
<td>Upgrade: HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11</td>
</tr>
<tr>
<td>User-Agent</td>
<td>User-Agent的内容包含发出请求的用户信息</td>
<td>User-Agent: Mozilla/5.0 (Linux; X11)</td>
</tr>
</tbody>
</table>
<h3><a id="response" class="anchor" href="#response"></a>Response</h3>
<p>常见头信息</p>
<table>
<thead>
<tr>
<th>Header</th>
<th>解释</th>
<th>示例</th>
</tr>
</thead>
<tbody>
<tr>
<td>Cache-Control</td>
<td>告诉所有的缓存机制是否可以缓存及哪种类型</td>
<td>Cache-Control: no-cache</td>
</tr>
<tr>
<td>Content-Encoding</td>
<td>web服务器支持的返回内容压缩编码类型。</td>
<td>Content-Encoding: gzip</td>
</tr>
<tr>
<td>Content-Language</td>
<td>响应体的语言</td>
<td>Content-Language: en,zh</td>
</tr>
<tr>
<td>Content-Length</td>
<td>响应体的长度</td>
<td>Content-Length: 348</td>
</tr>
<tr>
<td>Content-Location</td>
<td>请求资源可替代的备用的另一地址</td>
<td>Content-Location: /index.htm</td>
</tr>
<tr>
<td>Content-Type</td>
<td>返回内容的MIME类型</td>
<td>Content-Type: text/html; charset=utf-8</td>
</tr>
<tr>
<td>Expires</td>
<td>响应过期的日期和时间</td>
<td>Expires: Thu, 01 Dec 2010 16:00:00 GMT</td>
</tr>
<tr>
<td>Location</td>
<td>用来重定向接收方到非请求URL的位置来完成请求或标识新的资源</td>
<td>Location: <a href="https://blog.zxysilent.com/">https://blog.zxysilent.com/</a></td>
</tr>
<tr>
<td>Server</td>
<td>web服务器软件名称</td>
<td>Server: Apache/1.3.27 (Unix) (Red-Hat/Linux)</td>
</tr>
<tr>
<td>Set-Cookie</td>
<td>设置Http Cookie</td>
<td>Set-Cookie: UserID=JohnDoe; Max-Age=3600; Version=1</td>
</tr>
</tbody>
</table>
<h3><a id="mime" class="anchor" href="#mime"></a>MIME</h3>
<blockquote>
<p>(Multipurpose Internet Mail Extensions) 是描述消息内容类型的因特网标准</p>
</blockquote>
<p>一些MIME  </p>
<table>
<thead>
<tr>
<th>扩展名</th>
<th>类型/子类型</th>
</tr>
</thead>
<tbody>
<tr>
<td>css</td>
<td>text/css</td>
</tr>
<tr>
<td>doc</td>
<td>application/msword</td>
</tr>
<tr>
<td>htm</td>
<td>text/html</td>
</tr>
<tr>
<td>html</td>
<td>text/html</td>
</tr>
<tr>
<td>jpeg</td>
<td>image/jpeg</td>
</tr>
<tr>
<td>jpg</td>
<td>image/jpeg</td>
</tr>
<tr>
<td>js</td>
<td>application/x-javascript</td>
</tr>
<tr>
<td>json</td>
<td>application/json</td>
</tr>
<tr>
<td>mp3</td>
<td>audio/mpeg</td>
</tr>
<tr>
<td>mp4</td>
<td>video/mp4</td>
</tr>
<tr>
<td>pdf</td>
<td>application/pdf</td>
</tr>
<tr>
<td>ppt</td>
<td>application/vnd.ms-powerpoint</td>
</tr>
<tr>
<td>svg</td>
<td>image/svg+xml</td>
</tr>
<tr>
<td>txt</td>
<td>text/plain</td>
</tr>
<tr>
<td>xls</td>
<td>application/vnd.ms-excel</td>
</tr>
<tr>
<td>zip</td>
<td>application/zip</td>
</tr>
</tbody>
</table>
<h2><a id="toc-540" class="anchor" href="#toc-540"></a>http状态码</h2>
<h3><a id="toc-1ef" class="anchor" href="#toc-1ef"></a>一览众山小</h3>
<p>1xx 用于指定客户端应相应的某些动作。 
2xx 用于表示请求成功。 
3xx 用于已经移动的文件并且常被包含在定位头信息中指定新的地址信息。 
4xx 用于指出客户端的错误。 
5xx 用于指出服务器错误。</p>
<h3><a id="toc-9f1" class="anchor" href="#toc-9f1"></a>常见状态码</h3>
<h4><a id="10x" class="anchor" href="#10x"></a>10x</h4>
<ul>
<li>101 Switching Protocols
服务器将遵从客户的请求转换到另外一种协议。</li>
</ul>
<h4><a id="20x" class="anchor" href="#20x"></a>20x</h4>
<ul>
<li>200 OK
一切正常，对GET和POST请求的应答文档跟在后面。</li>
</ul>
<h4><a id="30x" class="anchor" href="#30x"></a>30x</h4>
<ul>
<li>301 Moved Permanently 
客户请求的文档在其他地方，新的URL在Location头中给出，浏览器应该自动地访问新的URL。</li>
<li>302 Found
类似于301，但新的URL应该被视为临时性的替代，而不是永久性的。</li>
<li>304 Not Modified
客户端有缓冲的文档并发出了一个条件性的请求（一般是提供If-Modified-Since头表示客户只想比指定日期更新的文档）。服务器告诉客户，原来缓存的数据还可以继续使用。</li>
</ul>
<h4><a id="40x" class="anchor" href="#40x"></a>40x</h4>
<ul>
<li>400 Bad Request
请求出现语法错误。</li>
<li>401 Unauthorized
客户试图未经授权访问受密码保护的页面(没有权限)。</li>
<li>403 Forbidden
表示资源不可用。服务器理解客户的请求，但拒绝处理它。</li>
<li>404 Not Found
无法找到指定位置的资源。</li>
<li>405 Method Not Allowed
请求方法（GET、POST、HEAD、Delete、PUT、TRACE等）对指定的资源不适用。</li>
</ul>
<h4><a id="50x" class="anchor" href="#50x"></a>50x</h4>
<ul>
<li>500 Internal Server Error
服务器遇到了意料不到的情况，不能完成客户的请求。</li>
<li>501 Not Implemented
服务器不支持实现请求所需要的功能。例如，客户发出了一个服务器不支持的PUT请求。</li>
<li>502 Bad Gateway
服务器作为网关或者代理时，为了完成请求访问下一个服务器，但该服务器返回了非法的应答。</li>
<li>503 Service Unavailable
服务器由于维护或者负载过重未能应答。</li>
<li><p>504 Gateway Timeout
由作为代理或网关的服务器使用，表示不能及时地从远程服务器获得应答。</p>
<blockquote>
<p>101,200,301,302,404,503</p>
</blockquote>
<h2><a id="toc-c5f" class="anchor" href="#toc-c5f"></a>调试？（debug）</h2>
<p><img src="/static/upload/20180712/upload_e011db73f04c1284d6d7dcb552f055b8.png" alt="alt">
<img src="/static/upload/20180712/upload_ff66bbedd946cbdd85b30187b7002706.png" alt="alt"></p>
<h3><a id="elements" class="anchor" href="#elements"></a>Elements</h3>
<p>页面元素</p>
<h3><a id="console" class="anchor" href="#console"></a>Console</h3>
<p>console.log/xxx()</p>
<h3><a id="network" class="anchor" href="#network"></a>Network</h3>
<p><img src="/static/upload/20180712/upload_0f1af672169c7821809cafbba200aabe.png" alt="alt"></p>
<h3><a id="application" class="anchor" href="#application"></a>Application</h3>
<p><img src="/static/upload/20180712/upload_e70aca28a199261bf3e0b879425514dc.png" alt="alt"></p>
</li>
</ul>
<h2><a id="toc-ba8" class="anchor" href="#toc-ba8"></a>GET/POST</h2>
<h3><a id="toc-5cf" class="anchor" href="#toc-5cf"></a>GET 方法</h3>
<p><strong>注意</strong>，查询字符串（名称/值对）是在 GET 请求的 URL 中发送的：
/p/a/t/h?name1=value1&amp;name2=value2</p>
<ol>
<li>GET 请求可被缓存 </li>
<li>GET 请求保留在浏览器历史记录中</li>
<li>GET 请求可被收藏为书签</li>
<li>GET 请求不应在处理敏感数据时使用</li>
<li>GET 请求有长度限制</li>
</ol>
<h3><a id="toc-ad5" class="anchor" href="#toc-ad5"></a>POST 方法</h3>
<p><strong>注意</strong>，查询字符串（名称/值对）是在 POST 请求的 HTTP 消息主体中发送的：
name1=value1&amp;name2=value2</p>
<ol>
<li>POST 请求不会被缓存</li>
<li>POST 请求不会保留在浏览器历史记录中</li>
<li>POST 不能被收藏为书签</li>
<li>POST 请求对数据长度没有要求</li>
</ol>
<table>
<thead>
<tr>
<th></th>
<th>GET</th>
<th>POST</th>
</tr>
</thead>
<tbody>
<tr>
<td>后退按钮/刷新</td>
<td>无害</td>
<td>数据会被重新提交（浏览器应该告知用户数据会被重新提交）。</td>
</tr>
<tr>
<td>书签</td>
<td>可收藏为书签</td>
<td>不可收藏为书签</td>
</tr>
<tr>
<td>缓存</td>
<td>能被缓存</td>
<td>不能缓存</td>
</tr>
<tr>
<td>编码类型</td>
<td>application/x-www-form-urlencoded</td>
<td>application/x-www-form-urlencoded 或 multipart/form-data。为二进制数据使用多重编码。</td>
</tr>
<tr>
<td>历史</td>
<td>参数保留在浏览器历史中。</td>
<td>参数不会保存在浏览器历史中。</td>
</tr>
<tr>
<td>对数据长度的限制</td>
<td>是的。当发送数据时，GET 方法向 URL 添加数据；URL 的长度是受限制的</td>
<td>无限制。</td>
</tr>
<tr>
<td>对数据类型的限制</td>
<td>文本（base64-img）</td>
<td>没有限制。也允许二进制数据。</td>
</tr>
<tr>
<td>安全性</td>
<td>与 POST 相比，GET 的安全性较差，因为所发送的数据是 URL 的一部分。在发送密码或其他敏感信息时绝不要使用 GET ！</td>
<td>POST 比 GET 更安全，因为参数不会被保存在浏览器历史或 web 服务器日志中。</td>
</tr>
<tr>
<td>可见性</td>
<td>数据在 URL 中对所有人都是可见的。</td>
<td>数据不会显示在 URL 中。</td>
</tr>
</tbody>
</table>
<h2><a id="toc-0d9" class="anchor" href="#toc-0d9"></a>其他</h2>
<table>
<thead>
<tr>
<th>序号</th>
<th>方法</th>
<th>描述</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>GET</td>
<td>请求指定的页面信息，并返回实体主体。</td>
</tr>
<tr>
<td>2</td>
<td>HEAD</td>
<td>类似于get请求，只不过返回的响应中没有具体的内容，用于获取报头</td>
</tr>
<tr>
<td>3</td>
<td>POST</td>
<td>向指定资源提交数据进行处理请求（例如提交表单或者上传文件）。数据被包含在请求体中。POST请求可能会导致新的资源的建立和/或已有资源的修改。</td>
</tr>
<tr>
<td>4</td>
<td>PUT</td>
<td>从客户端向服务器传送的数据取代指定的文档的内容。</td>
</tr>
<tr>
<td>5</td>
<td>DELETE</td>
<td>请求服务器删除指定的页面。</td>
</tr>
<tr>
<td>6</td>
<td>CONNECT</td>
<td>HTTP/1.1协议中预留给能够将连接改为管道方式的代理服务器。</td>
</tr>
<tr>
<td>7</td>
<td>OPTIONS</td>
<td>允许客户端查看服务器的性能。</td>
</tr>
<tr>
<td>8</td>
<td>TRACE</td>
<td>回显服务器收到的请求，主要用于测试或诊断。</td>
</tr>
</tbody>
</table>
<h2><a id="toc-382" class="anchor" href="#toc-382"></a>页面展示？</h2>
<h3><a id="toc-a22" class="anchor" href="#toc-a22"></a>传统方式</h3>
<ul>
<li>服务器生成完整的html</li>
<li>验证</li>
<li>传输<h3><a id="toc-4d2" class="anchor" href="#toc-4d2"></a>web2.0</h3>
Ajax</li>
</ul>
', 1, '2018-07-12 11:58:58', '2018-09-07 08:38:47', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('49', '4', '1', 0, 3, 'goweb-02-环境搭建', 'goweb-02', '<h1 id="golang">golang</h1>
<h2 id="-go1-10-3">安装go1.10.3</h2>
<p>图片上的字不重要请忽略</p>
<blockquote>
<p>根据自己电脑的配置 选择版本<br> <a href="https://golang.org/dl/">官方下载地址 墙外 https://golang.org/dl/</a><br><a href="https://golang.google.cn/dl/">镜像下载地址  https://golang.google.cn/dl/</a></p>
</blockquote>
<ol>
<li>点击安装程序  </li>
</ol>
', '# golang
## 安装go1.10.3
图片上的字不重要请忽略

> 根据自己电脑的配置 选择版本  
>  [官方下载地址 墙外 https://golang.org/dl/](https://golang.org/dl/)  
> [镜像下载地址  https://golang.google.cn/dl/](https://golang.google.cn/dl/)

1. 点击安装程序  
<!--more-->
![alt](/static/upload/20180712/upload_68f4d8bf14057375a91fab23dda71607.png)
2. 同意许可协议(Next)  
![alt](/static/upload/20180712/upload_dd857789db7965d17c2c62a971809ea8.png)
3. 修改安装路径(Next)  
![](/static/upload/20180712/screenshot_1500005905680.png)
4. 执行安装程序(Install)  
![](/static/upload/20180712/screenshot_1500005946369.png)
5. 等待安装完成(Ffinish)  
![](/static/upload/20180712/screenshot_1500005979454.png)
6. 测试安装结果( `Win + R => cmd  =>go version`)  
![](/static/upload/20180712/screenshot_1500006072376.png)
7. 配置GOPATH  
* 在电脑上新建一个文件夹如`D:\GoPath`   
* 把自己生成的用户环境变量 `GOPATH`删掉  
![](/static/upload/20180712/screenshot_1500006389713.png)
* 添加系统环境变量(GOPATH)  
![](/static/upload/20180712/screenshot_1500006367060.png)

## 安装IDE
> liteide  
> [liteide下载地址 http://liteide.org/cn/download/](http://liteide.org/cn/download/) 

1. 复制liteide到某个目录如`D:\liteide`  
2. 创建运行程序快捷方式到桌面  
![](/static/upload/20180712/screenshot_1500006685052.png)
3. 桌面打开liteide  
![](/static/upload/20180712/screenshot_1500006725601.png)
4. 新建`helloword`  
* 文件->新建  
![](/static/upload/20180712/screenshot_1500006773264.png)
* 注意选择顺序  
![](/static/upload/20180712/screenshot_1500006817054.png)
* 加载项目  
![](/static/upload/20180712/screenshot_1500006884590.png)
* 点击`BR`运行项目   
![](/static/upload/20180712/screenshot_1500006952260.png)

# Git
> git 版本管理工具，这里我们主要用来管理go的package  
> [git下载地址 https://git-for-windows.github.io/](https://git-for-windows.github.io/)

1. 点击安装程序(Next)  
![](/static/upload/20180712/screenshot_1500017564549.png)
2. 修改安装路径(Next)  
![](/static/upload/20180712/screenshot_1500017600540.png)
3. 差不多一直下一步下一步(Next)请自己选择  
![](/static/upload/20180712/screenshot_1500018406146.png)
![](/static/upload/20180712/screenshot_1500018439247.png)
![](/static/upload/20180712/screenshot_1500018469841.png)
![](/static/upload/20180712/screenshot_1500018480593.png)
4. 选择 `Use Windows default console window`  
![](/static/upload/20180712/screenshot_1500018493188.png)
5. 执行安装(Install)  
![](/static/upload/20180712/screenshot_1500018506952.png)
6. 安装完成(Finish)   
![](/static/upload/20180712/screenshot_1500018600346.png)

## 命令
 `go` 安装第三方包的命令 依赖于 `git`版本控制
![alt](/static/upload/20180806/upload_2f400e2fcf4ca3f7a4dad7481f37597f.png)

常用命令
 - build       compile packages and dependencies
 - get         download and install packages and dependencies
 - install     compile and install packages and dependencies
 - run         compile and run Go program
 - version     print Go version
主要使用 `ide`
eg 
`go get github.com/go-sql-driver/mysql`
`go get github.com/jmoiron/sqlx`

# 数据库
## MySql(MariaDB)  
> MariaDB 和MySql属于不同的分支，这个安装方便很多  
> [MariaDB下载地址 https://downloads.mariadb.org/](https://downloads.mariadb.org/) 

1. 点击安装程序(Next)  
![](/static/upload/20180712/screenshot_1500019795618.png)
2. 同意许可协议(Next)  
![](/static/upload/20180712/screenshot_1500019844633.png)
3. 修改安装路径(Browse -> Next)  
![](/static/upload/20180712/screenshot_1500019936732.png)  
![](/static/upload/20180712/screenshot_1500019913628.png)  
![](/static/upload/20180712/screenshot_1500019952707.png)  
4. 设置密码和字符打勾(Next)  
![](/static/upload/20180712/screenshot_1500020048497.png)
5. 设置Service名称和其他信息,一般不用修改(Next)  
![](/static/upload/20180712/screenshot_1500020105350.png)
6. 看需要打勾,一般不用(Next)  
![](/static/upload/20180712/screenshot_1500020158392.png)
7. 等待安装并完成(Finish) 
![](/static/upload/20180712/screenshot_1500020248798.png)
8. 添加到环境变量
![alt](https://blog.zxysilent.com/static/upload/20190314/upload_8580d0d9e7336c4b46fa223d6c60a189.png)
9. 验证安装成功( `Win + R => cmd  =>mysql -V`)显示版本号就成功了   
![](/static/upload/20180712/screenshot_1500020325738.png)

## Navicat Mysql
> Mysql可视化管理工具

1. 点击安装程序(Next)  
![](/static/upload/20180712/screenshot_1500020376988.png)
2. 同意许可协议(Next)  
![](/static/upload/20180712/screenshot_1500020412826.png)
3. 修改安装路径(Next)  
![](/static/upload/20180712/screenshot_1500020436858.png)
4. 一直下一步(Next)  
![](/static/upload/20180712/screenshot_1500020513423.png)  
![](/static/upload/20180712/screenshot_1500020530949.png)
5. 执行安装程序(安装)  
![](/static/upload/20180712/screenshot_1500020562387.png)
6. 安装完成(完成)  
![](/static/upload/20180712/screenshot_1500020587281.png)
7. 激活破解  
* 破解程序  
![](/static/upload/20180712/screenshot_1500020623591.png)
* 找到`Navicat`并选择打开  
![](/static/upload/20180712/screenshot_1500020660802.png)
* 破解成功  
![](/static/upload/20180712/screenshot_1500020694784.png)
8. 运行`Navicat`并选择创建`MariaDB`连接  
![](/static/upload/20180712/screenshot_1500020794969.png)
9. 填写链接信息并测试连接  
![](/static/upload/20180712/screenshot_1500020830884.png)  
![](/static/upload/20180712/screenshot_1500020846172.png)  
10. 点击**连接名**可连接数据库进行操作   
![](/static/upload/20180712/screenshot_1500020938945.png) ', '<div class="toc"><ul>
<li><a href="#golang">golang</a><ul>
<li><a href="#toc-cc7">安装go1.10.3</a></li>
<li><a href="#toc-d1b">安装IDE</a></li>
</ul>
</li>
<li><a href="#git">Git</a><ul>
<li><a href="#toc-ddf">命令</a></li>
</ul>
</li>
<li><a href="#toc-680">数据库</a><ul>
<li><a href="#mysql-mariadb">MySql(MariaDB)</a></li>
<li><a href="#navicatmysql">Navicat Mysql</a></li>
</ul>
</li>
</ul>
</div><h1><a id="golang" class="anchor" href="#golang"></a>golang</h1>
<h2><a id="toc-cc7" class="anchor" href="#toc-cc7"></a>安装go1.10.3</h2>
<p>图片上的字不重要请忽略</p>
<blockquote>
<p>根据自己电脑的配置 选择版本<br> <a href="https://golang.org/dl/">官方下载地址 墙外 https://golang.org/dl/</a><br><a href="https://golang.google.cn/dl/">镜像下载地址  https://golang.google.cn/dl/</a></p>
</blockquote>
<ol>
<li>点击安装程序  <!--more-->
<img src="/static/upload/20180712/upload_68f4d8bf14057375a91fab23dda71607.png" alt="alt"></li>
<li>同意许可协议(Next)<br><img src="/static/upload/20180712/upload_dd857789db7965d17c2c62a971809ea8.png" alt="alt"></li>
<li>修改安装路径(Next)<br><img src="/static/upload/20180712/screenshot_1500005905680.png" alt=""></li>
<li>执行安装程序(Install)<br><img src="/static/upload/20180712/screenshot_1500005946369.png" alt=""></li>
<li>等待安装完成(Ffinish)<br><img src="/static/upload/20180712/screenshot_1500005979454.png" alt=""></li>
<li>测试安装结果( <code>Win + R =&gt; cmd  =&gt;go version</code>)<br><img src="/static/upload/20180712/screenshot_1500006072376.png" alt=""></li>
<li>配置GOPATH  </li>
<li>在电脑上新建一个文件夹如<code>D:\GoPath</code>   </li>
<li>把自己生成的用户环境变量 <code>GOPATH</code>删掉<br><img src="/static/upload/20180712/screenshot_1500006389713.png" alt=""></li>
<li>添加系统环境变量(GOPATH)<br><img src="/static/upload/20180712/screenshot_1500006367060.png" alt=""></li>
</ol>
<h2><a id="toc-d1b" class="anchor" href="#toc-d1b"></a>安装IDE</h2>
<blockquote>
<p>liteide<br><a href="http://liteide.org/cn/download/">liteide下载地址 http://liteide.org/cn/download/</a> </p>
</blockquote>
<ol>
<li>复制liteide到某个目录如<code>D:\liteide</code>  </li>
<li>创建运行程序快捷方式到桌面<br><img src="/static/upload/20180712/screenshot_1500006685052.png" alt=""></li>
<li>桌面打开liteide<br><img src="/static/upload/20180712/screenshot_1500006725601.png" alt=""></li>
<li>新建<code>helloword</code>  </li>
<li>文件-&gt;新建<br><img src="/static/upload/20180712/screenshot_1500006773264.png" alt=""></li>
<li>注意选择顺序<br><img src="/static/upload/20180712/screenshot_1500006817054.png" alt=""></li>
<li>加载项目<br><img src="/static/upload/20180712/screenshot_1500006884590.png" alt=""></li>
<li>点击<code>BR</code>运行项目<br><img src="/static/upload/20180712/screenshot_1500006952260.png" alt=""></li>
</ol>
<h1><a id="git" class="anchor" href="#git"></a>Git</h1>
<blockquote>
<p>git 版本管理工具，这里我们主要用来管理go的package<br><a href="https://git-for-windows.github.io/">git下载地址 https://git-for-windows.github.io/</a></p>
</blockquote>
<ol>
<li>点击安装程序(Next)<br><img src="/static/upload/20180712/screenshot_1500017564549.png" alt=""></li>
<li>修改安装路径(Next)<br><img src="/static/upload/20180712/screenshot_1500017600540.png" alt=""></li>
<li>差不多一直下一步下一步(Next)请自己选择<br><img src="/static/upload/20180712/screenshot_1500018406146.png" alt="">
<img src="/static/upload/20180712/screenshot_1500018439247.png" alt="">
<img src="/static/upload/20180712/screenshot_1500018469841.png" alt="">
<img src="/static/upload/20180712/screenshot_1500018480593.png" alt=""></li>
<li>选择 <code>Use Windows default console window</code><br><img src="/static/upload/20180712/screenshot_1500018493188.png" alt=""></li>
<li>执行安装(Install)<br><img src="/static/upload/20180712/screenshot_1500018506952.png" alt=""></li>
<li>安装完成(Finish)<br><img src="/static/upload/20180712/screenshot_1500018600346.png" alt=""></li>
</ol>
<h2><a id="toc-ddf" class="anchor" href="#toc-ddf"></a>命令</h2>
<p> <code>go</code> 安装第三方包的命令 依赖于 <code>git</code>版本控制
<img src="/static/upload/20180806/upload_2f400e2fcf4ca3f7a4dad7481f37597f.png" alt="alt"></p>
<p>常用命令</p>
<ul>
<li>build       compile packages and dependencies</li>
<li>get         download and install packages and dependencies</li>
<li>install     compile and install packages and dependencies</li>
<li>run         compile and run Go program</li>
<li>version     print Go version
主要使用 <code>ide</code>
eg 
<code>go get github.com/go-sql-driver/mysql</code>
<code>go get github.com/jmoiron/sqlx</code></li>
</ul>
<h1><a id="toc-680" class="anchor" href="#toc-680"></a>数据库</h1>
<h2><a id="mysql-mariadb" class="anchor" href="#mysql-mariadb"></a>MySql(MariaDB)</h2>
<blockquote>
<p>MariaDB 和MySql属于不同的分支，这个安装方便很多<br><a href="https://downloads.mariadb.org/">MariaDB下载地址 https://downloads.mariadb.org/</a> </p>
</blockquote>
<ol>
<li>点击安装程序(Next)<br><img src="/static/upload/20180712/screenshot_1500019795618.png" alt=""></li>
<li>同意许可协议(Next)<br><img src="/static/upload/20180712/screenshot_1500019844633.png" alt=""></li>
<li>修改安装路径(Browse -&gt; Next)<br><img src="/static/upload/20180712/screenshot_1500019936732.png" alt=""><br><img src="/static/upload/20180712/screenshot_1500019913628.png" alt=""><br><img src="/static/upload/20180712/screenshot_1500019952707.png" alt="">  </li>
<li>设置密码和字符打勾(Next)<br><img src="/static/upload/20180712/screenshot_1500020048497.png" alt=""></li>
<li>设置Service名称和其他信息,一般不用修改(Next)<br><img src="/static/upload/20180712/screenshot_1500020105350.png" alt=""></li>
<li>看需要打勾,一般不用(Next)<br><img src="/static/upload/20180712/screenshot_1500020158392.png" alt=""></li>
<li>等待安装并完成(Finish) 
<img src="/static/upload/20180712/screenshot_1500020248798.png" alt=""></li>
<li>添加到环境变量
<img src="https://blog.zxysilent.com/static/upload/20190314/upload_8580d0d9e7336c4b46fa223d6c60a189.png" alt="alt"></li>
<li>验证安装成功( <code>Win + R =&gt; cmd  =&gt;mysql -V</code>)显示版本号就成功了<br><img src="/static/upload/20180712/screenshot_1500020325738.png" alt=""></li>
</ol>
<h2><a id="navicatmysql" class="anchor" href="#navicatmysql"></a>Navicat Mysql</h2>
<blockquote>
<p>Mysql可视化管理工具</p>
</blockquote>
<ol>
<li>点击安装程序(Next)<br><img src="/static/upload/20180712/screenshot_1500020376988.png" alt=""></li>
<li>同意许可协议(Next)<br><img src="/static/upload/20180712/screenshot_1500020412826.png" alt=""></li>
<li>修改安装路径(Next)<br><img src="/static/upload/20180712/screenshot_1500020436858.png" alt=""></li>
<li>一直下一步(Next)<br><img src="/static/upload/20180712/screenshot_1500020513423.png" alt=""><br><img src="/static/upload/20180712/screenshot_1500020530949.png" alt=""></li>
<li>执行安装程序(安装)<br><img src="/static/upload/20180712/screenshot_1500020562387.png" alt=""></li>
<li>安装完成(完成)<br><img src="/static/upload/20180712/screenshot_1500020587281.png" alt=""></li>
<li>激活破解  </li>
<li>破解程序<br><img src="/static/upload/20180712/screenshot_1500020623591.png" alt=""></li>
<li>找到<code>Navicat</code>并选择打开<br><img src="/static/upload/20180712/screenshot_1500020660802.png" alt=""></li>
<li>破解成功<br><img src="/static/upload/20180712/screenshot_1500020694784.png" alt=""></li>
<li>运行<code>Navicat</code>并选择创建<code>MariaDB</code>连接<br><img src="/static/upload/20180712/screenshot_1500020794969.png" alt=""></li>
<li>填写链接信息并测试连接<br><img src="/static/upload/20180712/screenshot_1500020830884.png" alt=""><br><img src="/static/upload/20180712/screenshot_1500020846172.png" alt="">  </li>
<li>点击<strong>连接名</strong>可连接数据库进行操作<br><img src="/static/upload/20180712/screenshot_1500020938945.png" alt=""> </li>
</ol>
', 1, '2018-07-12 12:00:20', '2019-03-14 09:11:42', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('40', '3', '1', 0, 0, 'java 环境变量', 'java-env', '<p>新建2个环境变量 JAVA_HOME与 CLASS_PATH，点击“新建(W...)”。</p>
<p>变量名： JAVA_HOME</p>
<p>变量值：D:\Program Files\Java\jdk1.7.0_06(java安装路径)</p>
<p>变量名： CLASS_PATH</p>
<p>变量值：.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar</p>
<p>[注意前面有一个点号，表示当前路径]</p>
<p>修改 PATH环境变量，选择“Path”，在变量值的最后处添加：</p>
<p>;%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin[注意前面要添加分号]</p>
<p>之后直接点击“确定”、“应用”等按钮，再按照上面的步骤键入Windows+R输入“cmd”进入控制台，现在无论输入“java”、“javac”、“Java -version”等命令均会成功显示。</p>
', '新建2个环境变量 JAVA_HOME与 CLASS_PATH，点击“新建(W...)”。

变量名： JAVA_HOME

变量值：D:\Program Files\Java\jdk1.7.0_06(java安装路径)

变量名： CLASS_PATH

变量值：.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar

[注意前面有一个点号，表示当前路径]

修改 PATH环境变量，选择“Path”，在变量值的最后处添加：

;%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin[注意前面要添加分号]

之后直接点击“确定”、“应用”等按钮，再按照上面的步骤键入Windows+R输入“cmd”进入控制台，现在无论输入“java”、“javac”、“Java -version”等命令均会成功显示。
', '<div class="toc"></div><p>新建2个环境变量 JAVA_HOME与 CLASS_PATH，点击“新建(W...)”。</p>
<p>变量名： JAVA_HOME</p>
<p>变量值：D:\Program Files\Java\jdk1.7.0_06(java安装路径)</p>
<p>变量名： CLASS_PATH</p>
<p>变量值：.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar</p>
<p>[注意前面有一个点号，表示当前路径]</p>
<p>修改 PATH环境变量，选择“Path”，在变量值的最后处添加：</p>
<p>;%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin[注意前面要添加分号]</p>
<p>之后直接点击“确定”、“应用”等按钮，再按照上面的步骤键入Windows+R输入“cmd”进入控制台，现在无论输入“java”、“javac”、“Java -version”等命令均会成功显示。</p>
', 1, '2018-03-13 12:25:09', '2018-03-13 12:25:13', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('41', '3', '1', 0, 3, '机器学习实战笔记', 'ml-in-action', '<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np

<span class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">Network</span><span class="hljs-params">(object)</span>:</span>

    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">__init__</span><span class="hljs-params">(self, sizes)</span>:</span>
        <span class="hljs-comment"># 层数</span>
        self.num_layers = len(sizes)
        <span class="hljs-comment"># 各层神经元的数量 eg:[2,3,1]</span>
        self.sizes = sizes
        <span class="hljs-comment"># 偏置 eg:3x1,1</span>
        self.biases = [np.random.randn(y, <span class="hljs-number">1</span>) <span class="hljs-keyword">for</span> y <span class="hljs-keyword">in</span> sizes[<span class="hljs-number">1</span>:]]
        <span class="hljs-comment"># 权重 eg:3x2,1x3</span>
        self.weights = [np.random.randn(y, x)
                        <span class="hljs-keyword">for</span> x, y <span class="hljs-keyword">in</span> zip(sizes[:<span class="hljs-number">-1</span>], sizes[<span class="hljs-number">1</span>:])]

    <span class="hljs-comment"># 对应输入求输出</span>
    <span class="hljs-comment"># a`=σ(w·a+b)</span>
    <span class="hljs-comment"># σ S型激活函数</span>
    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">feedforward</span><span class="hljs-params">(self, a)</span>:</span>
        <span class="hljs-keyword">for</span> b, w <span class="hljs-keyword">in</span> zip(self.biases, self.weights):
            a = sigmoid(np.dot(w, a)+b)
        <span class="hljs-keyword">return</span> a

    <span class="hljs-comment"># 梯度下降-小批量数据</span>
    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">SGD</span><span class="hljs-params">(self, training_data, epochs, mini_batch_size, eta,
            test_data=None)</span>:</span>
        <span class="hljs-comment"># training_data 是一个(x,y)元组列表，训练输入和对应的期望输出</span>
        <span class="hljs-comment"># epochs 迭代期数量</span>
        <span class="hljs-comment"># mini_batch_size 采样时的小批量数据的大小</span>
        <span class="hljs-comment"># eta学习速率 η </span>
        <span class="hljs-comment"># test_data 如果可选参数可用则每次训练后会评估网络</span>
        training_data = list(training_data)
        n = len(training_data)

        <span class="hljs-keyword">if</span> test_data:
            test_data = list(test_data)
            n_test = len(test_data)

        <span class="hljs-keyword">for</span> j <span class="hljs-keyword">in</span> range(epochs):
            <span class="hljs-comment"># 随机打乱数据</span>
            random.shuffle(training_data)
            <span class="hljs-comment"># 数据分为小块</span>
            mini_batches = [
                training_data[k:k+mini_batch_size]
                <span class="hljs-keyword">for</span> k <span class="hljs-keyword">in</span> range(<span class="hljs-number">0</span>, n, mini_batch_size)]
            <span class="hljs-comment"># 训练小块数据</span>
            <span class="hljs-keyword">for</span> mini_batch <span class="hljs-keyword">in</span> mini_batches:
                self.update_mini_batch(mini_batch, eta)
            <span class="hljs-comment"># 输出验证</span>
            <span class="hljs-keyword">if</span> test_data:
                print(<span class="hljs-string">"Epoch {} : {} / {}"</span>.format(j,self.evaluate(test_data),n_test));
                print(self.biases[<span class="hljs-number">1</span>])
            <span class="hljs-keyword">else</span>:
                print(<span class="hljs-string">"Epoch {} complete"</span>.format(j))
    <span class="hljs-comment"># 更新权值和偏置</span>
    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">update_mini_batch</span><span class="hljs-params">(self, mini_batch, eta)</span>:</span>
        <span class="hljs-string">"""Update the network''s weights and biases by applying
        gradient descent using backpropagation to a single mini batch.
        The ``mini_batch`` is a list of tuples ``(x, y)``, and ``eta``
        is the learning rate."""</span>
        nabla_b = [np.zeros(b.shape) <span class="hljs-keyword">for</span> b <span class="hljs-keyword">in</span> self.biases]
        nabla_w = [np.zeros(w.shape) <span class="hljs-keyword">for</span> w <span class="hljs-keyword">in</span> self.weights]
        <span class="hljs-keyword">for</span> x, y <span class="hljs-keyword">in</span> mini_batch:
            delta_nabla_b, delta_nabla_w = self.backprop(x, y)
            nabla_b = [nb+dnb <span class="hljs-keyword">for</span> nb, dnb <span class="hljs-keyword">in</span> zip(nabla_b, delta_nabla_b)]
            nabla_w = [nw+dnw <span class="hljs-keyword">for</span> nw, dnw <span class="hljs-keyword">in</span> zip(nabla_w, delta_nabla_w)]
        self.weights = [w-(eta/len(mini_batch))*nw
                        <span class="hljs-keyword">for</span> w, nw <span class="hljs-keyword">in</span> zip(self.weights, nabla_w)]
        self.biases = [b-(eta/len(mini_batch))*nb
                       <span class="hljs-keyword">for</span> b, nb <span class="hljs-keyword">in</span> zip(self.biases, nabla_b)]
    <span class="hljs-comment"># 计算偏导数</span>
    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">backprop</span><span class="hljs-params">(self, x, y)</span>:</span>
        <span class="hljs-string">"""Return a tuple ``(nabla_b, nabla_w)`` representing the
        gradient for the cost function C_x.  ``nabla_b`` and
        ``nabla_w`` are layer-by-layer lists of numpy arrays, similar
        to ``self.biases`` and ``self.weights``."""</span>
        nabla_b = [np.zeros(b.shape) <span class="hljs-keyword">for</span> b <span class="hljs-keyword">in</span> self.biases]
        nabla_w = [np.zeros(w.shape) <span class="hljs-keyword">for</span> w <span class="hljs-keyword">in</span> self.weights]
        <span class="hljs-comment"># feedforward</span>
        activation = x
        activations = [x] <span class="hljs-comment"># list to store all the activations, layer by layer</span>
        zs = [] <span class="hljs-comment"># list to store all the z vectors, layer by layer</span>
        <span class="hljs-keyword">for</span> b, w <span class="hljs-keyword">in</span> zip(self.biases, self.weights):
            z = np.dot(w, activation)+b
            zs.append(z)
            activation = sigmoid(z)
            activations.append(activation)
        <span class="hljs-comment"># backward pass</span>
        delta = self.cost_derivative(activations[<span class="hljs-number">-1</span>], y) * \
            sigmoid_prime(zs[<span class="hljs-number">-1</span>])
        nabla_b[<span class="hljs-number">-1</span>] = delta
        nabla_w[<span class="hljs-number">-1</span>] = np.dot(delta, activations[<span class="hljs-number">-2</span>].transpose())
        <span class="hljs-comment"># Note that the variable l in the loop below is used a little</span>
        <span class="hljs-comment"># differently to the notation in Chapter 2 of the book.  Here,</span>
        <span class="hljs-comment"># l = 1 means the last layer of neurons, l = 2 is the</span>
        <span class="hljs-comment"># second-last layer, and so on.  It''s a renumbering of the</span>
        <span class="hljs-comment"># scheme in the book, used here to take advantage of the fact</span>
        <span class="hljs-comment"># that Python can use negative indices in lists.</span>
        <span class="hljs-keyword">for</span> l <span class="hljs-keyword">in</span> range(<span class="hljs-number">2</span>, self.num_layers):
            z = zs[-l]
            sp = sigmoid_prime(z)
            delta = np.dot(self.weights[-l+<span class="hljs-number">1</span>].transpose(), delta) * sp
            nabla_b[-l] = delta
            nabla_w[-l] = np.dot(delta, activations[-l<span class="hljs-number">-1</span>].transpose())
        <span class="hljs-keyword">return</span> (nabla_b, nabla_w)

    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">evaluate</span><span class="hljs-params">(self, test_data)</span>:</span>
        <span class="hljs-string">"""Return the number of test inputs for which the neural
        network outputs the correct result. Note that the neural
        network''s output is assumed to be the index of whichever
        neuron in the final layer has the highest activation."""</span>
        test_results = [(np.argmax(self.feedforward(x)), y)
                        <span class="hljs-keyword">for</span> (x, y) <span class="hljs-keyword">in</span> test_data]
        <span class="hljs-keyword">return</span> sum(int(x == y) <span class="hljs-keyword">for</span> (x, y) <span class="hljs-keyword">in</span> test_results)

    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">cost_derivative</span><span class="hljs-params">(self, output_activations, y)</span>:</span>
        <span class="hljs-string">"""Return the vector of partial derivatives \partial C_x /
        \partial a for the output activations."""</span>
        <span class="hljs-keyword">return</span> (output_activations-y)

<span class="hljs-comment"># S型函数 1/(1+e^-z)</span>
<span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">sigmoid</span><span class="hljs-params">(z)</span>:</span>
    <span class="hljs-keyword">return</span> <span class="hljs-number">1.0</span>/(<span class="hljs-number">1.0</span>+np.exp(-z))
<span class="hljs-comment"># S型函数导数 e^-z/(1+e^-z)^2</span>
<span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">sigmoid_prime</span><span class="hljs-params">(z)</span>:</span>
    <span class="hljs-keyword">return</span> sigmoid(z)*(<span class="hljs-number">1</span>-sigmoid(z))


</code></pre>', '
```
import numpy as np

class Network(object):

    def __init__(self, sizes):
        # 层数
        self.num_layers = len(sizes)
        # 各层神经元的数量 eg:[2,3,1]
        self.sizes = sizes
        # 偏置 eg:3x1,1
        self.biases = [np.random.randn(y, 1) for y in sizes[1:]]
        # 权重 eg:3x2,1x3
        self.weights = [np.random.randn(y, x)
                        for x, y in zip(sizes[:-1], sizes[1:])]

    # 对应输入求输出
    # a`=σ(w·a+b)
    # σ S型激活函数
    def feedforward(self, a):
        for b, w in zip(self.biases, self.weights):
            a = sigmoid(np.dot(w, a)+b)
        return a

    # 梯度下降-小批量数据
    def SGD(self, training_data, epochs, mini_batch_size, eta,
            test_data=None):
        # training_data 是一个(x,y)元组列表，训练输入和对应的期望输出
        # epochs 迭代期数量
        # mini_batch_size 采样时的小批量数据的大小
        # eta学习速率 η 
        # test_data 如果可选参数可用则每次训练后会评估网络
        training_data = list(training_data)
        n = len(training_data)

        if test_data:
            test_data = list(test_data)
            n_test = len(test_data)

        for j in range(epochs):
            # 随机打乱数据
            random.shuffle(training_data)
            # 数据分为小块
            mini_batches = [
                training_data[k:k+mini_batch_size]
                for k in range(0, n, mini_batch_size)]
            # 训练小块数据
            for mini_batch in mini_batches:
                self.update_mini_batch(mini_batch, eta)
            # 输出验证
            if test_data:
                print("Epoch {} : {} / {}".format(j,self.evaluate(test_data),n_test));
                print(self.biases[1])
            else:
                print("Epoch {} complete".format(j))
    # 更新权值和偏置
    def update_mini_batch(self, mini_batch, eta):
        """Update the network''s weights and biases by applying
        gradient descent using backpropagation to a single mini batch.
        The ``mini_batch`` is a list of tuples ``(x, y)``, and ``eta``
        is the learning rate."""
        nabla_b = [np.zeros(b.shape) for b in self.biases]
        nabla_w = [np.zeros(w.shape) for w in self.weights]
        for x, y in mini_batch:
            delta_nabla_b, delta_nabla_w = self.backprop(x, y)
            nabla_b = [nb+dnb for nb, dnb in zip(nabla_b, delta_nabla_b)]
            nabla_w = [nw+dnw for nw, dnw in zip(nabla_w, delta_nabla_w)]
        self.weights = [w-(eta/len(mini_batch))*nw
                        for w, nw in zip(self.weights, nabla_w)]
        self.biases = [b-(eta/len(mini_batch))*nb
                       for b, nb in zip(self.biases, nabla_b)]
    # 计算偏导数
    def backprop(self, x, y):
        """Return a tuple ``(nabla_b, nabla_w)`` representing the
        gradient for the cost function C_x.  ``nabla_b`` and
        ``nabla_w`` are layer-by-layer lists of numpy arrays, similar
        to ``self.biases`` and ``self.weights``."""
        nabla_b = [np.zeros(b.shape) for b in self.biases]
        nabla_w = [np.zeros(w.shape) for w in self.weights]
        # feedforward
        activation = x
        activations = [x] # list to store all the activations, layer by layer
        zs = [] # list to store all the z vectors, layer by layer
        for b, w in zip(self.biases, self.weights):
            z = np.dot(w, activation)+b
            zs.append(z)
            activation = sigmoid(z)
            activations.append(activation)
        # backward pass
        delta = self.cost_derivative(activations[-1], y) * \
            sigmoid_prime(zs[-1])
        nabla_b[-1] = delta
        nabla_w[-1] = np.dot(delta, activations[-2].transpose())
        # Note that the variable l in the loop below is used a little
        # differently to the notation in Chapter 2 of the book.  Here,
        # l = 1 means the last layer of neurons, l = 2 is the
        # second-last layer, and so on.  It''s a renumbering of the
        # scheme in the book, used here to take advantage of the fact
        # that Python can use negative indices in lists.
        for l in range(2, self.num_layers):
            z = zs[-l]
            sp = sigmoid_prime(z)
            delta = np.dot(self.weights[-l+1].transpose(), delta) * sp
            nabla_b[-l] = delta
            nabla_w[-l] = np.dot(delta, activations[-l-1].transpose())
        return (nabla_b, nabla_w)

    def evaluate(self, test_data):
        """Return the number of test inputs for which the neural
        network outputs the correct result. Note that the neural
        network''s output is assumed to be the index of whichever
        neuron in the final layer has the highest activation."""
        test_results = [(np.argmax(self.feedforward(x)), y)
                        for (x, y) in test_data]
        return sum(int(x == y) for (x, y) in test_results)

    def cost_derivative(self, output_activations, y):
        """Return the vector of partial derivatives \partial C_x /
        \partial a for the output activations."""
        return (output_activations-y)

# S型函数 1/(1+e^-z)
def sigmoid(z):
    return 1.0/(1.0+np.exp(-z))
# S型函数导数 e^-z/(1+e^-z)^2
def sigmoid_prime(z):
    return sigmoid(z)*(1-sigmoid(z))


```', '<div class="toc"></div><pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np

<span class="hljs-class"><span class="hljs-keyword">class</span> <span class="hljs-title">Network</span><span class="hljs-params">(object)</span>:</span>

    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">__init__</span><span class="hljs-params">(self, sizes)</span>:</span>
        <span class="hljs-comment"># 层数</span>
        self.num_layers = len(sizes)
        <span class="hljs-comment"># 各层神经元的数量 eg:[2,3,1]</span>
        self.sizes = sizes
        <span class="hljs-comment"># 偏置 eg:3x1,1</span>
        self.biases = [np.random.randn(y, <span class="hljs-number">1</span>) <span class="hljs-keyword">for</span> y <span class="hljs-keyword">in</span> sizes[<span class="hljs-number">1</span>:]]
        <span class="hljs-comment"># 权重 eg:3x2,1x3</span>
        self.weights = [np.random.randn(y, x)
                        <span class="hljs-keyword">for</span> x, y <span class="hljs-keyword">in</span> zip(sizes[:<span class="hljs-number">-1</span>], sizes[<span class="hljs-number">1</span>:])]

    <span class="hljs-comment"># 对应输入求输出</span>
    <span class="hljs-comment"># a`=σ(w·a+b)</span>
    <span class="hljs-comment"># σ S型激活函数</span>
    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">feedforward</span><span class="hljs-params">(self, a)</span>:</span>
        <span class="hljs-keyword">for</span> b, w <span class="hljs-keyword">in</span> zip(self.biases, self.weights):
            a = sigmoid(np.dot(w, a)+b)
        <span class="hljs-keyword">return</span> a

    <span class="hljs-comment"># 梯度下降-小批量数据</span>
    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">SGD</span><span class="hljs-params">(self, training_data, epochs, mini_batch_size, eta,
            test_data=None)</span>:</span>
        <span class="hljs-comment"># training_data 是一个(x,y)元组列表，训练输入和对应的期望输出</span>
        <span class="hljs-comment"># epochs 迭代期数量</span>
        <span class="hljs-comment"># mini_batch_size 采样时的小批量数据的大小</span>
        <span class="hljs-comment"># eta学习速率 η </span>
        <span class="hljs-comment"># test_data 如果可选参数可用则每次训练后会评估网络</span>
        training_data = list(training_data)
        n = len(training_data)

        <span class="hljs-keyword">if</span> test_data:
            test_data = list(test_data)
            n_test = len(test_data)

        <span class="hljs-keyword">for</span> j <span class="hljs-keyword">in</span> range(epochs):
            <span class="hljs-comment"># 随机打乱数据</span>
            random.shuffle(training_data)
            <span class="hljs-comment"># 数据分为小块</span>
            mini_batches = [
                training_data[k:k+mini_batch_size]
                <span class="hljs-keyword">for</span> k <span class="hljs-keyword">in</span> range(<span class="hljs-number">0</span>, n, mini_batch_size)]
            <span class="hljs-comment"># 训练小块数据</span>
            <span class="hljs-keyword">for</span> mini_batch <span class="hljs-keyword">in</span> mini_batches:
                self.update_mini_batch(mini_batch, eta)
            <span class="hljs-comment"># 输出验证</span>
            <span class="hljs-keyword">if</span> test_data:
                print(<span class="hljs-string">"Epoch {} : {} / {}"</span>.format(j,self.evaluate(test_data),n_test));
                print(self.biases[<span class="hljs-number">1</span>])
            <span class="hljs-keyword">else</span>:
                print(<span class="hljs-string">"Epoch {} complete"</span>.format(j))
    <span class="hljs-comment"># 更新权值和偏置</span>
    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">update_mini_batch</span><span class="hljs-params">(self, mini_batch, eta)</span>:</span>
        <span class="hljs-string">"""Update the network''s weights and biases by applying
        gradient descent using backpropagation to a single mini batch.
        The ``mini_batch`` is a list of tuples ``(x, y)``, and ``eta``
        is the learning rate."""</span>
        nabla_b = [np.zeros(b.shape) <span class="hljs-keyword">for</span> b <span class="hljs-keyword">in</span> self.biases]
        nabla_w = [np.zeros(w.shape) <span class="hljs-keyword">for</span> w <span class="hljs-keyword">in</span> self.weights]
        <span class="hljs-keyword">for</span> x, y <span class="hljs-keyword">in</span> mini_batch:
            delta_nabla_b, delta_nabla_w = self.backprop(x, y)
            nabla_b = [nb+dnb <span class="hljs-keyword">for</span> nb, dnb <span class="hljs-keyword">in</span> zip(nabla_b, delta_nabla_b)]
            nabla_w = [nw+dnw <span class="hljs-keyword">for</span> nw, dnw <span class="hljs-keyword">in</span> zip(nabla_w, delta_nabla_w)]
        self.weights = [w-(eta/len(mini_batch))*nw
                        <span class="hljs-keyword">for</span> w, nw <span class="hljs-keyword">in</span> zip(self.weights, nabla_w)]
        self.biases = [b-(eta/len(mini_batch))*nb
                       <span class="hljs-keyword">for</span> b, nb <span class="hljs-keyword">in</span> zip(self.biases, nabla_b)]
    <span class="hljs-comment"># 计算偏导数</span>
    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">backprop</span><span class="hljs-params">(self, x, y)</span>:</span>
        <span class="hljs-string">"""Return a tuple ``(nabla_b, nabla_w)`` representing the
        gradient for the cost function C_x.  ``nabla_b`` and
        ``nabla_w`` are layer-by-layer lists of numpy arrays, similar
        to ``self.biases`` and ``self.weights``."""</span>
        nabla_b = [np.zeros(b.shape) <span class="hljs-keyword">for</span> b <span class="hljs-keyword">in</span> self.biases]
        nabla_w = [np.zeros(w.shape) <span class="hljs-keyword">for</span> w <span class="hljs-keyword">in</span> self.weights]
        <span class="hljs-comment"># feedforward</span>
        activation = x
        activations = [x] <span class="hljs-comment"># list to store all the activations, layer by layer</span>
        zs = [] <span class="hljs-comment"># list to store all the z vectors, layer by layer</span>
        <span class="hljs-keyword">for</span> b, w <span class="hljs-keyword">in</span> zip(self.biases, self.weights):
            z = np.dot(w, activation)+b
            zs.append(z)
            activation = sigmoid(z)
            activations.append(activation)
        <span class="hljs-comment"># backward pass</span>
        delta = self.cost_derivative(activations[<span class="hljs-number">-1</span>], y) * \
            sigmoid_prime(zs[<span class="hljs-number">-1</span>])
        nabla_b[<span class="hljs-number">-1</span>] = delta
        nabla_w[<span class="hljs-number">-1</span>] = np.dot(delta, activations[<span class="hljs-number">-2</span>].transpose())
        <span class="hljs-comment"># Note that the variable l in the loop below is used a little</span>
        <span class="hljs-comment"># differently to the notation in Chapter 2 of the book.  Here,</span>
        <span class="hljs-comment"># l = 1 means the last layer of neurons, l = 2 is the</span>
        <span class="hljs-comment"># second-last layer, and so on.  It''s a renumbering of the</span>
        <span class="hljs-comment"># scheme in the book, used here to take advantage of the fact</span>
        <span class="hljs-comment"># that Python can use negative indices in lists.</span>
        <span class="hljs-keyword">for</span> l <span class="hljs-keyword">in</span> range(<span class="hljs-number">2</span>, self.num_layers):
            z = zs[-l]
            sp = sigmoid_prime(z)
            delta = np.dot(self.weights[-l+<span class="hljs-number">1</span>].transpose(), delta) * sp
            nabla_b[-l] = delta
            nabla_w[-l] = np.dot(delta, activations[-l<span class="hljs-number">-1</span>].transpose())
        <span class="hljs-keyword">return</span> (nabla_b, nabla_w)

    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">evaluate</span><span class="hljs-params">(self, test_data)</span>:</span>
        <span class="hljs-string">"""Return the number of test inputs for which the neural
        network outputs the correct result. Note that the neural
        network''s output is assumed to be the index of whichever
        neuron in the final layer has the highest activation."""</span>
        test_results = [(np.argmax(self.feedforward(x)), y)
                        <span class="hljs-keyword">for</span> (x, y) <span class="hljs-keyword">in</span> test_data]
        <span class="hljs-keyword">return</span> sum(int(x == y) <span class="hljs-keyword">for</span> (x, y) <span class="hljs-keyword">in</span> test_results)

    <span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">cost_derivative</span><span class="hljs-params">(self, output_activations, y)</span>:</span>
        <span class="hljs-string">"""Return the vector of partial derivatives \partial C_x /
        \partial a for the output activations."""</span>
        <span class="hljs-keyword">return</span> (output_activations-y)

<span class="hljs-comment"># S型函数 1/(1+e^-z)</span>
<span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">sigmoid</span><span class="hljs-params">(z)</span>:</span>
    <span class="hljs-keyword">return</span> <span class="hljs-number">1.0</span>/(<span class="hljs-number">1.0</span>+np.exp(-z))
<span class="hljs-comment"># S型函数导数 e^-z/(1+e^-z)^2</span>
<span class="hljs-function"><span class="hljs-keyword">def</span> <span class="hljs-title">sigmoid_prime</span><span class="hljs-params">(z)</span>:</span>
    <span class="hljs-keyword">return</span> sigmoid(z)*(<span class="hljs-number">1</span>-sigmoid(z))


</code></pre>', 1, '2018-03-13 16:56:55', '2018-04-21 20:02:45', 0, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('43', '0', '1', 0, 3, 'clang & web', 'c-web-base', '<h2 id="-">软件下载</h2>
<h4 id="a-">a.软件名称</h4>
<p>apache http server</p>
<h4 id="b-">b.下载地址</h4>
<p><a href="http://www.apache.org/">官网下载</a> 
<a href="http://pan.baidu.com/s/1dFNz2Fn">百度云下载</a> </p>
<h4 id="c-">c.软件截图</h4>
<p><img src="/static/upload/20180326/screenshot_1484156168014.png" alt=""></p>
', '##  软件下载
#### a.软件名称
apache http server
#### b.下载地址
[官网下载](http://www.apache.org/) 
[百度云下载](http://pan.baidu.com/s/1dFNz2Fn) 
#### c.软件截图
![](/static/upload/20180326/screenshot_1484156168014.png)

<!--more-->
##  软件安装
#### a.开始安装
![](/static/upload/20180326/screenshot_1484156146964.png) 
#### b.确认
![](/static/upload/20180326/screenshot_1484156209188.png)
#### c.基本配置
![](/static/upload/20180326/screenshot_1484156225898.png)
#### d.安装配置
![](/static/upload/20180326/screenshot_1484156241536.png)

* * * * *
#### e.注意
注意:如果80端口被占用请自己修改为其他

![](/static/upload/20180326/screenshot_1484156254058.png)
##### a.修改文件的位置以及修改的地方
![](/static/upload/20180326/screenshot_1484156264984.png)

* * * * *
#### f.启动服务
![](/static/upload/20180326/screenshot_1484156274873.png)
#### g.浏览器测试
![](/static/upload/20180326/screenshot_1484156286961.png)

## c语言写网页
#### a.编写代码
![](/static/upload/20180326/screenshot_1484156332324.png) 
#### b.生成exe
![](/static/upload/20180326/screenshot_1484156302491.png) 
#### c.修改名称
![](/static/upload/20180326/screenshot_1484156345888.png) 
#### d.复制到 cgi-bin目录
![](/static/upload/20180326/screenshot_1484156355448.png)
#### e.浏览器访问
![](/static/upload/20180326/screenshot_1484156365449.png)', '<div class="toc"><ul>
<li><a href="#toc-873">软件下载</a><ul>
<li><a href="#toc-6c4">a.软件名称</a></li>
<li><a href="#toc-21c">b.下载地址</a></li>
<li><a href="#toc-554">c.软件截图</a></li>
</ul>
</li>
<li><a href="#toc-6aa">软件安装</a><ul>
<li><a href="#toc-ecb">a.开始安装</a></li>
<li><a href="#toc-6ea">b.确认</a></li>
<li><a href="#toc-a1d">c.基本配置</a></li>
<li><a href="#toc-5f0">d.安装配置</a></li>
<li><a href="#toc-e34">e.注意</a><ul>
<li><a href="#toc-273">a.修改文件的位置以及修改的地方</a></li>
</ul>
</li>
<li><a href="#toc-3d6">f.启动服务</a></li>
<li><a href="#toc-722">g.浏览器测试</a></li>
</ul>
</li>
<li><a href="#toc-5e1">c语言写网页</a><ul>
<li><a href="#toc-ba2">a.编写代码</a></li>
<li><a href="#toc-cd5">b.生成exe</a></li>
<li><a href="#toc-ce5">c.修改名称</a></li>
<li><a href="#toc-fee">d.复制到 cgi-bin目录</a></li>
<li><a href="#toc-ef8">e.浏览器访问</a></li>
</ul>
</li>
</ul>
</div><h2><a id="toc-873" class="anchor" href="#toc-873"></a>软件下载</h2>
<h4><a id="toc-6c4" class="anchor" href="#toc-6c4"></a>a.软件名称</h4>
<p>apache http server</p>
<h4><a id="toc-21c" class="anchor" href="#toc-21c"></a>b.下载地址</h4>
<p><a href="http://www.apache.org/">官网下载</a> 
<a href="http://pan.baidu.com/s/1dFNz2Fn">百度云下载</a> </p>
<h4><a id="toc-554" class="anchor" href="#toc-554"></a>c.软件截图</h4>
<p><img src="/static/upload/20180326/screenshot_1484156168014.png" alt=""></p>
<!--more-->
<h2><a id="toc-6aa" class="anchor" href="#toc-6aa"></a>软件安装</h2>
<h4><a id="toc-ecb" class="anchor" href="#toc-ecb"></a>a.开始安装</h4>
<p><img src="/static/upload/20180326/screenshot_1484156146964.png" alt=""> </p>
<h4><a id="toc-6ea" class="anchor" href="#toc-6ea"></a>b.确认</h4>
<p><img src="/static/upload/20180326/screenshot_1484156209188.png" alt=""></p>
<h4><a id="toc-a1d" class="anchor" href="#toc-a1d"></a>c.基本配置</h4>
<p><img src="/static/upload/20180326/screenshot_1484156225898.png" alt=""></p>
<h4><a id="toc-5f0" class="anchor" href="#toc-5f0"></a>d.安装配置</h4>
<p><img src="/static/upload/20180326/screenshot_1484156241536.png" alt=""></p>
<hr>
<h4><a id="toc-e34" class="anchor" href="#toc-e34"></a>e.注意</h4>
<p>注意:如果80端口被占用请自己修改为其他</p>
<p><img src="/static/upload/20180326/screenshot_1484156254058.png" alt=""></p>
<h5><a id="toc-273" class="anchor" href="#toc-273"></a>a.修改文件的位置以及修改的地方</h5>
<p><img src="/static/upload/20180326/screenshot_1484156264984.png" alt=""></p>
<hr>
<h4><a id="toc-3d6" class="anchor" href="#toc-3d6"></a>f.启动服务</h4>
<p><img src="/static/upload/20180326/screenshot_1484156274873.png" alt=""></p>
<h4><a id="toc-722" class="anchor" href="#toc-722"></a>g.浏览器测试</h4>
<p><img src="/static/upload/20180326/screenshot_1484156286961.png" alt=""></p>
<h2><a id="toc-5e1" class="anchor" href="#toc-5e1"></a>c语言写网页</h2>
<h4><a id="toc-ba2" class="anchor" href="#toc-ba2"></a>a.编写代码</h4>
<p><img src="/static/upload/20180326/screenshot_1484156332324.png" alt=""> </p>
<h4><a id="toc-cd5" class="anchor" href="#toc-cd5"></a>b.生成exe</h4>
<p><img src="/static/upload/20180326/screenshot_1484156302491.png" alt=""> </p>
<h4><a id="toc-ce5" class="anchor" href="#toc-ce5"></a>c.修改名称</h4>
<p><img src="/static/upload/20180326/screenshot_1484156345888.png" alt=""> </p>
<h4><a id="toc-fee" class="anchor" href="#toc-fee"></a>d.复制到 cgi-bin目录</h4>
<p><img src="/static/upload/20180326/screenshot_1484156355448.png" alt=""></p>
<h4><a id="toc-ef8" class="anchor" href="#toc-ef8"></a>e.浏览器访问</h4>
<p><img src="/static/upload/20180326/screenshot_1484156365449.png" alt=""></p>
', 1, '2018-03-26 10:35:12', '2018-04-04 15:58:07', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('44', '3', '1', 0, 3, 'clang &mysql', 'clang-mysql-base', '<p>c语言简单操作mysql</p>
', 'c语言简单操作mysql

<!--more-->
#### 代码
```C
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <winsock.h>
#include <mysql.h>
int main() {
	printf("Content-type:text/html\n\n");
	for (int i = 0; i < 1; i++) {
		printf("hello c (%d) <br/>\n", i);
	}
	MYSQL *mysql = mysql_init(NULL);
	if (mysql_real_connect(mysql, "localhost", "root", "root", "xj2014", 3306, NULL, 0)) {
		printf("数据库连接成功\n");
		if (mysql_set_character_set(mysql, "gbk")) {
			printf("编码设置失败:%s\n",mysql_error(mysql));
			exit(1);
		}
		if (mysql_query(mysql, "select num,name,classs from userinfo limit 10")) {
			printf("查询出错:%s\n", mysql_error(mysql));
			exit(1);
		};
		MYSQL_RES*	res = mysql_store_result(mysql);
		MYSQL_ROW row;
		while (row = mysql_fetch_row(res)) {
			printf("\n学号=%s\t姓名=%s\t班级=%s", row[0], row[1],row[2]);
		}
		mysql_free_result(res);
		mysql_close(mysql);
	} else {
		printf("数据库连接失败\n");
		exit(1);
	}
	Sleep(500);
	return 0;
}
```
#### 图片
![](/static/upload/20180326/screenshot_1484203727299.png)
', '<div class="toc"><ul>
<li><a href="#toc-06e">代码</a></li>
<li><a href="#toc-20d">图片</a></li>
</ul>
</div><p>c语言简单操作mysql</p>
<!--more-->
<h4><a id="toc-06e" class="anchor" href="#toc-06e"></a>代码</h4>
<pre><code class="hljs lang-C"><span class="hljs-meta">#<span class="hljs-meta-keyword">define</span> _CRT_SECURE_NO_WARNINGS</span>
<span class="hljs-meta">#<span class="hljs-meta-keyword">include</span> <span class="hljs-meta-string">&lt;stdio.h&gt;</span></span>
<span class="hljs-meta">#<span class="hljs-meta-keyword">include</span> <span class="hljs-meta-string">&lt;stdlib.h&gt;</span></span>
<span class="hljs-meta">#<span class="hljs-meta-keyword">include</span> <span class="hljs-meta-string">&lt;winsock.h&gt;</span></span>
<span class="hljs-meta">#<span class="hljs-meta-keyword">include</span> <span class="hljs-meta-string">&lt;mysql.h&gt;</span></span>
<span class="hljs-function"><span class="hljs-keyword">int</span> <span class="hljs-title">main</span><span class="hljs-params">()</span> </span>{
    <span class="hljs-built_in">printf</span>(<span class="hljs-string">"Content-type:text/html\n\n"</span>);
    <span class="hljs-keyword">for</span> (<span class="hljs-keyword">int</span> i = <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">1</span>; i++) {
        <span class="hljs-built_in">printf</span>(<span class="hljs-string">"hello c (%d) &lt;br/&gt;\n"</span>, i);
    }
    MYSQL *mysql = mysql_init(<span class="hljs-literal">NULL</span>);
    <span class="hljs-keyword">if</span> (mysql_real_connect(mysql, <span class="hljs-string">"localhost"</span>, <span class="hljs-string">"root"</span>, <span class="hljs-string">"root"</span>, <span class="hljs-string">"xj2014"</span>, <span class="hljs-number">3306</span>, <span class="hljs-literal">NULL</span>, <span class="hljs-number">0</span>)) {
        <span class="hljs-built_in">printf</span>(<span class="hljs-string">"数据库连接成功\n"</span>);
        <span class="hljs-keyword">if</span> (mysql_set_character_set(mysql, <span class="hljs-string">"gbk"</span>)) {
            <span class="hljs-built_in">printf</span>(<span class="hljs-string">"编码设置失败:%s\n"</span>,mysql_error(mysql));
            <span class="hljs-built_in">exit</span>(<span class="hljs-number">1</span>);
        }
        <span class="hljs-keyword">if</span> (mysql_query(mysql, <span class="hljs-string">"select num,name,classs from userinfo limit 10"</span>)) {
            <span class="hljs-built_in">printf</span>(<span class="hljs-string">"查询出错:%s\n"</span>, mysql_error(mysql));
            <span class="hljs-built_in">exit</span>(<span class="hljs-number">1</span>);
        };
        MYSQL_RES*    res = mysql_store_result(mysql);
        MYSQL_ROW row;
        <span class="hljs-keyword">while</span> (row = mysql_fetch_row(res)) {
            <span class="hljs-built_in">printf</span>(<span class="hljs-string">"\n学号=%s\t姓名=%s\t班级=%s"</span>, row[<span class="hljs-number">0</span>], row[<span class="hljs-number">1</span>],row[<span class="hljs-number">2</span>]);
        }
        mysql_free_result(res);
        mysql_close(mysql);
    } <span class="hljs-keyword">else</span> {
        <span class="hljs-built_in">printf</span>(<span class="hljs-string">"数据库连接失败\n"</span>);
        <span class="hljs-built_in">exit</span>(<span class="hljs-number">1</span>);
    }
    Sleep(<span class="hljs-number">500</span>);
    <span class="hljs-keyword">return</span> <span class="hljs-number">0</span>;
}
</code></pre>
<h4><a id="toc-20d" class="anchor" href="#toc-20d"></a>图片</h4>
<p><img src="/static/upload/20180326/screenshot_1484203727299.png" alt=""></p>
', 1, '2018-03-26 10:37:58', '2018-07-13 11:35:36', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('46', '0', '1', 0, 0, '使用 oracle 数据库', 'oracle', '', '### 连接
> `sqlplus /nolog` 进入`sqlplus`命令行

#### 在SQL Plus中登录Oracle的用户的语法格式：

1.  `{<username>[/<password>][@<connect_identifier>] | / }[AS { SYSDBA | SYSOPER }]`

2.  `username/password`：指定数据库账户用户名，口令

3. `connect_identifier`：数据库连接的连接标识符（服务器名）。如果没有连接标识符，SQL Plus将连接到默认的数据库。

4. `SYSDBA、SYSOPER`选项是数据库管理员权限（SYSDBA:数据库管理员的权限；SYSOPER：数据库操作员的权限）

#### 启用scott用户

- 给scott用户解锁【语法格式】（默认的scott用户是锁定的）：`alter user username account unlock`

 例：`alter user scott account unlock`

#### 赋予权限

- 口令`GRANT power TO uname; `
- 连接权限  `grant connect to SCOTT ;`
- 一般权限（基本操作）    `grant rescore to SCOTT ;`

#### 修改密码
   - 修改用户口令 格式为：`alter user uname identified by password`

   - 以system 为例，密码修改为 123456. 可输入
`alter user system identified by 123456;`', '<div class="toc"><ul><li><a href="#toc__0">连接</a><ul><li><a href="#toc_SQL_PlusOracle_3">在SQL Plus中登录Oracle的用户的语法格式：</a></li><li><a href="#toc_scott_13">启用scott用户</a></li><li><a href="#toc__19">赋予权限</a></li><li><a href="#toc__25">修改密码</a></li></ul></li></ul></div><h3><a id="toc__0"></a>连接</h3>
<blockquote>
<p><code>sqlplus /nolog</code> 进入<code>sqlplus</code>命令行</p>
</blockquote>
<h4><a id="toc_SQL_PlusOracle_3"></a>在SQL Plus中登录Oracle的用户的语法格式：</h4>
<ol>
<li>
<p><code>{&lt;username&gt;[/&lt;password&gt;][@&lt;connect_identifier&gt;] | / }[AS { SYSDBA | SYSOPER }]</code></p>
</li>
<li>
<p><code>username/password</code>：指定数据库账户用户名，口令</p>
</li>
<li>
<p><code>connect_identifier</code>：数据库连接的连接标识符（服务器名）。如果没有连接标识符，SQL Plus将连接到默认的数据库。</p>
</li>
<li>
<p><code>SYSDBA、SYSOPER</code>选项是数据库管理员权限（SYSDBA:数据库管理员的权限；SYSOPER：数据库操作员的权限）</p>
</li>
</ol>
<h4><a id="toc_scott_13"></a>启用scott用户</h4>
<ul>
<li>给scott用户解锁【语法格式】（默认的scott用户是锁定的）：<code>alter user username account unlock</code></li>
</ul>
<p>例：<code>alter user scott account unlock</code></p>
<h4><a id="toc__19"></a>赋予权限</h4>
<ul>
<li>口令<code>GRANT power TO uname;</code></li>
<li>连接权限  <code>grant connect to SCOTT ;</code></li>
<li>一般权限（基本操作）    <code>grant rescore to SCOTT ;</code></li>
</ul>
<h4><a id="toc__25"></a>修改密码</h4>
<ul>
<li>
<p>修改用户口令 格式为：<code>alter user uname identified by password</code></p>
</li>
<li>
<p>以system 为例，密码修改为 123456. 可输入<br />
<code>alter user system identified by 123456;</code></p>
</li>
</ul>
', 1, '2018-06-21 08:30:33', '2019-02-24 14:38:08', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('47', '4', '1', 0, 3, 'goweb-00-前言', 'goweb-00', '<h3 id="-">目标</h3>
<p> 通过完成<code>go</code>语言 <code>mysql</code> 等相关内容的学习使自己独立完成一般网站。</p>
<h3 id="-">网页基础</h3>
', '### 目标
 通过完成`go`语言 `mysql` 等相关内容的学习使自己独立完成一般网站。
### 网页基础 
<!--more-->
[传送门](https://www.kancloud.cn/zxysilent/ja/208236)
### 用到的软件
[传送门](http://pan.baidu.com/s/1miKDiQk)
### 实例
[传送门](https://pan.baidu.com/s/1miKDiQk#list/path=%2FShare%2Fgo-web-dev%2F%E4%BE%8B%E5%AD%90&parentPath=%2FShare)
### 硬性规定
- 平时分 30% [作业、点到]
- 期末 70%', '<div class="toc"><ul>
<li><a href="#toc-73e">目标</a></li>
<li><a href="#toc-de8">网页基础</a></li>
<li><a href="#toc-77e">用到的软件</a></li>
<li><a href="#toc-480">实例</a></li>
<li><a href="#toc-42a">硬性规定</a></li>
</ul>
</div><h3><a id="toc-73e" class="anchor" href="#toc-73e"></a>目标</h3>
<p> 通过完成<code>go</code>语言 <code>mysql</code> 等相关内容的学习使自己独立完成一般网站。</p>
<h3><a id="toc-de8" class="anchor" href="#toc-de8"></a>网页基础</h3>
<!--more-->
<p><a href="https://www.kancloud.cn/zxysilent/ja/208236">传送门</a></p>
<h3><a id="toc-77e" class="anchor" href="#toc-77e"></a>用到的软件</h3>
<p><a href="http://pan.baidu.com/s/1miKDiQk">传送门</a></p>
<h3><a id="toc-480" class="anchor" href="#toc-480"></a>实例</h3>
<p><a href="https://pan.baidu.com/s/1miKDiQk#list/path=%2FShare%2Fgo-web-dev%2F%E4%BE%8B%E5%AD%90&amp;parentPath=%2FShare">传送门</a></p>
<h3><a id="toc-42a" class="anchor" href="#toc-42a"></a>硬性规定</h3>
<ul>
<li>平时分 30% [作业、点到]</li>
<li>期末 70%</li>
</ul>
', 1, '2018-07-12 11:57:15', '2018-10-23 21:00:54', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('50', '4', '1', 0, 3, 'goweb-03-golang', 'goweb-03', '<h2 id="qaq">QAQ</h2>
<p>本应该长篇大论介绍<code>golang</code>的 but  </p>
<p><img src="/static/upload/20180716/upload_d7ba285d3e106edd139688f7287fef92.png" alt="alt">  </p>
<p><a href="https://golang.org/">https://golang.org/</a> 官方网站<strong>墙外</strong><br><a href="https://golang.google.cn/">https://golang.google.cn/</a>  镜像网站<br><a href="https://golang.google.cn/pkg/">https://golang.google.cn/pkg/</a> 标准库文档<br>很多例子可以在线练习</p>
<p><strong>特点</strong>
　简洁 快速 安全 并行 有趣 开源 支持泛型编程，内存管理，数组安全，编译迅速 balabala...  </p>
', '## QAQ
本应该长篇大论介绍`golang`的 but  

![alt](/static/upload/20180716/upload_d7ba285d3e106edd139688f7287fef92.png)  


[https://golang.org/](https://golang.org/) 官方网站**墙外**  
[https://golang.google.cn/](https://golang.google.cn/)  镜像网站  
[https://golang.google.cn/pkg/](https://golang.google.cn/pkg/) 标准库文档  
很多例子可以在线练习

**特点**
　简洁 快速 安全 并行 有趣 开源 支持泛型编程，内存管理，数组安全，编译迅速 balabala...  

<!--more-->
** 开发成员**
- Thompson：1983年图灵奖（Turing Award）和1998年美国国家技术奖（National Medal of Technology）得主。他与Dennis Ritchie是Unix的原创者。Thompson也发明了后来衍生出C语言的B程序语言。
- Pike：曾是贝尔实验室（Bell Labs）的Unix团队，和Plan 9操作系统计划的成员。他与Thompson共事多年，并共创出广泛使用的UTF-8 字元编码。
-  Robert Griesemer：曾协助制作Java的HotSpot编译器，和Chrome浏览器的JavaScript引擎V8
- 。。。
----------

## 正文

###  课程目标
学会开发动态网站
> 展示ui + 数据api
#### ui
- html+css+js
- 安卓
- 苹果
-  ...  
 html+css+js 的组合可以用在 pc+移动端  

#### api
- c 
- c++ 
- java 
-.net
- php ☃️
- nodejs 
- python 
- go 
- ...

### 内容
#### 程序结构
[去学习](/post/goweb-03-0.html)  
命名、声明、赋值、类型、包文件、作用域
#### 基础数据类型
[去学习](/post/goweb-03-1.html)  
 整型、浮点、布尔、字符串、常量
#### 符合数据类型
[去学习](/post/goweb-03-2.html)  
数组 、 slice、map、结构体、json
#### 函数
[去学习](/post/goweb-03-3.html)  
#### 方法
[去学习](/post/goweb-03-4.html)  
#### 接口
 [去学习](/post/goweb-03-5.html)  
#### goroutines channels
[去学习](/post/goweb-03-6.html)  
#### 常用包
[去学习](/post/goweb-03-7.html)  
 os、io、strings、bytes、[正则](/post/regular-expression.html)、net、http
### helloworld
- 新建文件 `main.go`
- 写入代码
    ```go
    package main

    import "fmt"

    func main() {
	    fmt.Println("Hello world")
    }
    ```
- `go run main.go` 直接输出结果
- `go build main.go`  编译链接>生成exe可执行程序
> 介绍此程序
', '<div class="toc"><ul>
<li><a href="#qaq">QAQ</a></li>
<li><a href="#toc-583">正文</a><ul>
<li><a href="#toc-f67">课程目标</a><ul>
<li><a href="#ui">ui</a></li>
<li><a href="#api">api</a></li>
</ul>
</li>
<li><a href="#toc-2d7">内容</a><ul>
<li><a href="#toc-498">程序结构</a></li>
<li><a href="#toc-2e2">基础数据类型</a></li>
<li><a href="#toc-8f6">符合数据类型</a></li>
<li><a href="#toc-870">函数</a></li>
<li><a href="#toc-ea3">方法</a></li>
<li><a href="#toc-54e">接口</a></li>
<li><a href="#goroutineschannels">goroutines channels</a></li>
<li><a href="#toc-88d">常用包</a></li>
</ul>
</li>
<li><a href="#helloworld">helloworld</a></li>
</ul>
</li>
</ul>
</div><h2><a id="qaq" class="anchor" href="#qaq"></a>QAQ</h2>
<p>本应该长篇大论介绍<code>golang</code>的 but  </p>
<p><img src="/static/upload/20180716/upload_d7ba285d3e106edd139688f7287fef92.png" alt="alt">  </p>
<p><a href="https://golang.org/">https://golang.org/</a> 官方网站<strong>墙外</strong><br><a href="https://golang.google.cn/">https://golang.google.cn/</a>  镜像网站<br><a href="https://golang.google.cn/pkg/">https://golang.google.cn/pkg/</a> 标准库文档<br>很多例子可以在线练习</p>
<p><strong>特点</strong>
　简洁 快速 安全 并行 有趣 开源 支持泛型编程，内存管理，数组安全，编译迅速 balabala...  </p>
<!--more-->
<p><strong> 开发成员</strong></p>
<ul>
<li>Thompson：1983年图灵奖（Turing Award）和1998年美国国家技术奖（National Medal of Technology）得主。他与Dennis Ritchie是Unix的原创者。Thompson也发明了后来衍生出C语言的B程序语言。</li>
<li>Pike：曾是贝尔实验室（Bell Labs）的Unix团队，和Plan 9操作系统计划的成员。他与Thompson共事多年，并共创出广泛使用的UTF-8 字元编码。</li>
<li>Robert Griesemer：曾协助制作Java的HotSpot编译器，和Chrome浏览器的JavaScript引擎V8</li>
<li>。。。</li>
</ul>
<hr>
<h2><a id="toc-583" class="anchor" href="#toc-583"></a>正文</h2>
<h3><a id="toc-f67" class="anchor" href="#toc-f67"></a>课程目标</h3>
<p>学会开发动态网站</p>
<blockquote>
<p>展示ui + 数据api</p>
</blockquote>
<h4><a id="ui" class="anchor" href="#ui"></a>ui</h4>
<ul>
<li>html+css+js</li>
<li>安卓</li>
<li>苹果</li>
<li>...<br>html+css+js 的组合可以用在 pc+移动端  </li>
</ul>
<h4><a id="api" class="anchor" href="#api"></a>api</h4>
<ul>
<li>c </li>
<li>c++ </li>
<li>java 
-.net</li>
<li>php ☃️</li>
<li>nodejs </li>
<li>python </li>
<li>go </li>
<li>...</li>
</ul>
<h3><a id="toc-2d7" class="anchor" href="#toc-2d7"></a>内容</h3>
<h4><a id="toc-498" class="anchor" href="#toc-498"></a>程序结构</h4>
<p><a href="/post/goweb-03-0.html">去学习</a><br>命名、声明、赋值、类型、包文件、作用域</p>
<h4><a id="toc-2e2" class="anchor" href="#toc-2e2"></a>基础数据类型</h4>
<p><a href="/post/goweb-03-1.html">去学习</a><br> 整型、浮点、布尔、字符串、常量</p>
<h4><a id="toc-8f6" class="anchor" href="#toc-8f6"></a>符合数据类型</h4>
<p><a href="/post/goweb-03-2.html">去学习</a><br>数组 、 slice、map、结构体、json</p>
<h4><a id="toc-870" class="anchor" href="#toc-870"></a>函数</h4>
<p><a href="/post/goweb-03-3.html">去学习</a>  </p>
<h4><a id="toc-ea3" class="anchor" href="#toc-ea3"></a>方法</h4>
<p><a href="/post/goweb-03-4.html">去学习</a>  </p>
<h4><a id="toc-54e" class="anchor" href="#toc-54e"></a>接口</h4>
<p> <a href="/post/goweb-03-5.html">去学习</a>  </p>
<h4><a id="goroutineschannels" class="anchor" href="#goroutineschannels"></a>goroutines channels</h4>
<p><a href="/post/goweb-03-6.html">去学习</a>  </p>
<h4><a id="toc-88d" class="anchor" href="#toc-88d"></a>常用包</h4>
<p><a href="/post/goweb-03-7.html">去学习</a><br> os、io、strings、bytes、<a href="/post/regular-expression.html">正则</a>、net、http</p>
<h3><a id="helloworld" class="anchor" href="#helloworld"></a>helloworld</h3>
<ul>
<li>新建文件 <code>main.go</code></li>
<li><p>写入代码</p>
<pre><code class="hljs lang-go">  <span class="hljs-keyword">package</span> main

  <span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>

  <span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
      fmt.Println(<span class="hljs-string">"Hello world"</span>)
  }
</code></pre>
</li>
<li><code>go run main.go</code> 直接输出结果</li>
<li><code>go build main.go</code>  编译链接&gt;生成exe可执行程序<blockquote>
<p>介绍此程序</p>
</blockquote>
</li>
</ul>
', 1, '2018-07-12 16:58:33', '2018-07-23 16:38:14', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('51', '4', '1', 0, 3, 'goweb-030-golang-程序结构', 'goweb-03-0', '<h2 id="-">命名</h2>
<p>Go语言中的函数名、变量名、常量名、类型名、语句标号和包名等所有的命名，都遵循一个
简单的命名规则：一个名字必须以一个字母（Unicode字母）或下划线开头，后面可以跟任意
数量的字母、数字或下划线。大写字母和小写字母是不同的：<code>abc</code>和<code>aBc</code>是两个不
同的名字。</p>
', '## 命名
Go语言中的函数名、变量名、常量名、类型名、语句标号和包名等所有的命名，都遵循一个
简单的命名规则：一个名字必须以一个字母（Unicode字母）或下划线开头，后面可以跟任意
数量的字母、数字或下划线。大写字母和小写字母是不同的：`abc`和`aBc`是两个不
同的名字。
<!--more-->
### 关键字
```go
break      default       func     interface   select
case       defer         go       map         struct
chan       else          goto     package     switch
const      fallthrough   if       range       type
continue   for           import   return      var
```
还有大约30多个预定义的名字，比如int和true等，主要对应内建的常量、类型和函数。
```
内建常量: true false iota nil

内建类型: int int8 int16 int32 int64
          uint uint8 uint16 uint32 uint64 uintptr
          float32 float64 complex128 complex64
          bool byte rune string error

内建函数: make len cap new append copy close delete
          complex real imag
          panic recover
```
这些内部预先定义的名字并不是关键字，可以在定义中重新使用它们。

## 声明

> 声明语句定义了程序的各种实体对象以及部分或全部的属性。 

- Go语言主要有四种类型的声明语句：`var`、`const`、`type`和`func`，分别对应变量、常量、类型和函数实体对象的声明。
- 一个Go语言编写的程序对应一个或多个以`.go`为文件后缀名的源文件中。  
- 每个源文件以包的声明语句开始，说明该源文件是属于哪个包。  
- 包声明语句之后是import语句导入依赖的其它包然后是包一级的类型、变量、常量、函数的声明语句。
- 包一级的各种类型的声明语句的顺序无关紧要。 

```go
//当前程序包名称
package main

//导入外部包
import (
	"fmt"
)

//常量
const TEL = 18284151024

//包级别变量
var name = "zxysilent"

// 新类型
type Int int

//结构体
type S struct{}

// 方法
func (s S) Test() {}

//接口
type obj interface{}

//函数
func main() {
	// 多个变量的声明
	var a, b, c int
	// 多个变量的赋值
	a, b, c = 1, 2, 3
	// 多个变量的声明同时赋值
	var d, e, f int = 4, 5, 6
	// 多个变量的省略类型的声明赋值(编译器推断类型)
	var g, h, i = 7, 8, 9
	fmt.Println(a, b, c, d, e, f, g, h, i)
	fmt.Println("hello,word")
}
```

## 变量
> var声明语句可以创建一个特定类型的变量，然后给变量附加一个名字，并且设置变量的初始值。

变量声明的一般语法如下： 
```go
var 变量名字 类型 = 表达式
```

其中**类型**或**= 表达式**两个部分可以省略其中的一个。
### 默认值
- 数值类型变量对应的零值是0。
- 布尔类型变量对应的零值是false 。
- 字符串类型对应的零值是空字符串。 
- 接口或引用类型（包括slice、指针、map、chan和函数）变量对应的零值是nil。
- 数组或结构体等聚合类型对应的零值是每个元素或字段都是对应该类型的零值。

零值初始化机制可以确保每个声明的变量总是有一个良好定义的值，因此在Go语言中不存在未初始化的变量。
```go
var s string
fmt.Println(s) // ""
```
### xxx
- 一个声明语句中同时声明一组变量，或用一组初始化表达式声明并初始化一组变量。
- 如果省略每个变量的类型，将可以声明多个类型不同的变量（类型由初始化表达式推导）：

```go
var i, j, k int                 // int, int, int
var b, f, s = true, 2.3, "four" // bool, float64, string
```

初始化表达式可以是字面量或任意的表达式。在包级别声明的变量会在main入口函数执行**前**完成初始化,局部变量将在声明语句被执行到的时候完成初始化。

- 一组变量也可以通过调用一个函数，由函数返回的多个返回值初始化：

```go
var f, err = os.Open("filename") //打开文件
```
###  简短变量声明
在函数内部，有一种称为简短变量声明语句的形式可用于声明和初始化局部变量。  
它以`名字 := 表达式`形式声明变量，变量的类型根据表达式来自动推导。

```go
package main

import "fmt"

func main() {
	z := "zxysilent"
	fmt.Println(z)
}
```

简短变量声明被广泛用于大部分的局部变量的声明和初始化。
var形式的声明语句往往是用于需要显式指定变量类型的地方，或者因为变量稍后会被重新赋值而初始值无关紧要的地方。

```go
i := 100                  // an int
var boiling float64 = 100 // a float64
var names []string
var err error
var p Point
```

简短变量声明语句也可以用来声明和初始化一组变量

```go
i, j := 0, 1
```
**✍**
**:=**是一个变量声明语句，而**=**是一个变量赋值操作。Ⓜ️做题面试才会考
```Go
i, j = j, i // 交换 i 和 j 的值
```

和普通var形式的变量声明语句一样，简短变量声明语句也可以用函数的返回值来声明和初始化变量，像下面的os.Open函数调用将返回两个值：

```go
f, err := os.Open(name)
if err != nil {
	return err
}
f.Close()
```

简短变量声明左边的变量可能并不是全部都是刚刚声明的。  
如果有一些已经在**相同的词法域**声明过了，那么简短变量声明语句对这些已经声明过的变量就只有赋值行为了。

```go
in, err := os.Open("inputFile")
// ...
out, err := os.Create("outputFile")
```
简短变量声明语句只有对已经在同级词法域声明过的变量才和赋值操作语句等价，如果变量是在外部词法域声明的，那么简短变量声明语句将会在当前词法域重新声明一个新的变量

###  指针
- 用`var x int`声明语句声明一个x变量那么`&x`表达式将产生一个指向该整数变量的指针 
- 指针对应的数据类型是`*int`，指针被称之为“指向int类型的指针”。
- 如果指针名字为`p`，那么就说“p指针指向变量`x`”，或者说“p指针保存了x变量的内存地址”。
- 同时`*p`表达式对应p指针指向的变量的值。 
   
```go
x := 1
p := &x         
fmt.Println(*p) 
*p = 2  
fmt.Println(x)  
```

返回函数中局部变量的地址也是安全的。

```go
var p = f()

func f() *int {
	v := 1
	return &v
}
```

指针包含了一个变量的地址，将指针作为参数调用函数，可以在函数中通过该指针来更新变量的值。

```go
func add(p *int) int{
	*p++ 
        return *p
}

v := 1
add(&v) 
fmt.Println(add(&v)) 
```
每次我们对一个变量取地址，或者复制指针，我们都是为原变量创建了新的别名。
### new函数
另一个创建变量的方法是调用内建的new函数。 表达式`new(T)`将创建一个`T`类型的匿名变量，初始化为T类型的零值，然后返回变量**地址**，返回的指针类型为`*T`。

```go
p := new(int)   // p, *int 类型, 指向匿名的 int 变量
fmt.Println(*p) // "0"
*p = 2          // 设置 int 匿名变量的值为 2
fmt.Println(*p) // "2"
```

用new创建变量和普通变量声明语句方式创建变量没有什么区别，`new`函数类似是一种语法糖，而不是一个新的基础概念。


```go
func newInt() *int {
	return new(int)
}

func newInt() *int {
	var dummy int
	return &dummy
}
```
上面的两个函数有着相同的行为。  
由于new只是一个预定义的函数，可以将new名字重新定义为别的类型。

```go
func f(old, new int) int {
  return new - old
}
```
new被定义为int类型的变量名，在函数内部是无法使用内置的new函数。
### 生命周期

变量的生命周期指的是在程序运行期间变量有效存在的时间段。
- 包一级声明的变量的生命周期和整个程序的运行周期是一致的。
- 局部变量的生命周期则是动态的：每次从创建一个新变量的声明语句开始，直到该变量不再被引用为止，然后变量的存储空间可能被回收。
- 函数的参数变量和返回值变量都是局部变量。

```go
package main

import "fmt"

var v = "1.0"

func main() {
	z := "zxysilent"
	fmt.Println(z)
	for i := 0; i < 2; i++ {
		fmt.Println(i)
	}
	fmt.Println(add(10, 20))
}

func add(a, b int) int {
	return a + b
}
```
编译器会自动选择在栈上还是在堆上分配局部变量的存储空间，不是由用var还是new声明变量的方式决定的。
```go
var global *int

func f() {
	var x int
	x = 1
	global = &x
}

func g() {
	y := new(int)
	*y = 1
}
```

## 赋值
使用赋值语句可以更新一个变量的值
```
被赋值的变量 = 新值的表达式
```
```go
x = 1                    // 命名变量的赋值
*p = true                // 通过指针间接赋值
person.name = "bob"      // 结构体字段赋值
count[x] = count[x] * 10 // 数组、slice或map的元素赋值
count[x] *= 100
```
数值变量也可以支持`++`递增和`--`递减**语句**  
❗️只能在后面
```go
v := 1
v++    // 等价方式 v = v + 1；v 变成 2
v--    // 等价方式 v = v - 1；v 变成 1
```
### 元组赋值 略

- 元组赋值是另一种形式的赋值语句，它允许同时更新多个变量的值。
- 在赋值之前，赋值语句右边的所有表达式将会先进行求值，然后再统一更新左边对应变量的值。  

```go
x, y = y, x
a[i], a[j] = a[j], a[i]
//调用一个有多个返回值的函数
f, err = os.Open("foo.txt") 
```
情况列举
```go
v, ok = m[key]        // map
v, ok = x.(T)         // 断言
v, ok = <-ch          // channel 接收
v = m[key]            // map查找，失败时返回零值
v = x.(T)             // type断言，失败时panic异常
v = <-ch              // 管道接收，失败时返回零值（阻塞不算是失败）
_, ok = m[key]        // map返回2个值
_, ok = mm[""], false // map返回1个值
_ = mm[""]            // map返回1个值
```

可以用下划线空白标识符`_`来丢弃不需要的值。

```go
_, err = io.Copy(dst, src) // 丢弃字节数
_, ok = x.(T)              // 只检测类型，忽略具体值
```
## 类型

变量或表达式的类型定义了对应存储值的属性特征，它们在内部是如何表达的，是否支持一些操作符，以及它们自己关联的方法集等。在任何程序中都会存在一些变量有着相同的内部结构，但是却表示完全不同的概念✏️。
```go
type 类型名字 底层类型
```
类型声明语句一般出现在包一级，因此如果新创建的类型名字的首字符**大写**，则在包外部也可以使用。

```go
package main

import (
	"fmt"
)

// MyInt type 类型名字 底层类型
type MyInt int

func (i MyInt) String() string {
	return fmt.Sprintf("myint:%d", i)
}

func main() {
	var i MyInt //= 100
	i = 100
	fmt.Println(i)
}
```
许多类型都会定义一个String方法，因为当使用fmt包的打印方法时，将会优先使用该类型对应的String方法返回的结果打印。

## 包和文件

一个包的源代码保存在一个或多个以.go为文件后缀名的源文件中，通常一个包所在目录路径的后缀是包的导入路径。  
目录结构  
![alt](/static/upload/20180716/upload_5a2c544d7fdf50069bc107ff35297f61.png)

⭐️ max

```go
package util

//Max 大的一个
func Max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
```
⭐️ min

```go
package util

//Min 小的一个
func Min(a, b int) int {
	if a > b {
		return b
	}
	return a
}
```
⭐️ main

```go
package main

import (
	"fmt"
	"tmp/util"
)

func main() {
	a, b := 10, 20
	fmt.Println(util.Min(a, b))
	fmt.Println(util.Max(a, b))
}
```
### 导入包

- Go语言程序中，每个包都有一个全局唯一的导入路径。
- 一个导入路径代表一个目录中的一个或多个Go源文件。

除了包的导入路径，每个包还有一个包名，包名一般是短小的名字（⚡️ 并不要求包名是唯一的），包名在包的声明处指定。
一个包的名字和包的导入路径的最后一个字段相同。

临时重命名
```go
package main

import (
	"fmt"
	u "tmp/util"
)

func main() {
	a, b := 10, 20
	fmt.Println(u.Min(a, b))
}
```
省掉包名
```go
package main

import (
	"fmt"
	. "tmp/util"
)

func main() {
	a, b := 10, 20
	fmt.Println(Min(a, b))
}
```
### 包的初始化

包的初始化首先是解决包级变量的依赖顺序，然后按照包级变量声明出现的顺序依次初始化：

```go
var a = b + c // a 第三个初始化, 为 3
var b = f()   // b 第二个初始化, 为 2, 通过调用 f (依赖c)
var c = 1     // c 第一个初始化, 为 1

func f() int { return c + 1 }
```

如果包中含有多个.go源文件，它们将按照发给编译器的顺序进行初始化，Go语言的构建工具首先会将.go文件根据文件名排序，然后依次调用编译器编译。
 init函数会优先于main函数执行
```go
func init() { /* ... */ }
```
在每个文件中的init初始化函数，在程序开始执行时按照它们声明的顺序被自动调用

✍min

```go
package util

import (
	"fmt"
)

func init() {
	fmt.Println("init min")
}

//Min 小的一个
func Min(a, b int) int {
	if a > b {
		return b
	}
	return a
}
```
结果  
![alt](/static/upload/20180716/upload_dec1426b7e10cc978b5122dbe81af62f.png)

init

![alt](/static/upload/20180716/upload_ef96f0c2738ca9e195ecddd6f73abc33.png)

## 作用域 略

- 预声明标识符的作用域为全域块。
- 在顶级（即在任何函数之外）声明的表示常量、类型、变量或函数（而非方法）的标识符其作用域为该包块。
- 已导入包的包名作用域为包含该导入声明的文件块。
- 表示方法接收器、函数形参或返回值变量的标识符，其作用域为该函数体。
- 在函数中声明为常量或变量的标识符，其作用域始于该函数中具体常量实现或变量实现ShortVarDecl表示短变量声明）的结尾，止于最内部包含块的结尾。
- 在函数中声明为类型的标识符，其作用域始于该函数中具体类型实现的标识符，止于最内部包含块的结尾。

```go
func main() {
	x := "hello!"
	for i := 0; i < len(x); i++ {
		x := x[i]
		if x != ''!'' {
			x := x + ''A'' - ''a''
			fmt.Printf("%c", x) // "HELLO" 
		}
	}
}
```', '<div class="toc"><ul>
<li><a href="#toc-25c">命名</a><ul>
<li><a href="#toc-cfb">关键字</a></li>
</ul>
</li>
<li><a href="#toc-86e">声明</a></li>
<li><a href="#toc-ddc">变量</a><ul>
<li><a href="#toc-225">默认值</a></li>
<li><a href="#xxx">xxx</a></li>
<li><a href="#toc-c5a">简短变量声明</a></li>
<li><a href="#toc-4cc">指针</a></li>
<li><a href="#toc-d8f">new函数</a></li>
<li><a href="#toc-176">生命周期</a></li>
</ul>
</li>
<li><a href="#toc-8f4">赋值</a><ul>
<li><a href="#toc-6c7">元组赋值 略</a></li>
</ul>
</li>
<li><a href="#toc-226">类型</a></li>
<li><a href="#toc-2c1">包和文件</a><ul>
<li><a href="#toc-f07">导入包</a></li>
<li><a href="#toc-118">包的初始化</a></li>
</ul>
</li>
<li><a href="#toc-f99">作用域 略</a></li>
</ul>
</div><h2><a id="toc-25c" class="anchor" href="#toc-25c"></a>命名</h2>
<p>Go语言中的函数名、变量名、常量名、类型名、语句标号和包名等所有的命名，都遵循一个
简单的命名规则：一个名字必须以一个字母（Unicode字母）或下划线开头，后面可以跟任意
数量的字母、数字或下划线。大写字母和小写字母是不同的：<code>abc</code>和<code>aBc</code>是两个不
同的名字。
<!--more--></p>
<h3><a id="toc-cfb" class="anchor" href="#toc-cfb"></a>关键字</h3>
<pre><code class="hljs lang-go"><span class="hljs-keyword">break</span>      <span class="hljs-keyword">default</span>       <span class="hljs-function"><span class="hljs-keyword">func</span>     <span class="hljs-title">interface</span>   <span class="hljs-title">select</span>
<span class="hljs-title">case</span>       <span class="hljs-title">defer</span>         <span class="hljs-title">go</span>       <span class="hljs-title">map</span>         <span class="hljs-title">struct</span>
<span class="hljs-title">chan</span>       <span class="hljs-title">else</span>          <span class="hljs-title">goto</span>     <span class="hljs-title">package</span>     <span class="hljs-title">switch</span>
<span class="hljs-title">const</span>      <span class="hljs-title">fallthrough</span>   <span class="hljs-title">if</span>       <span class="hljs-title">range</span>       <span class="hljs-title">type</span>
<span class="hljs-title">continue</span>   <span class="hljs-title">for</span>           <span class="hljs-title">import</span>   <span class="hljs-title">return</span>      <span class="hljs-title">var</span>
</span></code></pre>
<p>还有大约30多个预定义的名字，比如int和true等，主要对应内建的常量、类型和函数。</p>
<pre><code class="hljs lang-go">内建常量: <span class="hljs-literal">true</span> <span class="hljs-literal">false</span> <span class="hljs-literal">iota</span> <span class="hljs-literal">nil</span>

内建类型: <span class="hljs-keyword">int</span> <span class="hljs-keyword">int8</span> <span class="hljs-keyword">int16</span> <span class="hljs-keyword">int32</span> <span class="hljs-keyword">int64</span>
          <span class="hljs-keyword">uint</span> <span class="hljs-keyword">uint8</span> <span class="hljs-keyword">uint16</span> <span class="hljs-keyword">uint32</span> <span class="hljs-keyword">uint64</span> <span class="hljs-keyword">uintptr</span>
          <span class="hljs-keyword">float32</span> <span class="hljs-keyword">float64</span> <span class="hljs-keyword">complex128</span> <span class="hljs-keyword">complex64</span>
          <span class="hljs-keyword">bool</span> <span class="hljs-keyword">byte</span> <span class="hljs-keyword">rune</span> <span class="hljs-keyword">string</span> error

内建函数: <span class="hljs-built_in">make</span> <span class="hljs-built_in">len</span> <span class="hljs-built_in">cap</span> <span class="hljs-built_in">new</span> <span class="hljs-built_in">append</span> <span class="hljs-built_in">copy</span> <span class="hljs-built_in">close</span> <span class="hljs-built_in">delete</span>
          <span class="hljs-built_in">complex</span> <span class="hljs-built_in">real</span> <span class="hljs-built_in">imag</span>
          <span class="hljs-built_in">panic</span> <span class="hljs-built_in">recover</span>
</code></pre><p>这些内部预先定义的名字并不是关键字，可以在定义中重新使用它们。</p>
<h2><a id="toc-86e" class="anchor" href="#toc-86e"></a>声明</h2>
<blockquote>
<p>声明语句定义了程序的各种实体对象以及部分或全部的属性。 </p>
</blockquote>
<ul>
<li>Go语言主要有四种类型的声明语句：<code>var</code>、<code>const</code>、<code>type</code>和<code>func</code>，分别对应变量、常量、类型和函数实体对象的声明。</li>
<li>一个Go语言编写的程序对应一个或多个以<code>.go</code>为文件后缀名的源文件中。  </li>
<li>每个源文件以包的声明语句开始，说明该源文件是属于哪个包。  </li>
<li>包声明语句之后是import语句导入依赖的其它包然后是包一级的类型、变量、常量、函数的声明语句。</li>
<li>包一级的各种类型的声明语句的顺序无关紧要。 </li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-comment">//当前程序包名称</span>
<span class="hljs-keyword">package</span> main

<span class="hljs-comment">//导入外部包</span>
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
)

<span class="hljs-comment">//常量</span>
<span class="hljs-keyword">const</span> TEL = <span class="hljs-number">18284151024</span>

<span class="hljs-comment">//包级别变量</span>
<span class="hljs-keyword">var</span> name = <span class="hljs-string">"zxysilent"</span>

<span class="hljs-comment">// 新类型</span>
<span class="hljs-keyword">type</span> Int <span class="hljs-keyword">int</span>

<span class="hljs-comment">//结构体</span>
<span class="hljs-keyword">type</span> S <span class="hljs-keyword">struct</span>{}

<span class="hljs-comment">// 方法</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(s S)</span> <span class="hljs-title">Test</span><span class="hljs-params">()</span></span> {}

<span class="hljs-comment">//接口</span>
<span class="hljs-keyword">type</span> obj <span class="hljs-keyword">interface</span>{}

<span class="hljs-comment">//函数</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">// 多个变量的声明</span>
    <span class="hljs-keyword">var</span> a, b, c <span class="hljs-keyword">int</span>
    <span class="hljs-comment">// 多个变量的赋值</span>
    a, b, c = <span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>
    <span class="hljs-comment">// 多个变量的声明同时赋值</span>
    <span class="hljs-keyword">var</span> d, e, f <span class="hljs-keyword">int</span> = <span class="hljs-number">4</span>, <span class="hljs-number">5</span>, <span class="hljs-number">6</span>
    <span class="hljs-comment">// 多个变量的省略类型的声明赋值(编译器推断类型)</span>
    <span class="hljs-keyword">var</span> g, h, i = <span class="hljs-number">7</span>, <span class="hljs-number">8</span>, <span class="hljs-number">9</span>
    fmt.Println(a, b, c, d, e, f, g, h, i)
    fmt.Println(<span class="hljs-string">"hello,word"</span>)
}
</code></pre>
<h2><a id="toc-ddc" class="anchor" href="#toc-ddc"></a>变量</h2>
<blockquote>
<p>var声明语句可以创建一个特定类型的变量，然后给变量附加一个名字，并且设置变量的初始值。</p>
</blockquote>
<p>变量声明的一般语法如下： </p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> 变量名字 类型 = 表达式
</code></pre>
<p>其中<strong>类型</strong>或<strong>= 表达式</strong>两个部分可以省略其中的一个。</p>
<h3><a id="toc-225" class="anchor" href="#toc-225"></a>默认值</h3>
<ul>
<li>数值类型变量对应的零值是0。</li>
<li>布尔类型变量对应的零值是false 。</li>
<li>字符串类型对应的零值是空字符串。 </li>
<li>接口或引用类型（包括slice、指针、map、chan和函数）变量对应的零值是nil。</li>
<li>数组或结构体等聚合类型对应的零值是每个元素或字段都是对应该类型的零值。</li>
</ul>
<p>零值初始化机制可以确保每个声明的变量总是有一个良好定义的值，因此在Go语言中不存在未初始化的变量。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> s <span class="hljs-keyword">string</span>
fmt.Println(s) <span class="hljs-comment">// ""</span>
</code></pre>
<h3><a id="xxx" class="anchor" href="#xxx"></a>xxx</h3>
<ul>
<li>一个声明语句中同时声明一组变量，或用一组初始化表达式声明并初始化一组变量。</li>
<li>如果省略每个变量的类型，将可以声明多个类型不同的变量（类型由初始化表达式推导）：</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> i, j, k <span class="hljs-keyword">int</span>                 <span class="hljs-comment">// int, int, int</span>
<span class="hljs-keyword">var</span> b, f, s = <span class="hljs-literal">true</span>, <span class="hljs-number">2.3</span>, <span class="hljs-string">"four"</span> <span class="hljs-comment">// bool, float64, string</span>
</code></pre>
<p>初始化表达式可以是字面量或任意的表达式。在包级别声明的变量会在main入口函数执行<strong>前</strong>完成初始化,局部变量将在声明语句被执行到的时候完成初始化。</p>
<ul>
<li>一组变量也可以通过调用一个函数，由函数返回的多个返回值初始化：</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> f, err = os.Open(<span class="hljs-string">"filename"</span>) <span class="hljs-comment">//打开文件</span>
</code></pre>
<h3><a id="toc-c5a" class="anchor" href="#toc-c5a"></a>简短变量声明</h3>
<p>在函数内部，有一种称为简短变量声明语句的形式可用于声明和初始化局部变量。<br>它以<code>名字 := 表达式</code>形式声明变量，变量的类型根据表达式来自动推导。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    z := <span class="hljs-string">"zxysilent"</span>
    fmt.Println(z)
}
</code></pre>
<p>简短变量声明被广泛用于大部分的局部变量的声明和初始化。
var形式的声明语句往往是用于需要显式指定变量类型的地方，或者因为变量稍后会被重新赋值而初始值无关紧要的地方。</p>
<pre><code class="hljs lang-go">i := <span class="hljs-number">100</span>                  <span class="hljs-comment">// an int</span>
<span class="hljs-keyword">var</span> boiling <span class="hljs-keyword">float64</span> = <span class="hljs-number">100</span> <span class="hljs-comment">// a float64</span>
<span class="hljs-keyword">var</span> names []<span class="hljs-keyword">string</span>
<span class="hljs-keyword">var</span> err error
<span class="hljs-keyword">var</span> p Point
</code></pre>
<p>简短变量声明语句也可以用来声明和初始化一组变量</p>
<pre><code class="hljs lang-go">i, j := <span class="hljs-number">0</span>, <span class="hljs-number">1</span>
</code></pre>
<p><strong>✍</strong>
<strong>:=</strong>是一个变量声明语句，而<strong>=</strong>是一个变量赋值操作。Ⓜ️做题面试才会考</p>
<pre><code class="hljs lang-Go">i, j = j, i <span class="hljs-comment">// 交换 i 和 j 的值</span>
</code></pre>
<p>和普通var形式的变量声明语句一样，简短变量声明语句也可以用函数的返回值来声明和初始化变量，像下面的os.Open函数调用将返回两个值：</p>
<pre><code class="hljs lang-go">f, err := os.Open(name)
<span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
    <span class="hljs-keyword">return</span> err
}
f.Close()
</code></pre>
<p>简短变量声明左边的变量可能并不是全部都是刚刚声明的。<br>如果有一些已经在<strong>相同的词法域</strong>声明过了，那么简短变量声明语句对这些已经声明过的变量就只有赋值行为了。</p>
<pre><code class="hljs lang-go">in, err := os.Open(<span class="hljs-string">"inputFile"</span>)
<span class="hljs-comment">// ...</span>
out, err := os.Create(<span class="hljs-string">"outputFile"</span>)
</code></pre>
<p>简短变量声明语句只有对已经在同级词法域声明过的变量才和赋值操作语句等价，如果变量是在外部词法域声明的，那么简短变量声明语句将会在当前词法域重新声明一个新的变量</p>
<h3><a id="toc-4cc" class="anchor" href="#toc-4cc"></a>指针</h3>
<ul>
<li>用<code>var x int</code>声明语句声明一个x变量那么<code>&amp;x</code>表达式将产生一个指向该整数变量的指针 </li>
<li>指针对应的数据类型是<code>*int</code>，指针被称之为“指向int类型的指针”。</li>
<li>如果指针名字为<code>p</code>，那么就说“p指针指向变量<code>x</code>”，或者说“p指针保存了x变量的内存地址”。</li>
<li>同时<code>*p</code>表达式对应p指针指向的变量的值。 </li>
</ul>
<pre><code class="hljs lang-go">x := <span class="hljs-number">1</span>
p := &amp;x         
fmt.Println(*p) 
*p = <span class="hljs-number">2</span>  
fmt.Println(x)  
</code></pre>
<p>返回函数中局部变量的地址也是安全的。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> p = f()

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">f</span><span class="hljs-params">()</span> *<span class="hljs-title">int</span></span> {
    v := <span class="hljs-number">1</span>
    <span class="hljs-keyword">return</span> &amp;v
}
</code></pre>
<p>指针包含了一个变量的地址，将指针作为参数调用函数，可以在函数中通过该指针来更新变量的值。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">add</span><span class="hljs-params">(p *<span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span>{
    *p++ 
        <span class="hljs-keyword">return</span> *p
}

v := <span class="hljs-number">1</span>
add(&amp;v) 
fmt.Println(add(&amp;v)) 
</code></pre>
<p>每次我们对一个变量取地址，或者复制指针，我们都是为原变量创建了新的别名。</p>
<h3><a id="toc-d8f" class="anchor" href="#toc-d8f"></a>new函数</h3>
<p>另一个创建变量的方法是调用内建的new函数。 表达式<code>new(T)</code>将创建一个<code>T</code>类型的匿名变量，初始化为T类型的零值，然后返回变量<strong>地址</strong>，返回的指针类型为<code>*T</code>。</p>
<pre><code class="hljs lang-go">p := <span class="hljs-built_in">new</span>(<span class="hljs-keyword">int</span>)   <span class="hljs-comment">// p, *int 类型, 指向匿名的 int 变量</span>
fmt.Println(*p) <span class="hljs-comment">// "0"</span>
*p = <span class="hljs-number">2</span>          <span class="hljs-comment">// 设置 int 匿名变量的值为 2</span>
fmt.Println(*p) <span class="hljs-comment">// "2"</span>
</code></pre>
<p>用new创建变量和普通变量声明语句方式创建变量没有什么区别，<code>new</code>函数类似是一种语法糖，而不是一个新的基础概念。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">newInt</span><span class="hljs-params">()</span> *<span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">return</span> <span class="hljs-built_in">new</span>(<span class="hljs-keyword">int</span>)
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">newInt</span><span class="hljs-params">()</span> *<span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">var</span> dummy <span class="hljs-keyword">int</span>
    <span class="hljs-keyword">return</span> &amp;dummy
}
</code></pre>
<p>上面的两个函数有着相同的行为。<br>由于new只是一个预定义的函数，可以将new名字重新定义为别的类型。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">f</span><span class="hljs-params">(old, <span class="hljs-built_in">new</span> <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
  <span class="hljs-keyword">return</span> <span class="hljs-built_in">new</span> - old
}
</code></pre>
<p>new被定义为int类型的变量名，在函数内部是无法使用内置的new函数。</p>
<h3><a id="toc-176" class="anchor" href="#toc-176"></a>生命周期</h3>
<p>变量的生命周期指的是在程序运行期间变量有效存在的时间段。</p>
<ul>
<li>包一级声明的变量的生命周期和整个程序的运行周期是一致的。</li>
<li>局部变量的生命周期则是动态的：每次从创建一个新变量的声明语句开始，直到该变量不再被引用为止，然后变量的存储空间可能被回收。</li>
<li>函数的参数变量和返回值变量都是局部变量。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>

<span class="hljs-keyword">var</span> v = <span class="hljs-string">"1.0"</span>

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    z := <span class="hljs-string">"zxysilent"</span>
    fmt.Println(z)
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">2</span>; i++ {
        fmt.Println(i)
    }
    fmt.Println(add(<span class="hljs-number">10</span>, <span class="hljs-number">20</span>))
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">add</span><span class="hljs-params">(a, b <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">return</span> a + b
}
</code></pre>
<p>编译器会自动选择在栈上还是在堆上分配局部变量的存储空间，不是由用var还是new声明变量的方式决定的。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> global *<span class="hljs-keyword">int</span>

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">f</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">var</span> x <span class="hljs-keyword">int</span>
    x = <span class="hljs-number">1</span>
    global = &amp;x
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">g</span><span class="hljs-params">()</span></span> {
    y := <span class="hljs-built_in">new</span>(<span class="hljs-keyword">int</span>)
    *y = <span class="hljs-number">1</span>
}
</code></pre>
<h2><a id="toc-8f4" class="anchor" href="#toc-8f4"></a>赋值</h2>
<p>使用赋值语句可以更新一个变量的值</p>
<pre><code class="hljs lang-fix"><span class="hljs-attr">被赋值的变量 </span>=<span class="hljs-string"> 新值的表达式
</span></code></pre><pre><code class="hljs lang-go">x = <span class="hljs-number">1</span>                    <span class="hljs-comment">// 命名变量的赋值</span>
*p = <span class="hljs-literal">true</span>                <span class="hljs-comment">// 通过指针间接赋值</span>
person.name = <span class="hljs-string">"bob"</span>      <span class="hljs-comment">// 结构体字段赋值</span>
count[x] = count[x] * <span class="hljs-number">10</span> <span class="hljs-comment">// 数组、slice或map的元素赋值</span>
count[x] *= <span class="hljs-number">100</span>
</code></pre>
<p>数值变量也可以支持<code>++</code>递增和<code>--</code>递减<strong>语句</strong><br>❗️只能在后面</p>
<pre><code class="hljs lang-go">v := <span class="hljs-number">1</span>
v++    <span class="hljs-comment">// 等价方式 v = v + 1；v 变成 2</span>
v--    <span class="hljs-comment">// 等价方式 v = v - 1；v 变成 1</span>
</code></pre>
<h3><a id="toc-6c7" class="anchor" href="#toc-6c7"></a>元组赋值 略</h3>
<ul>
<li>元组赋值是另一种形式的赋值语句，它允许同时更新多个变量的值。</li>
<li>在赋值之前，赋值语句右边的所有表达式将会先进行求值，然后再统一更新左边对应变量的值。  </li>
</ul>
<pre><code class="hljs lang-go">x, y = y, x
a[i], a[j] = a[j], a[i]
<span class="hljs-comment">//调用一个有多个返回值的函数</span>
f, err = os.Open(<span class="hljs-string">"foo.txt"</span>) 
</code></pre>
<p>情况列举</p>
<pre><code class="hljs lang-go">v, ok = m[key]        <span class="hljs-comment">// map</span>
v, ok = x.(T)         <span class="hljs-comment">// 断言</span>
v, ok = &lt;-ch          <span class="hljs-comment">// channel 接收</span>
v = m[key]            <span class="hljs-comment">// map查找，失败时返回零值</span>
v = x.(T)             <span class="hljs-comment">// type断言，失败时panic异常</span>
v = &lt;-ch              <span class="hljs-comment">// 管道接收，失败时返回零值（阻塞不算是失败）</span>
_, ok = m[key]        <span class="hljs-comment">// map返回2个值</span>
_, ok = mm[<span class="hljs-string">""</span>], <span class="hljs-literal">false</span> <span class="hljs-comment">// map返回1个值</span>
_ = mm[<span class="hljs-string">""</span>]            <span class="hljs-comment">// map返回1个值</span>
</code></pre>
<p>可以用下划线空白标识符<code>_</code>来丢弃不需要的值。</p>
<pre><code class="hljs lang-go">_, err = io.Copy(dst, src) <span class="hljs-comment">// 丢弃字节数</span>
_, ok = x.(T)              <span class="hljs-comment">// 只检测类型，忽略具体值</span>
</code></pre>
<h2><a id="toc-226" class="anchor" href="#toc-226"></a>类型</h2>
<p>变量或表达式的类型定义了对应存储值的属性特征，它们在内部是如何表达的，是否支持一些操作符，以及它们自己关联的方法集等。在任何程序中都会存在一些变量有着相同的内部结构，但是却表示完全不同的概念✏️。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">type</span> 类型名字 底层类型
</code></pre>
<p>类型声明语句一般出现在包一级，因此如果新创建的类型名字的首字符<strong>大写</strong>，则在包外部也可以使用。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
)

<span class="hljs-comment">// MyInt type 类型名字 底层类型</span>
<span class="hljs-keyword">type</span> MyInt <span class="hljs-keyword">int</span>

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(i MyInt)</span> <span class="hljs-title">String</span><span class="hljs-params">()</span> <span class="hljs-title">string</span></span> {
    <span class="hljs-keyword">return</span> fmt.Sprintf(<span class="hljs-string">"myint:%d"</span>, i)
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">var</span> i MyInt <span class="hljs-comment">//= 100</span>
    i = <span class="hljs-number">100</span>
    fmt.Println(i)
}
</code></pre>
<p>许多类型都会定义一个String方法，因为当使用fmt包的打印方法时，将会优先使用该类型对应的String方法返回的结果打印。</p>
<h2><a id="toc-2c1" class="anchor" href="#toc-2c1"></a>包和文件</h2>
<p>一个包的源代码保存在一个或多个以.go为文件后缀名的源文件中，通常一个包所在目录路径的后缀是包的导入路径。<br>目录结构<br><img src="/static/upload/20180716/upload_5a2c544d7fdf50069bc107ff35297f61.png" alt="alt"></p>
<p>⭐️ max</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> util

<span class="hljs-comment">//Max 大的一个</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">Max</span><span class="hljs-params">(a, b <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">if</span> a &gt; b {
        <span class="hljs-keyword">return</span> a
    }
    <span class="hljs-keyword">return</span> b
}
</code></pre>
<p>⭐️ min</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> util

<span class="hljs-comment">//Min 小的一个</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">Min</span><span class="hljs-params">(a, b <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">if</span> a &gt; b {
        <span class="hljs-keyword">return</span> b
    }
    <span class="hljs-keyword">return</span> a
}
</code></pre>
<p>⭐️ main</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"tmp/util"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    a, b := <span class="hljs-number">10</span>, <span class="hljs-number">20</span>
    fmt.Println(util.Min(a, b))
    fmt.Println(util.Max(a, b))
}
</code></pre>
<h3><a id="toc-f07" class="anchor" href="#toc-f07"></a>导入包</h3>
<ul>
<li>Go语言程序中，每个包都有一个全局唯一的导入路径。</li>
<li>一个导入路径代表一个目录中的一个或多个Go源文件。</li>
</ul>
<p>除了包的导入路径，每个包还有一个包名，包名一般是短小的名字（⚡️ 并不要求包名是唯一的），包名在包的声明处指定。
一个包的名字和包的导入路径的最后一个字段相同。</p>
<p>临时重命名</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    u <span class="hljs-string">"tmp/util"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    a, b := <span class="hljs-number">10</span>, <span class="hljs-number">20</span>
    fmt.Println(u.Min(a, b))
}
</code></pre>
<p>省掉包名</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    . <span class="hljs-string">"tmp/util"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    a, b := <span class="hljs-number">10</span>, <span class="hljs-number">20</span>
    fmt.Println(Min(a, b))
}
</code></pre>
<h3><a id="toc-118" class="anchor" href="#toc-118"></a>包的初始化</h3>
<p>包的初始化首先是解决包级变量的依赖顺序，然后按照包级变量声明出现的顺序依次初始化：</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> a = b + c <span class="hljs-comment">// a 第三个初始化, 为 3</span>
<span class="hljs-keyword">var</span> b = f()   <span class="hljs-comment">// b 第二个初始化, 为 2, 通过调用 f (依赖c)</span>
<span class="hljs-keyword">var</span> c = <span class="hljs-number">1</span>     <span class="hljs-comment">// c 第一个初始化, 为 1</span>

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">f</span><span class="hljs-params">()</span> <span class="hljs-title">int</span></span> { <span class="hljs-keyword">return</span> c + <span class="hljs-number">1</span> }
</code></pre>
<p>如果包中含有多个.go源文件，它们将按照发给编译器的顺序进行初始化，Go语言的构建工具首先会将.go文件根据文件名排序，然后依次调用编译器编译。
 init函数会优先于main函数执行</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">init</span><span class="hljs-params">()</span></span> { <span class="hljs-comment">/* ... */</span> }
</code></pre>
<p>在每个文件中的init初始化函数，在程序开始执行时按照它们声明的顺序被自动调用</p>
<p>✍min</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> util

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">init</span><span class="hljs-params">()</span></span> {
    fmt.Println(<span class="hljs-string">"init min"</span>)
}

<span class="hljs-comment">//Min 小的一个</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">Min</span><span class="hljs-params">(a, b <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">if</span> a &gt; b {
        <span class="hljs-keyword">return</span> b
    }
    <span class="hljs-keyword">return</span> a
}
</code></pre>
<p>结果<br><img src="/static/upload/20180716/upload_dec1426b7e10cc978b5122dbe81af62f.png" alt="alt"></p>
<p>init</p>
<p><img src="/static/upload/20180716/upload_ef96f0c2738ca9e195ecddd6f73abc33.png" alt="alt"></p>
<h2><a id="toc-f99" class="anchor" href="#toc-f99"></a>作用域 略</h2>
<ul>
<li>预声明标识符的作用域为全域块。</li>
<li>在顶级（即在任何函数之外）声明的表示常量、类型、变量或函数（而非方法）的标识符其作用域为该包块。</li>
<li>已导入包的包名作用域为包含该导入声明的文件块。</li>
<li>表示方法接收器、函数形参或返回值变量的标识符，其作用域为该函数体。</li>
<li>在函数中声明为常量或变量的标识符，其作用域始于该函数中具体常量实现或变量实现ShortVarDecl表示短变量声明）的结尾，止于最内部包含块的结尾。</li>
<li>在函数中声明为类型的标识符，其作用域始于该函数中具体类型实现的标识符，止于最内部包含块的结尾。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    x := <span class="hljs-string">"hello!"</span>
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-built_in">len</span>(x); i++ {
        x := x[i]
        <span class="hljs-keyword">if</span> x != <span class="hljs-string">''!''</span> {
            x := x + <span class="hljs-string">''A''</span> - <span class="hljs-string">''a''</span>
            fmt.Printf(<span class="hljs-string">"%c"</span>, x) <span class="hljs-comment">// "HELLO" </span>
        }
    }
}
</code></pre>
', 1, '2018-07-16 11:41:45', '2018-07-23 16:38:42', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('52', '4', '1', 0, 3, 'goweb-031-golang-基础数据类型', 'goweb-03-1', '<p>所有的数据都是由比特组成</p>
<h2 id="-">整型</h2>
<ul>
<li>Go语言的数值类型包括几种不同大小的整数、浮点数和复数。</li>
<li>每种数值类型都决定了对应的大小范围和是否支持正负符号。</li>
<li>Go语言同时提供了有符号和无符号类型的整数运算。</li>
</ul>
', '所有的数据都是由比特组成
## 整型

- Go语言的数值类型包括几种不同大小的整数、浮点数和复数。
- 每种数值类型都决定了对应的大小范围和是否支持正负符号。
- Go语言同时提供了有符号和无符号类型的整数运算。

<!--more-->
四种不同大小的有符号整数类型`int8`、`int16`、`int32`和`int64`，分别对应8、16、32、64bit大小，与此对应的是`uint8`、`uint16`、`uint32`和`uint64`四种无符号整数类型。

✋还有两种一般对应特定CPU平台机器字大小的有符号和无符号整数`int`和`uint`,其中`int`是应用最广泛的数值类型。

- Unicode字符rune类型是和int32等价的类型，通常用于表示一个Unicode码点。
- byte是uint8类型的等价类型，byte类型一般用于强调数值是一个原始的数据而不是一个小的整数。 
- 无符号的整数类型uintptr，没有指定具体的bit大小但是足以容纳指针。

❌ `int`和`int32`也是不同的类型，即使int的大小也是32bit。

1. 有符号整数采用2的补码形式表示，最高bit位用来表示符号位，一个n-bit的有符号数的值域是从`-2^(n-1)`到`2^(n-1)-1`。
2. 无符号整数的所有bit位都用于表示非负数，值域是`0`到`2^n-1`。  
eg: int8类型整数的值域是从-128到127，而uint8类型整数的值域是从0到255。
  
算术运算、逻辑运算和比较运算的二元运算符，按照优先级递减的顺序排列：

```go
*      /      %      <<       >>     &       &^
+      -      |      ^
==     !=     <      <=       >      >=
&&
||
```
二元运算符有五种优先级。在同一个优先级，使用左优先结合规则，但是使用括号可以明确优先顺序，使用括号也可以用于提升优先级，例如`mask & (1 << 28)`。

⛲️逻辑表达式的结果是**布尔**类型。

```go
==    等于
!=    不等于
<     小于
<=    小于等于
>     大于
>=    大于等于
```


⌛️ 一元的加法和减法运算符

```go
+      一元加法（无效果）
-      负数
```
2️⃣`bit`位操作运算符
前面4个操作运算符**不区分**是有符号还是无符号数

```go
&      位运算 AND
|      位运算 OR
^      位运算 XOR
&^     位清空（AND NOT）
<<     左移
>>     右移
```
位操作运算符`^`作为二元运算符时是按位异或（XOR），当用作一元运算符时表示按位取反,位操作运算符`&^`用于按位置零（AND NOT)

对于每种类型T，如果转换允许的话，类型转换操作`T(x)`将`x`转换为`T`类型
许多整数之间的相互转换并不会改变数值；它们只是告诉编译器如何解释这个值。  
 对于将一个大尺寸的整数类型转为一个小尺寸的整数类型，或者是将一个浮点数转为整数，可能会改变数值或丢失精度

```go
f := 3.141 // a float64
i := int(f)
fmt.Println(f, i) // "3.141 3"
f = 1.99
fmt.Println(int(f)) // "1"
```
整数字面值都可以用以`0`开始的八进制格式书写， 或用以`0x`或`0X`开头的十六进制格式书写。

```go
ioutil.WriteFile("fileName", []byte("xxx"), 0777)//rwx
```
## 浮点数
- Go语言提供了两种精度的浮点数，`float32`和`float64`。  
它们的算术规范由IEEE754浮点数国际标准定义。
- 浮点数的范围极限值可以在math包找到。  
 eg 常量`math.MaxFloat32`表示`float32`能表示的最大数值。

小数点前面或后面的数字都可能被省略（.707或1.）。也可以用科学计数法书写，通过`e`或`E`来指定指数部分
```go
const e = 10e2//1000
```
## 复数 
- 两种精度的复数类型：`complex64`和`complex128`，分别对应`float32`和`float64`两种浮点数精度。
- 内置的`complex`函数用于构建复数，`real`和`imag`函数分别返回复数的实部和虚部：

```go
//(a+bi)(c+di)=(ac－bd)+(bc+ad)i
var x complex128 = complex(1, 2) // 1+2i
var y complex128 = complex(3, 4) // 3+4i
fmt.Println(x * y)               // "(-5+10i)"
fmt.Println(real(x * y))         // "-5"
fmt.Println(imag(x * y))         // "10"
```
一个浮点数面值或一个十进制整数面值后面跟着一个i，（3.141592i或2i），它将构成一个复数的虚部，复数的实部是0：
```go
fmt.Println(1i * 1i) // "(-1+0i)", i^2 = -1
```
## 布尔
- 布尔类型的值只有两种：`true`和`false`。
- 逻辑运算符会产生布尔型的值。
- 一元操作符`!`对应逻辑非操作，`!true`的值为`false`。
- 布尔值和`&&`和`||`操作符结合可能会**短路**。
- 布尔值并不会隐式转换为数字值0或1，反之亦然。

## 字符串
- 一个字符串是一个不可改变的字节序列。
- 字符串可以包含任意的数据，通常是用来包含人类可读的文本。
- 文本字符串通常被解释为采用UTF8编码的Unicode码点（rune）序列。
- 内置的`len`函数可以返回一个字符串中的**字节**数目**不是**`rune`字符数目。
- 索引操作`s[i]`返回第i个字节的字节值，`i`必须满足`0 ≤ i< len(s)`条件约束。

```go
s := "hello, world"
fmt.Println(len(s))     // "12"
fmt.Println(s[0], s[7]) // "104 119" (''h'' and ''w'')
```
访问超出字符串索引范围的字节将会导致`panic`异常：
```go
c := s[len(s)] // panic: index out of range
```
第`i`个字节并**不一定**是字符串的第i个字符，对于非`ASCII`字符的`UTF8`编码会要两个或多个字节。

子字符串操作`s[i:j]`基于原始的`s`字符串的第`i`个字节开始到第`j`个字节**不包含**`j`生成一个新字符串。生成的新字符串将包含`j-i`个字节。

```go
fmt.Println(s[0:5]) // "hello"
```
`i`或者`j`都可能被忽略，当它们被忽略时将采用`0`作为开始位置，采用`len(s)`作为结束的位置。
```go
fmt.Println(s[:5]) // "hello"
fmt.Println(s[7:]) // "world"
fmt.Println(s[:])  // "hello, world"
```
`+`操作符将两个字符串连接构造一个新字符串

```go
fmt.Println("goodbye" + s[5:]) // "goodbye, world"
```

字符串可以用`==`和`<`进行比较；比较通过逐个字节比较完成的，比较的结果是字符串自然编码的顺序。

字符串的值是❌**不可变**的。
```go
func main() {
	s := "left"
	t := s
	s += ", right"
	fmt.Println(s, "<-->", t)
}
```
![alt](/static/upload/20180717/upload_3ec29358173c13b9631578a169b9e538.png)

字符串是不可修改的，修改字符串内部数据的操作也被禁止

```go
s[0] = ''L'' // compile error: cannot assign to s[0]
```

✌不变性意味着如果两个字符串共享相同的底层数据的话也是安全的，复制任何长度的字符串代价是低廉的。
![alt](/static/upload/20180717/upload_e347cfb7c716505218ee022f23d4fc0c.png)

### 字符串面值
字符串直接写在双引号里面
```
"Hello, 世界"
```
转义
```go
\a      响铃
\b      退格
\f      换页
\n      换行
\r      回车
\t      制表符
\v      垂直制表符
\''      单引号（只用在 ''\'''' 形式的rune符号面值中）
\"      双引号（只用在 "..." 形式的字符串面值中）
\\      反斜杠
```

可以通过十六进制或八进制转义在字符串面值中包含任意的字节
- **一个**十六进制的转义形式是`\xhh`，其中两个h表示十六进制数字（大写或小写都可以）。
- **一个**八进制转义形式是`\ooo`，包含三个八进制的o数字（0到7）,不能超过`\377`❓ 。

一个原生的字符串面值形式是\`...\`，使用反引号代替双引号。  
在原生的字符串面值中，没有转义操作；全部的内容都是字面的意思。
```
func main() {
	s := `
	很多
	很多\
	行`
	fmt.Println(s)
}
```
### Unicode
在很久以前，世界还是比较简单的，起码计算机世界就只有一个ASCII字符集：美国信息交换标准代码。ASCI，使用7bit来表示128个字符：包含英文字母的大小写、数字、各种标点符号和设备控制符。随着互联网的发展，混合多种语言的数据变得很常见。如何有效处理这些包含了各种语言的丰富多样的文本数据呢❓  
![alt](/static/upload/20180717/upload_fd5efab3ff8f6b10f2bcf905b1f9f778.png)

`Unicode`[ http://unicode.org]( http://unicode.org)，它收集了这个世界上所有的符号系统，包括重音符号和其它变音符号，制表符和回车符，还有很多神秘的符号，每个符号都分配一个唯一的Unicode码点。
###  UTF-8
- UTF8是一个将Unicode码点编码为字节序列的变长编码。UTF8编码是由Go语言之父Ken Thompson和Rob Pike共同发明的。
- UTF8编码使用1到4个字节来表示每个Unicode码点，ASCII部分字符只使用1个字节，常用字符部分使用2或3个字节表示。

每个符号编码后第一个字节的高端bit位用于表示编码总共有多少个字节。如果第一个字节的高端bit为0，则表示对应7bit的ASCII字符，ASCII字符每个字符依然是一个字节，和传统的ASCII编码兼容。如果第一个字节的高端bit是110，则说明需要2个字节；后续的每个高端bit都以10开头。

```
0xxxxxxx     
110xxxxx 10xxxxxx       
1110xxxx 10xxxxxx 10xxxxxx      
11110xxx 10xxxxxx 10xxxxxx 10xxxxxx 
```
### 字符串和Byte切片
字符串和Byte切片转换
```go
s := "zxysilent"
b := []byte(s)
s1 := string(b)
fmt.Println(s, b, s1)
```
标准库中有四个包对字符串处理尤为重要：`bytes`、`strings`、`strconv`和`unicode`包。  
- `strings`包提供了许多如字符串的查询、替换、比较、截断、拆分和合并等功能。
- `bytes`包也提供了很多类似功能的函数，但是针对和字符串有着相同结构的`[]byte`类型。
因为字符串是只读的，因此逐步构建字符串会导致很多分配和复制。在这种情况下，使用`bytes.Buffer`类型将会更有效。
- `strconv`包提供了布尔型、整型数、浮点数和对应字符串的相互转换，还提供了双引号转义相关的转换。
- `unicode`包提供了`IsDigit`、`IsUppe`r和`IsLower`等类似功能，它们用于给字符分类。

![alt](/static/upload/20180717/upload_9ff6d8fc5e0d6e9b22bd998232ffb780.png)

### 字符串和数字的转换

除了字符串、字符、字节之间的转换，字符串和数值之间的转换也比较常见。
`strconv`包提供这类转换功能。

将一个整数转为字符串，一种方法是用fmt.Sprintf返回一个格式化的字符串；另一个方法是用strconv.Itoa(“整数到ASCII”)：

```go
x := 123
y := fmt.Sprintf("%d", x)
fmt.Println(y, strconv.Itoa(x)) // "123 123"
```

`FormatInt`和`FormatUint`函数可以用不同的进制来格式化数字

```go
fmt.Println(strconv.FormatInt(int64(x), 2)) // "1111011"
```

`fmt.Printf`函数的`%b`、`%d`、`%o`和`%x`等也可用来格式化：

```go
s := fmt.Sprintf("x=%b", x) // "x=1111011"
```

将一个字符串解析为整数，可以使用`strconv`包的`Atoi`或`ParseInt`,`ParseUint`(无符号整数)函数

```go
x, err := strconv.Atoi("123")          
y, err := strconv.ParseInt("123", 10, 64) // base 10, up to 64 bits
```
`ParseInt`函数的第三个参数是用于指定整型数的大小；eg`16`表示`int16`，`0`则表示`int`， 返回的结果总是`int64`类型。
也可使用`fmt.Scanf`来解析输入的字符串和数字。
```go
fmt.Printf(format string, a ...interface{})
fmt.Fprintf(w io.Writer, format string, a ...interface{})
fmt.Sprintf(format string, a ...interface{})

fmt.Scanf(format string, a ...interface{})
fmt.Fscanf(r io.Reader, format string, a ...interface{})
fmt.Sscanf(str string, format string, a ...interface{})
```
## 常量
- 常量表达式的值在编译期计算，而不是在运行期。
- 每种常量的潜在类型都是基础类型。

```go
const pi = 3.14159
```
批量声明多个常量。

```go
const (
	e  = 2.718281
	pi = 3.141592
)
```


常量间的所有算术运算、逻辑运算和比较运算的结果也是常量，对常量的类型转换操作或以下函数调用都是返回常量结果：`len`、`cap`、`real`、`imag`、`complex`和`unsafe.Sizeof`。
```
const L=len("adcd")//4
const L = unsafe.Sizeof(int(1))//8
```
一个常量的声明也可以包含一个类型和一个值，但是如果没有显式指明类型，那么将从右边的表达式推断类型。通过%T参数打印类型信息

```Go
//type Duration int64
const noDelay time.Duration = 0
const timeout = 2 * time.Minute
fmt.Printf("%T %[1]v\n", noDelay) 
fmt.Printf("%T %[1]v\n", timeout)   
```
批量声明的常量，除了第一个外其它的常量右边的初始化表达式都可以省略，如果省略初始化表达式则表示使用前面常量的初始化表达式写法，对应的常量类型也一样的

```Go
const (
	a = 1
	b
	c = 2
	d
)

fmt.Println(a, b, c, d) // "1 1 2 2"
```
### iota 常量生成器
在一个`const`声明语句中，在**第一个**声明的常量所在的行，`iota`将会被置为`0`，然后在每一个有常量声明的行加一。

```go
const (
		a = iota
		b
		c
	)
	const (
		d = iota
		e
		f
	)
	fmt.Println(a, b, c, d, e, f)
```', '<div class="toc"><ul>
<li><a href="#toc-87c">整型</a></li>
<li><a href="#toc-40e">浮点数</a></li>
<li><a href="#toc-f2f">复数</a></li>
<li><a href="#toc-97b">布尔</a></li>
<li><a href="#toc-cc4">字符串</a><ul>
<li><a href="#toc-5d1">字符串面值</a></li>
<li><a href="#unicode">Unicode</a></li>
<li><a href="#utf-8">UTF-8</a></li>
<li><a href="#toc-6ac">字符串和Byte切片</a></li>
<li><a href="#toc-485">字符串和数字的转换</a></li>
</ul>
</li>
<li><a href="#toc-7cb">常量</a><ul>
<li><a href="#toc-d5b">iota 常量生成器</a></li>
</ul>
</li>
</ul>
</div><p>所有的数据都是由比特组成</p>
<h2><a id="toc-87c" class="anchor" href="#toc-87c"></a>整型</h2>
<ul>
<li>Go语言的数值类型包括几种不同大小的整数、浮点数和复数。</li>
<li>每种数值类型都决定了对应的大小范围和是否支持正负符号。</li>
<li>Go语言同时提供了有符号和无符号类型的整数运算。</li>
</ul>
<!--more-->
<p>四种不同大小的有符号整数类型<code>int8</code>、<code>int16</code>、<code>int32</code>和<code>int64</code>，分别对应8、16、32、64bit大小，与此对应的是<code>uint8</code>、<code>uint16</code>、<code>uint32</code>和<code>uint64</code>四种无符号整数类型。</p>
<p>✋还有两种一般对应特定CPU平台机器字大小的有符号和无符号整数<code>int</code>和<code>uint</code>,其中<code>int</code>是应用最广泛的数值类型。</p>
<ul>
<li>Unicode字符rune类型是和int32等价的类型，通常用于表示一个Unicode码点。</li>
<li>byte是uint8类型的等价类型，byte类型一般用于强调数值是一个原始的数据而不是一个小的整数。 </li>
<li>无符号的整数类型uintptr，没有指定具体的bit大小但是足以容纳指针。</li>
</ul>
<p>❌ <code>int</code>和<code>int32</code>也是不同的类型，即使int的大小也是32bit。</p>
<ol>
<li>有符号整数采用2的补码形式表示，最高bit位用来表示符号位，一个n-bit的有符号数的值域是从<code>-2^(n-1)</code>到<code>2^(n-1)-1</code>。</li>
<li>无符号整数的所有bit位都用于表示非负数，值域是<code>0</code>到<code>2^n-1</code>。<br>eg: int8类型整数的值域是从-128到127，而uint8类型整数的值域是从0到255。</li>
</ol>
<p>算术运算、逻辑运算和比较运算的二元运算符，按照优先级递减的顺序排列：</p>
<pre><code class="hljs lang-undefined">*      /      %      &lt;&lt;       &gt;&gt;     &amp;       &amp;^
+      -      |      ^
==     !=     &lt;      &lt;=       &gt;      &gt;=
&amp;&amp;
||
</code></pre>
<p>二元运算符有五种优先级。在同一个优先级，使用左优先结合规则，但是使用括号可以明确优先顺序，使用括号也可以用于提升优先级，例如<code>mask &amp; (1 &lt;&lt; 28)</code>。</p>
<p>⛲️逻辑表达式的结果是<strong>布尔</strong>类型。</p>
<pre><code class="hljs lang-undefined">==    等于
!=    不等于
&lt;     小于
&lt;=    小于等于
&gt;     大于
&gt;=    大于等于
</code></pre>
<p>⌛️ 一元的加法和减法运算符</p>
<pre><code class="hljs lang-undefined">+      一元加法（无效果）
-      负数
</code></pre>
<p>2️⃣<code>bit</code>位操作运算符
前面4个操作运算符<strong>不区分</strong>是有符号还是无符号数</p>
<pre><code class="hljs lang-undefined">&amp;      位运算 AND
|      位运算 OR
^      位运算 XOR
&amp;^     位清空（AND NOT）
&lt;&lt;     左移
&gt;&gt;     右移
</code></pre>
<p>位操作运算符<code>^</code>作为二元运算符时是按位异或（XOR），当用作一元运算符时表示按位取反,位操作运算符<code>&amp;^</code>用于按位置零（AND NOT)</p>
<p>对于每种类型T，如果转换允许的话，类型转换操作<code>T(x)</code>将<code>x</code>转换为<code>T</code>类型
许多整数之间的相互转换并不会改变数值；它们只是告诉编译器如何解释这个值。<br> 对于将一个大尺寸的整数类型转为一个小尺寸的整数类型，或者是将一个浮点数转为整数，可能会改变数值或丢失精度</p>
<pre><code class="hljs lang-go">f := <span class="hljs-number">3.141</span> <span class="hljs-comment">// a float64</span>
i := <span class="hljs-keyword">int</span>(f)
fmt.Println(f, i) <span class="hljs-comment">// "3.141 3"</span>
f = <span class="hljs-number">1.99</span>
fmt.Println(<span class="hljs-keyword">int</span>(f)) <span class="hljs-comment">// "1"</span>
</code></pre>
<p>整数字面值都可以用以<code>0</code>开始的八进制格式书写， 或用以<code>0x</code>或<code>0X</code>开头的十六进制格式书写。</p>
<pre><code class="hljs lang-go">ioutil.WriteFile(<span class="hljs-string">"fileName"</span>, []<span class="hljs-keyword">byte</span>(<span class="hljs-string">"xxx"</span>), <span class="hljs-number">0777</span>)<span class="hljs-comment">//rwx</span>
</code></pre>
<h2><a id="toc-40e" class="anchor" href="#toc-40e"></a>浮点数</h2>
<ul>
<li>Go语言提供了两种精度的浮点数，<code>float32</code>和<code>float64</code>。<br>它们的算术规范由IEEE754浮点数国际标准定义。</li>
<li>浮点数的范围极限值可以在math包找到。<br>eg 常量<code>math.MaxFloat32</code>表示<code>float32</code>能表示的最大数值。</li>
</ul>
<p>小数点前面或后面的数字都可能被省略（.707或1.）。也可以用科学计数法书写，通过<code>e</code>或<code>E</code>来指定指数部分</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">const</span> e = <span class="hljs-number">10e2</span><span class="hljs-comment">//1000</span>
</code></pre>
<h2><a id="toc-f2f" class="anchor" href="#toc-f2f"></a>复数</h2>
<ul>
<li>两种精度的复数类型：<code>complex64</code>和<code>complex128</code>，分别对应<code>float32</code>和<code>float64</code>两种浮点数精度。</li>
<li>内置的<code>complex</code>函数用于构建复数，<code>real</code>和<code>imag</code>函数分别返回复数的实部和虚部：</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-comment">//(a+bi)(c+di)=(ac－bd)+(bc+ad)i</span>
<span class="hljs-keyword">var</span> x <span class="hljs-keyword">complex128</span> = <span class="hljs-built_in">complex</span>(<span class="hljs-number">1</span>, <span class="hljs-number">2</span>) <span class="hljs-comment">// 1+2i</span>
<span class="hljs-keyword">var</span> y <span class="hljs-keyword">complex128</span> = <span class="hljs-built_in">complex</span>(<span class="hljs-number">3</span>, <span class="hljs-number">4</span>) <span class="hljs-comment">// 3+4i</span>
fmt.Println(x * y)               <span class="hljs-comment">// "(-5+10i)"</span>
fmt.Println(<span class="hljs-built_in">real</span>(x * y))         <span class="hljs-comment">// "-5"</span>
fmt.Println(<span class="hljs-built_in">imag</span>(x * y))         <span class="hljs-comment">// "10"</span>
</code></pre>
<p>一个浮点数面值或一个十进制整数面值后面跟着一个i，（3.141592i或2i），它将构成一个复数的虚部，复数的实部是0：</p>
<pre><code class="hljs lang-go">fmt.Println(<span class="hljs-number">1i</span> * <span class="hljs-number">1i</span>) <span class="hljs-comment">// "(-1+0i)", i^2 = -1</span>
</code></pre>
<h2><a id="toc-97b" class="anchor" href="#toc-97b"></a>布尔</h2>
<ul>
<li>布尔类型的值只有两种：<code>true</code>和<code>false</code>。</li>
<li>逻辑运算符会产生布尔型的值。</li>
<li>一元操作符<code>!</code>对应逻辑非操作，<code>!true</code>的值为<code>false</code>。</li>
<li>布尔值和<code>&amp;&amp;</code>和<code>||</code>操作符结合可能会<strong>短路</strong>。</li>
<li>布尔值并不会隐式转换为数字值0或1，反之亦然。</li>
</ul>
<h2><a id="toc-cc4" class="anchor" href="#toc-cc4"></a>字符串</h2>
<ul>
<li>一个字符串是一个不可改变的字节序列。</li>
<li>字符串可以包含任意的数据，通常是用来包含人类可读的文本。</li>
<li>文本字符串通常被解释为采用UTF8编码的Unicode码点（rune）序列。</li>
<li>内置的<code>len</code>函数可以返回一个字符串中的<strong>字节</strong>数目<strong>不是</strong><code>rune</code>字符数目。</li>
<li>索引操作<code>s[i]</code>返回第i个字节的字节值，<code>i</code>必须满足<code>0 ≤ i&lt; len(s)</code>条件约束。</li>
</ul>
<pre><code class="hljs lang-go">s := <span class="hljs-string">"hello, world"</span>
fmt.Println(<span class="hljs-built_in">len</span>(s))     <span class="hljs-comment">// "12"</span>
fmt.Println(s[<span class="hljs-number">0</span>], s[<span class="hljs-number">7</span>]) <span class="hljs-comment">// "104 119" (''h'' and ''w'')</span>
</code></pre>
<p>访问超出字符串索引范围的字节将会导致<code>panic</code>异常：</p>
<pre><code class="hljs lang-go">c := s[<span class="hljs-built_in">len</span>(s)] <span class="hljs-comment">// panic: index out of range</span>
</code></pre>
<p>第<code>i</code>个字节并<strong>不一定</strong>是字符串的第i个字符，对于非<code>ASCII</code>字符的<code>UTF8</code>编码会要两个或多个字节。</p>
<p>子字符串操作<code>s[i:j]</code>基于原始的<code>s</code>字符串的第<code>i</code>个字节开始到第<code>j</code>个字节<strong>不包含</strong><code>j</code>生成一个新字符串。生成的新字符串将包含<code>j-i</code>个字节。</p>
<pre><code class="hljs lang-go">fmt.Println(s[<span class="hljs-number">0</span>:<span class="hljs-number">5</span>]) <span class="hljs-comment">// "hello"</span>
</code></pre>
<p><code>i</code>或者<code>j</code>都可能被忽略，当它们被忽略时将采用<code>0</code>作为开始位置，采用<code>len(s)</code>作为结束的位置。</p>
<pre><code class="hljs lang-go">fmt.Println(s[:<span class="hljs-number">5</span>]) <span class="hljs-comment">// "hello"</span>
fmt.Println(s[<span class="hljs-number">7</span>:]) <span class="hljs-comment">// "world"</span>
fmt.Println(s[:])  <span class="hljs-comment">// "hello, world"</span>
</code></pre>
<p><code>+</code>操作符将两个字符串连接构造一个新字符串</p>
<pre><code class="hljs lang-go">fmt.Println(<span class="hljs-string">"goodbye"</span> + s[<span class="hljs-number">5</span>:]) <span class="hljs-comment">// "goodbye, world"</span>
</code></pre>
<p>字符串可以用<code>==</code>和<code>&lt;</code>进行比较；比较通过逐个字节比较完成的，比较的结果是字符串自然编码的顺序。</p>
<p>字符串的值是❌<strong>不可变</strong>的。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    s := <span class="hljs-string">"left"</span>
    t := s
    s += <span class="hljs-string">", right"</span>
    fmt.Println(s, <span class="hljs-string">"&lt;--&gt;"</span>, t)
}
</code></pre>
<p><img src="/static/upload/20180717/upload_3ec29358173c13b9631578a169b9e538.png" alt="alt"></p>
<p>字符串是不可修改的，修改字符串内部数据的操作也被禁止</p>
<pre><code class="hljs lang-go">s[<span class="hljs-number">0</span>] = <span class="hljs-string">''L''</span> <span class="hljs-comment">// compile error: cannot assign to s[0]</span>
</code></pre>
<p>✌不变性意味着如果两个字符串共享相同的底层数据的话也是安全的，复制任何长度的字符串代价是低廉的。
<img src="/static/upload/20180717/upload_e347cfb7c716505218ee022f23d4fc0c.png" alt="alt"></p>
<h3><a id="toc-5d1" class="anchor" href="#toc-5d1"></a>字符串面值</h3>
<p>字符串直接写在双引号里面</p>
<pre><code class="hljs lang-1c"><span class="hljs-string">"Hello, 世界"</span>
</code></pre><p>转义</p>
<pre><code class="hljs lang-go">\a      响铃
\b      退格
\f      换页
\n      换行
\r      回车
\t      制表符
\v      垂直制表符
\<span class="hljs-string">''      单引号（只用在 ''</span>\<span class="hljs-string">'''' 形式的rune符号面值中）
\"      双引号（只用在 "..." 形式的字符串面值中）
\\      反斜杠
</span></code></pre>
<p>可以通过十六进制或八进制转义在字符串面值中包含任意的字节</p>
<ul>
<li><strong>一个</strong>十六进制的转义形式是<code>\xhh</code>，其中两个h表示十六进制数字（大写或小写都可以）。</li>
<li><strong>一个</strong>八进制转义形式是<code>\ooo</code>，包含三个八进制的o数字（0到7）,不能超过<code>\377</code>❓ 。</li>
</ul>
<p>一个原生的字符串面值形式是`...`，使用反引号代替双引号。<br>在原生的字符串面值中，没有转义操作；全部的内容都是字面的意思。</p>
<pre><code class="hljs lang-css"><span class="hljs-selector-tag">func</span> <span class="hljs-selector-tag">main</span>() {
    <span class="hljs-attribute">s </span>:= `
    很多
    很多\
    行`
    fmt.<span class="hljs-built_in">Println</span>(s)
}
</code></pre><h3><a id="unicode" class="anchor" href="#unicode"></a>Unicode</h3>
<p>在很久以前，世界还是比较简单的，起码计算机世界就只有一个ASCII字符集：美国信息交换标准代码。ASCI，使用7bit来表示128个字符：包含英文字母的大小写、数字、各种标点符号和设备控制符。随着互联网的发展，混合多种语言的数据变得很常见。如何有效处理这些包含了各种语言的丰富多样的文本数据呢❓<br><img src="/static/upload/20180717/upload_fd5efab3ff8f6b10f2bcf905b1f9f778.png" alt="alt"></p>
<p><code>Unicode</code><a href="http://unicode.org"> http://unicode.org</a>，它收集了这个世界上所有的符号系统，包括重音符号和其它变音符号，制表符和回车符，还有很多神秘的符号，每个符号都分配一个唯一的Unicode码点。</p>
<h3><a id="utf-8" class="anchor" href="#utf-8"></a>UTF-8</h3>
<ul>
<li>UTF8是一个将Unicode码点编码为字节序列的变长编码。UTF8编码是由Go语言之父Ken Thompson和Rob Pike共同发明的。</li>
<li>UTF8编码使用1到4个字节来表示每个Unicode码点，ASCII部分字符只使用1个字节，常用字符部分使用2或3个字节表示。</li>
</ul>
<p>每个符号编码后第一个字节的高端bit位用于表示编码总共有多少个字节。如果第一个字节的高端bit为0，则表示对应7bit的ASCII字符，ASCII字符每个字符依然是一个字节，和传统的ASCII编码兼容。如果第一个字节的高端bit是110，则说明需要2个字节；后续的每个高端bit都以10开头。</p>
<pre><code class="hljs lang-lsl"><span class="hljs-number">0</span>xxxxxxx     
<span class="hljs-number">110</span>xxxxx <span class="hljs-number">10</span>xxxxxx       
<span class="hljs-number">1110</span>xxxx <span class="hljs-number">10</span>xxxxxx <span class="hljs-number">10</span>xxxxxx      
<span class="hljs-number">11110</span>xxx <span class="hljs-number">10</span>xxxxxx <span class="hljs-number">10</span>xxxxxx <span class="hljs-number">10</span>xxxxxx 
</code></pre><h3><a id="toc-6ac" class="anchor" href="#toc-6ac"></a>字符串和Byte切片</h3>
<p>字符串和Byte切片转换</p>
<pre><code class="hljs lang-go">s := <span class="hljs-string">"zxysilent"</span>
b := []<span class="hljs-keyword">byte</span>(s)
s1 := <span class="hljs-keyword">string</span>(b)
fmt.Println(s, b, s1)
</code></pre>
<p>标准库中有四个包对字符串处理尤为重要：<code>bytes</code>、<code>strings</code>、<code>strconv</code>和<code>unicode</code>包。  </p>
<ul>
<li><code>strings</code>包提供了许多如字符串的查询、替换、比较、截断、拆分和合并等功能。</li>
<li><code>bytes</code>包也提供了很多类似功能的函数，但是针对和字符串有着相同结构的<code>[]byte</code>类型。
因为字符串是只读的，因此逐步构建字符串会导致很多分配和复制。在这种情况下，使用<code>bytes.Buffer</code>类型将会更有效。</li>
<li><code>strconv</code>包提供了布尔型、整型数、浮点数和对应字符串的相互转换，还提供了双引号转义相关的转换。</li>
<li><code>unicode</code>包提供了<code>IsDigit</code>、<code>IsUppe</code>r和<code>IsLower</code>等类似功能，它们用于给字符分类。</li>
</ul>
<p><img src="/static/upload/20180717/upload_9ff6d8fc5e0d6e9b22bd998232ffb780.png" alt="alt"></p>
<h3><a id="toc-485" class="anchor" href="#toc-485"></a>字符串和数字的转换</h3>
<p>除了字符串、字符、字节之间的转换，字符串和数值之间的转换也比较常见。
<code>strconv</code>包提供这类转换功能。</p>
<p>将一个整数转为字符串，一种方法是用fmt.Sprintf返回一个格式化的字符串；另一个方法是用strconv.Itoa(“整数到ASCII”)：</p>
<pre><code class="hljs lang-go">x := <span class="hljs-number">123</span>
y := fmt.Sprintf(<span class="hljs-string">"%d"</span>, x)
fmt.Println(y, strconv.Itoa(x)) <span class="hljs-comment">// "123 123"</span>
</code></pre>
<p><code>FormatInt</code>和<code>FormatUint</code>函数可以用不同的进制来格式化数字</p>
<pre><code class="hljs lang-go">fmt.Println(strconv.FormatInt(<span class="hljs-keyword">int64</span>(x), <span class="hljs-number">2</span>)) <span class="hljs-comment">// "1111011"</span>
</code></pre>
<p><code>fmt.Printf</code>函数的<code>%b</code>、<code>%d</code>、<code>%o</code>和<code>%x</code>等也可用来格式化：</p>
<pre><code class="hljs lang-go">s := fmt.Sprintf(<span class="hljs-string">"x=%b"</span>, x) <span class="hljs-comment">// "x=1111011"</span>
</code></pre>
<p>将一个字符串解析为整数，可以使用<code>strconv</code>包的<code>Atoi</code>或<code>ParseInt</code>,<code>ParseUint</code>(无符号整数)函数</p>
<pre><code class="hljs lang-go">x, err := strconv.Atoi(<span class="hljs-string">"123"</span>)          
y, err := strconv.ParseInt(<span class="hljs-string">"123"</span>, <span class="hljs-number">10</span>, <span class="hljs-number">64</span>) <span class="hljs-comment">// base 10, up to 64 bits</span>
</code></pre>
<p><code>ParseInt</code>函数的第三个参数是用于指定整型数的大小；eg<code>16</code>表示<code>int16</code>，<code>0</code>则表示<code>int</code>， 返回的结果总是<code>int64</code>类型。
也可使用<code>fmt.Scanf</code>来解析输入的字符串和数字。</p>
<pre><code class="hljs lang-go">fmt.Printf(format <span class="hljs-keyword">string</span>, a ...<span class="hljs-keyword">interface</span>{})
fmt.Fprintf(w io.Writer, format <span class="hljs-keyword">string</span>, a ...<span class="hljs-keyword">interface</span>{})
fmt.Sprintf(format <span class="hljs-keyword">string</span>, a ...<span class="hljs-keyword">interface</span>{})

fmt.Scanf(format <span class="hljs-keyword">string</span>, a ...<span class="hljs-keyword">interface</span>{})
fmt.Fscanf(r io.Reader, format <span class="hljs-keyword">string</span>, a ...<span class="hljs-keyword">interface</span>{})
fmt.Sscanf(str <span class="hljs-keyword">string</span>, format <span class="hljs-keyword">string</span>, a ...<span class="hljs-keyword">interface</span>{})
</code></pre>
<h2><a id="toc-7cb" class="anchor" href="#toc-7cb"></a>常量</h2>
<ul>
<li>常量表达式的值在编译期计算，而不是在运行期。</li>
<li>每种常量的潜在类型都是基础类型。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">const</span> pi = <span class="hljs-number">3.14159</span>
</code></pre>
<p>批量声明多个常量。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">const</span> (
    e  = <span class="hljs-number">2.718281</span>
    pi = <span class="hljs-number">3.141592</span>
)
</code></pre>
<p>常量间的所有算术运算、逻辑运算和比较运算的结果也是常量，对常量的类型转换操作或以下函数调用都是返回常量结果：<code>len</code>、<code>cap</code>、<code>real</code>、<code>imag</code>、<code>complex</code>和<code>unsafe.Sizeof</code>。</p>
<pre><code class="hljs lang-cs"><span class="hljs-keyword">const</span> L=len(<span class="hljs-string">"adcd"</span>)<span class="hljs-comment">//4</span>
<span class="hljs-keyword">const</span> L = <span class="hljs-keyword">unsafe</span>.Sizeof(<span class="hljs-keyword">int</span>(<span class="hljs-number">1</span>))<span class="hljs-comment">//8</span>
</code></pre><p>一个常量的声明也可以包含一个类型和一个值，但是如果没有显式指明类型，那么将从右边的表达式推断类型。通过%T参数打印类型信息</p>
<pre><code class="hljs lang-Go"><span class="hljs-comment">//type Duration int64</span>
<span class="hljs-keyword">const</span> noDelay time.Duration = <span class="hljs-number">0</span>
<span class="hljs-keyword">const</span> timeout = <span class="hljs-number">2</span> * time.Minute
fmt.Printf(<span class="hljs-string">"%T %[1]v\n"</span>, noDelay) 
fmt.Printf(<span class="hljs-string">"%T %[1]v\n"</span>, timeout)   
</code></pre>
<p>批量声明的常量，除了第一个外其它的常量右边的初始化表达式都可以省略，如果省略初始化表达式则表示使用前面常量的初始化表达式写法，对应的常量类型也一样的</p>
<pre><code class="hljs lang-Go"><span class="hljs-keyword">const</span> (
    a = <span class="hljs-number">1</span>
    b
    c = <span class="hljs-number">2</span>
    d
)

fmt.Println(a, b, c, d) <span class="hljs-comment">// "1 1 2 2"</span>
</code></pre>
<h3><a id="toc-d5b" class="anchor" href="#toc-d5b"></a>iota 常量生成器</h3>
<p>在一个<code>const</code>声明语句中，在<strong>第一个</strong>声明的常量所在的行，<code>iota</code>将会被置为<code>0</code>，然后在每一个有常量声明的行加一。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">const</span> (
        a = <span class="hljs-literal">iota</span>
        b
        c
    )
    <span class="hljs-keyword">const</span> (
        d = <span class="hljs-literal">iota</span>
        e
        f
    )
    fmt.Println(a, b, c, d, e, f)
</code></pre>
', 1, '2018-07-16 16:40:28', '2018-07-23 16:39:29', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('53', '4', '1', 0, 3, 'goweb-032-golang-复合数据类型', 'goweb-03-2', '<h2 id="-">流程控制</h2>
<p> 类比 <code>clang</code></p>
<h3 id="if">if</h3>
<ul>
<li>条件表达式没有括号</li>
<li>左大括号必须和条件语句或<code>else</code>在同一行</li>
</ul>
', '## 流程控制
 类比 `clang`

### if
- 条件表达式没有括号
- 左大括号必须和条件语句或`else`在同一行
<!--more--> 

```go
package main
func main() {
	a,b:=1,2
	// 没有小括号
	if a>b{
		println(b)
	}else{
		print(a)
	}
}

```
- 支持一个初始化表达式（可以是并行方式）
- 支持单行模式
```go
package main
func main() {
	if a,b:=1,2;a>b{
		println(b)
	}else{
		print(a)
	}
}
```
- 初始化语句中的变量为`block`级别，同时隐藏外部同名变量
```go
package main
func main() {
	var a =true
	if a,b:=1,2;a>b{
		println(b)
	}else{
		print(a)
	}
	println(a)
}
```

### for
* Go只有`for`一个循环语句关键字，但支持3种形式
* 初始化和步进表达式可以是多个值
* 条件语句每次循环都会被重新检查，因此**不建议**在条件语句中使用函数，尽量提前计算好条件并以变量或常量代替
* 左大括号必须和条件语句在同一行
```go
package main
func main() {
	for{
		//死循环
	}
}
```
```go
package main
func main() {
	flag := 1
	//while
	for flag < 5 {
		flag++
		println(flag)
	}
}
```
```go
package main
func main() {
	//index:=1
	// for ;index < 5;index++ {
	// 	println(index)
	// }

	for idx:=0;idx<5;idx++{
		println(idx)
	}
}
```

### switch
* 可以使用任何类型或表达式作为条件语句
* 不需要写`break`，一旦条件符合自动终止
* 如希望继续执行下一个`case`，需使用`fallthrough`语句
* 支持一个初始化表达式（可以是并行方式），右侧需跟分号
* 左大括号必须和条件语句在同一行
```go
package main
func main() {
	swh := 1
	switch swh {
	case 0:
		println(0)
	case 1:
		{
			println(1)
			println("OK")
		}
	default:
		println("default")
	}
}
```
```go
package main
func main() {
	switch swh:=1;{
	case swh > 0:
		println(0)
		fallthrough
	case swh == 1:
		{
			println("OK")
		} 
	default:
		println("default")
	}
}
```

### goto, break, continue
* 三个语法都可以配合标签使用
* 标签名区分大小写，若不使用会造成编译错误
* `break`与`continue`配合标签可用于多层循环的跳出**标签同级**
* `goto`是**调整执行位置**，与其它2个语句配合标签的结果并不相同
```go
package main
func main() {
	FLG:
	for{
		for i:=0;i<10;i++{
			if i>2{
				break FLG
			}else{
				println(i)
			}
		}
	}
}
```   
```go
package main
func main() {
FLG:
	for i := 0; i < 10; i++ {
		for {
			println(i)
			continue FLG
		}
	}
}
```
将上面中的continue替换成goto，程序运行的结果还一样吗❓

## 数组

- 数组是一个由固定长度的特定类型元素组成的序列，一个数组可以由零个或多个元素组成。
- 数组的每个元素可以通过索引下标来访问，索引下标的范围是从0开始到数组长度减1的位置。
- 内置的len函数将返回数组中元素的个数。
- **值类型** 数组的长度是数组类型的一个组成部分，因此[3]int和[4]int是两种不同的数组类型。

```go
var a [3]int           
fmt.Println(a[0])        
fmt.Println(a[len(a)-1]) 

for i, v := range a {
	fmt.Printf("%d %d\n", i, v)
}

// Print the elements only.
for _, v := range a {
	fmt.Printf("%d\n", v)
}
```

数组的每个元素都被初始化为元素类型对应的零值，也可以使用数组字面值语法用一组值来初始化数组。

```go
var q [3]int = [3]int{1, 2, 3}
var r [3]int = [3]int{1, 2}
fmt.Println(r[2]) // "0"
```

在数组字面值中，如果在数组的长度位置出现的是“...”省略号，则表示数组的长度是根据初始化值的个数来计算。
```go
q := [...]int{1, 2, 3}
fmt.Printf("%T\n", q) // "[3]int"
```
数组的长度必须是常量表达式，因为数组的长度需要在编译阶段确定。

```go
q := [3]int{1, 2, 3}
q = [4]int{1, 2, 3, 4} // compile error: cannot assign [4]int to [3]int
```
可以指定一个索引和对应值列表的方式初始化，初始化索引的顺序是无关紧要的。

```go
func main() {
	arr := [...]int{2: 10}
	fmt.Println(arr)//[0 0 10]
}
```

```
package main
import "fmt"
func main() {
	var arr1 [5]int = [5]int{}
	arr1[1] = 99
	var arr2 = [4]int{}
	// paintln 只能输出简单类型
	//println(arr1)
	fmt.Println(arr1)
	// 不同的类型不能比较
	//invalid operation: arr1 == arr2 (mismatched types [5]int and [4]int)
	// if arr1 == arr2 {
	// 	fmt.Println("arr1==arr2")
	// }
	//指向数组的指针
	var arr3 = new([3]int)
	fmt.Println(&arr2, arr3)
	// 由编译器推断数组大小
	arr4 := [...]int{1, 2, 3, 4, 5, 6, 10: 9}
	fmt.Println(arr4, len(arr4))
	// 值类型 copy
	arr5 := arr4
	fmt.Printf("%p,%p\n", &arr4[1], &arr5[1])
	//arr6:=[2][3]int{}
        //多维数组
	arr6 := [2][3]int{
		{1, 2, 3},
		{4, 5, 6},
	}
	fmt.Println(arr6)
}
```
### range
* 完整使用方式 `for k,v:=range arr{  /* do something*/}`
* 索引方式 `for item:=range {  /* do something*/}`
* 值方式 `for _,v:=range arr{/* do something*/}`
```go
package main
import "fmt"
func main() {
var arr = [10]int{2, 3, 4, 5, 6, 7, 8, 9}
	for k,v:=range arr{
		fmt.Println(k,v)
		//i:=0
		//fmt.Printf("i:%p\n",&i)
		fmt.Printf("%p,%p\n",&k,&v)
	}
	println("oth")
	for item:=range arr{
		fmt.Println(item)
	}
	for _,v:=range arr{
		fmt.Println(v)
	}
}
```

##  Slice

- Slice（切片）代表变长的序列，序列中每个元素都有相同的类型。
- 一个slice类型一般写作`[]T`，其中`T`代表`slice`中元素的类型。
- 变长数组啦 

```
type slice struct{
      len  int
      cap  int
      data point
}
```
数组和slice之间有着紧密的联系。  
一个slice由三个部分构成：指针、长度和容量。  
指针指向第一个slice元素对应的底层数组元素的地址，`slice`的第一个元素**不一定**就是数组的第一个元素。  
长度对应slice中元素的数目；长度不能超过容量，容量一般是从slice的开始位置到**底层数据**的结尾位置。  
`len`和`cap`函数分别返回slice的长度和容量。

![alt](/static/upload/20180717/upload_3fa5906635be890fe02429ba7b8a61b7.png)

多个slice之间可以共享底层的数据，并且引用的数组部分区间可能重叠。  
字符串的切片操作和`[]byte`字节类型切片的切片操作是类似的。都写作`x[m:n]`，并且都是返回一个原始字节系列的子序列，底层都是共享之前的底层数组，因此这种操作都是常量时间复杂度。

```go
Array_ori := [...]byte{''a'', ''b'', ''c'', ''d'', ''e'', ''f'', ''h'', ''i'', ''j'', ''k''}
Slice_a := Array_ori[2:5]
Slice_b:= Array_ori[3:5]
fmt.Println(Array_ori, len(Array_ori))
fmt.Println(Slice_a, len(Slice_a), cap(Slice_a))
fmt.Println(Slice_b, len(Slice_b), cap(Slice_b))
```
![alt](/static/upload/20180717/upload_384221ee8c9cb1eff19c567c2cf891df.png)

slice唯一合法的比较操作是和`nil`比较。

```go
if summer == nil { /* ... */ }
```
一个零值的`slice`等于`nil`。一个`nil`值的`slice`并没有底层数组。一个`nil`值的`slice`的长度和容量都是`0`。
但也有非`nil`值的`slice`的长度和容量也是`0`的。

```go
var s []int    // len(s) == 0, s == nil
s = nil        // len(s) == 0, s == nil
s = []int(nil) // len(s) == 0, s == nil
s = []int{}    // len(s) == 0, s != nil
```
内置的make函数创建一个指定元素类型、长度和容量的`slice`。容量部分可以省略(容量将等于长度)。
```go
make([]T, len)
make([]T, len, cap) 
```
### append函数
内置的append函数用于向slice追加元素

```go
var arr []rune
for _, r := range "Hello,世界" {
	arr = append(arr, r)
}
fmt.Println(arr) //[72 101 108 108 111 44 19990 30028]
//%q 单引号围绕的字符字面值
fmt.Printf("%q\n", arr) // [''H'' ''e'' ''l'' ''l'' ''o'' '','' ''世'' ''界'']
```
append函数则可以追加多个元素，甚至追加一个slice。
**面向过程**
```go
var x []int
x = append(x, 1)
x = append(x, 2, 3)
x = append(x, 4, 5, 6)
x = append(x, x...) // append the slice x
fmt.Println(x)      // "[1 2 3 4 5 6 1 2 3 4 5 6]"
```
## Map
- 无序的`key/value`对的集合，其中所有的`key`都是不同的，然后通过给定的`key`可以在常数时间复杂度内检索、更新或删除对应的`value`。
- 一个`map`就是一个哈希表的引用，`map`类型可以写为`map[K]V`，其中`K`和`V`分别对应`key`和`value`的数据类型，`key`和`value`可以是不同的数据类型。
- `K`对应的`key`必须是支持`==`比较运算符的数据类型，`V`对应的`value`数据类型则没有限制。

内置的make函数可以创建一个map：

```go
ages := make(map[string]int) 
```
也可以用map字面值的语法创建`map`，同时还可以指定一些最初的`key/value`。

```go
ages := map[string]int{
	"zxy":   24,
	"zxysilent": 24,
}
```
等价于
```go
ages := make(map[string]int)
ages["zxy"] =24
ages["zxysilent"] = 24
```
创建空的`map`的表达式是`map[string]int{}`。

`Map`中的元素通过`ke`y对应的下标语法访问。
```go
ages["zxy"] = 32
fmt.Println(ages["zxy"]) // "32"
```

内置的delete函数可以删除元素。

```go
delete(ages, "zxy") 
```

⚠️所有这些操作是安全的，即使这些元素不在map中也没有关系；如果一个查找失败将返回value类型对应的零值。
```go
ages["xxx"] = ages["xxx"] + 1
```

`x += y`和`x++`等简短赋值语法也可以用在map上。

```go
ages["xxx"] += 1
```
更简单的写法
```go
ages["xxx"]++
```
不能对map的元素进行取址操作⁉️。


遍历 `map`
```go
ages := make(map[string]int)
ages["zxysilent"] = 24
ages["zxy"] = 24
for k, v := range ages {
	fmt.Println(k, v)
}
fmt.Println("------------")
for k := range ages {
	fmt.Println(k)
}
fmt.Println("------------")
for _, v := range ages {
	fmt.Println(v)
}
```
遍历的顺序是随机的

map上的大部分操作，包括查找、删除、len和range循环都可以安全工作在nil值的map上，它们的行为和一个空的map类似。但向一个nil值的map存入元素将导致一个panic异常：

```go
ages["carol"] = 21 // panic: assignment to entry in nil map
```
⛔️在向map存数据前必须先创建map。

通过key作为索引下标来访问map将产生一个value。如果key在map中是存在的，那么将得到与key对应的value；如果key不存在，那么将得到value对应类型的零值，有时候可能需要知道对应的元素是否真的是在map之中。
```go
age, ok := ages["zxy"]
if !ok { /* todo */ }
```
变成一行
```go
if age, ok := ages["bob"]; !ok { /* ... */ }
```
map的下标语法将产生两个值；第二个是一个布尔值，用于报告元素是否真的存在。

## 结构体

- 结构体是一种聚合的数据类型，是由零个或多个任意类型的值聚合成的实体。
- 每个值称为结构体的成员。

```go
// Person 结构体 描述人
type Person struct {
	Name     string    //姓名
	Age      int       //年龄
	Addr     string    //地址
	Birthday time.Time //生日
}

var zxy Person
```
声明了一个叫`Person`的**命名**的结构体类型，并且声明了一个`Person`类型的变量`zxy`。
`zxy`结构体变量的成员可以通过点操作符访问。

```Go
zxy.Name = "曾祥银"
fmt.Println(zxy.Name)
```
对成员取地址，然后通过指针访问。

```go
age := &zxy.Age
*age = 24
fmt.Println(zxy.Age)
```

指向结构体的**指针**也可用点操作符。

```go
alias := &zxy
alias.Age = 24
fmt.Println(zxy.Age)
(*alias).Age = 24
fmt.Println(zxy.Age)
```
一个命名为`S`的结构体类型将不能再包含`S`类型的成员但可以包含`*S`指针类型的成员。

```go
type tree struct {
	data interface{}
	left  *tree
	right *tree
}
```
### 结构体字面值

结构体值也可以用结构体字面值表示，结构体字面值可以指定每个成员的值。

两种形式的结构体字面值语法：
1. 以结构体成员定义的顺序为每个结构体成员指定一个字面值。
2. 以成员名字和相应的值来初始化，可以包含部分或全部的成员，顺序并不重要❗️。

```go
type Point struct {
	X int
	Y int
}

func main() {
	p := Point{1, 2}
	p1 := Point{
		Y: 10,
		X: 3,
	}
}
```


结构体可以作为函数的参数和返回值。

```go
func Scale(p Point, f int) Point {
	return Point{p.X * f, p.Y * f}
}
fmt.Println(Scale(Point{1, 2}, 5)) // "{5 10}"
```

较大的结构体通常会用指针的方式传入和返回，
要在函数内部修改结构体成员的话，用指针传入是必须的⛵️(值传递)。 


创建并初始化一个结构体变量，并返回结构体的地址。
```go
p := &Point{1, 2}
```
等价于
```go
p := new(Point)
*p = Point{1, 2}
```

- 结构体类型的零值是每个成员都是零值。
- 结构体没有任何成员的话就是空结构体，写作struct{}。

### 结构体高级操作


```
//Point 一个点
type Point struct {
	X int
	Y int
}

//Circle 圆
type Circle struct {
	Point      //圆心//嵌套结构体匿名成员
	Radius int //半径
}

func main() {
	c := Circle{
		Point:  Point{0, 0},
		Radius: 10,
	}
	c1 := Circle{Point{0, 0}, 10}
	c1.X
	c1.Point.X
}
```
## JSON

- `JavaScript`对象表示法（`JSON`）是一种用于发送和接收结构化信息的标准协议。
还有 `XML`、`Protocol Buffers`等。

- 标准库支持 `encoding/json` ✴️

序列化/编码 `Marshal`   
> Go语言的数据结构数据转换为`json`字符串

```go
//Point 一个点
type Point struct {
	X int
	Y int
}

//Circle 圆
type Circle struct {
	Point      //圆心
	Radius int //半径
}

func main() {
	c := Circle{
		Point:  Point{1, 2},
		Radius: 10,
	}
	//序列化
	buf, _ := json.Marshal(c)
	fmt.Println(buf)         //[123 34 88 34 58 49 44 34 89 34 58 50 44 34 82 97 100 105 117 115 34 58 49 48 125]
	fmt.Println(string(buf)) //{"X":1,"Y":2,"Radius":10}
}
```

在编码时，默认使用Go语言结构体的成员名字作为JSON的对象。
一个结构体成员标签`Tag`可以修改映射关系
```
//Circle 圆
type Circle struct {
	Point      //圆心
	Radius int `json:"半径"` //半径
}

c := Circle{
	Point:  Point{1, 2},
	Radius: 10,
}
//序列化
buf, _ := json.Marshal(c)
fmt.Println(string(buf)) //{"X":1,"Y":2,"半径":10}
```
反序列化/解码 `Unmarshal`  
> `json`字符串转换为Go语言的数据结构  


```go
s := `{"X":1,"Y":2,"半径":10}`
	c := Circle{}
	json.Unmarshal([]byte(s), &c)
	fmt.Println(c)//{{1 2} 10}
```

## 文本和HTML模板
- Go语言提供了对模板的支持(数据驱动模板）在"text/template"和"html/template"两个包下。
- 使用方式类似，`html/template`主要针对`html` 而`text/template` 主要针对文本。


```
package main

import (
	"html/template"
	"os"
)

// Person 结构体 描述人
type Person struct {
	Name string   //姓名
	Age  int      //年龄
	Addr string   //地址
	Arr  []string //oth
}

const str = `
	<html>
	<head>
		<title>template</title>
	</head>
	<body>
		<h2>{{.Name}}</h2>
		<ul>
			{{range $k,$v := .Arr}}
				<li>{{$v}}</li>
			{{end}}
		</ul>
	</body>
	</html>
`

func main() {
	z := Person{
		Name: "曾祥银",
		Age:  24,
		Arr:  []string{"A", "B", "C", "D"},
	}
	t, _ := template.New("模板名称").Parse(str) //.ParseFiles 读取文件
	t.Execute(os.Stdout, z)                 //os.Stdout 标准输出流 相当于 fmt.Ptintln
}
```
![alt](/static/upload/20180718/upload_e303d556ef4d21630148c18102b4a006.png)


官方文档
[https://golang.google.cn/pkg/html/template/](https://golang.google.cn/pkg/html/template/)
', '<div class="toc"><ul>
<li><a href="#toc-cf4">流程控制</a><ul>
<li><a href="#if">if</a></li>
<li><a href="#for">for</a></li>
<li><a href="#switch">switch</a></li>
<li><a href="#goto-break-continue">goto, break, continue</a></li>
</ul>
</li>
<li><a href="#toc-0e6">数组</a><ul>
<li><a href="#range">range</a></li>
</ul>
</li>
<li><a href="#slice">Slice</a><ul>
<li><a href="#toc-394">append函数</a></li>
</ul>
</li>
<li><a href="#map">Map</a></li>
<li><a href="#toc-9d9">结构体</a><ul>
<li><a href="#toc-3ba">结构体字面值</a></li>
<li><a href="#toc-987">结构体高级操作</a></li>
</ul>
</li>
<li><a href="#json">JSON</a></li>
<li><a href="#toc-998">文本和HTML模板</a></li>
</ul>
</div><h2><a id="toc-cf4" class="anchor" href="#toc-cf4"></a>流程控制</h2>
<p> 类比 <code>clang</code></p>
<h3><a id="if" class="anchor" href="#if"></a>if</h3>
<ul>
<li>条件表达式没有括号</li>
<li>左大括号必须和条件语句或<code>else</code>在同一行<!--more--> 
</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    a,b:=<span class="hljs-number">1</span>,<span class="hljs-number">2</span>
    <span class="hljs-comment">// 没有小括号</span>
    <span class="hljs-keyword">if</span> a&gt;b{
        <span class="hljs-built_in">println</span>(b)
    }<span class="hljs-keyword">else</span>{
        <span class="hljs-built_in">print</span>(a)
    }
}

</code></pre>
<ul>
<li>支持一个初始化表达式（可以是并行方式）</li>
<li>支持单行模式<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  <span class="hljs-keyword">if</span> a,b:=<span class="hljs-number">1</span>,<span class="hljs-number">2</span>;a&gt;b{
      <span class="hljs-built_in">println</span>(b)
  }<span class="hljs-keyword">else</span>{
      <span class="hljs-built_in">print</span>(a)
  }
}
</code></pre>
</li>
<li>初始化语句中的变量为<code>block</code>级别，同时隐藏外部同名变量<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  <span class="hljs-keyword">var</span> a =<span class="hljs-literal">true</span>
  <span class="hljs-keyword">if</span> a,b:=<span class="hljs-number">1</span>,<span class="hljs-number">2</span>;a&gt;b{
      <span class="hljs-built_in">println</span>(b)
  }<span class="hljs-keyword">else</span>{
      <span class="hljs-built_in">print</span>(a)
  }
  <span class="hljs-built_in">println</span>(a)
}
</code></pre>
</li>
</ul>
<h3><a id="for" class="anchor" href="#for"></a>for</h3>
<ul>
<li>Go只有<code>for</code>一个循环语句关键字，但支持3种形式</li>
<li>初始化和步进表达式可以是多个值</li>
<li>条件语句每次循环都会被重新检查，因此<strong>不建议</strong>在条件语句中使用函数，尽量提前计算好条件并以变量或常量代替</li>
<li><p>左大括号必须和条件语句在同一行</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  <span class="hljs-keyword">for</span>{
      <span class="hljs-comment">//死循环</span>
  }
}
</code></pre>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  flag := <span class="hljs-number">1</span>
  <span class="hljs-comment">//while</span>
  <span class="hljs-keyword">for</span> flag &lt; <span class="hljs-number">5</span> {
      flag++
      <span class="hljs-built_in">println</span>(flag)
  }
}
</code></pre>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  <span class="hljs-comment">//index:=1</span>
  <span class="hljs-comment">// for ;index &lt; 5;index++ {</span>
  <span class="hljs-comment">//     println(index)</span>
  <span class="hljs-comment">// }</span>

  <span class="hljs-keyword">for</span> idx:=<span class="hljs-number">0</span>;idx&lt;<span class="hljs-number">5</span>;idx++{
      <span class="hljs-built_in">println</span>(idx)
  }
}
</code></pre>
</li>
</ul>
<h3><a id="switch" class="anchor" href="#switch"></a>switch</h3>
<ul>
<li>可以使用任何类型或表达式作为条件语句</li>
<li>不需要写<code>break</code>，一旦条件符合自动终止</li>
<li>如希望继续执行下一个<code>case</code>，需使用<code>fallthrough</code>语句</li>
<li>支持一个初始化表达式（可以是并行方式），右侧需跟分号</li>
<li>左大括号必须和条件语句在同一行<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  swh := <span class="hljs-number">1</span>
  <span class="hljs-keyword">switch</span> swh {
  <span class="hljs-keyword">case</span> <span class="hljs-number">0</span>:
      <span class="hljs-built_in">println</span>(<span class="hljs-number">0</span>)
  <span class="hljs-keyword">case</span> <span class="hljs-number">1</span>:
      {
          <span class="hljs-built_in">println</span>(<span class="hljs-number">1</span>)
          <span class="hljs-built_in">println</span>(<span class="hljs-string">"OK"</span>)
      }
  <span class="hljs-keyword">default</span>:
      <span class="hljs-built_in">println</span>(<span class="hljs-string">"default"</span>)
  }
}
</code></pre>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  <span class="hljs-keyword">switch</span> swh:=<span class="hljs-number">1</span>;{
  <span class="hljs-keyword">case</span> swh &gt; <span class="hljs-number">0</span>:
      <span class="hljs-built_in">println</span>(<span class="hljs-number">0</span>)
      <span class="hljs-keyword">fallthrough</span>
  <span class="hljs-keyword">case</span> swh == <span class="hljs-number">1</span>:
      {
          <span class="hljs-built_in">println</span>(<span class="hljs-string">"OK"</span>)
      } 
  <span class="hljs-keyword">default</span>:
      <span class="hljs-built_in">println</span>(<span class="hljs-string">"default"</span>)
  }
}
</code></pre>
</li>
</ul>
<h3><a id="goto-break-continue" class="anchor" href="#goto-break-continue"></a>goto, break, continue</h3>
<ul>
<li>三个语法都可以配合标签使用</li>
<li>标签名区分大小写，若不使用会造成编译错误</li>
<li><code>break</code>与<code>continue</code>配合标签可用于多层循环的跳出<strong>标签同级</strong></li>
<li><code>goto</code>是<strong>调整执行位置</strong>，与其它2个语句配合标签的结果并不相同<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  FLG:
  <span class="hljs-keyword">for</span>{
      <span class="hljs-keyword">for</span> i:=<span class="hljs-number">0</span>;i&lt;<span class="hljs-number">10</span>;i++{
          <span class="hljs-keyword">if</span> i&gt;<span class="hljs-number">2</span>{
              <span class="hljs-keyword">break</span> FLG
          }<span class="hljs-keyword">else</span>{
              <span class="hljs-built_in">println</span>(i)
          }
      }
  }
}
</code></pre>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
FLG:
  <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">10</span>; i++ {
      <span class="hljs-keyword">for</span> {
          <span class="hljs-built_in">println</span>(i)
          <span class="hljs-keyword">continue</span> FLG
      }
  }
}
</code></pre>
将上面中的continue替换成goto，程序运行的结果还一样吗❓</li>
</ul>
<h2><a id="toc-0e6" class="anchor" href="#toc-0e6"></a>数组</h2>
<ul>
<li>数组是一个由固定长度的特定类型元素组成的序列，一个数组可以由零个或多个元素组成。</li>
<li>数组的每个元素可以通过索引下标来访问，索引下标的范围是从0开始到数组长度减1的位置。</li>
<li>内置的len函数将返回数组中元素的个数。</li>
<li><strong>值类型</strong> 数组的长度是数组类型的一个组成部分，因此[3]int和[4]int是两种不同的数组类型。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> a [<span class="hljs-number">3</span>]<span class="hljs-keyword">int</span>           
fmt.Println(a[<span class="hljs-number">0</span>])        
fmt.Println(a[<span class="hljs-built_in">len</span>(a)<span class="hljs-number">-1</span>]) 

<span class="hljs-keyword">for</span> i, v := <span class="hljs-keyword">range</span> a {
    fmt.Printf(<span class="hljs-string">"%d %d\n"</span>, i, v)
}

<span class="hljs-comment">// Print the elements only.</span>
<span class="hljs-keyword">for</span> _, v := <span class="hljs-keyword">range</span> a {
    fmt.Printf(<span class="hljs-string">"%d\n"</span>, v)
}
</code></pre>
<p>数组的每个元素都被初始化为元素类型对应的零值，也可以使用数组字面值语法用一组值来初始化数组。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> q [<span class="hljs-number">3</span>]<span class="hljs-keyword">int</span> = [<span class="hljs-number">3</span>]<span class="hljs-keyword">int</span>{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>}
<span class="hljs-keyword">var</span> r [<span class="hljs-number">3</span>]<span class="hljs-keyword">int</span> = [<span class="hljs-number">3</span>]<span class="hljs-keyword">int</span>{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>}
fmt.Println(r[<span class="hljs-number">2</span>]) <span class="hljs-comment">// "0"</span>
</code></pre>
<p>在数组字面值中，如果在数组的长度位置出现的是“...”省略号，则表示数组的长度是根据初始化值的个数来计算。</p>
<pre><code class="hljs lang-go">q := [...]<span class="hljs-keyword">int</span>{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>}
fmt.Printf(<span class="hljs-string">"%T\n"</span>, q) <span class="hljs-comment">// "[3]int"</span>
</code></pre>
<p>数组的长度必须是常量表达式，因为数组的长度需要在编译阶段确定。</p>
<pre><code class="hljs lang-go">q := [<span class="hljs-number">3</span>]<span class="hljs-keyword">int</span>{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>}
q = [<span class="hljs-number">4</span>]<span class="hljs-keyword">int</span>{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>, <span class="hljs-number">4</span>} <span class="hljs-comment">// compile error: cannot assign [4]int to [3]int</span>
</code></pre>
<p>可以指定一个索引和对应值列表的方式初始化，初始化索引的顺序是无关紧要的。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    arr := [...]<span class="hljs-keyword">int</span>{<span class="hljs-number">2</span>: <span class="hljs-number">10</span>}
    fmt.Println(arr)<span class="hljs-comment">//[0 0 10]</span>
}
</code></pre>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">var</span> arr1 [<span class="hljs-number">5</span>]<span class="hljs-keyword">int</span> = [<span class="hljs-number">5</span>]<span class="hljs-keyword">int</span>{}
    arr1[<span class="hljs-number">1</span>] = <span class="hljs-number">99</span>
    <span class="hljs-keyword">var</span> arr2 = [<span class="hljs-number">4</span>]<span class="hljs-keyword">int</span>{}
    <span class="hljs-comment">// paintln 只能输出简单类型</span>
    <span class="hljs-comment">//println(arr1)</span>
    fmt.Println(arr1)
    <span class="hljs-comment">// 不同的类型不能比较</span>
    <span class="hljs-comment">//invalid operation: arr1 == arr2 (mismatched types [5]int and [4]int)</span>
    <span class="hljs-comment">// if arr1 == arr2 {</span>
    <span class="hljs-comment">//     fmt.Println("arr1==arr2")</span>
    <span class="hljs-comment">// }</span>
    <span class="hljs-comment">//指向数组的指针</span>
    <span class="hljs-keyword">var</span> arr3 = <span class="hljs-built_in">new</span>([<span class="hljs-number">3</span>]<span class="hljs-keyword">int</span>)
    fmt.Println(&amp;arr2, arr3)
    <span class="hljs-comment">// 由编译器推断数组大小</span>
    arr4 := [...]<span class="hljs-keyword">int</span>{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>, <span class="hljs-number">4</span>, <span class="hljs-number">5</span>, <span class="hljs-number">6</span>, <span class="hljs-number">10</span>: <span class="hljs-number">9</span>}
    fmt.Println(arr4, <span class="hljs-built_in">len</span>(arr4))
    <span class="hljs-comment">// 值类型 copy</span>
    arr5 := arr4
    fmt.Printf(<span class="hljs-string">"%p,%p\n"</span>, &amp;arr4[<span class="hljs-number">1</span>], &amp;arr5[<span class="hljs-number">1</span>])
    <span class="hljs-comment">//arr6:=[2][3]int{}</span>
        <span class="hljs-comment">//多维数组</span>
    arr6 := [<span class="hljs-number">2</span>][<span class="hljs-number">3</span>]<span class="hljs-keyword">int</span>{
        {<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>},
        {<span class="hljs-number">4</span>, <span class="hljs-number">5</span>, <span class="hljs-number">6</span>},
    }
    fmt.Println(arr6)
}
</code></pre><h3><a id="range" class="anchor" href="#range"></a>range</h3>
<ul>
<li>完整使用方式 <code>for k,v:=range arr{  /* do something*/}</code></li>
<li>索引方式 <code>for item:=range {  /* do something*/}</code></li>
<li>值方式 <code>for _,v:=range arr{/* do something*/}</code><pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
<span class="hljs-keyword">var</span> arr = [<span class="hljs-number">10</span>]<span class="hljs-keyword">int</span>{<span class="hljs-number">2</span>, <span class="hljs-number">3</span>, <span class="hljs-number">4</span>, <span class="hljs-number">5</span>, <span class="hljs-number">6</span>, <span class="hljs-number">7</span>, <span class="hljs-number">8</span>, <span class="hljs-number">9</span>}
  <span class="hljs-keyword">for</span> k,v:=<span class="hljs-keyword">range</span> arr{
      fmt.Println(k,v)
      <span class="hljs-comment">//i:=0</span>
      <span class="hljs-comment">//fmt.Printf("i:%p\n",&amp;i)</span>
      fmt.Printf(<span class="hljs-string">"%p,%p\n"</span>,&amp;k,&amp;v)
  }
  <span class="hljs-built_in">println</span>(<span class="hljs-string">"oth"</span>)
  <span class="hljs-keyword">for</span> item:=<span class="hljs-keyword">range</span> arr{
      fmt.Println(item)
  }
  <span class="hljs-keyword">for</span> _,v:=<span class="hljs-keyword">range</span> arr{
      fmt.Println(v)
  }
}
</code></pre>
</li>
</ul>
<h2><a id="slice" class="anchor" href="#slice"></a>Slice</h2>
<ul>
<li>Slice（切片）代表变长的序列，序列中每个元素都有相同的类型。</li>
<li>一个slice类型一般写作<code>[]T</code>，其中<code>T</code>代表<code>slice</code>中元素的类型。</li>
<li>变长数组啦 </li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">type</span> slice <span class="hljs-keyword">struct</span>{
      <span class="hljs-built_in">len</span>  <span class="hljs-keyword">int</span>
      <span class="hljs-built_in">cap</span>  <span class="hljs-keyword">int</span>
      data point
}
</code></pre><p>数组和slice之间有着紧密的联系。<br>一个slice由三个部分构成：指针、长度和容量。<br>指针指向第一个slice元素对应的底层数组元素的地址，<code>slice</code>的第一个元素<strong>不一定</strong>就是数组的第一个元素。<br>长度对应slice中元素的数目；长度不能超过容量，容量一般是从slice的开始位置到<strong>底层数据</strong>的结尾位置。<br><code>len</code>和<code>cap</code>函数分别返回slice的长度和容量。</p>
<p><img src="/static/upload/20180717/upload_3fa5906635be890fe02429ba7b8a61b7.png" alt="alt"></p>
<p>多个slice之间可以共享底层的数据，并且引用的数组部分区间可能重叠。<br>字符串的切片操作和<code>[]byte</code>字节类型切片的切片操作是类似的。都写作<code>x[m:n]</code>，并且都是返回一个原始字节系列的子序列，底层都是共享之前的底层数组，因此这种操作都是常量时间复杂度。</p>
<pre><code class="hljs lang-go">Array_ori := [...]<span class="hljs-keyword">byte</span>{<span class="hljs-string">''a''</span>, <span class="hljs-string">''b''</span>, <span class="hljs-string">''c''</span>, <span class="hljs-string">''d''</span>, <span class="hljs-string">''e''</span>, <span class="hljs-string">''f''</span>, <span class="hljs-string">''h''</span>, <span class="hljs-string">''i''</span>, <span class="hljs-string">''j''</span>, <span class="hljs-string">''k''</span>}
Slice_a := Array_ori[<span class="hljs-number">2</span>:<span class="hljs-number">5</span>]
Slice_b:= Array_ori[<span class="hljs-number">3</span>:<span class="hljs-number">5</span>]
fmt.Println(Array_ori, <span class="hljs-built_in">len</span>(Array_ori))
fmt.Println(Slice_a, <span class="hljs-built_in">len</span>(Slice_a), <span class="hljs-built_in">cap</span>(Slice_a))
fmt.Println(Slice_b, <span class="hljs-built_in">len</span>(Slice_b), <span class="hljs-built_in">cap</span>(Slice_b))
</code></pre>
<p><img src="/static/upload/20180717/upload_384221ee8c9cb1eff19c567c2cf891df.png" alt="alt"></p>
<p>slice唯一合法的比较操作是和<code>nil</code>比较。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">if</span> summer == <span class="hljs-literal">nil</span> { <span class="hljs-comment">/* ... */</span> }
</code></pre>
<p>一个零值的<code>slice</code>等于<code>nil</code>。一个<code>nil</code>值的<code>slice</code>并没有底层数组。一个<code>nil</code>值的<code>slice</code>的长度和容量都是<code>0</code>。
但也有非<code>nil</code>值的<code>slice</code>的长度和容量也是<code>0</code>的。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> s []<span class="hljs-keyword">int</span>    <span class="hljs-comment">// len(s) == 0, s == nil</span>
s = <span class="hljs-literal">nil</span>        <span class="hljs-comment">// len(s) == 0, s == nil</span>
s = []<span class="hljs-keyword">int</span>(<span class="hljs-literal">nil</span>) <span class="hljs-comment">// len(s) == 0, s == nil</span>
s = []<span class="hljs-keyword">int</span>{}    <span class="hljs-comment">// len(s) == 0, s != nil</span>
</code></pre>
<p>内置的make函数创建一个指定元素类型、长度和容量的<code>slice</code>。容量部分可以省略(容量将等于长度)。</p>
<pre><code class="hljs lang-go"><span class="hljs-built_in">make</span>([]T, <span class="hljs-built_in">len</span>)
<span class="hljs-built_in">make</span>([]T, <span class="hljs-built_in">len</span>, <span class="hljs-built_in">cap</span>) 
</code></pre>
<h3><a id="toc-394" class="anchor" href="#toc-394"></a>append函数</h3>
<p>内置的append函数用于向slice追加元素</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> arr []<span class="hljs-keyword">rune</span>
<span class="hljs-keyword">for</span> _, r := <span class="hljs-keyword">range</span> <span class="hljs-string">"Hello,世界"</span> {
    arr = <span class="hljs-built_in">append</span>(arr, r)
}
fmt.Println(arr) <span class="hljs-comment">//[72 101 108 108 111 44 19990 30028]</span>
<span class="hljs-comment">//%q 单引号围绕的字符字面值</span>
fmt.Printf(<span class="hljs-string">"%q\n"</span>, arr) <span class="hljs-comment">// [''H'' ''e'' ''l'' ''l'' ''o'' '','' ''世'' ''界'']</span>
</code></pre>
<p>append函数则可以追加多个元素，甚至追加一个slice。
<strong>面向过程</strong></p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> x []<span class="hljs-keyword">int</span>
x = <span class="hljs-built_in">append</span>(x, <span class="hljs-number">1</span>)
x = <span class="hljs-built_in">append</span>(x, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>)
x = <span class="hljs-built_in">append</span>(x, <span class="hljs-number">4</span>, <span class="hljs-number">5</span>, <span class="hljs-number">6</span>)
x = <span class="hljs-built_in">append</span>(x, x...) <span class="hljs-comment">// append the slice x</span>
fmt.Println(x)      <span class="hljs-comment">// "[1 2 3 4 5 6 1 2 3 4 5 6]"</span>
</code></pre>
<h2><a id="map" class="anchor" href="#map"></a>Map</h2>
<ul>
<li>无序的<code>key/value</code>对的集合，其中所有的<code>key</code>都是不同的，然后通过给定的<code>key</code>可以在常数时间复杂度内检索、更新或删除对应的<code>value</code>。</li>
<li>一个<code>map</code>就是一个哈希表的引用，<code>map</code>类型可以写为<code>map[K]V</code>，其中<code>K</code>和<code>V</code>分别对应<code>key</code>和<code>value</code>的数据类型，<code>key</code>和<code>value</code>可以是不同的数据类型。</li>
<li><code>K</code>对应的<code>key</code>必须是支持<code>==</code>比较运算符的数据类型，<code>V</code>对应的<code>value</code>数据类型则没有限制。</li>
</ul>
<p>内置的make函数可以创建一个map：</p>
<pre><code class="hljs lang-go">ages := <span class="hljs-built_in">make</span>(<span class="hljs-keyword">map</span>[<span class="hljs-keyword">string</span>]<span class="hljs-keyword">int</span>) 
</code></pre>
<p>也可以用map字面值的语法创建<code>map</code>，同时还可以指定一些最初的<code>key/value</code>。</p>
<pre><code class="hljs lang-go">ages := <span class="hljs-keyword">map</span>[<span class="hljs-keyword">string</span>]<span class="hljs-keyword">int</span>{
    <span class="hljs-string">"zxy"</span>:   <span class="hljs-number">24</span>,
    <span class="hljs-string">"zxysilent"</span>: <span class="hljs-number">24</span>,
}
</code></pre>
<p>等价于</p>
<pre><code class="hljs lang-go">ages := <span class="hljs-built_in">make</span>(<span class="hljs-keyword">map</span>[<span class="hljs-keyword">string</span>]<span class="hljs-keyword">int</span>)
ages[<span class="hljs-string">"zxy"</span>] =<span class="hljs-number">24</span>
ages[<span class="hljs-string">"zxysilent"</span>] = <span class="hljs-number">24</span>
</code></pre>
<p>创建空的<code>map</code>的表达式是<code>map[string]int{}</code>。</p>
<p><code>Map</code>中的元素通过<code>ke</code>y对应的下标语法访问。</p>
<pre><code class="hljs lang-go">ages[<span class="hljs-string">"zxy"</span>] = <span class="hljs-number">32</span>
fmt.Println(ages[<span class="hljs-string">"zxy"</span>]) <span class="hljs-comment">// "32"</span>
</code></pre>
<p>内置的delete函数可以删除元素。</p>
<pre><code class="hljs lang-go"><span class="hljs-built_in">delete</span>(ages, <span class="hljs-string">"zxy"</span>) 
</code></pre>
<p>⚠️所有这些操作是安全的，即使这些元素不在map中也没有关系；如果一个查找失败将返回value类型对应的零值。</p>
<pre><code class="hljs lang-go">ages[<span class="hljs-string">"xxx"</span>] = ages[<span class="hljs-string">"xxx"</span>] + <span class="hljs-number">1</span>
</code></pre>
<p><code>x += y</code>和<code>x++</code>等简短赋值语法也可以用在map上。</p>
<pre><code class="hljs lang-go">ages[<span class="hljs-string">"xxx"</span>] += <span class="hljs-number">1</span>
</code></pre>
<p>更简单的写法</p>
<pre><code class="hljs lang-go">ages[<span class="hljs-string">"xxx"</span>]++
</code></pre>
<p>不能对map的元素进行取址操作⁉️。</p>
<p>遍历 <code>map</code></p>
<pre><code class="hljs lang-go">ages := <span class="hljs-built_in">make</span>(<span class="hljs-keyword">map</span>[<span class="hljs-keyword">string</span>]<span class="hljs-keyword">int</span>)
ages[<span class="hljs-string">"zxysilent"</span>] = <span class="hljs-number">24</span>
ages[<span class="hljs-string">"zxy"</span>] = <span class="hljs-number">24</span>
<span class="hljs-keyword">for</span> k, v := <span class="hljs-keyword">range</span> ages {
    fmt.Println(k, v)
}
fmt.Println(<span class="hljs-string">"------------"</span>)
<span class="hljs-keyword">for</span> k := <span class="hljs-keyword">range</span> ages {
    fmt.Println(k)
}
fmt.Println(<span class="hljs-string">"------------"</span>)
<span class="hljs-keyword">for</span> _, v := <span class="hljs-keyword">range</span> ages {
    fmt.Println(v)
}
</code></pre>
<p>遍历的顺序是随机的</p>
<p>map上的大部分操作，包括查找、删除、len和range循环都可以安全工作在nil值的map上，它们的行为和一个空的map类似。但向一个nil值的map存入元素将导致一个panic异常：</p>
<pre><code class="hljs lang-go">ages[<span class="hljs-string">"carol"</span>] = <span class="hljs-number">21</span> <span class="hljs-comment">// panic: assignment to entry in nil map</span>
</code></pre>
<p>⛔️在向map存数据前必须先创建map。</p>
<p>通过key作为索引下标来访问map将产生一个value。如果key在map中是存在的，那么将得到与key对应的value；如果key不存在，那么将得到value对应类型的零值，有时候可能需要知道对应的元素是否真的是在map之中。</p>
<pre><code class="hljs lang-go">age, ok := ages[<span class="hljs-string">"zxy"</span>]
<span class="hljs-keyword">if</span> !ok { <span class="hljs-comment">/* todo */</span> }
</code></pre>
<p>变成一行</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">if</span> age, ok := ages[<span class="hljs-string">"bob"</span>]; !ok { <span class="hljs-comment">/* ... */</span> }
</code></pre>
<p>map的下标语法将产生两个值；第二个是一个布尔值，用于报告元素是否真的存在。</p>
<h2><a id="toc-9d9" class="anchor" href="#toc-9d9"></a>结构体</h2>
<ul>
<li>结构体是一种聚合的数据类型，是由零个或多个任意类型的值聚合成的实体。</li>
<li>每个值称为结构体的成员。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-comment">// Person 结构体 描述人</span>
<span class="hljs-keyword">type</span> Person <span class="hljs-keyword">struct</span> {
    Name     <span class="hljs-keyword">string</span>    <span class="hljs-comment">//姓名</span>
    Age      <span class="hljs-keyword">int</span>       <span class="hljs-comment">//年龄</span>
    Addr     <span class="hljs-keyword">string</span>    <span class="hljs-comment">//地址</span>
    Birthday time.Time <span class="hljs-comment">//生日</span>
}

<span class="hljs-keyword">var</span> zxy Person
</code></pre>
<p>声明了一个叫<code>Person</code>的<strong>命名</strong>的结构体类型，并且声明了一个<code>Person</code>类型的变量<code>zxy</code>。
<code>zxy</code>结构体变量的成员可以通过点操作符访问。</p>
<pre><code class="hljs lang-Go">zxy.Name = <span class="hljs-string">"曾祥银"</span>
fmt.Println(zxy.Name)
</code></pre>
<p>对成员取地址，然后通过指针访问。</p>
<pre><code class="hljs lang-go">age := &amp;zxy.Age
*age = <span class="hljs-number">24</span>
fmt.Println(zxy.Age)
</code></pre>
<p>指向结构体的<strong>指针</strong>也可用点操作符。</p>
<pre><code class="hljs lang-go">alias := &amp;zxy
alias.Age = <span class="hljs-number">24</span>
fmt.Println(zxy.Age)
(*alias).Age = <span class="hljs-number">24</span>
fmt.Println(zxy.Age)
</code></pre>
<p>一个命名为<code>S</code>的结构体类型将不能再包含<code>S</code>类型的成员但可以包含<code>*S</code>指针类型的成员。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">type</span> tree <span class="hljs-keyword">struct</span> {
    data <span class="hljs-keyword">interface</span>{}
    left  *tree
    right *tree
}
</code></pre>
<h3><a id="toc-3ba" class="anchor" href="#toc-3ba"></a>结构体字面值</h3>
<p>结构体值也可以用结构体字面值表示，结构体字面值可以指定每个成员的值。</p>
<p>两种形式的结构体字面值语法：</p>
<ol>
<li>以结构体成员定义的顺序为每个结构体成员指定一个字面值。</li>
<li>以成员名字和相应的值来初始化，可以包含部分或全部的成员，顺序并不重要❗️。</li>
</ol>
<pre><code class="hljs lang-go"><span class="hljs-keyword">type</span> Point <span class="hljs-keyword">struct</span> {
    X <span class="hljs-keyword">int</span>
    Y <span class="hljs-keyword">int</span>
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    p := Point{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>}
    p1 := Point{
        Y: <span class="hljs-number">10</span>,
        X: <span class="hljs-number">3</span>,
    }
}
</code></pre>
<p>结构体可以作为函数的参数和返回值。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">Scale</span><span class="hljs-params">(p Point, f <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">Point</span></span> {
    <span class="hljs-keyword">return</span> Point{p.X * f, p.Y * f}
}
fmt.Println(Scale(Point{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>}, <span class="hljs-number">5</span>)) <span class="hljs-comment">// "{5 10}"</span>
</code></pre>
<p>较大的结构体通常会用指针的方式传入和返回，
要在函数内部修改结构体成员的话，用指针传入是必须的⛵️(值传递)。 </p>
<p>创建并初始化一个结构体变量，并返回结构体的地址。</p>
<pre><code class="hljs lang-go">p := &amp;Point{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>}
</code></pre>
<p>等价于</p>
<pre><code class="hljs lang-go">p := <span class="hljs-built_in">new</span>(Point)
*p = Point{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>}
</code></pre>
<ul>
<li>结构体类型的零值是每个成员都是零值。</li>
<li>结构体没有任何成员的话就是空结构体，写作struct{}。</li>
</ul>
<h3><a id="toc-987" class="anchor" href="#toc-987"></a>结构体高级操作</h3>
<pre><code class="hljs lang-go"><span class="hljs-comment">//Point 一个点</span>
<span class="hljs-keyword">type</span> Point <span class="hljs-keyword">struct</span> {
    X <span class="hljs-keyword">int</span>
    Y <span class="hljs-keyword">int</span>
}

<span class="hljs-comment">//Circle 圆</span>
<span class="hljs-keyword">type</span> Circle <span class="hljs-keyword">struct</span> {
    Point      <span class="hljs-comment">//圆心//嵌套结构体匿名成员</span>
    Radius <span class="hljs-keyword">int</span> <span class="hljs-comment">//半径</span>
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    c := Circle{
        Point:  Point{<span class="hljs-number">0</span>, <span class="hljs-number">0</span>},
        Radius: <span class="hljs-number">10</span>,
    }
    c1 := Circle{Point{<span class="hljs-number">0</span>, <span class="hljs-number">0</span>}, <span class="hljs-number">10</span>}
    c1.X
    c1.Point.X
}
</code></pre><h2><a id="json" class="anchor" href="#json"></a>JSON</h2>
<ul>
<li><p><code>JavaScript</code>对象表示法（<code>JSON</code>）是一种用于发送和接收结构化信息的标准协议。
还有 <code>XML</code>、<code>Protocol Buffers</code>等。</p>
</li>
<li><p>标准库支持 <code>encoding/json</code> ✴️</p>
</li>
</ul>
<p>序列化/编码 <code>Marshal</code>   </p>
<blockquote>
<p>Go语言的数据结构数据转换为<code>json</code>字符串</p>
</blockquote>
<pre><code class="hljs lang-go"><span class="hljs-comment">//Point 一个点</span>
<span class="hljs-keyword">type</span> Point <span class="hljs-keyword">struct</span> {
    X <span class="hljs-keyword">int</span>
    Y <span class="hljs-keyword">int</span>
}

<span class="hljs-comment">//Circle 圆</span>
<span class="hljs-keyword">type</span> Circle <span class="hljs-keyword">struct</span> {
    Point      <span class="hljs-comment">//圆心</span>
    Radius <span class="hljs-keyword">int</span> <span class="hljs-comment">//半径</span>
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    c := Circle{
        Point:  Point{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>},
        Radius: <span class="hljs-number">10</span>,
    }
    <span class="hljs-comment">//序列化</span>
    buf, _ := json.Marshal(c)
    fmt.Println(buf)         <span class="hljs-comment">//[123 34 88 34 58 49 44 34 89 34 58 50 44 34 82 97 100 105 117 115 34 58 49 48 125]</span>
    fmt.Println(<span class="hljs-keyword">string</span>(buf)) <span class="hljs-comment">//{"X":1,"Y":2,"Radius":10}</span>
}
</code></pre>
<p>在编码时，默认使用Go语言结构体的成员名字作为JSON的对象。
一个结构体成员标签<code>Tag</code>可以修改映射关系</p>
<pre><code class="hljs lang-go"><span class="hljs-comment">//Circle 圆</span>
<span class="hljs-keyword">type</span> Circle <span class="hljs-keyword">struct</span> {
    Point      <span class="hljs-comment">//圆心</span>
    Radius <span class="hljs-keyword">int</span> <span class="hljs-string">`json:"半径"`</span> <span class="hljs-comment">//半径</span>
}

c := Circle{
    Point:  Point{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>},
    Radius: <span class="hljs-number">10</span>,
}
<span class="hljs-comment">//序列化</span>
buf, _ := json.Marshal(c)
fmt.Println(<span class="hljs-keyword">string</span>(buf)) <span class="hljs-comment">//{"X":1,"Y":2,"半径":10}</span>
</code></pre><p>反序列化/解码 <code>Unmarshal</code>  </p>
<blockquote>
<p><code>json</code>字符串转换为Go语言的数据结构  </p>
</blockquote>
<pre><code class="hljs lang-go">s := <span class="hljs-string">`{"X":1,"Y":2,"半径":10}`</span>
    c := Circle{}
    json.Unmarshal([]<span class="hljs-keyword">byte</span>(s), &amp;c)
    fmt.Println(c)<span class="hljs-comment">//{{1 2} 10}</span>
</code></pre>
<h2><a id="toc-998" class="anchor" href="#toc-998"></a>文本和HTML模板</h2>
<ul>
<li>Go语言提供了对模板的支持(数据驱动模板）在&quot;text/template&quot;和&quot;html/template&quot;两个包下。</li>
<li>使用方式类似，<code>html/template</code>主要针对<code>html</code> 而<code>text/template</code> 主要针对文本。</li>
</ul>
<pre><code class="hljs lang-dts">package main

import (
    <span class="hljs-string">"html/template"</span>
    <span class="hljs-string">"os"</span>
)

<span class="hljs-comment">// Person 结构体 描述人</span>
type Person <span class="hljs-class">struct </span>{
    Name string   <span class="hljs-comment">//姓名</span>
    Age  int      <span class="hljs-comment">//年龄</span>
    Addr string   <span class="hljs-comment">//地址</span>
    Arr  []string <span class="hljs-comment">//oth</span>
}

const str = `
    <span class="hljs-params">&lt;html&gt;</span>
    <span class="hljs-params">&lt;head&gt;</span>
        <span class="hljs-params">&lt;title&gt;</span>template<span class="hljs-params">&lt;/title&gt;</span>
    <span class="hljs-params">&lt;/head&gt;</span>
    <span class="hljs-params">&lt;body&gt;</span>
        <span class="hljs-params">&lt;h2&gt;</span>{{.Name}}<span class="hljs-params">&lt;/h2&gt;</span>
        <span class="hljs-params">&lt;ul&gt;</span>
            {{range $k,$v := .Arr}}
                <span class="hljs-params">&lt;li&gt;</span>{{$v}}<span class="hljs-params">&lt;/li&gt;</span>
            {{end}}
        <span class="hljs-params">&lt;/ul&gt;</span>
    <span class="hljs-params">&lt;/body&gt;</span>
    <span class="hljs-params">&lt;/html&gt;</span>
`

func main() {
    z := Person{
<span class="hljs-symbol">        Name:</span> <span class="hljs-string">"曾祥银"</span>,
<span class="hljs-symbol">        Age:</span>  <span class="hljs-number">24</span>,
<span class="hljs-symbol">        Arr:</span>  []string{<span class="hljs-string">"A"</span>, <span class="hljs-string">"B"</span>, <span class="hljs-string">"C"</span>, <span class="hljs-string">"D"</span>},
    }
    t, _ := template.New(<span class="hljs-string">"模板名称"</span>).Parse(str) <span class="hljs-comment">//.ParseFiles 读取文件</span>
    t.Execute(os.Stdout, z)                 <span class="hljs-comment">//os.Stdout 标准输出流 相当于 fmt.Ptintln</span>
}
</code></pre><p><img src="/static/upload/20180718/upload_e303d556ef4d21630148c18102b4a006.png" alt="alt"></p>
<p>官方文档
<a href="https://golang.google.cn/pkg/html/template/">https://golang.google.cn/pkg/html/template/</a></p>
', 1, '2018-07-17 11:51:12', '2018-09-25 15:13:24', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('54', '4', '1', 0, 3, 'goweb-033-golang-函数', 'goweb-03-3', '<h2 id="-">函数声明</h2>
<ul>
<li>函数声明包括函数名、形式参数列表、返回值列表（可省略）以及函数体。</li>
<li>形式参数列表描述了函数的参数名以及参数类型。</li>
<li>返回值列表描述了函数返回值的变量名以及类型。</li>
<li>若函数返回一个无名变量或者没有返回值，返回值列表的括号是可以省略的。</li>
<li>若函数声明不包括返回值列表，那么函数体执行完毕后，不会返回任何值。</li>
</ul>
', '## 函数声明

- 函数声明包括函数名、形式参数列表、返回值列表（可省略）以及函数体。
- 形式参数列表描述了函数的参数名以及参数类型。
- 返回值列表描述了函数返回值的变量名以及类型。
- 若函数返回一个无名变量或者没有返回值，返回值列表的括号是可以省略的。
- 若函数声明不包括返回值列表，那么函数体执行完毕后，不会返回任何值。
<!--more-->

```go
func name(parameter-list) (result-list) {
	body
}

func add(a int ,b int) int{
	return a+b
}
// 命名返回值
func min(a, b int) (min int) {
	if a > b {
		min = b
	} else {
		min = a
	}
	return
}
```
一组形参或返回值有相同的类型，不必为每个形参都写出参数类型。
```go
func f(i, j, k int, s, t string)                 { /* ... */ }
func f(i int, j int, k int,  s string, t string) { /* ... */ }
```
- 函数的类型被称为函数的签名☝️如果两个函数**形式参数列表**和**返回值列表**中的变量**类型**一一对应，那么这两个函数被认为有相同的类型或签名。  
- 函数调用都必须按照声明顺序为所有参数提供实参。
- 实参通过值的方式传递，对形参进行修改不会影响实参。
- 实参包括引用类型，如指针，`slice`、`map`等类型，实参可能会由于函数的间接引用被修改。

没有函数体的函数声明，这表示该函数不是以`Go`实现的，只有函数签名。

```go
package math

func Sin(x float64) float //implemented in assembly language
```
## 递归

函数可以是递归的，函数可以直接或间接的调用自身。

```go
func fib(n int) int {
	if n <= 1 {
		return 1
	}
	return fib(n-1) + fib(n-2)
}
func main() {
	for i := 0; i < 10; i++ {
		fmt.Printf("\t%d", fib(i))
	}
}
```
## 多返回值
- 在`Go`语言中，一个函数可以返回多个值。
- 标准库中的许多函数返回`2`个值，一个是期望得到的返回值，另一个是函数**出错时**的错误信息。

```go
func f(a, b int) (max, min int) {
	if a > b {
		max = a
		min = b
	} else {
		max = b
		min = a
	}
	return
}

func main() {
	max, min := f(10, 100)
	fmt.Println(max, min)
}

```
http请求

```go
package main

import (
	"fmt"
	"net/http"
)

func main() {
	// resp 服务器响应内容
	// err http请求出错时候的信息
	resp, err := http.Get(`https://blog.zxysilent.com`)
	if err != nil { // 不等于nil 表示有错误
		panic(err) //抛出异常
	}
	// 准备容器
	buf := make([]byte, 1024*10) //1kb*10
	// 读取响应内容到 数据容器中
	l, err := resp.Body.Read(buf) //读取长度和错误
	fmt.Println(l, err)
	// 字节转换为字符串
	fmt.Println(string(buf[:l]))
}
```
##  函数值

在Go语言中，函数被看作第一类值（first-class values）：函数像其他值一样，拥有类型，可以被赋值给其他变量，传递给函数，从函数返回。

```go
func add(a, b int) int {
	return a + b
}
func fn() func(int, int) int {
        // 产生了一个不知名的函数
        // 匿名函数
	return func(a, b int) int {
		return a + b
	}
}
func main() {
	f := add
	fmt.Println(f(10, 20))
        //插播内容
        func() {
		fmt.Println("匿名函数自执行")
	}()
	fmt.Println(fn()(100, 200))
}
```
函数类型的零值是`nil`，调用值为`nil`的函数值会引起`panic`。

```go
	var fn func(int) int
	fn(10) // 此处f的值为nil, 会引起panic错误
```

函数值可以与nil比较。

```go
	var fn func(int) int
	if fn != nil {
		fn(10)
	}
```
✍️函数值**之间**是不可比较的，也不能用函数值作为`map`的`key`。

## 可变参数

- 参数数量可变的函数称为可变参数函数。
`fmt.Printf`首先接收一个必备的参数，之后接收任意个数的后续参数。
- 在声明可变参数函数时，需要在参数列表的最后一个参数类型之前加上省略符号`..`，这表示该函数会接收任意数量的该类型参数。

```go
func sum(vals...int) int {
	total := 0
	for _, val := range vals {
		total += val
	}
	return total
}
```

`sum`函数返回任意个`int`型参数的和。在函数体中，`vals`被看作是类型为`[] int`的切片。

```go
fmt.Println(sum())       
fmt.Println(sum(3))  
fmt.Println(sum(1, 2, 3, 4)) 
```

原始参数已经是切片类型，我们该如何传递给sum❓。

```go
values := []int{1, 2, 3}
fmt.Println(sum(values...)) 
```

`...int` 型参数的行为看起来很像切片类型，但实可变参数函数和以切片作为参数的函数是不同的。
```go
func f(...int) {}
func g([]int) {}
fmt.Printf("%T\n", f) // "func(...int)"
fmt.Printf("%T\n", g) // "func([]int)"
```
## defer
 函数返回前执行的函数⛲️

- 在调用普通函数或方法前加上关键字`defer`，就完成了`defer`所需要的语法。 
- 可以在一个函数中执行多条`defer`语句，它们的执行顺序与声明顺序相反。
- 无论包含`defer`语句的函数是通过`return`正常结束，还是由于`panic`导致的异常结束`defer`后的函数都会被执行。
- 函数体内某个变量作为`defer`时匿名函数的参数，则在定义`defer`时即已经获得了拷贝，否则则是引用某个变量的地址。

```go
package main
import (
	"fmt"
)
func main() {
	//函数返回前执行
	defer fmt.Println("defer1")
	defer fmt.Println("defer2")
	fmt.Println("exit")
}
```
![alt](/static/upload/20180719/upload_8b86de51b01a66688df58dd21bcbaecb.png)


```go
import (
	"fmt"
)
func fn() {
	defer fmt.Println("异常也会执行")
	fmt.Println("exit")
	panic("手动异常")
}
func main() {
	fn()
}
```
拷贝还是引用

```go
package main
import "fmt"
func main() {
	defer fmt.Println("hello defer")
	// 拷贝还是引用
	for i := 0; i < 5; i++ {
		//普通匿名函数
		func() {
			fmt.Println(i)
		}()
		// defer 引用
		defer func() {
			fmt.Println("defer:", i)
		}()
		// defer 拷贝
		defer func(x int) {
			fmt.Println("defer-:", x)
		}(i)
	}
}
```
函数返回前⌛️
```go
package main

import "fmt"

func main() {
	res := test(10)
	fmt.Println(res) //100

	res1 := test1(10)
	fmt.Println(res1) //101
}

func test(i int) int {
	defer func() {
		i++
	}()
	return i * 10
}
func test1(i int) (r int) {
	defer func() {
		r++
	}()
	r = i * 10
	return
}

```


## panic异常

Go的类型系统会在编译时捕获很多错误，但有些错误只能在运行时检查，如数组访问越界、空指针引用等。这些运行时错误会引起painc异常。

- 当panic异常发生时，程序会中断运行，并立即执行在该goroutine中被延迟的函数（`defer `）。
- 随后程序崩溃并输出日志信息。日志信息包括panic value和函数调用的堆栈跟踪信息。
-直接调用内置的panic函数也会引发`panic`异常。`panic`函数接受任何值`interface{}`作为参数。

## recover捕获异常

当异常发生的时候程序会停止运行。当一个`web`服务（教学管理系统）某一个模块出现问题（登陆）但其他模块应该可以正常提供服务（抢课）。

- 在`defer`中调用了内置函数`recover`，`recover`会使程序从`panic`中恢复，并返回`panic value`。
- 导致`panic`异常的函数不会继续运行，但能正常返回。
- 在未发生`panic`时调用`recover`，`recove`r会返回`nil`。

```go
package main

import "fmt"

func main() {
	defer func() {
		if err := recover(); err != nil {
			fmt.Println("defer:", err)
		}
	}()
	panic("提前终止程序")
}
```
不影响其他功能

```go
package main
import "fmt"
func fn1() {
	// defer func() {
	// 	if err := recover(); err != nil {
	// 		fmt.Println("defer:", err)
	// 	}
	// }()
	panic("panic")
}
func fn2() {
	defer func() {
		if err := recover(); err != nil {
			fmt.Println("defer:", err)
		}
	}()
	fmt.Println("zxysilent")
}
func main() {
	for i := 0; i < 3; i++ {
		fn1()
		fn2()
	}
}
```', '<div class="toc"><ul>
<li><a href="#toc-e78">函数声明</a></li>
<li><a href="#toc-099">递归</a></li>
<li><a href="#toc-125">多返回值</a></li>
<li><a href="#toc-eb2">函数值</a></li>
<li><a href="#toc-708">可变参数</a></li>
<li><a href="#defer">defer</a></li>
<li><a href="#toc-73d">panic异常</a></li>
<li><a href="#toc-a6a">recover捕获异常</a></li>
</ul>
</div><h2><a id="toc-e78" class="anchor" href="#toc-e78"></a>函数声明</h2>
<ul>
<li>函数声明包括函数名、形式参数列表、返回值列表（可省略）以及函数体。</li>
<li>形式参数列表描述了函数的参数名以及参数类型。</li>
<li>返回值列表描述了函数返回值的变量名以及类型。</li>
<li>若函数返回一个无名变量或者没有返回值，返回值列表的括号是可以省略的。</li>
<li>若函数声明不包括返回值列表，那么函数体执行完毕后，不会返回任何值。<!--more-->
</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">name</span><span class="hljs-params">(parameter-list)</span> <span class="hljs-params">(result-list)</span></span> {
    body
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">add</span><span class="hljs-params">(a <span class="hljs-keyword">int</span> ,b <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span>{
    <span class="hljs-keyword">return</span> a+b
}
<span class="hljs-comment">// 命名返回值</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">min</span><span class="hljs-params">(a, b <span class="hljs-keyword">int</span>)</span> <span class="hljs-params">(min <span class="hljs-keyword">int</span>)</span></span> {
    <span class="hljs-keyword">if</span> a &gt; b {
        min = b
    } <span class="hljs-keyword">else</span> {
        min = a
    }
    <span class="hljs-keyword">return</span>
}
</code></pre>
<p>一组形参或返回值有相同的类型，不必为每个形参都写出参数类型。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">f</span><span class="hljs-params">(i, j, k <span class="hljs-keyword">int</span>, s, t <span class="hljs-keyword">string</span>)</span></span>                 { <span class="hljs-comment">/* ... */</span> }
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">f</span><span class="hljs-params">(i <span class="hljs-keyword">int</span>, j <span class="hljs-keyword">int</span>, k <span class="hljs-keyword">int</span>,  s <span class="hljs-keyword">string</span>, t <span class="hljs-keyword">string</span>)</span></span> { <span class="hljs-comment">/* ... */</span> }
</code></pre>
<ul>
<li>函数的类型被称为函数的签名☝️如果两个函数<strong>形式参数列表</strong>和<strong>返回值列表</strong>中的变量<strong>类型</strong>一一对应，那么这两个函数被认为有相同的类型或签名。  </li>
<li>函数调用都必须按照声明顺序为所有参数提供实参。</li>
<li>实参通过值的方式传递，对形参进行修改不会影响实参。</li>
<li>实参包括引用类型，如指针，<code>slice</code>、<code>map</code>等类型，实参可能会由于函数的间接引用被修改。</li>
</ul>
<p>没有函数体的函数声明，这表示该函数不是以<code>Go</code>实现的，只有函数签名。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> math

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">Sin</span><span class="hljs-params">(x <span class="hljs-keyword">float64</span>)</span> <span class="hljs-title">float</span> //<span class="hljs-title">implemented</span> <span class="hljs-title">in</span> <span class="hljs-title">assembly</span> <span class="hljs-title">language</span>
</span></code></pre>
<h2><a id="toc-099" class="anchor" href="#toc-099"></a>递归</h2>
<p>函数可以是递归的，函数可以直接或间接的调用自身。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fib</span><span class="hljs-params">(n <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">if</span> n &lt;= <span class="hljs-number">1</span> {
        <span class="hljs-keyword">return</span> <span class="hljs-number">1</span>
    }
    <span class="hljs-keyword">return</span> fib(n<span class="hljs-number">-1</span>) + fib(n<span class="hljs-number">-2</span>)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">10</span>; i++ {
        fmt.Printf(<span class="hljs-string">"\t%d"</span>, fib(i))
    }
}
</code></pre>
<h2><a id="toc-125" class="anchor" href="#toc-125"></a>多返回值</h2>
<ul>
<li>在<code>Go</code>语言中，一个函数可以返回多个值。</li>
<li>标准库中的许多函数返回<code>2</code>个值，一个是期望得到的返回值，另一个是函数<strong>出错时</strong>的错误信息。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">f</span><span class="hljs-params">(a, b <span class="hljs-keyword">int</span>)</span> <span class="hljs-params">(max, min <span class="hljs-keyword">int</span>)</span></span> {
    <span class="hljs-keyword">if</span> a &gt; b {
        max = a
        min = b
    } <span class="hljs-keyword">else</span> {
        max = b
        min = a
    }
    <span class="hljs-keyword">return</span>
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    max, min := f(<span class="hljs-number">10</span>, <span class="hljs-number">100</span>)
    fmt.Println(max, min)
}

</code></pre>
<p>http请求</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"net/http"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">// resp 服务器响应内容</span>
    <span class="hljs-comment">// err http请求出错时候的信息</span>
    resp, err := http.Get(<span class="hljs-string">`https://blog.zxysilent.com`</span>)
    <span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> { <span class="hljs-comment">// 不等于nil 表示有错误</span>
        <span class="hljs-built_in">panic</span>(err) <span class="hljs-comment">//抛出异常</span>
    }
    <span class="hljs-comment">// 准备容器</span>
    buf := <span class="hljs-built_in">make</span>([]<span class="hljs-keyword">byte</span>, <span class="hljs-number">1024</span>*<span class="hljs-number">10</span>) <span class="hljs-comment">//1kb*10</span>
    <span class="hljs-comment">// 读取响应内容到 数据容器中</span>
    l, err := resp.Body.Read(buf) <span class="hljs-comment">//读取长度和错误</span>
    fmt.Println(l, err)
    <span class="hljs-comment">// 字节转换为字符串</span>
    fmt.Println(<span class="hljs-keyword">string</span>(buf[:l]))
}
</code></pre>
<h2><a id="toc-eb2" class="anchor" href="#toc-eb2"></a>函数值</h2>
<p>在Go语言中，函数被看作第一类值（first-class values）：函数像其他值一样，拥有类型，可以被赋值给其他变量，传递给函数，从函数返回。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">add</span><span class="hljs-params">(a, b <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">return</span> a + b
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fn</span><span class="hljs-params">()</span> <span class="hljs-title">func</span><span class="hljs-params">(<span class="hljs-keyword">int</span>, <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
        <span class="hljs-comment">// 产生了一个不知名的函数</span>
        <span class="hljs-comment">// 匿名函数</span>
    <span class="hljs-keyword">return</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(a, b <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
        <span class="hljs-keyword">return</span> a + b
    }
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    f := add
    fmt.Println(f(<span class="hljs-number">10</span>, <span class="hljs-number">20</span>))
        <span class="hljs-comment">//插播内容</span>
        <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
        fmt.Println(<span class="hljs-string">"匿名函数自执行"</span>)
    }()
    fmt.Println(fn()(<span class="hljs-number">100</span>, <span class="hljs-number">200</span>))
}
</code></pre>
<p>函数类型的零值是<code>nil</code>，调用值为<code>nil</code>的函数值会引起<code>panic</code>。</p>
<pre><code class="hljs lang-go">    <span class="hljs-keyword">var</span> fn <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(<span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span>
    <span class="hljs-title">fn</span><span class="hljs-params">(10)</span> // 此处<span class="hljs-title">f</span>的值为<span class="hljs-title">nil</span>, 会引起<span class="hljs-title">panic</span>错误
</span></code></pre>
<p>函数值可以与nil比较。</p>
<pre><code class="hljs lang-go">    <span class="hljs-keyword">var</span> fn <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(<span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span>
    <span class="hljs-title">if</span> <span class="hljs-title">fn</span> != <span class="hljs-title">nil</span></span> {
        fn(<span class="hljs-number">10</span>)
    }
</code></pre>
<p>✍️函数值<strong>之间</strong>是不可比较的，也不能用函数值作为<code>map</code>的<code>key</code>。</p>
<h2><a id="toc-708" class="anchor" href="#toc-708"></a>可变参数</h2>
<ul>
<li>参数数量可变的函数称为可变参数函数。
<code>fmt.Printf</code>首先接收一个必备的参数，之后接收任意个数的后续参数。</li>
<li>在声明可变参数函数时，需要在参数列表的最后一个参数类型之前加上省略符号<code>..</code>，这表示该函数会接收任意数量的该类型参数。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">sum</span><span class="hljs-params">(vals...<span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
    total := <span class="hljs-number">0</span>
    <span class="hljs-keyword">for</span> _, val := <span class="hljs-keyword">range</span> vals {
        total += val
    }
    <span class="hljs-keyword">return</span> total
}
</code></pre>
<p><code>sum</code>函数返回任意个<code>int</code>型参数的和。在函数体中，<code>vals</code>被看作是类型为<code>[] int</code>的切片。</p>
<pre><code class="hljs lang-undefined">fmt.Println(sum())       
fmt.Println(sum(3))  
fmt.Println(sum(1, 2, 3, 4)) 
</code></pre>
<p>原始参数已经是切片类型，我们该如何传递给sum❓。</p>
<pre><code class="hljs lang-go">values := []<span class="hljs-keyword">int</span>{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>, <span class="hljs-number">3</span>}
fmt.Println(sum(values...)) 
</code></pre>
<p><code>...int</code> 型参数的行为看起来很像切片类型，但实可变参数函数和以切片作为参数的函数是不同的。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">f</span><span class="hljs-params">(...<span class="hljs-keyword">int</span>)</span></span> {}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">g</span><span class="hljs-params">([]<span class="hljs-keyword">int</span>)</span></span> {}
fmt.Printf(<span class="hljs-string">"%T\n"</span>, f) <span class="hljs-comment">// "func(...int)"</span>
fmt.Printf(<span class="hljs-string">"%T\n"</span>, g) <span class="hljs-comment">// "func([]int)"</span>
</code></pre>
<h2><a id="defer" class="anchor" href="#defer"></a>defer</h2>
<p> 函数返回前执行的函数⛲️</p>
<ul>
<li>在调用普通函数或方法前加上关键字<code>defer</code>，就完成了<code>defer</code>所需要的语法。 </li>
<li>可以在一个函数中执行多条<code>defer</code>语句，它们的执行顺序与声明顺序相反。</li>
<li>无论包含<code>defer</code>语句的函数是通过<code>return</code>正常结束，还是由于<code>panic</code>导致的异常结束<code>defer</code>后的函数都会被执行。</li>
<li>函数体内某个变量作为<code>defer</code>时匿名函数的参数，则在定义<code>defer</code>时即已经获得了拷贝，否则则是引用某个变量的地址。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">//函数返回前执行</span>
    <span class="hljs-keyword">defer</span> fmt.Println(<span class="hljs-string">"defer1"</span>)
    <span class="hljs-keyword">defer</span> fmt.Println(<span class="hljs-string">"defer2"</span>)
    fmt.Println(<span class="hljs-string">"exit"</span>)
}
</code></pre>
<p><img src="/static/upload/20180719/upload_8b86de51b01a66688df58dd21bcbaecb.png" alt="alt"></p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fn</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">defer</span> fmt.Println(<span class="hljs-string">"异常也会执行"</span>)
    fmt.Println(<span class="hljs-string">"exit"</span>)
    <span class="hljs-built_in">panic</span>(<span class="hljs-string">"手动异常"</span>)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    fn()
}
</code></pre>
<p>拷贝还是引用</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">defer</span> fmt.Println(<span class="hljs-string">"hello defer"</span>)
    <span class="hljs-comment">// 拷贝还是引用</span>
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">5</span>; i++ {
        <span class="hljs-comment">//普通匿名函数</span>
        <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
            fmt.Println(i)
        }()
        <span class="hljs-comment">// defer 引用</span>
        <span class="hljs-keyword">defer</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
            fmt.Println(<span class="hljs-string">"defer:"</span>, i)
        }()
        <span class="hljs-comment">// defer 拷贝</span>
        <span class="hljs-keyword">defer</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(x <span class="hljs-keyword">int</span>)</span></span> {
            fmt.Println(<span class="hljs-string">"defer-:"</span>, x)
        }(i)
    }
}
</code></pre>
<p>函数返回前⌛️</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    res := test(<span class="hljs-number">10</span>)
    fmt.Println(res) <span class="hljs-comment">//100</span>

    res1 := test1(<span class="hljs-number">10</span>)
    fmt.Println(res1) <span class="hljs-comment">//101</span>
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">test</span><span class="hljs-params">(i <span class="hljs-keyword">int</span>)</span> <span class="hljs-title">int</span></span> {
    <span class="hljs-keyword">defer</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
        i++
    }()
    <span class="hljs-keyword">return</span> i * <span class="hljs-number">10</span>
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">test1</span><span class="hljs-params">(i <span class="hljs-keyword">int</span>)</span> <span class="hljs-params">(r <span class="hljs-keyword">int</span>)</span></span> {
    <span class="hljs-keyword">defer</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
        r++
    }()
    r = i * <span class="hljs-number">10</span>
    <span class="hljs-keyword">return</span>
}

</code></pre>
<h2><a id="toc-73d" class="anchor" href="#toc-73d"></a>panic异常</h2>
<p>Go的类型系统会在编译时捕获很多错误，但有些错误只能在运行时检查，如数组访问越界、空指针引用等。这些运行时错误会引起painc异常。</p>
<ul>
<li>当panic异常发生时，程序会中断运行，并立即执行在该goroutine中被延迟的函数（<code>defer</code>）。</li>
<li>随后程序崩溃并输出日志信息。日志信息包括panic value和函数调用的堆栈跟踪信息。
-直接调用内置的panic函数也会引发<code>panic</code>异常。<code>panic</code>函数接受任何值<code>interface{}</code>作为参数。</li>
</ul>
<h2><a id="toc-a6a" class="anchor" href="#toc-a6a"></a>recover捕获异常</h2>
<p>当异常发生的时候程序会停止运行。当一个<code>web</code>服务（教学管理系统）某一个模块出现问题（登陆）但其他模块应该可以正常提供服务（抢课）。</p>
<ul>
<li>在<code>defer</code>中调用了内置函数<code>recover</code>，<code>recover</code>会使程序从<code>panic</code>中恢复，并返回<code>panic value</code>。</li>
<li>导致<code>panic</code>异常的函数不会继续运行，但能正常返回。</li>
<li>在未发生<code>panic</code>时调用<code>recover</code>，<code>recove</code>r会返回<code>nil</code>。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">defer</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
        <span class="hljs-keyword">if</span> err := <span class="hljs-built_in">recover</span>(); err != <span class="hljs-literal">nil</span> {
            fmt.Println(<span class="hljs-string">"defer:"</span>, err)
        }
    }()
    <span class="hljs-built_in">panic</span>(<span class="hljs-string">"提前终止程序"</span>)
}
</code></pre>
<p>不影响其他功能</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> <span class="hljs-string">"fmt"</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fn1</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">// defer func() {</span>
    <span class="hljs-comment">//     if err := recover(); err != nil {</span>
    <span class="hljs-comment">//         fmt.Println("defer:", err)</span>
    <span class="hljs-comment">//     }</span>
    <span class="hljs-comment">// }()</span>
    <span class="hljs-built_in">panic</span>(<span class="hljs-string">"panic"</span>)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fn2</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">defer</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
        <span class="hljs-keyword">if</span> err := <span class="hljs-built_in">recover</span>(); err != <span class="hljs-literal">nil</span> {
            fmt.Println(<span class="hljs-string">"defer:"</span>, err)
        }
    }()
    fmt.Println(<span class="hljs-string">"zxysilent"</span>)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">3</span>; i++ {
        fn1()
        fn2()
    }
}
</code></pre>
', 1, '2018-07-19 09:27:42', '2018-10-30 15:25:31', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('55', '4', '1', 0, 3, 'goweb-034-golang-方法', 'goweb-03-4', '<p>面向对象编程(OOP)的三大特征分别为封装、继承和多态。 
封装，是指利用抽象数据类型对数据信息以及对数据。。。。。。。此处省略3万字<br><img src="/static/upload/20180719/upload_17ce2c733b1cb9b4b3a410756c4765fd.png" alt="alt"></p>
', '面向对象编程(OOP)的三大特征分别为封装、继承和多态。 
封装，是指利用抽象数据类型对数据信息以及对数据。。。。。。。此处省略3万字  
![alt](/static/upload/20180719/upload_17ce2c733b1cb9b4b3a410756c4765fd.png)

<!--more-->
## 方法声明

- 在函数声明时，在其名字之前放上一个变量，即是一个方法。
- 这个附加的参数会将该函数附加到这种类型上，即相当于为这种类型定义了一个独占的方法。

```go
package main

import (
	"fmt"
)

//Point 一个点
type Point struct {
	X, Y float64
}

//Format 格式化输出
func (p Point) Format() {
	fmt.Println("x:", p.X, "y:", p.Y)
}
func main() {
	var p Point
	p.Format()
}
```
附加的参数`p`，叫做方法的接收器（`receiver`）,可以任意的选择接收器的名字。
> 本质类似于其他OOP绑定方法到`this`需要额外的成本。

```go
//Point 一个点
type Point struct {
	X, Y float64
}
//Format 格式化输出
func Format(p Point) {
	fmt.Println("x:", p.X, "y:", p.Y)
}
func main() {
	var p Point
	Format(p)
}
```

## 指针接收者

当需要改变接收者时或者接收者变量本身比较大时可使用指针作为接收者。

```go
func (p *Point) Scale(rate float64) {
	p.X *= rate
	p.Y *= rate
}
```
无论`method`的`receiver`是指针类型还是非指针类型，都是可以通过指针/非指针类型进行调用的，编译器会帮你做类型转换。


```go
//Point 一个点
type Point struct {
	X, Y float64
}

//Format 格式化输出
func (p Point) Format() {
	fmt.Println("x:", p.X, "y:", p.Y)
}

//Scale 缩放
func (p *Point) Scale(rate float64) {
	p.X *= rate
	p.Y = p.Y * rate
}
func main() {
	var p = Point{1, 2}
	var ptr = &Point{3, 4}
	p.Scale(2)
	p.Format()

	ptr.Scale(2)
	ptr.Format()
}
```
![alt](/static/upload/20180719/upload_6c241e891082e746747ff7f37b4a8ef3.png)

## 综合示例

```
package main

import (
	"fmt"
)

//Point 一个点
type Point struct {
	X, Y float64
}

//Format 格式化输出
func (p Point) Format() {
	fmt.Println("x:", p.X, "y:", p.Y)
}

//Print 打印
func (p *Point) Print() {
	fmt.Println("x:", p.X, "y:", p.Y)
}

//Circle 一个圆
type Circle struct {
	Point  
	Radius float64 //半径
}

//Print 打印
func (c *Circle) Print() {
	fmt.Println("x:", c.X, "y:", c.Y, "r:", c.Radius)
}

func main() {
	var c = Circle{
		Point{1, 2},
		10,
	}
	// 调用 Point的方法
	c.Format() //x: 1 y: 2
	// Circle的Print 方法
	// 覆盖
	// Point的Print方法
	c.Print()
	// 调用Point的Print方法
	c.Point.Print()
	Circle{}.Format() //x: 0 y: 0
        //不能在一个不能寻址的对象上调用指针接收者的方法
	//Circle{}.Print()//cannot call pointer method on Circle literal
}
```', '<div class="toc"><ul>
<li><a href="#toc-0d0">方法声明</a></li>
<li><a href="#toc-adf">指针接收者</a></li>
<li><a href="#toc-8ac">综合示例</a></li>
</ul>
</div><p>面向对象编程(OOP)的三大特征分别为封装、继承和多态。 
封装，是指利用抽象数据类型对数据信息以及对数据。。。。。。。此处省略3万字<br><img src="/static/upload/20180719/upload_17ce2c733b1cb9b4b3a410756c4765fd.png" alt="alt"></p>
<!--more-->
<h2><a id="toc-0d0" class="anchor" href="#toc-0d0"></a>方法声明</h2>
<ul>
<li>在函数声明时，在其名字之前放上一个变量，即是一个方法。</li>
<li>这个附加的参数会将该函数附加到这种类型上，即相当于为这种类型定义了一个独占的方法。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
)

<span class="hljs-comment">//Point 一个点</span>
<span class="hljs-keyword">type</span> Point <span class="hljs-keyword">struct</span> {
    X, Y <span class="hljs-keyword">float64</span>
}

<span class="hljs-comment">//Format 格式化输出</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(p Point)</span> <span class="hljs-title">Format</span><span class="hljs-params">()</span></span> {
    fmt.Println(<span class="hljs-string">"x:"</span>, p.X, <span class="hljs-string">"y:"</span>, p.Y)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">var</span> p Point
    p.Format()
}
</code></pre>
<p>附加的参数<code>p</code>，叫做方法的接收器（<code>receiver</code>）,可以任意的选择接收器的名字。</p>
<blockquote>
<p>本质类似于其他OOP绑定方法到<code>this</code>需要额外的成本。</p>
</blockquote>
<pre><code class="hljs lang-go"><span class="hljs-comment">//Point 一个点</span>
<span class="hljs-keyword">type</span> Point <span class="hljs-keyword">struct</span> {
    X, Y <span class="hljs-keyword">float64</span>
}
<span class="hljs-comment">//Format 格式化输出</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">Format</span><span class="hljs-params">(p Point)</span></span> {
    fmt.Println(<span class="hljs-string">"x:"</span>, p.X, <span class="hljs-string">"y:"</span>, p.Y)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">var</span> p Point
    Format(p)
}
</code></pre>
<h2><a id="toc-adf" class="anchor" href="#toc-adf"></a>指针接收者</h2>
<p>当需要改变接收者时或者接收者变量本身比较大时可使用指针作为接收者。</p>
<pre><code class="hljs lang-go"><span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(p *Point)</span> <span class="hljs-title">Scale</span><span class="hljs-params">(rate <span class="hljs-keyword">float64</span>)</span></span> {
    p.X *= rate
    p.Y *= rate
}
</code></pre>
<p>无论<code>method</code>的<code>receiver</code>是指针类型还是非指针类型，都是可以通过指针/非指针类型进行调用的，编译器会帮你做类型转换。</p>
<pre><code class="hljs lang-go"><span class="hljs-comment">//Point 一个点</span>
<span class="hljs-keyword">type</span> Point <span class="hljs-keyword">struct</span> {
    X, Y <span class="hljs-keyword">float64</span>
}

<span class="hljs-comment">//Format 格式化输出</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(p Point)</span> <span class="hljs-title">Format</span><span class="hljs-params">()</span></span> {
    fmt.Println(<span class="hljs-string">"x:"</span>, p.X, <span class="hljs-string">"y:"</span>, p.Y)
}

<span class="hljs-comment">//Scale 缩放</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(p *Point)</span> <span class="hljs-title">Scale</span><span class="hljs-params">(rate <span class="hljs-keyword">float64</span>)</span></span> {
    p.X *= rate
    p.Y = p.Y * rate
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">var</span> p = Point{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>}
    <span class="hljs-keyword">var</span> ptr = &amp;Point{<span class="hljs-number">3</span>, <span class="hljs-number">4</span>}
    p.Scale(<span class="hljs-number">2</span>)
    p.Format()

    ptr.Scale(<span class="hljs-number">2</span>)
    ptr.Format()
}
</code></pre>
<p><img src="/static/upload/20180719/upload_6c241e891082e746747ff7f37b4a8ef3.png" alt="alt"></p>
<h2><a id="toc-8ac" class="anchor" href="#toc-8ac"></a>综合示例</h2>
<pre><code class="hljs lang-swift">package main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
)

<span class="hljs-comment">//Point 一个点</span>
type <span class="hljs-type">Point</span> <span class="hljs-class"><span class="hljs-keyword">struct</span> </span>{
    <span class="hljs-type">X</span>, <span class="hljs-type">Y</span> float64
}

<span class="hljs-comment">//Format 格式化输出</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(p Point)</span></span> <span class="hljs-type">Format</span>() {
    fmt.<span class="hljs-type">Println</span>(<span class="hljs-string">"x:"</span>, p.<span class="hljs-type">X</span>, <span class="hljs-string">"y:"</span>, p.<span class="hljs-type">Y</span>)
}

<span class="hljs-comment">//Print 打印</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(p *Point)</span></span> <span class="hljs-type">Print</span>() {
    fmt.<span class="hljs-type">Println</span>(<span class="hljs-string">"x:"</span>, p.<span class="hljs-type">X</span>, <span class="hljs-string">"y:"</span>, p.<span class="hljs-type">Y</span>)
}

<span class="hljs-comment">//Circle 一个圆</span>
type <span class="hljs-type">Circle</span> <span class="hljs-class"><span class="hljs-keyword">struct</span> </span>{
    <span class="hljs-type">Point</span>  
    <span class="hljs-type">Radius</span> float64 <span class="hljs-comment">//半径</span>
}

<span class="hljs-comment">//Print 打印</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(<span class="hljs-built_in">c</span> *Circle)</span></span> <span class="hljs-type">Print</span>() {
    fmt.<span class="hljs-type">Println</span>(<span class="hljs-string">"x:"</span>, <span class="hljs-built_in">c</span>.<span class="hljs-type">X</span>, <span class="hljs-string">"y:"</span>, <span class="hljs-built_in">c</span>.<span class="hljs-type">Y</span>, <span class="hljs-string">"r:"</span>, <span class="hljs-built_in">c</span>.<span class="hljs-type">Radius</span>)
}

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-keyword">var</span> <span class="hljs-built_in">c</span> = <span class="hljs-type">Circle</span>{
        <span class="hljs-type">Point</span>{<span class="hljs-number">1</span>, <span class="hljs-number">2</span>},
        <span class="hljs-number">10</span>,
    }
    <span class="hljs-comment">// 调用 Point的方法</span>
    <span class="hljs-built_in">c</span>.<span class="hljs-type">Format</span>() <span class="hljs-comment">//x: 1 y: 2</span>
    <span class="hljs-comment">// Circle的Print 方法</span>
    <span class="hljs-comment">// 覆盖</span>
    <span class="hljs-comment">// Point的Print方法</span>
    <span class="hljs-built_in">c</span>.<span class="hljs-type">Print</span>()
    <span class="hljs-comment">// 调用Point的Print方法</span>
    <span class="hljs-built_in">c</span>.<span class="hljs-type">Point</span>.<span class="hljs-type">Print</span>()
    <span class="hljs-type">Circle</span>{}.<span class="hljs-type">Format</span>() <span class="hljs-comment">//x: 0 y: 0</span>
        <span class="hljs-comment">//不能在一个不能寻址的对象上调用指针接收者的方法</span>
    <span class="hljs-comment">//Circle{}.Print()//cannot call pointer method on Circle literal</span>
}
</code></pre>', 1, '2018-07-19 11:38:47', '2018-07-23 16:39:52', 1, 1, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('56', '4', '1', 0, 3, 'goweb-035-golang-接口', 'goweb-03-5', '<p>接口类型是对其它类型行为的抽象和概括；因为接口类型不会和特定的实现细节绑定在一起，通过这种抽象的方式我们可以让我们的函数更加灵活和更具有适应能力。</p>
<h2 id="-">接口类型</h2>
<p>接口类型具体描述了一系列方法的集合，一个实现了这些方法的具体类型是这个接口类型的实例。</p>
<p><code>io.Writer</code>类型是用得最广泛的接口之一，因为它提供了所有类型的写入<code>bytes</code>的抽象。</p>
', '接口类型是对其它类型行为的抽象和概括；因为接口类型不会和特定的实现细节绑定在一起，通过这种抽象的方式我们可以让我们的函数更加灵活和更具有适应能力。

## 接口类型

接口类型具体描述了一系列方法的集合，一个实现了这些方法的具体类型是这个接口类型的实例。

`io.Writer`类型是用得最广泛的接口之一，因为它提供了所有类型的写入`bytes`的抽象。
<!--more-->
```go
// Writer is the interface that wraps the basic Write method.
//
// Write writes len(p) bytes from p to the underlying data stream.
// It returns the number of bytes written from p (0 <= n <= len(p))
// and any error encountered that caused the write to stop early.
// Write must return a non-nil error if it returns n < len(p).
// Write must not modify the slice data, even temporarily.
//
// Implementations must not retain p.
type Writer interface {
	Write(p []byte) (n int, err error)
}
```
## 实现接口
> 一个类型如果拥有一个接口需要的所有方法，那么这个类型就实现了这个接口。

如标准库中`*os.File`类型实现了`Reader`，`Writer`，`Closer`，和`ReadWriter`接口。
![alt](/static/upload/20180719/upload_4191d76d456f10c251689e4ec2cf2961.png)

举例子说明
> 抽象的东西请多动手 ✅ 


``` go
package main
import (
	"fmt"
)
//Animal 定义 Animal 接口
type Animal interface {
	Say()
}
//具体类型去实现接口所定义的方法
//Dog 狗狗
type Dog struct {
	Name string
}
//Say 实现接口所需要的方法 就实现了接口
func (d Dog) Say() {
	fmt.Println("Dog say :", d.Name)
}
//Cat 猫猫
type Cat struct {
	Name string
}
//Say 实现接口所需要的方法 就实现了接口
func (c Cat) Say() {
	fmt.Println("Cat say :", c.Name)
}
//String 实现 stringer接口
//fmt.Println 输出时 优先调用 String
func (c Cat) String() string {
	return fmt.Sprintf("\nStringer Cat:%s", c.Name)
}
func main() {
	// 一个接口变量
	var i Animal
	// 一个 Dog 变量
	var d = Dog{
		Name: "大狗狗",
	}
	//实现了接口就可以把值赋值给 接口
	i = d
	i.Say()
	fmt.Printf("%T\n", i)
	fmt.Println(i)
	fmt.Println("------------------华丽分割线-------------")
	// 一个 Cat 变量
	var c = Cat{
		Name: "小猫猫",
	}
	//实现了接口就可以把值赋值给 接口
	i = c
	i.Say()
	fmt.Printf("%T", i)
	fmt.Println(i)
}
```
结果  
![alt](/static/upload/20180719/upload_55d4713a9ee3851f90deb5cd1ca80ada.png)
## 空接口
- 空接口`interface{}` 任何类型都实现了空接口的方法因为**没有方法**
- 空接口用来存放任意类型的值如其他语言的  `object`、`void*`
```go
var i interface{}
var d = Dog{
	Name: "大狗狗",
}
i = d
fmt.Println(i)
i = "string"
fmt.Println(i)
i = false
fmt.Println(i)
i = 100
fmt.Println(i)
i = 3.1415
fmt.Println(i)
```

## 断言
- `x.(T)`[变量.(类型)]被称为断言类型，这里`x`表示一个接口的类型的值和`T`表示一个类型。
- 一个类型断言检查它操作对象的动态类型是否和断言的类型匹配。  

这里有 2️⃣两种可能。

1. 断言的类型`T`是一个具体类型，然后类型断言检查`x`的动态类型是否和`T`相同。   
  **具体类型的类型断言**从它的操作对象中获得具体的值。如果检查失败，这个操作会抛出`panic`。
```go
var i Animal
var d = Dog{
	Name: "大狗狗",
}
i = d
dog := i.(Dog)
cat := i.(Cat) //panic: interface conversion: main.Animal is main.Dog, not main.Cat
fmt.Println(dog, cat)
```

2. 断言的类型T是一个接口类型，然后类型断言检查是否`x`的动态类型满足`T`。  
**接口类型的类型断言**改变了类型的表述方式，改变了可以获取的方法集合，但它保留了接口值内部的动态类型和值的部分。
```go
var i Animal
var c = Cat{
	Name: "小猫猫",
}
i = c
a, ok := i.(Animal)
fmt.Println(a, ok)
a.Say()
//a.String() //a.String undefined (type Animal has no field or method String)
```
![alt](/static/upload/20180719/upload_5ed502ee18dd06ab1049987c0f7daf5c.png)

如果断言操作的对象是一个`nil`接口值，那么不论被断言的类型是什么这个类型断言都会失败。

对一个接口值的动态类型我们是不确定的，我们也不想产生`panic`，那么可以返回一个额外的第二个结果，这个结果是一个标识成功与否的布尔值：

```go
var i Animal
var d = Dog{
	Name: "大狗狗",
}
i = d
dog, ok1 := i.(Dog)
cat, ok2 := i.(Cat)
fmt.Println(dog, ok1, cat, ok2)
//{大狗狗} true 
//Stringer Cat: false
```

', '<div class="toc"><ul>
<li><a href="#toc-274">接口类型</a></li>
<li><a href="#toc-cf1">实现接口</a></li>
<li><a href="#toc-52c">空接口</a></li>
<li><a href="#toc-679">断言</a></li>
</ul>
</div><p>接口类型是对其它类型行为的抽象和概括；因为接口类型不会和特定的实现细节绑定在一起，通过这种抽象的方式我们可以让我们的函数更加灵活和更具有适应能力。</p>
<h2><a id="toc-274" class="anchor" href="#toc-274"></a>接口类型</h2>
<p>接口类型具体描述了一系列方法的集合，一个实现了这些方法的具体类型是这个接口类型的实例。</p>
<p><code>io.Writer</code>类型是用得最广泛的接口之一，因为它提供了所有类型的写入<code>bytes</code>的抽象。
<!--more--></p>
<pre><code class="hljs lang-go"><span class="hljs-comment">// Writer is the interface that wraps the basic Write method.</span>
<span class="hljs-comment">//</span>
<span class="hljs-comment">// Write writes len(p) bytes from p to the underlying data stream.</span>
<span class="hljs-comment">// It returns the number of bytes written from p (0 &lt;= n &lt;= len(p))</span>
<span class="hljs-comment">// and any error encountered that caused the write to stop early.</span>
<span class="hljs-comment">// Write must return a non-nil error if it returns n &lt; len(p).</span>
<span class="hljs-comment">// Write must not modify the slice data, even temporarily.</span>
<span class="hljs-comment">//</span>
<span class="hljs-comment">// Implementations must not retain p.</span>
<span class="hljs-keyword">type</span> Writer <span class="hljs-keyword">interface</span> {
    Write(p []<span class="hljs-keyword">byte</span>) (n <span class="hljs-keyword">int</span>, err error)
}
</code></pre>
<h2><a id="toc-cf1" class="anchor" href="#toc-cf1"></a>实现接口</h2>
<blockquote>
<p>一个类型如果拥有一个接口需要的所有方法，那么这个类型就实现了这个接口。</p>
</blockquote>
<p>如标准库中<code>*os.File</code>类型实现了<code>Reader</code>，<code>Writer</code>，<code>Closer</code>，和<code>ReadWriter</code>接口。
<img src="/static/upload/20180719/upload_4191d76d456f10c251689e4ec2cf2961.png" alt="alt"></p>
<p>举例子说明</p>
<blockquote>
<p>抽象的东西请多动手 ✅ </p>
</blockquote>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
)
<span class="hljs-comment">//Animal 定义 Animal 接口</span>
<span class="hljs-keyword">type</span> Animal <span class="hljs-keyword">interface</span> {
    Say()
}
<span class="hljs-comment">//具体类型去实现接口所定义的方法</span>
<span class="hljs-comment">//Dog 狗狗</span>
<span class="hljs-keyword">type</span> Dog <span class="hljs-keyword">struct</span> {
    Name <span class="hljs-keyword">string</span>
}
<span class="hljs-comment">//Say 实现接口所需要的方法 就实现了接口</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(d Dog)</span> <span class="hljs-title">Say</span><span class="hljs-params">()</span></span> {
    fmt.Println(<span class="hljs-string">"Dog say :"</span>, d.Name)
}
<span class="hljs-comment">//Cat 猫猫</span>
<span class="hljs-keyword">type</span> Cat <span class="hljs-keyword">struct</span> {
    Name <span class="hljs-keyword">string</span>
}
<span class="hljs-comment">//Say 实现接口所需要的方法 就实现了接口</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(c Cat)</span> <span class="hljs-title">Say</span><span class="hljs-params">()</span></span> {
    fmt.Println(<span class="hljs-string">"Cat say :"</span>, c.Name)
}
<span class="hljs-comment">//String 实现 stringer接口</span>
<span class="hljs-comment">//fmt.Println 输出时 优先调用 String</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-params">(c Cat)</span> <span class="hljs-title">String</span><span class="hljs-params">()</span> <span class="hljs-title">string</span></span> {
    <span class="hljs-keyword">return</span> fmt.Sprintf(<span class="hljs-string">"\nStringer Cat:%s"</span>, c.Name)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">// 一个接口变量</span>
    <span class="hljs-keyword">var</span> i Animal
    <span class="hljs-comment">// 一个 Dog 变量</span>
    <span class="hljs-keyword">var</span> d = Dog{
        Name: <span class="hljs-string">"大狗狗"</span>,
    }
    <span class="hljs-comment">//实现了接口就可以把值赋值给 接口</span>
    i = d
    i.Say()
    fmt.Printf(<span class="hljs-string">"%T\n"</span>, i)
    fmt.Println(i)
    fmt.Println(<span class="hljs-string">"------------------华丽分割线-------------"</span>)
    <span class="hljs-comment">// 一个 Cat 变量</span>
    <span class="hljs-keyword">var</span> c = Cat{
        Name: <span class="hljs-string">"小猫猫"</span>,
    }
    <span class="hljs-comment">//实现了接口就可以把值赋值给 接口</span>
    i = c
    i.Say()
    fmt.Printf(<span class="hljs-string">"%T"</span>, i)
    fmt.Println(i)
}
</code></pre>
<p>结果<br><img src="/static/upload/20180719/upload_55d4713a9ee3851f90deb5cd1ca80ada.png" alt="alt"></p>
<h2><a id="toc-52c" class="anchor" href="#toc-52c"></a>空接口</h2>
<ul>
<li>空接口<code>interface{}</code> 任何类型都实现了空接口的方法因为<strong>没有方法</strong></li>
<li>空接口用来存放任意类型的值如其他语言的  <code>object</code>、<code>void*</code><pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> i <span class="hljs-keyword">interface</span>{}
<span class="hljs-keyword">var</span> d = Dog{
  Name: <span class="hljs-string">"大狗狗"</span>,
}
i = d
fmt.Println(i)
i = <span class="hljs-string">"string"</span>
fmt.Println(i)
i = <span class="hljs-literal">false</span>
fmt.Println(i)
i = <span class="hljs-number">100</span>
fmt.Println(i)
i = <span class="hljs-number">3.1415</span>
fmt.Println(i)
</code></pre>
</li>
</ul>
<h2><a id="toc-679" class="anchor" href="#toc-679"></a>断言</h2>
<ul>
<li><code>x.(T)</code>[变量.(类型)]被称为断言类型，这里<code>x</code>表示一个接口的类型的值和<code>T</code>表示一个类型。</li>
<li>一个类型断言检查它操作对象的动态类型是否和断言的类型匹配。  </li>
</ul>
<p>这里有 2️⃣两种可能。</p>
<ol>
<li><p>断言的类型<code>T</code>是一个具体类型，然后类型断言检查<code>x</code>的动态类型是否和<code>T</code>相同。<br><strong>具体类型的类型断言</strong>从它的操作对象中获得具体的值。如果检查失败，这个操作会抛出<code>panic</code>。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> i Animal
<span class="hljs-keyword">var</span> d = Dog{
 Name: <span class="hljs-string">"大狗狗"</span>,
}
i = d
dog := i.(Dog)
cat := i.(Cat) <span class="hljs-comment">//panic: interface conversion: main.Animal is main.Dog, not main.Cat</span>
fmt.Println(dog, cat)
</code></pre>
</li>
<li><p>断言的类型T是一个接口类型，然后类型断言检查是否<code>x</code>的动态类型满足<code>T</code>。<br><strong>接口类型的类型断言</strong>改变了类型的表述方式，改变了可以获取的方法集合，但它保留了接口值内部的动态类型和值的部分。</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> i Animal
<span class="hljs-keyword">var</span> c = Cat{
 Name: <span class="hljs-string">"小猫猫"</span>,
}
i = c
a, ok := i.(Animal)
fmt.Println(a, ok)
a.Say()
<span class="hljs-comment">//a.String() //a.String undefined (type Animal has no field or method String)</span>
</code></pre>
<p><img src="/static/upload/20180719/upload_5ed502ee18dd06ab1049987c0f7daf5c.png" alt="alt"></p>
</li>
</ol>
<p>如果断言操作的对象是一个<code>nil</code>接口值，那么不论被断言的类型是什么这个类型断言都会失败。</p>
<p>对一个接口值的动态类型我们是不确定的，我们也不想产生<code>panic</code>，那么可以返回一个额外的第二个结果，这个结果是一个标识成功与否的布尔值：</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">var</span> i Animal
<span class="hljs-keyword">var</span> d = Dog{
    Name: <span class="hljs-string">"大狗狗"</span>,
}
i = d
dog, ok1 := i.(Dog)
cat, ok2 := i.(Cat)
fmt.Println(dog, ok1, cat, ok2)
<span class="hljs-comment">//{大狗狗} true </span>
<span class="hljs-comment">//Stringer Cat: false</span>
</code></pre>
', 1, '2018-07-19 15:37:41', '2018-07-23 16:39:59', 1, 1, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('57', '4', '1', 0, 3, 'goweb-036-golang-Goroutines和Channels', 'goweb-03-6', '<ul>
<li><strong>并行</strong>同时做不同事。<br><img src="/static/upload/20180719/upload_637d666569fc53940d0de76a3f6987b0.png" alt="alt"></li>
<li><strong>并发</strong>交替做不同事。<br><img src="/static/upload/20180719/upload_f5b7c9457b34b935a0d61a822ac573c9.png" alt="alt"></li>
</ul>
<p>假设你需要洗衣服和做饭</p>
<ol>
<li><strong> 串行</strong>：先洗完衣服再做饭，或者先做完饭再洗衣服。</li>
</ol>
', '- **并行**同时做不同事。  
![alt](/static/upload/20180719/upload_637d666569fc53940d0de76a3f6987b0.png)
- **并发**交替做不同事。  
![alt](/static/upload/20180719/upload_f5b7c9457b34b935a0d61a822ac573c9.png)

假设你需要洗衣服和做饭
1. ** 串行**：先洗完衣服再做饭，或者先做完饭再洗衣服。<!--more-->
2. **并发**：一会洗衣一会做饭。
3. **并行**：把洗衣盆拿到灶边，一只手做饭另一只手洗衣。  
为啥快 ⁉️


## Goroutines 协程
   - 传统的多线程模型中创建一个新的线程代价高昂**8M**。
   - Go语言中，每一个并发的执行单元叫作一个`goroutine`（协程）。类比轻量级的线程**2kb**  。
   - 通过在普通函数前添加`go`直接启动新的协程执行。
    更多细节请 [https://golang.google.cn/ref/mem](https://golang.google.cn/ref/mem) 官网走一波
 
用示例说明  
传统模式
``` go
package main

import (
	"fmt"
	"time"
)

func fn1() {
	time.Sleep(1 * time.Second)
	fmt.Println("暂停 1 s")
}
func fn2() {
	time.Sleep(2 * time.Second)
	fmt.Println("暂停 2 s")
}
func main() {
	//开始时间
	begin := time.Now()
	for i := 0; i < 5; i++ {
		fn1()
		fn2()
	}
	//获取运行结束时间
	end := time.Now()
	//输出时间差
	fmt.Println("总共用时:", end.Sub(begin)) //总共用时: 15.0871782s
}
```
并发模式

直接添加`go`开启新的协程 `main`函数的主协程并不会等待子协程结束**需改造**
```go
package main

import (
	"fmt"
	"sync"
	"time"
)

func fn1() {
	time.Sleep(1 * time.Second)
	fmt.Println("暂停 1 s")
	// 执行完成就关闭一个等待
	wg.Done()
}
func fn2() {
	time.Sleep(2 * time.Second)
	fmt.Println("暂停 2 s")
	// 执行完成就关闭一个等待
	wg.Done()
}

//WaitGroup 可以用来等待协程执行完成
var wg sync.WaitGroup

func main() {
	//开始时间
	begin := time.Now()
	for i := 0; i < 5; i++ {
		go fn1()
		// 每次启动一个 协程
		wg.Add(1)
		go fn2()
		wg.Add(1)
	}
	//等待所有子协程执行完成
	wg.Wait()
	//获取运行结束时间
	end := time.Now()
	//输出时间差
	fmt.Println("总共用时:", end.Sub(begin)) //总共用时: 2.015722s
}
```
时间就是金钱☢️

## Channels
- `channels`则是`goroutine`之间的通信机制。一个`channel`是一个通信机制，它可以让一个`goroutine`通过它给另一个`goroutine`发送值信息。
- 每个`channel`都有一个特殊的类型，也就是`channel`可发送数据的类型。
- 一个可以发送int类型数据的`channel`一般写为`chan int`。
> 抽象的东西往往不好理解，可以理解为一个队列的引用。


内置的`make`函数，我们可以创建一个channel：

```go
ch := make(chan int) 
```

复制一个`channe`l或用于函数参数传递时，只是拷贝了一个`channel`引用，因此调用者和被调用者将引用同一个`channel`对象。  
和其它的引用类型一样，`channel`的零值也是nil。

- 一个`channel`有发送和接受两个主要操作(入队✍️出队)。
- 发送和接收两个操作都使用`<-`运算符。
- 在发送语句中，`<-`运算符分割channel和要发送的值。
- 在接收语句中，`<-`运算符写在channel对象之前。

```go
ch <- 10  // 发送
x := <-ch // 接收
<-ch
```

`Channel`支持`close`操作，用于关闭`channel`，随后对基于该`channel`的任何发送操作都将导致`panic`异常。对一个已经被`close`的`channel`进行接收操作依然可以接受到之前已经成功发送的数据；如果`channel中`已经没有数据的话将产生一个零值的数据。

```go
ch := make(chan int)
ch <- 10 // 发送
close(ch)
x := <-ch
// val, ok:= <- ch
fmt.Println(x)
```
以最简单方式调用`make`函数创建的是一个无缓存的`channel`，也可以指定第二个整型参数，对应`channel`的容量。如果大于零，那么该`channel`就是带缓存的`channel`。

```Go
ch = make(chan int)    
ch = make(chan int, 0) //0 也没有缓冲
ch = make(chan int, 3) 
```
### 不带缓存的Channels

- 无缓存`Channels`的发送操作将导致发送者`goroutine`阻塞，直到另一个`goroutine`在相同的`Channels`上执行接收操作。
- 如果接收操作先发生，那么接收者`goroutine`也将阻塞，直到有另一个`goroutine`在相同的`Channels`上执行发送操作。
- 当发送的值通过`Channels`成功传输之后，两个`goroutine`可以继续执行后面的语句。

case1 **阻塞**
```go
ch := make(chan int)
x := <-ch
fmt.Println(x)//fatal error: all goroutines are asleep - deadlock!
```
case2 **阻塞**
```
ch := make(chan int)
ch <- 100
x := <-ch
fmt.Println(x)//fatal error: all goroutines are asleep - deadlock!
```
case3 **不阻塞**
```go
ch := make(chan int)
go func() {
	ch <- 100
}()
x := <-ch
fmt.Println(x)
```
### 带缓存的Channels

- 带缓存的`Channel`内部持有一个元素队列。
- 队列的最大容量是在调用`make`函数创建`channel`时通过第二个参数指定的。
```go
ch = make(chan string, 3)
```

在无阻塞的情况下连续向新创建的`channel`发送三个值 **不阻塞**。
```go
ch <- "A"
ch <- "B"
ch <- "C"
```

现在`channel`的内部缓存队列将是满的，如果现在有第四个发送操作将发生阻塞。

![alt](/static/upload/20180719/upload_d638a20ac55a4aee829a0cc1afb94772.png)

接收一个值，

```go
fmt.Println(<-ch) // "A"
```
![alt](/static/upload/20180719/upload_50ae7db62360924ce0e0379a9d7bdf01.png)  
此时对`channel`执行的发送或接收操作都不会发生阻塞。

![](../images/ch8-04.png)

内置的cap函数获取`channel`内部缓存的容量。
```go
fmt.Println(cap(ch)) // "3"
```
内置的`len`函数，获取`channel`内部缓存队列中有效元素的个数。
```go
fmt.Println(len(ch)) // "2"
```

类比饭馆吃饭   
要吃饭的人 <-  
空位 chan  
<-厨师    
更多的使用更多的理解✋(充分利用`cpu`性能)。

> 到此我需要讲的语法都已经完成
', '<div class="toc"><ul>
<li><a href="#toc-f92">Goroutines 协程</a></li>
<li><a href="#channels">Channels</a><ul>
<li><a href="#toc-a94">不带缓存的Channels</a></li>
<li><a href="#toc-78a">带缓存的Channels</a></li>
</ul>
</li>
</ul>
</div><ul>
<li><strong>并行</strong>同时做不同事。<br><img src="/static/upload/20180719/upload_637d666569fc53940d0de76a3f6987b0.png" alt="alt"></li>
<li><strong>并发</strong>交替做不同事。<br><img src="/static/upload/20180719/upload_f5b7c9457b34b935a0d61a822ac573c9.png" alt="alt"></li>
</ul>
<p>假设你需要洗衣服和做饭</p>
<ol>
<li><strong> 串行</strong>：先洗完衣服再做饭，或者先做完饭再洗衣服。<!--more--></li>
<li><strong>并发</strong>：一会洗衣一会做饭。</li>
<li><strong>并行</strong>：把洗衣盆拿到灶边，一只手做饭另一只手洗衣。<br>为啥快 ⁉️</li>
</ol>
<h2><a id="toc-f92" class="anchor" href="#toc-f92"></a>Goroutines 协程</h2>
<ul>
<li>传统的多线程模型中创建一个新的线程代价高昂<strong>8M</strong>。</li>
<li>Go语言中，每一个并发的执行单元叫作一个<code>goroutine</code>（协程）。类比轻量级的线程<strong>2kb</strong>  。</li>
<li>通过在普通函数前添加<code>go</code>直接启动新的协程执行。
更多细节请 <a href="https://golang.google.cn/ref/mem">https://golang.google.cn/ref/mem</a> 官网走一波</li>
</ul>
<p>用示例说明<br>传统模式</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"time"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fn1</span><span class="hljs-params">()</span></span> {
    time.Sleep(<span class="hljs-number">1</span> * time.Second)
    fmt.Println(<span class="hljs-string">"暂停 1 s"</span>)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fn2</span><span class="hljs-params">()</span></span> {
    time.Sleep(<span class="hljs-number">2</span> * time.Second)
    fmt.Println(<span class="hljs-string">"暂停 2 s"</span>)
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">//开始时间</span>
    begin := time.Now()
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">5</span>; i++ {
        fn1()
        fn2()
    }
    <span class="hljs-comment">//获取运行结束时间</span>
    end := time.Now()
    <span class="hljs-comment">//输出时间差</span>
    fmt.Println(<span class="hljs-string">"总共用时:"</span>, end.Sub(begin)) <span class="hljs-comment">//总共用时: 15.0871782s</span>
}
</code></pre>
<p>并发模式</p>
<p>直接添加<code>go</code>开启新的协程 <code>main</code>函数的主协程并不会等待子协程结束<strong>需改造</strong></p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"sync"</span>
    <span class="hljs-string">"time"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fn1</span><span class="hljs-params">()</span></span> {
    time.Sleep(<span class="hljs-number">1</span> * time.Second)
    fmt.Println(<span class="hljs-string">"暂停 1 s"</span>)
    <span class="hljs-comment">// 执行完成就关闭一个等待</span>
    wg.Done()
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">fn2</span><span class="hljs-params">()</span></span> {
    time.Sleep(<span class="hljs-number">2</span> * time.Second)
    fmt.Println(<span class="hljs-string">"暂停 2 s"</span>)
    <span class="hljs-comment">// 执行完成就关闭一个等待</span>
    wg.Done()
}

<span class="hljs-comment">//WaitGroup 可以用来等待协程执行完成</span>
<span class="hljs-keyword">var</span> wg sync.WaitGroup

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">//开始时间</span>
    begin := time.Now()
    <span class="hljs-keyword">for</span> i := <span class="hljs-number">0</span>; i &lt; <span class="hljs-number">5</span>; i++ {
        <span class="hljs-keyword">go</span> fn1()
        <span class="hljs-comment">// 每次启动一个 协程</span>
        wg.Add(<span class="hljs-number">1</span>)
        <span class="hljs-keyword">go</span> fn2()
        wg.Add(<span class="hljs-number">1</span>)
    }
    <span class="hljs-comment">//等待所有子协程执行完成</span>
    wg.Wait()
    <span class="hljs-comment">//获取运行结束时间</span>
    end := time.Now()
    <span class="hljs-comment">//输出时间差</span>
    fmt.Println(<span class="hljs-string">"总共用时:"</span>, end.Sub(begin)) <span class="hljs-comment">//总共用时: 2.015722s</span>
}
</code></pre>
<p>时间就是金钱☢️</p>
<h2><a id="channels" class="anchor" href="#channels"></a>Channels</h2>
<ul>
<li><code>channels</code>则是<code>goroutine</code>之间的通信机制。一个<code>channel</code>是一个通信机制，它可以让一个<code>goroutine</code>通过它给另一个<code>goroutine</code>发送值信息。</li>
<li>每个<code>channel</code>都有一个特殊的类型，也就是<code>channel</code>可发送数据的类型。</li>
<li>一个可以发送int类型数据的<code>channel</code>一般写为<code>chan int</code>。<blockquote>
<p>抽象的东西往往不好理解，可以理解为一个队列的引用。</p>
</blockquote>
</li>
</ul>
<p>内置的<code>make</code>函数，我们可以创建一个channel：</p>
<pre><code class="hljs lang-go">ch := <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">int</span>) 
</code></pre>
<p>复制一个<code>channe</code>l或用于函数参数传递时，只是拷贝了一个<code>channel</code>引用，因此调用者和被调用者将引用同一个<code>channel</code>对象。<br>和其它的引用类型一样，<code>channel</code>的零值也是nil。</p>
<ul>
<li>一个<code>channel</code>有发送和接受两个主要操作(入队✍️出队)。</li>
<li>发送和接收两个操作都使用<code>&lt;-</code>运算符。</li>
<li>在发送语句中，<code>&lt;-</code>运算符分割channel和要发送的值。</li>
<li>在接收语句中，<code>&lt;-</code>运算符写在channel对象之前。</li>
</ul>
<pre><code class="hljs lang-go">ch &lt;- <span class="hljs-number">10</span>  <span class="hljs-comment">// 发送</span>
x := &lt;-ch <span class="hljs-comment">// 接收</span>
&lt;-ch
</code></pre>
<p><code>Channel</code>支持<code>close</code>操作，用于关闭<code>channel</code>，随后对基于该<code>channel</code>的任何发送操作都将导致<code>panic</code>异常。对一个已经被<code>close</code>的<code>channel</code>进行接收操作依然可以接受到之前已经成功发送的数据；如果<code>channel中</code>已经没有数据的话将产生一个零值的数据。</p>
<pre><code class="hljs lang-go">ch := <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">int</span>)
ch &lt;- <span class="hljs-number">10</span> <span class="hljs-comment">// 发送</span>
<span class="hljs-built_in">close</span>(ch)
x := &lt;-ch
<span class="hljs-comment">// val, ok:= &lt;- ch</span>
fmt.Println(x)
</code></pre>
<p>以最简单方式调用<code>make</code>函数创建的是一个无缓存的<code>channel</code>，也可以指定第二个整型参数，对应<code>channel</code>的容量。如果大于零，那么该<code>channel</code>就是带缓存的<code>channel</code>。</p>
<pre><code class="hljs lang-Go">ch = <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">int</span>)    
ch = <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">int</span>, <span class="hljs-number">0</span>) <span class="hljs-comment">//0 也没有缓冲</span>
ch = <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">int</span>, <span class="hljs-number">3</span>) 
</code></pre>
<h3><a id="toc-a94" class="anchor" href="#toc-a94"></a>不带缓存的Channels</h3>
<ul>
<li>无缓存<code>Channels</code>的发送操作将导致发送者<code>goroutine</code>阻塞，直到另一个<code>goroutine</code>在相同的<code>Channels</code>上执行接收操作。</li>
<li>如果接收操作先发生，那么接收者<code>goroutine</code>也将阻塞，直到有另一个<code>goroutine</code>在相同的<code>Channels</code>上执行发送操作。</li>
<li>当发送的值通过<code>Channels</code>成功传输之后，两个<code>goroutine</code>可以继续执行后面的语句。</li>
</ul>
<p>case1 <strong>阻塞</strong></p>
<pre><code class="hljs lang-go">ch := <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">int</span>)
x := &lt;-ch
fmt.Println(x)<span class="hljs-comment">//fatal error: all goroutines are asleep - deadlock!</span>
</code></pre>
<p>case2 <strong>阻塞</strong></p>
<pre><code class="hljs lang-go">ch := <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">int</span>)
ch &lt;- <span class="hljs-number">100</span>
x := &lt;-ch
fmt.Println(x)<span class="hljs-comment">//fatal error: all goroutines are asleep - deadlock!</span>
</code></pre><p>case3 <strong>不阻塞</strong></p>
<pre><code class="hljs lang-go">ch := <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">int</span>)
<span class="hljs-keyword">go</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">()</span></span> {
    ch &lt;- <span class="hljs-number">100</span>
}()
x := &lt;-ch
fmt.Println(x)
</code></pre>
<h3><a id="toc-78a" class="anchor" href="#toc-78a"></a>带缓存的Channels</h3>
<ul>
<li>带缓存的<code>Channel</code>内部持有一个元素队列。</li>
<li>队列的最大容量是在调用<code>make</code>函数创建<code>channel</code>时通过第二个参数指定的。<pre><code class="hljs lang-go">ch = <span class="hljs-built_in">make</span>(<span class="hljs-keyword">chan</span> <span class="hljs-keyword">string</span>, <span class="hljs-number">3</span>)
</code></pre>
</li>
</ul>
<p>在无阻塞的情况下连续向新创建的<code>channel</code>发送三个值 <strong>不阻塞</strong>。</p>
<pre><code class="hljs lang-go">ch &lt;- <span class="hljs-string">"A"</span>
ch &lt;- <span class="hljs-string">"B"</span>
ch &lt;- <span class="hljs-string">"C"</span>
</code></pre>
<p>现在<code>channel</code>的内部缓存队列将是满的，如果现在有第四个发送操作将发生阻塞。</p>
<p><img src="/static/upload/20180719/upload_d638a20ac55a4aee829a0cc1afb94772.png" alt="alt"></p>
<p>接收一个值，</p>
<pre><code class="hljs lang-go">fmt.Println(&lt;-ch) <span class="hljs-comment">// "A"</span>
</code></pre>
<p><img src="/static/upload/20180719/upload_50ae7db62360924ce0e0379a9d7bdf01.png" alt="alt"><br>此时对<code>channel</code>执行的发送或接收操作都不会发生阻塞。</p>
<p><img src="../images/ch8-04.png" alt=""></p>
<p>内置的cap函数获取<code>channel</code>内部缓存的容量。</p>
<pre><code class="hljs lang-go">fmt.Println(<span class="hljs-built_in">cap</span>(ch)) <span class="hljs-comment">// "3"</span>
</code></pre>
<p>内置的<code>len</code>函数，获取<code>channel</code>内部缓存队列中有效元素的个数。</p>
<pre><code class="hljs lang-go">fmt.Println(<span class="hljs-built_in">len</span>(ch)) <span class="hljs-comment">// "2"</span>
</code></pre>
<p>类比饭馆吃饭<br>要吃饭的人 &lt;-<br>空位 chan<br>&lt;-厨师<br>更多的使用更多的理解✋(充分利用<code>cpu</code>性能)。</p>
<blockquote>
<p>到此我需要讲的语法都已经完成</p>
</blockquote>
', 1, '2018-07-19 17:16:40', '2018-10-21 17:23:14', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('58', '4', '1', 0, 3, 'goweb-037-golang-常用包', 'goweb-03-7', '<p>以示例的方式演示常用包的用法，更详细深入的信息请参考 <a href="https://golang.google.cn/pkg/">https://golang.google.cn/pkg/</a>标准库<br><img src="/static/upload/20180720/upload_a2a95976a5f1c377cd1244e720deeeea.png" alt="alt"></p>
<h2 id="os">os</h2>
<ul>
<li><code>os</code>包提供了操作系统函数的不依赖平台的接口。设计为<code>Unix</code>风格的，错误处理是go风格的；失败的调用会返回错误值而非错误码。</li>
<li>通常错误值里包含更多信息。</li>
</ul>
<p><code>os</code>包的接口规定为在所有操作系统中都是一致的。</p>
', '以示例的方式演示常用包的用法，更详细深入的信息请参考 [https://golang.google.cn/pkg/](https://golang.google.cn/pkg/)标准库  
![alt](/static/upload/20180720/upload_a2a95976a5f1c377cd1244e720deeeea.png)

## os
- `os`包提供了操作系统函数的不依赖平台的接口。设计为`Unix`风格的，错误处理是go风格的；失败的调用会返回错误值而非错误码。
- 通常错误值里包含更多信息。

`os`包的接口规定为在所有操作系统中都是一致的。

<!--more-->
打开一个文件并从中读取一些数据。
```go
file, err := os.Open("file.go")
if err != nil {
	log.Fatal(err)
}
```
如果打开失败，错误字符串是自解释的。  
`open file.go: no such file or directory`

文件的信息可以读取进一个`[]byte`切片。`Read`和`Write`方法从切片参数获取其内的字节数。
```go
data := make([]byte, 100)
count, err := file.Read(data)
if err != nil {
	log.Fatal(err)
}
fmt.Printf("read %d bytes: %q\n", count, data[:count])
```
### 标准的文件信息

```go
type FileInfo interface {
	Name() string       // base name of the file
	Size() int64        // length in bytes for regular files; system-dependent for others
	Mode() FileMode     // file mode bits
	ModTime() time.Time // modification time
	IsDir() bool        // abbreviation for Mode().IsDir()
	Sys() interface{}   // underlying data source (can return nil)
}
```
### 常用方法
- Stat  
`func Stat(name string) (fi FileInfo, err error)`  
`Stat`返回一个描述`name`指定的文件对象的`FileInfo`。
```go
f, _ := os.Stat(`main.go`)
fmt.Println(f.Name(), f.IsDir(), f.ModTime())
```
- Mkdir  
`func Mkdir(name string, perm FileMode) error`  
` Mkdir`使用指定的权限和名称创建一个目录。
```go
os.Mkdir(`dir`, 0777)
```
![alt](/static/upload/20180720/upload_e9a73d014542e1228a9a08c31b12de29.png)
- MkdirAll  
 `func MkdirAll(path string, perm FileMode) error `  
 `MkdirAll`使用指定的权限和名称创建一个目录，包括任何必要的上级目录，并返回nil，否则返回错误。  
   权限位`perm`会应用在每一个被本函数创建的目录上。  
   如果path指定了一个已经存在的目录，MkdirAll不做任何操作并返回nil。
```go
os.MkdirAll(`a/b/c/d`, 0777)
```
![alt](/static/upload/20180720/upload_a4ecf075da47c998092272678259589d.png)

-  Rename  
`func Rename(oldpath, newpath string) error`  
Rename修改一个文件的名字，移动一个文件。可能会有一些个操作系统特定的限制。
```go
os.Rename(`dir`, `dir1`)
```
![alt](/static/upload/20180720/upload_092c76037732ad6153ddb4a499655a6f.png)
- Remove  
`func Remove(name string) error`  
 Remove删除`name`指定的文件或目录。
```go
os.Remove(`dir1`)
```
![alt](/static/upload/20180720/upload_2003eaf33eb743e7e22593c20be9d05c.png)
- RemoveAll  
`func RemoveAll(path string) error`  
 RemoveAll删除path指定的文件，或目录及它包含的任何下级对象。它会尝试删除所有东西，除非遇到错误并返回。  
 如果path指定的对象不存在，`RemoveAll`会返回nil而不返回错误。
```go
os.RemoveAll(`a`)
```
![alt](/static/upload/20180720/upload_5b46e1aaac0611fa435eca5ac25ab103.png)
- Create  
`func Create(name string) (file *File, err error)`  
`Create`采用模式`0666`✋创建一个名为`name`的文件，如果文件已存在会置为空文件。  
如果成功，返回的文件对象可用于`I/O`；对应的文件描述符具有`O_RDWR`模式。

- Open  
`func Open(name string) (file *File, err error)` 
`Open`打开一个文件用于读取。如果操作成功，返回的文件对象的方法可用于读取数据；对应的文件描述符具有`O_RDONLY`模式。
```go
fout, _ := os.Create(`output.txt`)
fin, _ := os.Open(`main.go`)
io.Copy(fout, fin)//io包
```
- OpenFile  
`func OpenFile(name string, flag int, perm FileMode) (file *File, err error)`  
`OpenFile`是一个更一般性的文件打开函数，大多数调用者都应用`Open`或`Create`代替本函数。   
它会使用指定的选项（如`O_RDONLY`等）、指定的模式（如`066`6等）打开指定名称的文件。   
 如果操作成功，返回的文件对象可用于`I/O`。
```go
fout, _ := os.Create(`output.txt`)
fin, _ := os.OpenFile(`main.go`, os.O_RDWR, 0666)
io.Copy(fout, fin)
```
- Readdir
`func (f *File) Readdir(n int) (fi []FileInfo, err error)`  
`Readdir`读取目录f的内容，返回一个有`n`个成员的`[]FileInfo`，采用目录顺序。  对本函数的下一次调用会返回上一次调用剩余未读取的内容的信息。     
如果`n>0`，`Readdir`函数会返回一个最多n个成员的切片。   
如果`n<=0`，`Readdir`函数返回目录中剩余所有文件对象的`FileInfo`构成的切片。 
```go
dir, _ := os.Open(`util`)
dirs, _ := dir.Readdir(-1)
for idx := range dirs {
	fmt.Println(dirs[idx].Name())
}
```
- Read  
`func (f *File) Read(b []byte) (n int, err error)`  
`Read`方法从f中读取最多`len(b)`字节数据并写入`b`。它返回读取的字节数和可能遇到的任何错误。文件终止标志是读取`0`个字节且返回值`err`为`io.EOF`。
-  Write  
`func (f *File) Write(b []byte) (n int, err error)`  
`Write`向文件中写入`len(b)`字节数据。它返回写入的字节数和可能遇到的任何错误。如果返回值`n!=len(b)`，本方法会返回一个非`nil`的错误。
- Close  
`func (f *File) Close() error`  
`Close`关闭文件`f`，使文件不能用于读写。它返回可能出现的错误。
```go
fin, _ := os.Open(`main.go`)
fout, _ := os.Create(`output.txt`)
//准备容器
buf := make([]byte, 128)
for {
	n, err := fin.Read(buf)
	if n == 0 || err == io.EOF {
		break
	}
	fout.Write(buf[:n])
}
fin.Close()
fout.Close()
```
- `WriteString`  
`func (f *File) WriteString(s string) (ret int, err error)`   
`WriteString` 类似`Write`，但接受一个字符串参数。

```go
fout, _ := os.Create(`output.txt`)
defer fout.Close()
fout.WriteString(`WriteString`)
```
## io && ioutil
- eof 
`var EOF = errors.New("EOF")`  
`EOF`当无法得到更多输入时，`Read`方法返回`EOF`☂️。当函数一切正常的到达输入的结束时，就应返回`EOF`。

- Copy
`func Copy(dst Writer, src Reader) (written int64, err error) `
- 将`src`的数据拷贝到`dst`，直到在`src`上到达`EOF`或发生错误。返回拷贝的字节数和遇到的第一个错误。
- 对成功的调用，返回值err为nil而`非EOF`，因为`Copy`定义为从`src`读取直到`EOF`，它**不**会将读取到`EOF`视为应报告的错误。
```go
fout, _ := os.Create(`output.txt`)
fin, _ := os.OpenFile(`main.go`, os.O_RDWR, 0666)
io.Copy(fout, fin)
```
### ioutil
- ReadAll  
 `func ReadAll(r io.Reader) ([]byte, error)`  
`ReadAll`从`r`读取数据直到`EOF`或遇到`error`，返回读取的数据和遇到的错误。  
 成功的调用返回的`err`为`nil`而非`EOF`。因为本函数定义为读取r直到`EOF`，它不会将读取返回的`EOF`视为应报告的错误。

```go
package main
import (
	"fmt"
	"io/ioutil"
	"log"
	"strings"
)
func main() {
	r := strings.NewReader("Go is a general-purpose language designed with systems programming in mind.")
	b, err := ioutil.ReadAll(r)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%s", b)
}
```
- ReadFile  
`func ReadFile(filename string) ([]byte, error)`  
`ReadFile` 从`filename`指定的文件中读取数据并返回文件的内容。成功的调用返回的`err`为`nil`而非`EOF`。因为本函数定义为读取整个文件，它不会将读取返回的`EOF`视为应报告的错误。

```go
package main
import (
	"fmt"
	"io/ioutil"
	"log"
)
func main() {
	content, err := ioutil.ReadFile("testdata/hello")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("File contents: %s", content)
}
```
-  WriteFile  
`func WriteFile(filename string, data []byte, perm os.FileMode) error`  
函数向`filename`指定的文件中写入数据。如果文件不存在将按给出的权限创建文件，否则在写入数据之前清空文件。

```go
package main
import "io/ioutil"
func main() {
	ioutil.WriteFile("1.txt", []byte(`string`), 0777)
}
```
- ReadDir
`func ReadDir(dirname string) ([]os.FileInfo, error)`  
返回`dirname`指定的目录的目录信息的有序列表。

```go
package main
import (
	"fmt"
	"io/ioutil"
	"log"
)
func main() {
	files, err := ioutil.ReadDir(".")
	if err != nil {
		log.Fatal(err)
	}
	for _, file := range files {
		fmt.Println(file.Name())
	}
}
```

## strings
- Compare  
`func Compare(a, b string) int`  
Compare returns an integer comparing two strings lexicographically. The result will be 0 if a==b, -1 if a < b, and +1 if a > b.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.Compare("a", "b"))
	fmt.Println(strings.Compare("a", "a"))
	fmt.Println(strings.Compare("b", "a"))
}
```
- Contains  
`func Contains(s, substr string) bool`   
Contains reports whether substr is within s.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.Contains("seafood", "foo"))
	fmt.Println(strings.Contains("seafood", "bar"))
	fmt.Println(strings.Contains("seafood", ""))
	fmt.Println(strings.Contains("", ""))
}
```
- Count  
`func Count(s, substr string) int`  
Count counts the number of non-overlapping instances of substr in s. If substr is an empty string, Count returns 1 + the number of Unicode code points in s.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.Count("cheese", "e"))
	fmt.Println(strings.Count("five", "")) // before & after each rune
}
```
- HasPrefix  
`func HasPrefix(s, prefix string) bool`  
HasPrefix tests whether the string s begins with prefix
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.HasPrefix("Gopher", "Go"))
	fmt.Println(strings.HasPrefix("Gopher", "C"))
	fmt.Println(strings.HasPrefix("Gopher", ""))
}
```
- HasSuffix
`func HasSuffix(s, suffix string) bool`  
HasSuffix tests whether the string s ends with suffix.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.HasSuffix("Amigo", "go"))
	fmt.Println(strings.HasSuffix("Amigo", "O"))
	fmt.Println(strings.HasSuffix("Amigo", "Ami"))
	fmt.Println(strings.HasSuffix("Amigo", ""))
}
```
- Index  
`func Index(s, substr string) int`  
Index returns the index of the first instance of substr in s, or -1 if substr is not present in s.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.Index("chicken", "ken"))
	fmt.Println(strings.Index("chicken", "dmr"))
}
```
- Join  
`func Join(a []string, sep string) string`  
Join concatenates the elements of a to create a single string. The separator string sep is placed between elements in the resulting string.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	s := []string{"foo", "bar", "baz"}
	fmt.Println(strings.Join(s, ", "))
}
```
- Replace
`func Replace(s, old, new string, n int) string`  
Replace returns a copy of the string s with the first n non-overlapping instances of old replaced by new. If old is empty, it matches at the beginning of the string and after each UTF-8 sequence, yielding up to k+1 replacements for a k-rune string. If n < 0, there is no limit on the number of replacements.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.Replace("oink oink oink", "k", "ky", 2))
	fmt.Println(strings.Replace("oink oink oink", "oink", "moo", -1))
}
```
- Split
`func Split(s, sep string) []string` 
Split slices s into all substrings separated by sep and returns a slice of the substrings between those separators.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Printf("%q\n", strings.Split("a,b,c", ","))
	fmt.Printf("%q\n", strings.Split("a man a plan a canal panama", "a "))
	fmt.Printf("%q\n", strings.Split(" xyz ", ""))
	fmt.Printf("%q\n", strings.Split("", "Bernardo O''Higgins"))
}
```
- ToLower      
`func ToLower(s string) string`    
ToLower returns a copy of the string s with all Unicode letters mapped to their lower case.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.ToLower("Gopher"))
}
```

- ToUpper   
`func ToUpper(s string) string`       
ToUpper returns a copy of the string s with all Unicode letters mapped to their upper case.
```go
package main
import (
	"fmt"
	"strings"
)
func main() {
	fmt.Println(strings.ToUpper("Gopher"))
}
```

- Builder   
 ⚡️
A Builder is used to efficiently build a string using Write methods. It minimizes memory copying. The zero value is ready to use. Do not copy a non-zero Builder.
``` go
type Builder struct {
        // contains filtered or unexported fields
}
```  
```
package main
import (
	"fmt"
	"strings"
)
func main() {
	var b strings.Builder
	for i := 3; i >= 1; i-- {
		fmt.Fprintf(&b, "%d...", i)
	}
	b.WriteString("ignition")
	fmt.Println(b.String())
}
```

## bytes
- `bytes` 包使用方式同`strings包`
- `bytes` 包操作对象为`[]byte`
- `strings`包操作对象为`string`

直接操作不舒服
[正则走一波](/post/regular-expression.html)
', '<div class="toc"><ul>
<li><a href="#os">os</a><ul>
<li><a href="#toc-6bf">标准的文件信息</a></li>
<li><a href="#toc-694">常用方法</a></li>
</ul>
</li>
<li><a href="#toc-65f">io &amp;&amp; ioutil</a><ul>
<li><a href="#ioutil">ioutil</a></li>
</ul>
</li>
<li><a href="#strings">strings</a></li>
<li><a href="#bytes">bytes</a></li>
</ul>
</div><p>以示例的方式演示常用包的用法，更详细深入的信息请参考 <a href="https://golang.google.cn/pkg/">https://golang.google.cn/pkg/</a>标准库<br><img src="/static/upload/20180720/upload_a2a95976a5f1c377cd1244e720deeeea.png" alt="alt"></p>
<h2><a id="os" class="anchor" href="#os"></a>os</h2>
<ul>
<li><code>os</code>包提供了操作系统函数的不依赖平台的接口。设计为<code>Unix</code>风格的，错误处理是go风格的；失败的调用会返回错误值而非错误码。</li>
<li>通常错误值里包含更多信息。</li>
</ul>
<p><code>os</code>包的接口规定为在所有操作系统中都是一致的。</p>
<!--more-->
<p>打开一个文件并从中读取一些数据。</p>
<pre><code class="hljs lang-go">file, err := os.Open(<span class="hljs-string">"file.go"</span>)
<span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
    log.Fatal(err)
}
</code></pre>
<p>如果打开失败，错误字符串是自解释的。<br><code>open file.go: no such file or directory</code></p>
<p>文件的信息可以读取进一个<code>[]byte</code>切片。<code>Read</code>和<code>Write</code>方法从切片参数获取其内的字节数。</p>
<pre><code class="hljs lang-go">data := <span class="hljs-built_in">make</span>([]<span class="hljs-keyword">byte</span>, <span class="hljs-number">100</span>)
count, err := file.Read(data)
<span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
    log.Fatal(err)
}
fmt.Printf(<span class="hljs-string">"read %d bytes: %q\n"</span>, count, data[:count])
</code></pre>
<h3><a id="toc-6bf" class="anchor" href="#toc-6bf"></a>标准的文件信息</h3>
<pre><code class="hljs lang-go"><span class="hljs-keyword">type</span> FileInfo <span class="hljs-keyword">interface</span> {
    Name() <span class="hljs-keyword">string</span>       <span class="hljs-comment">// base name of the file</span>
    Size() <span class="hljs-keyword">int64</span>        <span class="hljs-comment">// length in bytes for regular files; system-dependent for others</span>
    Mode() FileMode     <span class="hljs-comment">// file mode bits</span>
    ModTime() time.Time <span class="hljs-comment">// modification time</span>
    IsDir() <span class="hljs-keyword">bool</span>        <span class="hljs-comment">// abbreviation for Mode().IsDir()</span>
    Sys() <span class="hljs-keyword">interface</span>{}   <span class="hljs-comment">// underlying data source (can return nil)</span>
}
</code></pre>
<h3><a id="toc-694" class="anchor" href="#toc-694"></a>常用方法</h3>
<ul>
<li>Stat<br><code>func Stat(name string) (fi FileInfo, err error)</code><br><code>Stat</code>返回一个描述<code>name</code>指定的文件对象的<code>FileInfo</code>。<pre><code class="hljs lang-go">f, _ := os.Stat(<span class="hljs-string">`main.go`</span>)
fmt.Println(f.Name(), f.IsDir(), f.ModTime())
</code></pre>
</li>
<li>Mkdir<br><code>func Mkdir(name string, perm FileMode) error</code><br><code>Mkdir</code>使用指定的权限和名称创建一个目录。<pre><code class="hljs lang-go">os.Mkdir(<span class="hljs-string">`dir`</span>, <span class="hljs-number">0777</span>)
</code></pre>
<img src="/static/upload/20180720/upload_e9a73d014542e1228a9a08c31b12de29.png" alt="alt"></li>
<li><p>MkdirAll<br><code>func MkdirAll(path string, perm FileMode) error</code><br><code>MkdirAll</code>使用指定的权限和名称创建一个目录，包括任何必要的上级目录，并返回nil，否则返回错误。<br> 权限位<code>perm</code>会应用在每一个被本函数创建的目录上。<br> 如果path指定了一个已经存在的目录，MkdirAll不做任何操作并返回nil。</p>
<pre><code class="hljs lang-go">os.MkdirAll(<span class="hljs-string">`a/b/c/d`</span>, <span class="hljs-number">0777</span>)
</code></pre>
<p><img src="/static/upload/20180720/upload_a4ecf075da47c998092272678259589d.png" alt="alt"></p>
</li>
<li><p>Rename<br><code>func Rename(oldpath, newpath string) error</code><br>Rename修改一个文件的名字，移动一个文件。可能会有一些个操作系统特定的限制。</p>
<pre><code class="hljs lang-go">os.Rename(<span class="hljs-string">`dir`</span>, <span class="hljs-string">`dir1`</span>)
</code></pre>
<p><img src="/static/upload/20180720/upload_092c76037732ad6153ddb4a499655a6f.png" alt="alt"></p>
</li>
<li>Remove<br><code>func Remove(name string) error</code><br>Remove删除<code>name</code>指定的文件或目录。<pre><code class="hljs lang-go">os.Remove(<span class="hljs-string">`dir1`</span>)
</code></pre>
<img src="/static/upload/20180720/upload_2003eaf33eb743e7e22593c20be9d05c.png" alt="alt"></li>
<li>RemoveAll<br><code>func RemoveAll(path string) error</code><br>RemoveAll删除path指定的文件，或目录及它包含的任何下级对象。它会尝试删除所有东西，除非遇到错误并返回。<br>如果path指定的对象不存在，<code>RemoveAll</code>会返回nil而不返回错误。<pre><code class="hljs lang-go">os.RemoveAll(<span class="hljs-string">`a`</span>)
</code></pre>
<img src="/static/upload/20180720/upload_5b46e1aaac0611fa435eca5ac25ab103.png" alt="alt"></li>
<li><p>Create<br><code>func Create(name string) (file *File, err error)</code><br><code>Create</code>采用模式<code>0666</code>✋创建一个名为<code>name</code>的文件，如果文件已存在会置为空文件。<br>如果成功，返回的文件对象可用于<code>I/O</code>；对应的文件描述符具有<code>O_RDWR</code>模式。</p>
</li>
<li><p>Open<br><code>func Open(name string) (file *File, err error)</code> 
<code>Open</code>打开一个文件用于读取。如果操作成功，返回的文件对象的方法可用于读取数据；对应的文件描述符具有<code>O_RDONLY</code>模式。</p>
<pre><code class="hljs lang-go">fout, _ := os.Create(<span class="hljs-string">`output.txt`</span>)
fin, _ := os.Open(<span class="hljs-string">`main.go`</span>)
io.Copy(fout, fin)<span class="hljs-comment">//io包</span>
</code></pre>
</li>
<li>OpenFile<br><code>func OpenFile(name string, flag int, perm FileMode) (file *File, err error)</code><br><code>OpenFile</code>是一个更一般性的文件打开函数，大多数调用者都应用<code>Open</code>或<code>Create</code>代替本函数。<br>它会使用指定的选项（如<code>O_RDONLY</code>等）、指定的模式（如<code>066</code>6等）打开指定名称的文件。<br>如果操作成功，返回的文件对象可用于<code>I/O</code>。<pre><code class="hljs lang-go">fout, _ := os.Create(<span class="hljs-string">`output.txt`</span>)
fin, _ := os.OpenFile(<span class="hljs-string">`main.go`</span>, os.O_RDWR, <span class="hljs-number">0666</span>)
io.Copy(fout, fin)
</code></pre>
</li>
<li>Readdir
<code>func (f *File) Readdir(n int) (fi []FileInfo, err error)</code><br><code>Readdir</code>读取目录f的内容，返回一个有<code>n</code>个成员的<code>[]FileInfo</code>，采用目录顺序。  对本函数的下一次调用会返回上一次调用剩余未读取的内容的信息。<br>如果<code>n&gt;0</code>，<code>Readdir</code>函数会返回一个最多n个成员的切片。<br>如果<code>n&lt;=0</code>，<code>Readdir</code>函数返回目录中剩余所有文件对象的<code>FileInfo</code>构成的切片。 <pre><code class="hljs lang-go">dir, _ := os.Open(<span class="hljs-string">`util`</span>)
dirs, _ := dir.Readdir(<span class="hljs-number">-1</span>)
<span class="hljs-keyword">for</span> idx := <span class="hljs-keyword">range</span> dirs {
  fmt.Println(dirs[idx].Name())
}
</code></pre>
</li>
<li>Read<br><code>func (f *File) Read(b []byte) (n int, err error)</code><br><code>Read</code>方法从f中读取最多<code>len(b)</code>字节数据并写入<code>b</code>。它返回读取的字节数和可能遇到的任何错误。文件终止标志是读取<code>0</code>个字节且返回值<code>err</code>为<code>io.EOF</code>。</li>
<li>Write<br><code>func (f *File) Write(b []byte) (n int, err error)</code><br><code>Write</code>向文件中写入<code>len(b)</code>字节数据。它返回写入的字节数和可能遇到的任何错误。如果返回值<code>n!=len(b)</code>，本方法会返回一个非<code>nil</code>的错误。</li>
<li>Close<br><code>func (f *File) Close() error</code><br><code>Close</code>关闭文件<code>f</code>，使文件不能用于读写。它返回可能出现的错误。<pre><code class="hljs lang-go">fin, _ := os.Open(<span class="hljs-string">`main.go`</span>)
fout, _ := os.Create(<span class="hljs-string">`output.txt`</span>)
<span class="hljs-comment">//准备容器</span>
buf := <span class="hljs-built_in">make</span>([]<span class="hljs-keyword">byte</span>, <span class="hljs-number">128</span>)
<span class="hljs-keyword">for</span> {
  n, err := fin.Read(buf)
  <span class="hljs-keyword">if</span> n == <span class="hljs-number">0</span> || err == io.EOF {
      <span class="hljs-keyword">break</span>
  }
  fout.Write(buf[:n])
}
fin.Close()
fout.Close()
</code></pre>
</li>
<li><code>WriteString</code><br><code>func (f *File) WriteString(s string) (ret int, err error)</code><br><code>WriteString</code> 类似<code>Write</code>，但接受一个字符串参数。</li>
</ul>
<pre><code class="hljs lang-go">fout, _ := os.Create(<span class="hljs-string">`output.txt`</span>)
<span class="hljs-keyword">defer</span> fout.Close()
fout.WriteString(<span class="hljs-string">`WriteString`</span>)
</code></pre>
<h2><a id="toc-65f" class="anchor" href="#toc-65f"></a>io &amp;&amp; ioutil</h2>
<ul>
<li><p>eof 
<code>var EOF = errors.New(&quot;EOF&quot;)</code><br><code>EOF</code>当无法得到更多输入时，<code>Read</code>方法返回<code>EOF</code>☂️。当函数一切正常的到达输入的结束时，就应返回<code>EOF</code>。</p>
</li>
<li><p>Copy
<code>func Copy(dst Writer, src Reader) (written int64, err error)</code></p>
</li>
<li>将<code>src</code>的数据拷贝到<code>dst</code>，直到在<code>src</code>上到达<code>EOF</code>或发生错误。返回拷贝的字节数和遇到的第一个错误。</li>
<li>对成功的调用，返回值err为nil而<code>非EOF</code>，因为<code>Copy</code>定义为从<code>src</code>读取直到<code>EOF</code>，它<strong>不</strong>会将读取到<code>EOF</code>视为应报告的错误。<pre><code class="hljs lang-go">fout, _ := os.Create(<span class="hljs-string">`output.txt`</span>)
fin, _ := os.OpenFile(<span class="hljs-string">`main.go`</span>, os.O_RDWR, <span class="hljs-number">0666</span>)
io.Copy(fout, fin)
</code></pre>
<h3><a id="ioutil" class="anchor" href="#ioutil"></a>ioutil</h3>
</li>
<li>ReadAll<br><code>func ReadAll(r io.Reader) ([]byte, error)</code><br><code>ReadAll</code>从<code>r</code>读取数据直到<code>EOF</code>或遇到<code>error</code>，返回读取的数据和遇到的错误。<br>成功的调用返回的<code>err</code>为<code>nil</code>而非<code>EOF</code>。因为本函数定义为读取r直到<code>EOF</code>，它不会将读取返回的<code>EOF</code>视为应报告的错误。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"io/ioutil"</span>
    <span class="hljs-string">"log"</span>
    <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    r := strings.NewReader(<span class="hljs-string">"Go is a general-purpose language designed with systems programming in mind."</span>)
    b, err := ioutil.ReadAll(r)
    <span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
        log.Fatal(err)
    }
    fmt.Printf(<span class="hljs-string">"%s"</span>, b)
}
</code></pre>
<ul>
<li>ReadFile<br><code>func ReadFile(filename string) ([]byte, error)</code><br><code>ReadFile</code> 从<code>filename</code>指定的文件中读取数据并返回文件的内容。成功的调用返回的<code>err</code>为<code>nil</code>而非<code>EOF</code>。因为本函数定义为读取整个文件，它不会将读取返回的<code>EOF</code>视为应报告的错误。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"io/ioutil"</span>
    <span class="hljs-string">"log"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    content, err := ioutil.ReadFile(<span class="hljs-string">"testdata/hello"</span>)
    <span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
        log.Fatal(err)
    }
    fmt.Printf(<span class="hljs-string">"File contents: %s"</span>, content)
}
</code></pre>
<ul>
<li>WriteFile<br><code>func WriteFile(filename string, data []byte, perm os.FileMode) error</code><br>函数向<code>filename</code>指定的文件中写入数据。如果文件不存在将按给出的权限创建文件，否则在写入数据之前清空文件。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> <span class="hljs-string">"io/ioutil"</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    ioutil.WriteFile(<span class="hljs-string">"1.txt"</span>, []<span class="hljs-keyword">byte</span>(<span class="hljs-string">`string`</span>), <span class="hljs-number">0777</span>)
}
</code></pre>
<ul>
<li>ReadDir
<code>func ReadDir(dirname string) ([]os.FileInfo, error)</code><br>返回<code>dirname</code>指定的目录的目录信息的有序列表。</li>
</ul>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"io/ioutil"</span>
    <span class="hljs-string">"log"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    files, err := ioutil.ReadDir(<span class="hljs-string">"."</span>)
    <span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
        log.Fatal(err)
    }
    <span class="hljs-keyword">for</span> _, file := <span class="hljs-keyword">range</span> files {
        fmt.Println(file.Name())
    }
}
</code></pre>
<h2><a id="strings" class="anchor" href="#strings"></a>strings</h2>
<ul>
<li>Compare<br><code>func Compare(a, b string) int</code><br>Compare returns an integer comparing two strings lexicographically. The result will be 0 if a==b, -1 if a &lt; b, and +1 if a &gt; b.<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.Compare(<span class="hljs-string">"a"</span>, <span class="hljs-string">"b"</span>))
  fmt.Println(strings.Compare(<span class="hljs-string">"a"</span>, <span class="hljs-string">"a"</span>))
  fmt.Println(strings.Compare(<span class="hljs-string">"b"</span>, <span class="hljs-string">"a"</span>))
}
</code></pre>
</li>
<li>Contains<br><code>func Contains(s, substr string) bool</code><br>Contains reports whether substr is within s.<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.Contains(<span class="hljs-string">"seafood"</span>, <span class="hljs-string">"foo"</span>))
  fmt.Println(strings.Contains(<span class="hljs-string">"seafood"</span>, <span class="hljs-string">"bar"</span>))
  fmt.Println(strings.Contains(<span class="hljs-string">"seafood"</span>, <span class="hljs-string">""</span>))
  fmt.Println(strings.Contains(<span class="hljs-string">""</span>, <span class="hljs-string">""</span>))
}
</code></pre>
</li>
<li>Count<br><code>func Count(s, substr string) int</code><br>Count counts the number of non-overlapping instances of substr in s. If substr is an empty string, Count returns 1 + the number of Unicode code points in s.<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.Count(<span class="hljs-string">"cheese"</span>, <span class="hljs-string">"e"</span>))
  fmt.Println(strings.Count(<span class="hljs-string">"five"</span>, <span class="hljs-string">""</span>)) <span class="hljs-comment">// before &amp; after each rune</span>
}
</code></pre>
</li>
<li>HasPrefix<br><code>func HasPrefix(s, prefix string) bool</code><br>HasPrefix tests whether the string s begins with prefix<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.HasPrefix(<span class="hljs-string">"Gopher"</span>, <span class="hljs-string">"Go"</span>))
  fmt.Println(strings.HasPrefix(<span class="hljs-string">"Gopher"</span>, <span class="hljs-string">"C"</span>))
  fmt.Println(strings.HasPrefix(<span class="hljs-string">"Gopher"</span>, <span class="hljs-string">""</span>))
}
</code></pre>
</li>
<li>HasSuffix
<code>func HasSuffix(s, suffix string) bool</code><br>HasSuffix tests whether the string s ends with suffix.<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.HasSuffix(<span class="hljs-string">"Amigo"</span>, <span class="hljs-string">"go"</span>))
  fmt.Println(strings.HasSuffix(<span class="hljs-string">"Amigo"</span>, <span class="hljs-string">"O"</span>))
  fmt.Println(strings.HasSuffix(<span class="hljs-string">"Amigo"</span>, <span class="hljs-string">"Ami"</span>))
  fmt.Println(strings.HasSuffix(<span class="hljs-string">"Amigo"</span>, <span class="hljs-string">""</span>))
}
</code></pre>
</li>
<li>Index<br><code>func Index(s, substr string) int</code><br>Index returns the index of the first instance of substr in s, or -1 if substr is not present in s.<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.Index(<span class="hljs-string">"chicken"</span>, <span class="hljs-string">"ken"</span>))
  fmt.Println(strings.Index(<span class="hljs-string">"chicken"</span>, <span class="hljs-string">"dmr"</span>))
}
</code></pre>
</li>
<li>Join<br><code>func Join(a []string, sep string) string</code><br>Join concatenates the elements of a to create a single string. The separator string sep is placed between elements in the resulting string.<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  s := []<span class="hljs-keyword">string</span>{<span class="hljs-string">"foo"</span>, <span class="hljs-string">"bar"</span>, <span class="hljs-string">"baz"</span>}
  fmt.Println(strings.Join(s, <span class="hljs-string">", "</span>))
}
</code></pre>
</li>
<li>Replace
<code>func Replace(s, old, new string, n int) string</code><br>Replace returns a copy of the string s with the first n non-overlapping instances of old replaced by new. If old is empty, it matches at the beginning of the string and after each UTF-8 sequence, yielding up to k+1 replacements for a k-rune string. If n &lt; 0, there is no limit on the number of replacements.<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.Replace(<span class="hljs-string">"oink oink oink"</span>, <span class="hljs-string">"k"</span>, <span class="hljs-string">"ky"</span>, <span class="hljs-number">2</span>))
  fmt.Println(strings.Replace(<span class="hljs-string">"oink oink oink"</span>, <span class="hljs-string">"oink"</span>, <span class="hljs-string">"moo"</span>, <span class="hljs-number">-1</span>))
}
</code></pre>
</li>
<li>Split
<code>func Split(s, sep string) []string</code> 
Split slices s into all substrings separated by sep and returns a slice of the substrings between those separators.<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Printf(<span class="hljs-string">"%q\n"</span>, strings.Split(<span class="hljs-string">"a,b,c"</span>, <span class="hljs-string">","</span>))
  fmt.Printf(<span class="hljs-string">"%q\n"</span>, strings.Split(<span class="hljs-string">"a man a plan a canal panama"</span>, <span class="hljs-string">"a "</span>))
  fmt.Printf(<span class="hljs-string">"%q\n"</span>, strings.Split(<span class="hljs-string">" xyz "</span>, <span class="hljs-string">""</span>))
  fmt.Printf(<span class="hljs-string">"%q\n"</span>, strings.Split(<span class="hljs-string">""</span>, <span class="hljs-string">"Bernardo O''Higgins"</span>))
}
</code></pre>
</li>
<li><p>ToLower<br><code>func ToLower(s string) string</code><br>ToLower returns a copy of the string s with all Unicode letters mapped to their lower case.</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.ToLower(<span class="hljs-string">"Gopher"</span>))
}
</code></pre>
</li>
<li><p>ToUpper<br><code>func ToUpper(s string) string</code><br>ToUpper returns a copy of the string s with all Unicode letters mapped to their upper case.</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  fmt.Println(strings.ToUpper(<span class="hljs-string">"Gopher"</span>))
}
</code></pre>
</li>
<li><p>Builder<br>⚡️
A Builder is used to efficiently build a string using Write methods. It minimizes memory copying. The zero value is ready to use. Do not copy a non-zero Builder.</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">type</span> Builder <span class="hljs-keyword">struct</span> {
      <span class="hljs-comment">// contains filtered or unexported fields</span>
}
</code></pre>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
  <span class="hljs-string">"fmt"</span>
  <span class="hljs-string">"strings"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
  <span class="hljs-keyword">var</span> b strings.Builder
  <span class="hljs-keyword">for</span> i := <span class="hljs-number">3</span>; i &gt;= <span class="hljs-number">1</span>; i-- {
      fmt.Fprintf(&amp;b, <span class="hljs-string">"%d..."</span>, i)
  }
  b.WriteString(<span class="hljs-string">"ignition"</span>)
  fmt.Println(b.String())
}
</code></pre></li>
</ul>
<h2><a id="bytes" class="anchor" href="#bytes"></a>bytes</h2>
<ul>
<li><code>bytes</code> 包使用方式同<code>strings包</code></li>
<li><code>bytes</code> 包操作对象为<code>[]byte</code></li>
<li><code>strings</code>包操作对象为<code>string</code></li>
</ul>
<p>直接操作不舒服
<a href="/post/regular-expression.html">正则走一波</a></p>
', 1, '2018-07-20 08:22:37', '2018-07-23 16:40:14', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('59', '4', '1', 0, 3, 'goweb-038-常用包net+http', 'goweb-03-8', '<p>网络操作(计算机网络相关知识可以利用此包实践)</p>
<h2 id="net">net</h2>
<ul>
<li><code>net</code>包提供了可移植的网络<code>I/O</code>接口，包括<code>TCP/IP</code>、<code>UDP</code>、域名解析和<code>Unix</code>域<code>socket</code>。</li>
<li>本包提供了对网络原语的访问，大部分使用者只需要<code>Dial</code>、<code>Listen</code>和<code>Accept</code>函数提供的基本接口；以及相关的<code>Conn</code>和<code>Listener</code>接口。</li>
</ul>
', '网络操作(计算机网络相关知识可以利用此包实践)

## net
- `net`包提供了可移植的网络`I/O`接口，包括`TCP/IP`、`UDP`、域名解析和`Unix`域`socket`。
- 本包提供了对网络原语的访问，大部分使用者只需要`Dial`、`Listen`和`Accept`函数提供的基本接口；以及相关的`Conn`和`Listener`接口。

<!--more-->

> 过程  

1. 服务端程序 `Listen` 监听某个端口，等待客户端程序的连接请求`Accept`。
2. 客户端程序 `Dial` 申请连接。
3. 服务端程序 处理连接请求并建立网络连接 `Conn`
4. 双方在`Conn` 进行读`Read`/写`Write`操作传递数据。

代码示例  
server 
```go
package main
import (
	"net"
)
func main() {
	//监听端口
	listen, _ := net.Listen("tcp", `:88`)
	for {
		//等待连接连接并建立连接
		conn, _ := listen.Accept()
		//通过连接发送数据
		conn.Write([]byte(`hello 我是服务端`))
	}
}
```

client  
```go
package main
import (
	"fmt"
	"net"
)
func main() {
	//请求建立连接
	conn, _ := net.Dial("tcp", ":88")
	//数据容器
	buf := make([]byte, 1024)
	//读取数据到容器
	l, _ := conn.Read(buf)
	//打印输出
	fmt.Println(string(buf[:l]))
}
```
模拟http    
浏览器访问 [http://127.0.0.1:86/](http://127.0.0.1:86/)查看效果

![alt](/static/upload/20180720/upload_d58bc21f7065acf2ef93d82e6441e987.png)
```go
package main
import (
	"fmt"
	"net"
)
func main() {
	//监听端口
	listen, _ := net.Listen("tcp", `:86`)
	//等待连接连接并建立连接
	conn, _ := listen.Accept()
	//http半双工需要先读取里面的数据
	buf := make([]byte, 1024)
	l, _ := conn.Read(buf)
	fmt.Println(string(buf[:l]))
	//通过连接发送数据
	//http 协议格式
	conn.Write([]byte("HTTP/1.1 200 OK\r\nContent-Type: text/plain;charset=UTF-8\r\n\r\n数据开始：net模拟http"))
	conn.Close()
}
```
浏览器  
![alt](/static/upload/20180720/upload_b9253304b8a4d505971937522cfc4514.png)  
控制台  
![alt](/static/upload/20180720/upload_32194fa03d531311b67b797aba4909f1.png)
## http  
[官方文档](https://golang.google.cn/pkg/net/http/)  
net的上层封装  
- `http`包提供了`HTTP`客户端和服务端的实现。

Get, Head, Post, and PostForm make HTTP (or HTTPS) requests:

```go
//普通get请求
resp, err := http.Get("http://example.com/")
//上传文件
bodyBuf := &bytes.Buffer{}
bodyWriter := multipart.NewWriter(bodyBuf)
fileWriter, _ := bodyWriter.CreateFormFile("file", "main.go")
fh, _ := os.Open("main.go")
defer fh.Close()
io.Copy(fileWriter, fh)
ctype := bodyWriter.FormDataContentType()
bodyWriter.Close()
http.Post("http://127.0.0.1/up", ctype, bodyBuf)

//提交数据
resp, err := http.PostForm("http://example.com/form",
	url.Values{"key": {"Value"}, "id": {"123"}})
```

The client must close the response body when finished with it:
```go
resp, err := http.Get("http://example.com/")
if err != nil {
	// handle error
}
defer resp.Body.Close()
body, err := ioutil.ReadAll(resp.Body)
// ...
```

For control over HTTP client headers, redirect policy, and other settings, create a Client:
```go
client := &http.Client{
}

resp, err := client.Get("http://example.com")
// ...

req, err := http.NewRequest("GET", "http://example.com", nil)
// ...
req.Header.Add("If-None-Match", `W/"wyzzy"`)
resp, err := client.Do(req)
```
爬取页面

```go
package main
import (
	"fmt"
	"io/ioutil"
	"net/http"
	"regexp"
)
func main() {
	//发送http请求
	resp, err := http.Get("http://www.cwnu.edu.cn/")
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()
	//读取响应数据
	body, err := ioutil.ReadAll(resp.Body)
	//解析 a标签里面的 href数据
	reg, _ := regexp.Compile(`<a.+href="(http.+?)"`)
	res := reg.FindAllStringSubmatch(string(body), -1)
	for idx := range res {
		fmt.Println(res[idx][1])
		//后续数据处理
	}
}
```

### web
版本1
```
package main

import (
	"net/http"
)

func index(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte(`hello`))
}
func main() {
	http.HandleFunc(`/first`, index)
	http.ListenAndServe(":8080", nil)
}
```
![alt](/static/upload/20180720/upload_a1a517c639d3d67122045e4195b95631.png)

**巴拉巴拉。。。✍**

版本2

```go
package main
import (
	"io/ioutil"
	"net/http"
	"os"
)
func index(w http.ResponseWriter, r *http.Request) {
	//读取html文件
	f, _ := os.Open(`./index.html`)
	//读取数据
	buf, _ := ioutil.ReadAll(f)
	//写入到响应
	w.Write(buf)

}
func main() {
	http.HandleFunc(`/first`, index)
	//静态文件访问 css img js 等
	http.Handle("/res/", http.StripPrefix("/res/", http.FileServer(http.Dir("./res"))))
	http.ListenAndServe(":8080", nil)
}
```
html文件  
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>hello</title>
</head>
<body>
    <div>index.html</div>
    <script src="/res/js.js"></script>
</body>
</html>
```
js 文件
```js
alert("res js")
```
', '<div class="toc"><ul>
<li><a href="#net">net</a></li>
<li><a href="#http">http</a><ul>
<li><a href="#web">web</a></li>
</ul>
</li>
</ul>
</div><p>网络操作(计算机网络相关知识可以利用此包实践)</p>
<h2><a id="net" class="anchor" href="#net"></a>net</h2>
<ul>
<li><code>net</code>包提供了可移植的网络<code>I/O</code>接口，包括<code>TCP/IP</code>、<code>UDP</code>、域名解析和<code>Unix</code>域<code>socket</code>。</li>
<li>本包提供了对网络原语的访问，大部分使用者只需要<code>Dial</code>、<code>Listen</code>和<code>Accept</code>函数提供的基本接口；以及相关的<code>Conn</code>和<code>Listener</code>接口。</li>
</ul>
<!--more-->
<blockquote>
<p>过程  </p>
</blockquote>
<ol>
<li>服务端程序 <code>Listen</code> 监听某个端口，等待客户端程序的连接请求<code>Accept</code>。</li>
<li>客户端程序 <code>Dial</code> 申请连接。</li>
<li>服务端程序 处理连接请求并建立网络连接 <code>Conn</code></li>
<li>双方在<code>Conn</code> 进行读<code>Read</code>/写<code>Write</code>操作传递数据。</li>
</ol>
<p>代码示例<br>server </p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"net"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">//监听端口</span>
    listen, _ := net.Listen(<span class="hljs-string">"tcp"</span>, <span class="hljs-string">`:88`</span>)
    <span class="hljs-keyword">for</span> {
        <span class="hljs-comment">//等待连接连接并建立连接</span>
        conn, _ := listen.Accept()
        <span class="hljs-comment">//通过连接发送数据</span>
        conn.Write([]<span class="hljs-keyword">byte</span>(<span class="hljs-string">`hello 我是服务端`</span>))
    }
}
</code></pre>
<p>client  </p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"net"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">//请求建立连接</span>
    conn, _ := net.Dial(<span class="hljs-string">"tcp"</span>, <span class="hljs-string">":88"</span>)
    <span class="hljs-comment">//数据容器</span>
    buf := <span class="hljs-built_in">make</span>([]<span class="hljs-keyword">byte</span>, <span class="hljs-number">1024</span>)
    <span class="hljs-comment">//读取数据到容器</span>
    l, _ := conn.Read(buf)
    <span class="hljs-comment">//打印输出</span>
    fmt.Println(<span class="hljs-keyword">string</span>(buf[:l]))
}
</code></pre>
<p>模拟http<br>浏览器访问 <a href="http://127.0.0.1:86/">http://127.0.0.1:86/</a>查看效果</p>
<p><img src="/static/upload/20180720/upload_d58bc21f7065acf2ef93d82e6441e987.png" alt="alt"></p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"net"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">//监听端口</span>
    listen, _ := net.Listen(<span class="hljs-string">"tcp"</span>, <span class="hljs-string">`:86`</span>)
    <span class="hljs-comment">//等待连接连接并建立连接</span>
    conn, _ := listen.Accept()
    <span class="hljs-comment">//http半双工需要先读取里面的数据</span>
    buf := <span class="hljs-built_in">make</span>([]<span class="hljs-keyword">byte</span>, <span class="hljs-number">1024</span>)
    l, _ := conn.Read(buf)
    fmt.Println(<span class="hljs-keyword">string</span>(buf[:l]))
    <span class="hljs-comment">//通过连接发送数据</span>
    <span class="hljs-comment">//http 协议格式</span>
    conn.Write([]<span class="hljs-keyword">byte</span>(<span class="hljs-string">"HTTP/1.1 200 OK\r\nContent-Type: text/plain;charset=UTF-8\r\n\r\n数据开始：net模拟http"</span>))
    conn.Close()
}
</code></pre>
<p>浏览器<br><img src="/static/upload/20180720/upload_b9253304b8a4d505971937522cfc4514.png" alt="alt"><br>控制台<br><img src="/static/upload/20180720/upload_32194fa03d531311b67b797aba4909f1.png" alt="alt"></p>
<h2><a id="http" class="anchor" href="#http"></a>http</h2>
<p><a href="https://golang.google.cn/pkg/net/http/">官方文档</a><br>net的上层封装  </p>
<ul>
<li><code>http</code>包提供了<code>HTTP</code>客户端和服务端的实现。</li>
</ul>
<p>Get, Head, Post, and PostForm make HTTP (or HTTPS) requests:</p>
<pre><code class="hljs lang-go"><span class="hljs-comment">//普通get请求</span>
resp, err := http.Get(<span class="hljs-string">"http://example.com/"</span>)
<span class="hljs-comment">//上传文件</span>
bodyBuf := &amp;bytes.Buffer{}
bodyWriter := multipart.NewWriter(bodyBuf)
fileWriter, _ := bodyWriter.CreateFormFile(<span class="hljs-string">"file"</span>, <span class="hljs-string">"main.go"</span>)
fh, _ := os.Open(<span class="hljs-string">"main.go"</span>)
<span class="hljs-keyword">defer</span> fh.Close()
io.Copy(fileWriter, fh)
ctype := bodyWriter.FormDataContentType()
bodyWriter.Close()
http.Post(<span class="hljs-string">"http://127.0.0.1/up"</span>, ctype, bodyBuf)

<span class="hljs-comment">//提交数据</span>
resp, err := http.PostForm(<span class="hljs-string">"http://example.com/form"</span>,
    url.Values{<span class="hljs-string">"key"</span>: {<span class="hljs-string">"Value"</span>}, <span class="hljs-string">"id"</span>: {<span class="hljs-string">"123"</span>}})
</code></pre>
<p>The client must close the response body when finished with it:</p>
<pre><code class="hljs lang-go">resp, err := http.Get(<span class="hljs-string">"http://example.com/"</span>)
<span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
    <span class="hljs-comment">// handle error</span>
}
<span class="hljs-keyword">defer</span> resp.Body.Close()
body, err := ioutil.ReadAll(resp.Body)
<span class="hljs-comment">// ...</span>
</code></pre>
<p>For control over HTTP client headers, redirect policy, and other settings, create a Client:</p>
<pre><code class="hljs lang-go">client := &amp;http.Client{
}

resp, err := client.Get(<span class="hljs-string">"http://example.com"</span>)
<span class="hljs-comment">// ...</span>

req, err := http.NewRequest(<span class="hljs-string">"GET"</span>, <span class="hljs-string">"http://example.com"</span>, <span class="hljs-literal">nil</span>)
<span class="hljs-comment">// ...</span>
req.Header.Add(<span class="hljs-string">"If-None-Match"</span>, <span class="hljs-string">`W/"wyzzy"`</span>)
resp, err := client.Do(req)
</code></pre>
<p>爬取页面</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    <span class="hljs-string">"io/ioutil"</span>
    <span class="hljs-string">"net/http"</span>
    <span class="hljs-string">"regexp"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    <span class="hljs-comment">//发送http请求</span>
    resp, err := http.Get(<span class="hljs-string">"http://www.cwnu.edu.cn/"</span>)
    <span class="hljs-keyword">if</span> err != <span class="hljs-literal">nil</span> {
        <span class="hljs-built_in">panic</span>(err)
    }
    <span class="hljs-keyword">defer</span> resp.Body.Close()
    <span class="hljs-comment">//读取响应数据</span>
    body, err := ioutil.ReadAll(resp.Body)
    <span class="hljs-comment">//解析 a标签里面的 href数据</span>
    reg, _ := regexp.Compile(<span class="hljs-string">`&lt;a.+href="(http.+?)"`</span>)
    res := reg.FindAllStringSubmatch(<span class="hljs-keyword">string</span>(body), <span class="hljs-number">-1</span>)
    <span class="hljs-keyword">for</span> idx := <span class="hljs-keyword">range</span> res {
        fmt.Println(res[idx][<span class="hljs-number">1</span>])
        <span class="hljs-comment">//后续数据处理</span>
    }
}
</code></pre>
<h3><a id="web" class="anchor" href="#web"></a>web</h3>
<p>版本1</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main

<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"net/http"</span>
)

<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">index</span><span class="hljs-params">(w http.ResponseWriter, r *http.Request)</span></span> {
    w.Write([]<span class="hljs-keyword">byte</span>(<span class="hljs-string">`hello`</span>))
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    http.HandleFunc(<span class="hljs-string">`/first`</span>, index)
    http.ListenAndServe(<span class="hljs-string">":8080"</span>, <span class="hljs-literal">nil</span>)
}
</code></pre><p><img src="/static/upload/20180720/upload_a1a517c639d3d67122045e4195b95631.png" alt="alt"></p>
<p><strong>巴拉巴拉。。。✍</strong></p>
<p>版本2</p>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"io/ioutil"</span>
    <span class="hljs-string">"net/http"</span>
    <span class="hljs-string">"os"</span>
)
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">index</span><span class="hljs-params">(w http.ResponseWriter, r *http.Request)</span></span> {
    <span class="hljs-comment">//读取html文件</span>
    f, _ := os.Open(<span class="hljs-string">`./index.html`</span>)
    <span class="hljs-comment">//读取数据</span>
    buf, _ := ioutil.ReadAll(f)
    <span class="hljs-comment">//写入到响应</span>
    w.Write(buf)

}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    http.HandleFunc(<span class="hljs-string">`/first`</span>, index)
    <span class="hljs-comment">//静态文件访问 css img js 等</span>
    http.Handle(<span class="hljs-string">"/res/"</span>, http.StripPrefix(<span class="hljs-string">"/res/"</span>, http.FileServer(http.Dir(<span class="hljs-string">"./res"</span>))))
    http.ListenAndServe(<span class="hljs-string">":8080"</span>, <span class="hljs-literal">nil</span>)
}
</code></pre>
<p>html文件  </p>
<pre><code class="hljs lang-html"><span class="hljs-meta">&lt;!DOCTYPE html&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">html</span> <span class="hljs-attr">lang</span>=<span class="hljs-string">"en"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">head</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">charset</span>=<span class="hljs-string">"UTF-8"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">title</span>&gt;</span>hello<span class="hljs-tag">&lt;/<span class="hljs-name">title</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">head</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">body</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">div</span>&gt;</span>index.html<span class="hljs-tag">&lt;/<span class="hljs-name">div</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">script</span> <span class="hljs-attr">src</span>=<span class="hljs-string">"/res/js.js"</span>&gt;</span><span class="undefined"></span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">body</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">html</span>&gt;</span>
</code></pre>
<p>js 文件</p>
<pre><code class="hljs lang-js">alert(<span class="hljs-string">"res js"</span>)
</code></pre>
', 1, '2018-07-20 11:50:06', '2018-11-12 14:38:20', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('6', '1', '1', 0, 3, '收藏', 'collect', '<h3 id="webpack">webpack</h3>
<ul>
<li><a href="https://webpack.js.org/">webpack</a></li>
<li><a href="https://doc.webpack-china.org/">webpack-china</a></li>
</ul>
', '### webpack
* [webpack](https://webpack.js.org/)
* [webpack-china](https://doc.webpack-china.org/)

<!--more-->
### vue
   * [vue](https://cn.vuejs.org/)
   * [vue-router](https://router.vuejs.org/)
   * [vuex](https://vuex.vuejs.org/zh-cn/)

### golang
   * [golang中国](http://www.golangtc.com/)
   * [go语言中文网](http://studygolang.com/) 
   * [sqlx](https://github.com/jmoiron/sqlx)
   * [xorm](http://xorm.io/docs)
   * [gorm](https://github.com/jinzhu/gorm)
   * [beego](https://beego.me/)
   * [echo](https://echo.labstack.com/)
   * [gin](https://github.com/gin-gonic/gin)

### 看云
* [看云](http://www.kancloud.cn/@zxysilent) 
  
### pm2
* [m2](http://pm2.keymetrics.io/)

### nodejs
* [nodejs-en](https://nodejs.org/en/)
* [nodejs-cn](http://nodejs.cn/)
* [express-en](http://expressjs.com/)
* [express-cn](http://www.expressjs.com.cn/)
* [thinkjs](https://thinkjs.org/)
* [npm-doc](https://docs.npmjs.com/)  

### docker
* [daocloud](https://www.daocloud.io/)
* [doc](https://docs.docker.com/docker-for-windows/)
', '<div class="toc"><ul>
<li><a href="#webpack">webpack</a></li>
<li><a href="#vue">vue</a></li>
<li><a href="#golang">golang</a></li>
<li><a href="#toc-5b6">看云</a></li>
<li><a href="#pm2">pm2</a></li>
<li><a href="#nodejs">nodejs</a></li>
<li><a href="#docker">docker</a></li>
</ul>
</div><h3><a id="webpack" class="anchor" href="#webpack"></a>webpack</h3>
<ul>
<li><a href="https://webpack.js.org/">webpack</a></li>
<li><a href="https://doc.webpack-china.org/">webpack-china</a></li>
</ul>
<!--more-->
<h3><a id="vue" class="anchor" href="#vue"></a>vue</h3>
<ul>
<li><a href="https://cn.vuejs.org/">vue</a></li>
<li><a href="https://router.vuejs.org/">vue-router</a></li>
<li><a href="https://vuex.vuejs.org/zh-cn/">vuex</a></li>
</ul>
<h3><a id="golang" class="anchor" href="#golang"></a>golang</h3>
<ul>
<li><a href="http://www.golangtc.com/">golang中国</a></li>
<li><a href="http://studygolang.com/">go语言中文网</a> </li>
<li><a href="https://github.com/jmoiron/sqlx">sqlx</a></li>
<li><a href="http://xorm.io/docs">xorm</a></li>
<li><a href="https://github.com/jinzhu/gorm">gorm</a></li>
<li><a href="https://beego.me/">beego</a></li>
<li><a href="https://echo.labstack.com/">echo</a></li>
<li><a href="https://github.com/gin-gonic/gin">gin</a></li>
</ul>
<h3><a id="toc-5b6" class="anchor" href="#toc-5b6"></a>看云</h3>
<ul>
<li><a href="http://www.kancloud.cn/@zxysilent">看云</a> </li>
</ul>
<h3><a id="pm2" class="anchor" href="#pm2"></a>pm2</h3>
<ul>
<li><a href="http://pm2.keymetrics.io/">m2</a></li>
</ul>
<h3><a id="nodejs" class="anchor" href="#nodejs"></a>nodejs</h3>
<ul>
<li><a href="https://nodejs.org/en/">nodejs-en</a></li>
<li><a href="http://nodejs.cn/">nodejs-cn</a></li>
<li><a href="http://expressjs.com/">express-en</a></li>
<li><a href="http://www.expressjs.com.cn/">express-cn</a></li>
<li><a href="https://thinkjs.org/">thinkjs</a></li>
<li><a href="https://docs.npmjs.com/">npm-doc</a>  </li>
</ul>
<h3><a id="docker" class="anchor" href="#docker"></a>docker</h3>
<ul>
<li><a href="https://www.daocloud.io/">daocloud</a></li>
<li><a href="https://docs.docker.com/docker-for-windows/">doc</a></li>
</ul>
', 1, '2017-04-07 19:31:38', '2017-04-11 20:22:05', 1, 0, '"{\"template\":\"\",\"push_sites\":[]}"');
INSERT INTO "public"."post" VALUES ('60', '4', '1', 0, 3, 'goweb-04-数据库', 'goweb-04', '<h2 id="-">测试数据库</h2>
<p><code>mysql -V</code><br><img src="/static/upload/20180712/screenshot_1502450228763.png" alt=""><br><a href="http://pan.baidu.com/s/1kUAXwgv">测试数据</a>
tip<code>source D:/news.sql;</code></p>
', '## 测试数据库
`mysql -V`  
![](/static/upload/20180712/screenshot_1502450228763.png)  
[测试数据](http://pan.baidu.com/s/1kUAXwgv)
tip`source D:/news.sql;`
<!--more-->
## 命令行操作
1. 连接命令
`mysql -h host -P port  -u user -p password`
2. 步骤 `win + r `->`cmd`->`mysql -u root -p enter`-> `password`  
![](/static/upload/20180712/screenshot_1502449944199.png)
![](/static/upload/20180712/screenshot_1502449959964.png)
3. 显示所有数据库  
`show databases;`  
![](/static/upload/20180712/screenshot_1502450071613.png)
4. 指定要使用的数据库  
`use news;`  
![](/static/upload/20180712/screenshot_1502450164958.png)
5. 显示所有的数据表  
`show tables;`  
![](/static/upload/20180712/screenshot_1502450435648.png)
6. 执行sql    
 ![](/static/upload/20180712/screenshot_1502450501420.png)

**注意**  

> 其它sql语句都可以这样执行  
> 并且接下来的所讲的都可以这样执行  
> 但为了更方便的学习我们主要采用可视化工具方式教学  

## 可视化工具navicat  
还原数据库  
![alt](/static/upload/20180720/upload_ccb8b04f1a3b89abb4f4777e48bfddb2.png)

打开运行`sql`语句界面  
![alt](/static/upload/20180720/upload_a2d91936c86ee81f54509765c70283d8.png)  
### select
#### 查询所有数据
```
select * from article
```
![](/static/upload/20180712/screenshot_1502451531611.png)
#### 查询部分列
```
SELECT id,title,author FROM article
```
![](/static/upload/20180712/screenshot_1502451773194.png)
#### 列别名
```
SELECT id 编号,title as 标题,author FROM article
```
![](/static/upload/20180712/screenshot_1502451883782.png)
![](/static/upload/20180712/screenshot_1502451912272.png)
#### Where
 1. **>**
 ```
 SELECT * FROM article WHERE id >100
 ```
![](/static/upload/20180712/screenshot_1502503267828.png)
 2. **<**
 ```
 SELECT * FROM article WHERE id <10
 ```
  ![](/static/upload/20180712/screenshot_1502503217133.png)
 3. **=**  
```
 SELECT * FROM article WHERE id =100
```
 ![](/static/upload/20180712/screenshot_1502503399115.png)
 4. 区间
```
SELECT * FROM article WHERE id > 95 and id <100
SELECT * FROM article WHERE id BETWEEN 96 AND 99
SELECT * FROM article WHERE id in(96,97,98,99)
```
![](/static/upload/20180712/screenshot_1502503794587.png)
5. **like** 

> 类型自动转换 

1. 没有通配符
```
SELECT * FROM article WHERE id LIKE ''90'' 
```
![](/static/upload/20180712/screenshot_1502504290128.png)
2.  `_`通配符
```
SELECT * FROM article WHERE id LIKE ''_1'' 
```
![](/static/upload/20180712/screenshot_1502504557696.png)
3. `%`通配符
```
SELECT * FROM article WHERE id LIKE ''%1'' 
```
![](/static/upload/20180712/screenshot_1502504587984.png)
4.  Count & Concat
```
SELECT count(*) FROM article WHERE id LIKE ''%1'' #%通配符
```
![](/static/upload/20180712/screenshot_1502507062019.png)
```
SELECT * FROM article WHERE title = CONCAT(''服务'',''指南'')
```
![](/static/upload/20180712/screenshot_1502507298141.png)
5. Limit & Top
```
SELECT * FROM article  limit 4 # 只查询前4条数据
```
![](/static/upload/20180712/screenshot_1502507624013.png)
```
SELECT * FROM article  limit 2,4 # 第三条开始查询前4条数据
```
![](/static/upload/20180712/screenshot_1502507747804.png)   

6.  MSSQL        
```
select * from Area
```
![](/static/upload/20180712/screenshot_1502519107517.png)
```
select top 3 * from Area
```  
![](/static/upload/20180712/screenshot_1502519235984.png)

7. Order by
```
SELECT * FROM article  ORDER by id DESC 
```  
![](/static/upload/20180712/screenshot_1502518851092.png)

8. 分页

```SQL
原始数据
1   2   3   4   5   6   7   8   9   10  11 
分页要求
pageSize 4
pageIndex 2

limit 一个参数 or top
1   2   3   4
5   6   7   8
9   10  11 

目标分页数 
5   6   7   8

步骤 
1   2   3   4   5   6   7   8 
SELECT * FROM article LIMIT 8 #2*4

8   7   6   5   4   3   2   1
SELECT * FROM (SELECT * FROM article LIMIT 8) AS First ORDER BY id DESC 

8   7   6   5
SELECT * FROM (SELECT * FROM article LIMIT 8) AS First ORDER BY id DESC LIMIT 4

5   6   7   8  
SELECT * FROM (SELECT * FROM (SELECT * FROM article LIMIT 8) AS One ORDER BY id DESC LIMIT 4 ) AS Two ORDER BY id ASC

```
![](/static/upload/20180712/screenshot_1502519882481.png)

**Easy**
```
SELECT  * FROM article LIMIT 4,4
```
![](/static/upload/20180712/screenshot_1502521481331.png)

**More**
```
EXPLAIN SELECT  * FROM (SELECT * FROM (SELECT * FROM article LIMIT 8) AS One ORDER BY id DESC LIMIT 4 )AS Two ORDER BY id ASC
```
![](/static/upload/20180712/screenshot_1502520752305.png)
```
EXPLAIN SELECT  * FROM article WHERE id= 3
```
![](/static/upload/20180712/screenshot_1502521401911.png)

### insert
```SQL
#要插入所有列
INSERT INTO 表名称 VALUES (值1, 值2,....)
#指定所要插入数据的列：
INSERT INTO 表名称 (列1, 列2,...) VALUES (值1, 值2,....)
```
### update
```SQL
# 更新指定数据
UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
# 所有数据
UPDATE 表名称 SET 列名称 = 新值 
```
### delete
```SQL
# 删除某些数据
DELETE FROM 表名称 WHERE 列名称 = 值
# 删除所有数据
DELETE FROM 表名称
DELETE * FROM 表名称
```
### SELECT步骤
> (8) SELECT 
> (9)DISTINCT  
> (11)  <TOP_specification> <select_list>  
> (1) FROM <left_table>  
> (3)　<join_type> JOIN <right_table>  
> (2)　 ON <join_condition>  
> (4) WHERE <where_condition>  
> (5) GROUP BY <group_by_list>  
> (6) WITH {CUBE | ROLLUP}  
> (7) HAVING <having_condition>  
> (10) ORDER BY <order_by_list>  

每个步骤产生一个虚拟表，该虚拟表被用作下一个步骤的输入。  
只有最后一步生成的表返回给调用者。如果没有某一子句，则跳过相应的步骤。  
1. FROM:对FROM子句中的前两个表执行笛卡尔积，生成虚拟表VT1。
2. ON:对VT1应用ON筛选器。只有那些使<join_condition>为真的行才被插入VT2。
3. OUTER(JOIN):如果指定了OUTER JOIN，保留表中未找到匹配的行将作为外部行添加到VT2，生成VT3。如果FROM子句包含两个以上的表，则对上一个联接生成的结果表和下一个表重复执行步骤1到步骤3，直到 处理完所有的表为止。
4. 对VT3应用WHERE筛选器。只有使<where_condition>为TRUE的行才被插入VT4。
5. GROUP BY:按GROUP BY 子句中的列列表对VT4中的行分组，生成VT5。
6. CUBE|ROLLUP:把超组插入VT5，生成VT6。
7. HAVING:对VT6应用HAVING筛选器。只有使<having_condition>为TRUE的组才会被插入VT7。 
8. SELECT:处理SELECT列表，产生VT8。
9. DISTINCT:将重复的行从VT8中移除，产生VT9。
10. ORDER BY:将VT9中的行按ORDER BY子句中的列列表排序，生成一个有表(VC10)。
11. TOP:从VC10的开始处选择指定数量或比例的行，生成表VT11,并返回给调用者。', '<div class="toc"><ul>
<li><a href="#toc-920">测试数据库</a></li>
<li><a href="#toc-15c">命令行操作</a></li>
<li><a href="#toc-8e6">可视化工具navicat</a><ul>
<li><a href="#select">select</a><ul>
<li><a href="#toc-485">查询所有数据</a></li>
<li><a href="#toc-b63">查询部分列</a></li>
<li><a href="#toc-b3b">列别名</a></li>
<li><a href="#where">Where</a></li>
</ul>
</li>
<li><a href="#insert">insert</a></li>
<li><a href="#update">update</a></li>
<li><a href="#delete">delete</a></li>
<li><a href="#toc-d25">SELECT步骤</a></li>
</ul>
</li>
</ul>
</div><h2><a id="toc-920" class="anchor" href="#toc-920"></a>测试数据库</h2>
<p><code>mysql -V</code><br><img src="/static/upload/20180712/screenshot_1502450228763.png" alt=""><br><a href="http://pan.baidu.com/s/1kUAXwgv">测试数据</a>
tip<code>source D:/news.sql;</code>
<!--more--></p>
<h2><a id="toc-15c" class="anchor" href="#toc-15c"></a>命令行操作</h2>
<ol>
<li>连接命令
<code>mysql -h host -P port  -u user -p password</code></li>
<li>步骤 <code>win + r</code>-&gt;<code>cmd</code>-&gt;<code>mysql -u root -p enter</code>-&gt; <code>password</code><br><img src="/static/upload/20180712/screenshot_1502449944199.png" alt="">
<img src="/static/upload/20180712/screenshot_1502449959964.png" alt=""></li>
<li>显示所有数据库<br><code>show databases;</code><br><img src="/static/upload/20180712/screenshot_1502450071613.png" alt=""></li>
<li>指定要使用的数据库<br><code>use news;</code><br><img src="/static/upload/20180712/screenshot_1502450164958.png" alt=""></li>
<li>显示所有的数据表<br><code>show tables;</code><br><img src="/static/upload/20180712/screenshot_1502450435648.png" alt=""></li>
<li>执行sql<br><img src="/static/upload/20180712/screenshot_1502450501420.png" alt=""></li>
</ol>
<p><strong>注意</strong>  </p>
<blockquote>
<p>其它sql语句都可以这样执行<br>并且接下来的所讲的都可以这样执行<br>但为了更方便的学习我们主要采用可视化工具方式教学  </p>
</blockquote>
<h2><a id="toc-8e6" class="anchor" href="#toc-8e6"></a>可视化工具navicat</h2>
<p>还原数据库<br><img src="/static/upload/20180720/upload_ccb8b04f1a3b89abb4f4777e48bfddb2.png" alt="alt"></p>
<p>打开运行<code>sql</code>语句界面<br><img src="/static/upload/20180720/upload_a2d91936c86ee81f54509765c70283d8.png" alt="alt">  </p>
<h3><a id="select" class="anchor" href="#select"></a>select</h3>
<h4><a id="toc-485" class="anchor" href="#toc-485"></a>查询所有数据</h4>
<pre><code class="hljs lang-cs"><span class="hljs-keyword">select</span> * <span class="hljs-keyword">from</span> article
</code></pre><p><img src="/static/upload/20180712/screenshot_1502451531611.png" alt=""></p>
<h4><a id="toc-b63" class="anchor" href="#toc-b63"></a>查询部分列</h4>
<pre><code class="hljs lang-n1ql"><span class="hljs-keyword">SELECT</span> id,<span class="hljs-built_in">title</span>,author <span class="hljs-keyword">FROM</span> article
</code></pre><p><img src="/static/upload/20180712/screenshot_1502451773194.png" alt=""></p>
<h4><a id="toc-b3b" class="anchor" href="#toc-b3b"></a>列别名</h4>
<pre><code class="hljs lang-n1ql"><span class="hljs-keyword">SELECT</span> id 编号,<span class="hljs-built_in">title</span> <span class="hljs-keyword">as</span> 标题,author <span class="hljs-keyword">FROM</span> article
</code></pre><p><img src="/static/upload/20180712/screenshot_1502451883782.png" alt="">
<img src="/static/upload/20180712/screenshot_1502451912272.png" alt=""></p>
<h4><a id="where" class="anchor" href="#where"></a>Where</h4>
<ol>
<li><strong>&gt;</strong><pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> &gt;<span class="hljs-number">100</span>
</code></pre><img src="/static/upload/20180712/screenshot_1502503267828.png" alt=""></li>
<li><strong>&lt;</strong><pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> &lt;<span class="hljs-number">10</span>
</code></pre><img src="/static/upload/20180712/screenshot_1502503217133.png" alt=""></li>
<li><strong>=</strong>  <pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> =<span class="hljs-number">100</span>
</code></pre><img src="/static/upload/20180712/screenshot_1502503399115.png" alt=""></li>
<li>区间<pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> &gt; <span class="hljs-number">95</span> <span class="hljs-keyword">and</span> <span class="hljs-keyword">id</span> &lt;<span class="hljs-number">100</span>
<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">BETWEEN</span> <span class="hljs-number">96</span> <span class="hljs-keyword">AND</span> <span class="hljs-number">99</span>
<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">in</span>(<span class="hljs-number">96</span>,<span class="hljs-number">97</span>,<span class="hljs-number">98</span>,<span class="hljs-number">99</span>)
</code></pre><img src="/static/upload/20180712/screenshot_1502503794587.png" alt=""><ol start="5">
<li><strong>like</strong> </li>
</ol>
</li>
</ol>
<blockquote>
<p>类型自动转换 </p>
</blockquote>
<ol>
<li>没有通配符<pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">LIKE</span> <span class="hljs-string">''90''</span> 
</code></pre><img src="/static/upload/20180712/screenshot_1502504290128.png" alt=""></li>
<li><code>_</code>通配符<pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">LIKE</span> <span class="hljs-string">''_1''</span> 
</code></pre><img src="/static/upload/20180712/screenshot_1502504557696.png" alt=""></li>
<li><code>%</code>通配符<pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">LIKE</span> <span class="hljs-string">''%1''</span> 
</code></pre><img src="/static/upload/20180712/screenshot_1502504587984.png" alt=""></li>
<li>Count &amp; Concat<pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> <span class="hljs-keyword">count</span>(*) <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">LIKE</span> <span class="hljs-string">''%1''</span> #%通配符
</code></pre><img src="/static/upload/20180712/screenshot_1502507062019.png" alt=""><pre><code class="hljs lang-oxygene"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> title = <span class="hljs-keyword">CONCAT</span>(<span class="hljs-string">''服务''</span>,<span class="hljs-string">''指南''</span>)
</code></pre><img src="/static/upload/20180712/screenshot_1502507298141.png" alt=""></li>
<li><p>Limit &amp; Top</p>
<pre><code class="hljs lang-n1ql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article  <span class="hljs-keyword">limit</span> <span class="hljs-number">4</span> # 只查询前<span class="hljs-number">4</span>条数据
</code></pre><p><img src="/static/upload/20180712/screenshot_1502507624013.png" alt=""></p>
<pre><code class="hljs lang-lsl">SELECT * FROM article  limit <span class="hljs-number">2</span>,<span class="hljs-number">4</span> # 第三条开始查询前<span class="hljs-number">4</span>条数据
</code></pre><p><img src="/static/upload/20180712/screenshot_1502507747804.png" alt="">   </p>
</li>
<li><p>MSSQL        </p>
<pre><code class="hljs lang-routeros">select * <span class="hljs-keyword">from</span><span class="hljs-built_in"> Area
</span></code></pre><p><img src="/static/upload/20180712/screenshot_1502519107517.png" alt=""></p>
<pre><code class="hljs lang-routeros">select top 3 * <span class="hljs-keyword">from</span><span class="hljs-built_in"> Area
</span></code></pre><p><img src="/static/upload/20180712/screenshot_1502519235984.png" alt=""></p>
</li>
<li><p>Order by</p>
<pre><code class="hljs lang-sql"><span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article  <span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">by</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">DESC</span> 
</code></pre><p><img src="/static/upload/20180712/screenshot_1502518851092.png" alt=""></p>
</li>
<li><p>分页</p>
</li>
</ol>
<pre><code class="hljs lang-SQL">原始数据
1   2   3   4   5   6   7   8   9   10  11 
分页要求
pageSize 4
pageIndex 2

limit 一个参数 or top
1   2   3   4
5   6   7   8
9   10  11 

目标分页数 
5   6   7   8

步骤 
1   2   3   4   5   6   7   8 
<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">8</span> #<span class="hljs-number">2</span>*<span class="hljs-number">4</span>

<span class="hljs-number">8</span>   <span class="hljs-number">7</span>   <span class="hljs-number">6</span>   <span class="hljs-number">5</span>   <span class="hljs-number">4</span>   <span class="hljs-number">3</span>   <span class="hljs-number">2</span>   <span class="hljs-number">1</span>
<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> (<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">8</span>) <span class="hljs-keyword">AS</span> <span class="hljs-keyword">First</span> <span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">DESC</span> 

<span class="hljs-number">8</span>   <span class="hljs-number">7</span>   <span class="hljs-number">6</span>   <span class="hljs-number">5</span>
<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> (<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">8</span>) <span class="hljs-keyword">AS</span> <span class="hljs-keyword">First</span> <span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">DESC</span> <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">4</span>

<span class="hljs-number">5</span>   <span class="hljs-number">6</span>   <span class="hljs-number">7</span>   <span class="hljs-number">8</span>  
<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> (<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> (<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">8</span>) <span class="hljs-keyword">AS</span> One <span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">DESC</span> <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">4</span> ) <span class="hljs-keyword">AS</span> Two <span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">ASC</span>

</code></pre>
<p><img src="/static/upload/20180712/screenshot_1502519882481.png" alt=""></p>
<p><strong>Easy</strong></p>
<pre><code class="hljs lang-n1ql"><span class="hljs-keyword">SELECT</span>  * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">4</span>,<span class="hljs-number">4</span>
</code></pre><p><img src="/static/upload/20180712/screenshot_1502521481331.png" alt=""></p>
<p><strong>More</strong></p>
<pre><code class="hljs lang-sql"><span class="hljs-keyword">EXPLAIN</span> <span class="hljs-keyword">SELECT</span>  * <span class="hljs-keyword">FROM</span> (<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> (<span class="hljs-keyword">SELECT</span> * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">8</span>) <span class="hljs-keyword">AS</span> One <span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">DESC</span> <span class="hljs-keyword">LIMIT</span> <span class="hljs-number">4</span> )<span class="hljs-keyword">AS</span> Two <span class="hljs-keyword">ORDER</span> <span class="hljs-keyword">BY</span> <span class="hljs-keyword">id</span> <span class="hljs-keyword">ASC</span>
</code></pre><p><img src="/static/upload/20180712/screenshot_1502520752305.png" alt=""></p>
<pre><code class="hljs lang-sql"><span class="hljs-keyword">EXPLAIN</span> <span class="hljs-keyword">SELECT</span>  * <span class="hljs-keyword">FROM</span> article <span class="hljs-keyword">WHERE</span> <span class="hljs-keyword">id</span>= <span class="hljs-number">3</span>
</code></pre><p><img src="/static/upload/20180712/screenshot_1502521401911.png" alt=""></p>
<h3><a id="insert" class="anchor" href="#insert"></a>insert</h3>
<pre><code class="hljs lang-undefined">#要插入所有列
INSERT INTO 表名称 VALUES (值1, 值2,....)
#指定所要插入数据的列：
INSERT INTO 表名称 (列1, 列2,...) VALUES (值1, 值2,....)
</code></pre>
<h3><a id="update" class="anchor" href="#update"></a>update</h3>
<pre><code class="hljs lang-undefined"># 更新指定数据
UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
# 所有数据
UPDATE 表名称 SET 列名称 = 新值 
</code></pre>
<h3><a id="delete" class="anchor" href="#delete"></a>delete</h3>
<pre><code class="hljs lang-undefined"># 删除某些数据
DELETE FROM 表名称 WHERE 列名称 = 值
# 删除所有数据
DELETE FROM 表名称
DELETE * FROM 表名称
</code></pre>
<h3><a id="toc-d25" class="anchor" href="#toc-d25"></a>SELECT步骤</h3>
<blockquote>
<p>(8) SELECT 
(9)DISTINCT<br>(11)  &lt;TOP_specification&gt; &lt;select_list&gt;<br>(1) FROM &lt;left_table&gt;<br>(3)　&lt;join_type&gt; JOIN &lt;right_table&gt;<br>(2)　 ON &lt;join_condition&gt;<br>(4) WHERE &lt;where_condition&gt;<br>(5) GROUP BY &lt;group_by_list&gt;<br>(6) WITH {CUBE | ROLLUP}<br>(7) HAVING &lt;having_condition&gt;<br>(10) ORDER BY &lt;order_by_list&gt;  </p>
</blockquote>
<p>每个步骤产生一个虚拟表，该虚拟表被用作下一个步骤的输入。<br>只有最后一步生成的表返回给调用者。如果没有某一子句，则跳过相应的步骤。  </p>
<ol>
<li>FROM:对FROM子句中的前两个表执行笛卡尔积，生成虚拟表VT1。</li>
<li>ON:对VT1应用ON筛选器。只有那些使&lt;join_condition&gt;为真的行才被插入VT2。</li>
<li>OUTER(JOIN):如果指定了OUTER JOIN，保留表中未找到匹配的行将作为外部行添加到VT2，生成VT3。如果FROM子句包含两个以上的表，则对上一个联接生成的结果表和下一个表重复执行步骤1到步骤3，直到 处理完所有的表为止。</li>
<li>对VT3应用WHERE筛选器。只有使&lt;where_condition&gt;为TRUE的行才被插入VT4。</li>
<li>GROUP BY:按GROUP BY 子句中的列列表对VT4中的行分组，生成VT5。</li>
<li>CUBE|ROLLUP:把超组插入VT5，生成VT6。</li>
<li>HAVING:对VT6应用HAVING筛选器。只有使&lt;having_condition&gt;为TRUE的组才会被插入VT7。 </li>
<li>SELECT:处理SELECT列表，产生VT8。</li>
<li>DISTINCT:将重复的行从VT8中移除，产生VT9。</li>
<li>ORDER BY:将VT9中的行按ORDER BY子句中的列列表排序，生成一个有表(VC10)。</li>
<li>TOP:从VC10的开始处选择指定数量或比例的行，生成表VT11,并返回给调用者。</li>
</ol>
', 1, '2018-07-22 17:04:05', '2018-10-24 17:26:32', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('61', '4', '1', 0, 3, 'goweb-05-golang-操作数据库', 'goweb-05', '<h2 id="-">使用数据库的一般步骤</h2>
<blockquote>
<p><a href="https://github.com/jmoiron/sqlx">sqlx官网</a></p>
</blockquote>
<h3 id="-xxx">引入xxx</h3>
<ol>
<li>第三方包 <code>import &quot;github.com/jmoiron/sqlx&quot;</code></li>
<li>驱动 <code>import _ &quot;github.com/go-sql-driver/mysql&quot;</code></li>
</ol>
', '## 使用数据库的一般步骤
> [sqlx官网](https://github.com/jmoiron/sqlx)
### 引入xxx
1. 第三方包 `import "github.com/jmoiron/sqlx"`
2. 驱动 `import _ "github.com/go-sql-driver/mysql"`

<!--more-->
### 建立链接
```go
//uid:pass@tcp(host:port)/dbname?charset=utf8&parseTime=true

//用户名:密码@tcp(主机:端口)/数据库名称?charset=utf8&parseTime=true

db, err = sqlx.Open(`mysql`, `root:root@tcp(127.0.0.1:3306)/news?charset=utf8&parseTime=true`)
```
### 测试链接
```go
err = db.Ping()
```

### 查询数据
![](/static/upload/20180712/screenshot_1504754036555.png)
#### 单个查询
```go
package main
import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)
//Class db class
type Class struct {
	ID   int
	Name string
	Desc string
}
func main() {
	db, err := sqlx.Open(`mysql`, `root:root@tcp(127.0.0.1:3306)/news?charset=utf8&parseTime=true`)
	mod := &Class{}
	//查询一条数据
	//错误信息 = db.Get(要保存数据的变量的指针,`sql语句`,参数...)
	err = db.Get(mod, `select * from class limit 1`)
	fmt.Println(mod, err)
}
```
#### 查询集合
```go
package main
import (
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)
//Class db class
type Class struct {
	ID   int
	Name string
	Desc string
}
func main() {
	db, err := sqlx.Open(`mysql`, `root:root@tcp(127.0.0.1:3306)/news?charset=utf8&parseTime=true`)
	mods := make([]Class, 0)
	//查询多条数据
	//错误信息 = db.Select(要保存数据的变量的指针,`sql语句`,参数...)
	err = db.Select(&mods, `select * from class`)
	fmt.Println(&mods, err)
}
```
### 操作数据
#### 添加数据
```go
//操作结果, 错误信息 := db.Exec(`sql语句`,参数...)
//result, err := db.Exec("insert into class(`name`,`desc`) values(?,?)", `名称`, `描述description`)
result, err := db.Exec("insert into class(`name`,`desc`) values(?,?)", `名称`, `描述description`)
fmt.Println(err)
// 如果是insert数据 则LastInsertId 返回插入的 id
fmt.Println(result.LastInsertId())
// 修改和删除 RowsAffected 返回到底影响了多少条数据
fmt.Println(result.RowsAffected())
```
![](/static/upload/20180712/screenshot_1504754500324.png)
![](/static/upload/20180712/screenshot_1504754530766.png)
#### 修改数据
```go
//修改数据
result, err := db.Exec("update class set `desc`= ?", `描述 描述`)//警告
fmt.Println(err)
// 如果是insert数据 则LastInsertId 返回插入的 id
fmt.Println(result.LastInsertId())
// 修改和删除 RowsAffected 返回到底影响了多少条数据
fmt.Println(result.RowsAffected())
```
![](/static/upload/20180712/screenshot_1504754697055.png)
#### 删除数据
```go
//删除数据
result, err := db.Exec("delete from class where id = ?", 4) //警告
fmt.Println(err)
// 如果是insert数据 则LastInsertId 返回插入的 id
fmt.Println(result.LastInsertId())
// 修改和删除 RowsAffected 返回到底影响了多少条数据
fmt.Println(result.RowsAffected())
```', '<div class="toc"><ul>
<li><a href="#toc-6f0">使用数据库的一般步骤</a><ul>
<li><a href="#toc-761">引入xxx</a></li>
<li><a href="#toc-fe7">建立链接</a></li>
<li><a href="#toc-64c">测试链接</a></li>
<li><a href="#toc-818">查询数据</a><ul>
<li><a href="#toc-dc6">单个查询</a></li>
<li><a href="#toc-913">查询集合</a></li>
</ul>
</li>
<li><a href="#toc-e1a">操作数据</a><ul>
<li><a href="#toc-94b">添加数据</a></li>
<li><a href="#toc-c1d">修改数据</a></li>
<li><a href="#toc-40f">删除数据</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div><h2><a id="toc-6f0" class="anchor" href="#toc-6f0"></a>使用数据库的一般步骤</h2>
<blockquote>
<p><a href="https://github.com/jmoiron/sqlx">sqlx官网</a></p>
</blockquote>
<h3><a id="toc-761" class="anchor" href="#toc-761"></a>引入xxx</h3>
<ol>
<li>第三方包 <code>import &quot;github.com/jmoiron/sqlx&quot;</code></li>
<li>驱动 <code>import _ &quot;github.com/go-sql-driver/mysql&quot;</code></li>
</ol>
<!--more-->
<h3><a id="toc-fe7" class="anchor" href="#toc-fe7"></a>建立链接</h3>
<pre><code class="hljs lang-go"><span class="hljs-comment">//uid:pass@tcp(host:port)/dbname?charset=utf8&amp;parseTime=true</span>

<span class="hljs-comment">//用户名:密码@tcp(主机:端口)/数据库名称?charset=utf8&amp;parseTime=true</span>

db, err = sqlx.Open(<span class="hljs-string">`mysql`</span>, <span class="hljs-string">`root:root@tcp(127.0.0.1:3306)/news?charset=utf8&amp;parseTime=true`</span>)
</code></pre>
<h3><a id="toc-64c" class="anchor" href="#toc-64c"></a>测试链接</h3>
<pre><code class="hljs lang-undefined">err = db.Ping()
</code></pre>
<h3><a id="toc-818" class="anchor" href="#toc-818"></a>查询数据</h3>
<p><img src="/static/upload/20180712/screenshot_1504754036555.png" alt=""></p>
<h4><a id="toc-dc6" class="anchor" href="#toc-dc6"></a>单个查询</h4>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    _ <span class="hljs-string">"github.com/go-sql-driver/mysql"</span>
    <span class="hljs-string">"github.com/jmoiron/sqlx"</span>
)
<span class="hljs-comment">//Class db class</span>
<span class="hljs-keyword">type</span> Class <span class="hljs-keyword">struct</span> {
    ID   <span class="hljs-keyword">int</span>
    Name <span class="hljs-keyword">string</span>
    Desc <span class="hljs-keyword">string</span>
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    db, err := sqlx.Open(<span class="hljs-string">`mysql`</span>, <span class="hljs-string">`root:root@tcp(127.0.0.1:3306)/news?charset=utf8&amp;parseTime=true`</span>)
    mod := &amp;Class{}
    <span class="hljs-comment">//查询一条数据</span>
    <span class="hljs-comment">//错误信息 = db.Get(要保存数据的变量的指针,`sql语句`,参数...)</span>
    err = db.Get(mod, <span class="hljs-string">`select * from class limit 1`</span>)
    fmt.Println(mod, err)
}
</code></pre>
<h4><a id="toc-913" class="anchor" href="#toc-913"></a>查询集合</h4>
<pre><code class="hljs lang-go"><span class="hljs-keyword">package</span> main
<span class="hljs-keyword">import</span> (
    <span class="hljs-string">"fmt"</span>
    _ <span class="hljs-string">"github.com/go-sql-driver/mysql"</span>
    <span class="hljs-string">"github.com/jmoiron/sqlx"</span>
)
<span class="hljs-comment">//Class db class</span>
<span class="hljs-keyword">type</span> Class <span class="hljs-keyword">struct</span> {
    ID   <span class="hljs-keyword">int</span>
    Name <span class="hljs-keyword">string</span>
    Desc <span class="hljs-keyword">string</span>
}
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">main</span><span class="hljs-params">()</span></span> {
    db, err := sqlx.Open(<span class="hljs-string">`mysql`</span>, <span class="hljs-string">`root:root@tcp(127.0.0.1:3306)/news?charset=utf8&amp;parseTime=true`</span>)
    mods := <span class="hljs-built_in">make</span>([]Class, <span class="hljs-number">0</span>)
    <span class="hljs-comment">//查询多条数据</span>
    <span class="hljs-comment">//错误信息 = db.Select(要保存数据的变量的指针,`sql语句`,参数...)</span>
    err = db.Select(&amp;mods, <span class="hljs-string">`select * from class`</span>)
    fmt.Println(&amp;mods, err)
}
</code></pre>
<h3><a id="toc-e1a" class="anchor" href="#toc-e1a"></a>操作数据</h3>
<h4><a id="toc-94b" class="anchor" href="#toc-94b"></a>添加数据</h4>
<pre><code class="hljs lang-go"><span class="hljs-comment">//操作结果, 错误信息 := db.Exec(`sql语句`,参数...)</span>
<span class="hljs-comment">//result, err := db.Exec("insert into class(`name`,`desc`) values(?,?)", `名称`, `描述description`)</span>
result, err := db.Exec(<span class="hljs-string">"insert into class(`name`,`desc`) values(?,?)"</span>, <span class="hljs-string">`名称`</span>, <span class="hljs-string">`描述description`</span>)
fmt.Println(err)
<span class="hljs-comment">// 如果是insert数据 则LastInsertId 返回插入的 id</span>
fmt.Println(result.LastInsertId())
<span class="hljs-comment">// 修改和删除 RowsAffected 返回到底影响了多少条数据</span>
fmt.Println(result.RowsAffected())
</code></pre>
<p><img src="/static/upload/20180712/screenshot_1504754500324.png" alt="">
<img src="/static/upload/20180712/screenshot_1504754530766.png" alt=""></p>
<h4><a id="toc-c1d" class="anchor" href="#toc-c1d"></a>修改数据</h4>
<pre><code class="hljs lang-go"><span class="hljs-comment">//修改数据</span>
result, err := db.Exec(<span class="hljs-string">"update class set `desc`= ?"</span>, <span class="hljs-string">`描述 描述`</span>)<span class="hljs-comment">//警告</span>
fmt.Println(err)
<span class="hljs-comment">// 如果是insert数据 则LastInsertId 返回插入的 id</span>
fmt.Println(result.LastInsertId())
<span class="hljs-comment">// 修改和删除 RowsAffected 返回到底影响了多少条数据</span>
fmt.Println(result.RowsAffected())
</code></pre>
<p><img src="/static/upload/20180712/screenshot_1504754697055.png" alt=""></p>
<h4><a id="toc-40f" class="anchor" href="#toc-40f"></a>删除数据</h4>
<pre><code class="hljs lang-go"><span class="hljs-comment">//删除数据</span>
result, err := db.Exec(<span class="hljs-string">"delete from class where id = ?"</span>, <span class="hljs-number">4</span>) <span class="hljs-comment">//警告</span>
fmt.Println(err)
<span class="hljs-comment">// 如果是insert数据 则LastInsertId 返回插入的 id</span>
fmt.Println(result.LastInsertId())
<span class="hljs-comment">// 修改和删除 RowsAffected 返回到底影响了多少条数据</span>
fmt.Println(result.RowsAffected())
</code></pre>
', 1, '2018-07-22 17:35:10', '2018-07-23 16:38:35', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('62', '4', '1', 0, 3, 'goweb-06-综合示例', 'goweb-06', '<p>goweb-06-综合示例</p>
', 'goweb-06-综合示例', '<div class="toc"></div><p>goweb-06-综合示例</p>
', 1, '2018-07-23 09:09:26', '2018-07-28 09:10:40', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('63', '5', '1', 0, 3, 'python-00-前言', 'python-00', '<h3 id="-">目标</h3>
<p> 通过完成<code>python</code>语言基础的学习为后面数据分析机器学习打下坚实的基础。<br>   后续课程包括：</p>
<ul>
<li><code>opencv</code>的使用</li>
<li>数据分析</li>
</ul>
', '### 目标
 通过完成`python`语言基础的学习为后面数据分析机器学习打下坚实的基础。  
   后续课程包括：
 - `opencv`的使用
 - 数据分析
<!--more-->
 - 机器学习

### 硬性规定
- 平时分 30% [作业、点到]
- 期末 70%', '<div class="toc"><ul>
<li><a href="#toc-73e">目标</a></li>
<li><a href="#toc-42a">硬性规定</a></li>
</ul>
</div><h3><a id="toc-73e" class="anchor" href="#toc-73e"></a>目标</h3>
<p> 通过完成<code>python</code>语言基础的学习为后面数据分析机器学习打下坚实的基础。<br>   后续课程包括：</p>
<ul>
<li><code>opencv</code>的使用</li>
<li>数据分析<!--more--></li>
<li>机器学习</li>
</ul>
<h3><a id="toc-42a" class="anchor" href="#toc-42a"></a>硬性规定</h3>
<ul>
<li>平时分 30% [作业、点到]</li>
<li>期末 70%</li>
</ul>
', 1, '2018-07-23 16:37:12', '2018-08-06 09:43:17', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('64', '5', '1', 0, 3, 'python-01-环境搭建', 'python-01', '<h2 id="python">python</h2>
<p>安装 python</p>
<blockquote>
<p>官方下载地址 <a href="https://www.python.org/downloads/">https://www.python.org/downloads/</a><br>推荐安装 3.6.5 </p>
</blockquote>
<p>网盘<a href="https://pan.baidu.com/s/10CxDeoLMzETGxm_IU9Rhlg">https://pan.baidu.com/s/10CxDeoLMzETGxm_IU9Rhlg</a></p>
', '## python 
安装 python
> 官方下载地址 [https://www.python.org/downloads/](https://www.python.org/downloads/)  
推荐安装 3.6.5 

网盘[https://pan.baidu.com/s/10CxDeoLMzETGxm_IU9Rhlg](https://pan.baidu.com/s/10CxDeoLMzETGxm_IU9Rhlg)

<!--more-->
`python` 兼容性不是很好
![alt](/static/upload/20180806/upload_5a40537e81d1f94b317bf022f8cc11e8.png)

1. 点击安装程序  
![alt](/static/upload/20180806/upload_f24deabe27f8265900e223cac1dc9f92.png)

2. 默认选择全部安装  
![alt](/static/upload/20180806/upload_7f53bba92558978620f15947b5a41660.png)
3. 修改安装路径  
![alt](/static/upload/20180806/upload_01128fd496b17a64456d449376b6760e.png)

4. 测试安装结果( `Win + R => cmd =>py`)
![alt](/static/upload/20180806/upload_22aa3e7832920e04ffa627223413c1fa.png)

5. 退出交互模式(`exit()`)⚡️  
![alt](/static/upload/20180806/upload_d7407f224b94f6ede88d7ae88a26e790.png)

6. 添加环境变量(如果没有)
![alt](/static/upload/20180806/upload_2792b039ef6624c665fc822a11c1b1f8.png)

## pip 
pip 是一个Python包管理工具可以用来管理python的第三方包

直接输入 `pip` 等价于`pip -h ` 、`pip --help` 或者 `pip help` 获取帮助信息  
![alt](/static/upload/20180806/upload_66e9739db086c25ffa41ff6425c3e2f0.png)

 常用三个指令 
- install                         Install packages.
- download                        Download packages.
- uninstall                       Uninstall packages.
- list                            List installed packages.

## libs
网络不稳定请多安装几次
### numpy
`numpy`系统是`Python`的一种开源的数值计算扩展。  
官网[http://www.numpy.org/](http://www.numpy.org/)

`pip install numpy`  
![alt](/static/upload/20180806/upload_19d9ff2cdbb36356bdb0979423684124.png)

### opencv
OpenCV是一个基于BSD许可（开源）发行的跨平台计算机视觉库。  
官网[https://opencv.org/](https://opencv.org/)  
`pip install opencv-python`

### Matplotlib
Matplotlib 是一个 Python 的 2D绘图库，它以各种硬拷贝格式和跨平台的交互式环境生成出版质量级别的图形。  
官网 [https://matplotlib.org/](https://matplotlib.org/)  
`pip install Matplotlib`

### tensorflow
TensorFlow是谷歌基于DistBelief进行研发的第二代人工智能学习系统。  
官网[墙外] [http://tensorflow.org/](http://tensorflow.org/)  
镜像 [https://tensorflow.google.cn/](https://tensorflow.google.cn/)  
`pip install --upgrade tensorflow`

### Keras
Keras是一个高层神经网络API，Keras由纯Python编写而成并基Tensorflow、Theano以及CNTK后端。  
官网 [https://keras.io//](https://keras.io/)  
`pip install keras`

## vscode 
一个运行于 Mac OS X、Windows和 Linux 之上的，针对于编写现代 Web 和云应用的跨平台源代码编辑器。    
官网 [https://code.visualstudio.com/](https://code.visualstudio.com/)  
常用插件  
![alt](/static/upload/20180806/upload_1f2214fcf8dcd5cbc2e1aa9ebfc38b80.png)', '<div class="toc"><ul>
<li><a href="#python">python</a></li>
<li><a href="#pip">pip</a></li>
<li><a href="#libs">libs</a><ul>
<li><a href="#numpy">numpy</a></li>
<li><a href="#opencv">opencv</a></li>
<li><a href="#matplotlib">Matplotlib</a></li>
<li><a href="#tensorflow">tensorflow</a></li>
<li><a href="#keras">Keras</a></li>
</ul>
</li>
<li><a href="#vscode">vscode</a></li>
</ul>
</div><h2><a id="python" class="anchor" href="#python"></a>python</h2>
<p>安装 python</p>
<blockquote>
<p>官方下载地址 <a href="https://www.python.org/downloads/">https://www.python.org/downloads/</a><br>推荐安装 3.6.5 </p>
</blockquote>
<p>网盘<a href="https://pan.baidu.com/s/10CxDeoLMzETGxm_IU9Rhlg">https://pan.baidu.com/s/10CxDeoLMzETGxm_IU9Rhlg</a></p>
<!--more-->
<p><code>python</code> 兼容性不是很好
<img src="/static/upload/20180806/upload_5a40537e81d1f94b317bf022f8cc11e8.png" alt="alt"></p>
<ol>
<li><p>点击安装程序<br><img src="/static/upload/20180806/upload_f24deabe27f8265900e223cac1dc9f92.png" alt="alt"></p>
</li>
<li><p>默认选择全部安装<br><img src="/static/upload/20180806/upload_7f53bba92558978620f15947b5a41660.png" alt="alt"></p>
</li>
<li><p>修改安装路径<br><img src="/static/upload/20180806/upload_01128fd496b17a64456d449376b6760e.png" alt="alt"></p>
</li>
<li><p>测试安装结果( <code>Win + R =&gt; cmd =&gt;py</code>)
<img src="/static/upload/20180806/upload_22aa3e7832920e04ffa627223413c1fa.png" alt="alt"></p>
</li>
<li><p>退出交互模式(<code>exit()</code>)⚡️<br><img src="/static/upload/20180806/upload_d7407f224b94f6ede88d7ae88a26e790.png" alt="alt"></p>
</li>
<li><p>添加环境变量(如果没有)
<img src="/static/upload/20180806/upload_2792b039ef6624c665fc822a11c1b1f8.png" alt="alt"></p>
</li>
</ol>
<h2><a id="pip" class="anchor" href="#pip"></a>pip</h2>
<p>pip 是一个Python包管理工具可以用来管理python的第三方包</p>
<p>直接输入 <code>pip</code> 等价于<code>pip -h</code> 、<code>pip --help</code> 或者 <code>pip help</code> 获取帮助信息<br><img src="/static/upload/20180806/upload_66e9739db086c25ffa41ff6425c3e2f0.png" alt="alt"></p>
<p> 常用三个指令 </p>
<ul>
<li>install                         Install packages.</li>
<li>download                        Download packages.</li>
<li>uninstall                       Uninstall packages.</li>
<li>list                            List installed packages.</li>
</ul>
<h2><a id="libs" class="anchor" href="#libs"></a>libs</h2>
<p>网络不稳定请多安装几次</p>
<h3><a id="numpy" class="anchor" href="#numpy"></a>numpy</h3>
<p><code>numpy</code>系统是<code>Python</code>的一种开源的数值计算扩展。<br>官网<a href="http://www.numpy.org/">http://www.numpy.org/</a></p>
<p><code>pip install numpy</code><br><img src="/static/upload/20180806/upload_19d9ff2cdbb36356bdb0979423684124.png" alt="alt"></p>
<h3><a id="opencv" class="anchor" href="#opencv"></a>opencv</h3>
<p>OpenCV是一个基于BSD许可（开源）发行的跨平台计算机视觉库。<br>官网<a href="https://opencv.org/">https://opencv.org/</a><br><code>pip install opencv-python</code></p>
<h3><a id="matplotlib" class="anchor" href="#matplotlib"></a>Matplotlib</h3>
<p>Matplotlib 是一个 Python 的 2D绘图库，它以各种硬拷贝格式和跨平台的交互式环境生成出版质量级别的图形。<br>官网 <a href="https://matplotlib.org/">https://matplotlib.org/</a><br><code>pip install Matplotlib</code></p>
<h3><a id="tensorflow" class="anchor" href="#tensorflow"></a>tensorflow</h3>
<p>TensorFlow是谷歌基于DistBelief进行研发的第二代人工智能学习系统。<br>官网[墙外] <a href="http://tensorflow.org/">http://tensorflow.org/</a><br>镜像 <a href="https://tensorflow.google.cn/">https://tensorflow.google.cn/</a><br><code>pip install --upgrade tensorflow</code></p>
<h3><a id="keras" class="anchor" href="#keras"></a>Keras</h3>
<p>Keras是一个高层神经网络API，Keras由纯Python编写而成并基Tensorflow、Theano以及CNTK后端。<br>官网 <a href="https://keras.io/">https://keras.io//</a><br><code>pip install keras</code></p>
<h2><a id="vscode" class="anchor" href="#vscode"></a>vscode</h2>
<p>一个运行于 Mac OS X、Windows和 Linux 之上的，针对于编写现代 Web 和云应用的跨平台源代码编辑器。<br>官网 <a href="https://code.visualstudio.com/">https://code.visualstudio.com/</a><br>常用插件<br><img src="/static/upload/20180806/upload_1f2214fcf8dcd5cbc2e1aa9ebfc38b80.png" alt="alt"></p>
', 1, '2018-08-06 09:50:47', '2018-09-05 23:07:25', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('65', '5', '1', 0, 3, 'python-02', 'python-02', '<h2 id="-python">运行python</h2>
<ul>
<li>交互模式<code>win+r =&gt; py</code><br>直接输入<code>python</code>代码运行</li>
</ul>
', '## 运行python
- 交互模式`win+r => py`  
直接输入`python`代码运行
<!--more-->
![alt](/static/upload/20180821/upload_319c935a7be3313ae707584a099a6394.png)
- py+ python代码文件  
`py + xxx.py`   
![alt](/static/upload/20180821/upload_ebb97163af79192ac0518a49f360f240.png)

## 特点 
[百度百科](https://baike.baidu.com/item/Python/407313?fr=aladdin)

## 课程规划
设计基础知识范围太广所以☹️

- python 基础
- numpy 
- matplotlib
- opencv
- tensorflow
- 。。。', '<div class="toc"><ul>
<li><a href="#toc-31d">运行python</a></li>
<li><a href="#toc-b4d">特点</a></li>
<li><a href="#toc-6e1">课程规划</a></li>
</ul>
</div><h2><a id="toc-31d" class="anchor" href="#toc-31d"></a>运行python</h2>
<ul>
<li>交互模式<code>win+r =&gt; py</code><br>直接输入<code>python</code>代码运行<!--more-->
<img src="/static/upload/20180821/upload_319c935a7be3313ae707584a099a6394.png" alt="alt"></li>
<li>py+ python代码文件<br><code>py + xxx.py</code><br><img src="/static/upload/20180821/upload_ebb97163af79192ac0518a49f360f240.png" alt="alt"></li>
</ul>
<h2><a id="toc-b4d" class="anchor" href="#toc-b4d"></a>特点</h2>
<p><a href="https://baike.baidu.com/item/Python/407313?fr=aladdin">百度百科</a></p>
<h2><a id="toc-6e1" class="anchor" href="#toc-6e1"></a>课程规划</h2>
<p>设计基础知识范围太广所以☹️</p>
<ul>
<li>python 基础</li>
<li>numpy </li>
<li>matplotlib</li>
<li>opencv</li>
<li>tensorflow</li>
<li>。。。</li>
</ul>
', 1, '2018-08-06 11:04:59', '2018-08-21 16:07:19', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('66', '5', '1', 0, 3, 'matplotlib ', 'python-matplotlib', '<blockquote>
<p>Matplotlib 是 Python 的一个绘图库。
它包含了大量的工具，你可以使用这些工具创建各种图形，包括简单的散点图，正弦曲线，三维图形。</p>
</blockquote>
<h3 id="-">安装</h3>
<p><code>pip install matplotlib</code></p>
', '>Matplotlib 是 Python 的一个绘图库。
它包含了大量的工具，你可以使用这些工具创建各种图形，包括简单的散点图，正弦曲线，三维图形。
### 安装 
`pip install matplotlib`
<!--more-->
###  快速体验
```python
import matplotlib.pyplot as plt
import numpy as np

## 产生0 到10之间100个等差数列
x = np.linspace(0, 10, 100)
## ^ 平方
y = x**2
plt.plot(x, y)
## 显示
plt.show()
``` 
![alt](/static/upload/20180821/upload_891eb3c4cf52f57b864a4d76ec38f6cc.png)

### 功能按钮  
![alt](/static/upload/20180821/upload_8d9356f859472de4e202c10f74146369.png)  

- Home 单击它可以返回原始视图， 在浏览图表之前单击此按钮将不会生效。

- Forward/Back  像浏览器中的前进和后退按钮一样使用。 可以单击这些来移回到之前的位置，或再次前进。

- Pan 点击之后可以拖拽图表。

- Zoom 单击并拖动出要放大的方形区域。 放大需要**左键**单击并拖动。 你也可以**右键**单击并拖动来缩小。

- Configure Subplots 此可以对图形和绘图配置各种间距选项。
![alt](/static/upload/20180821/upload_8ef12724f071e0122102ba8bd3862551.png)  
 wspace和hspace对应于绘制多个子图时，它们的水平或竖直间距。

- Save 允许以各种形式保存图形。

### 图例、标题和标签

``` python
import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(-5, 5, 100)
y = np.sin(x)
y1 = np.cos(x)

# 直接画在一起
# plt.plot(x,y,x,y1)

# 中文乱码
# plt.xlabel("x轴")
# plt.ylabel("y轴")

plt.xlabel("x")
plt.ylabel("y")

plt.title(''title'')

plt.plot(x, y, label=''sin'')
plt.plot(x, y1, label=''cos'')
# 生成图例
plt.legend()
plt.show()
```
![alt](/static/upload/20180822/upload_f6d7d9164b0fa84845d335945d485dff.png)

### 条形图

``` python
import matplotlib.pyplot as plt

x=[1,3,5,7,9]
y=[1,2,3,5,4]

x1=[2,4,6,8,10]
y1=[5,4,3,1,2]

plt.bar(x,y)
plt.bar(x1,y1)
plt.show()
```
![alt](/static/upload/20180822/upload_3643533a5b2a2ed79e845017d3fc3d4e.png)

### 直方图
直方图非常像条形图，倾向于通过将区段组合在一起来显示分布

``` python
import matplotlib.pyplot as plt
y = [23, 56,  63, 46,  22, 23, 35, 43,  43, 5, 100, 123, 131, 112, 116, 113, 81, 76,   66,  55]
print(y)
bins = [0, 50, 100, 150]
#plt.hist(y, 10, rwidth=0.8)
plt.hist(y, bins, rwidth=0.8)
plt.show()
```
![alt](/static/upload/20180822/upload_7246de998f84c0b667fe18dbd8f57752.png)

### 散点图

```
import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(-5, 5, 100)
y = np.sin(x)

plt.scatter(x,y,label=''sin'', color=''b'', s=3, marker="o")#颜色，大小，形状
plt.legend()
plt.show()
```
![alt](/static/upload/20180822/upload_926338acadce3b8f9c79c2810dfd0836.png)

### 展示图片
**png**
``` python
import matplotlib.pyplot as plt
import matplotlib.image as mpimg 

# 读取图片
lena = mpimg.imread(''lena.png'')
# 绘制图片
plt.imshow(lena)
# 关闭坐标轴
plt.axis(''off'')
plt.show()
```', '<div class="toc"><ul>
<li><a href="#toc-e65">安装</a></li>
<li><a href="#toc-282">快速体验</a></li>
<li><a href="#toc-799">功能按钮</a></li>
<li><a href="#toc-55d">图例、标题和标签</a></li>
<li><a href="#toc-3a3">条形图</a></li>
<li><a href="#toc-c64">直方图</a></li>
<li><a href="#toc-927">散点图</a></li>
<li><a href="#toc-f02">展示图片</a></li>
</ul>
</div><blockquote>
<p>Matplotlib 是 Python 的一个绘图库。
它包含了大量的工具，你可以使用这些工具创建各种图形，包括简单的散点图，正弦曲线，三维图形。</p>
</blockquote>
<h3><a id="toc-e65" class="anchor" href="#toc-e65"></a>安装</h3>
<p><code>pip install matplotlib</code>
<!--more--></p>
<h3><a id="toc-282" class="anchor" href="#toc-282"></a>快速体验</h3>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> matplotlib.pyplot <span class="hljs-keyword">as</span> plt
<span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np

<span class="hljs-comment">## 产生0 到10之间100个等差数列</span>
x = np.linspace(<span class="hljs-number">0</span>, <span class="hljs-number">10</span>, <span class="hljs-number">100</span>)
<span class="hljs-comment">## ^ 平方</span>
y = x**<span class="hljs-number">2</span>
plt.plot(x, y)
<span class="hljs-comment">## 显示</span>
plt.show()
</code></pre>
<p><img src="/static/upload/20180821/upload_891eb3c4cf52f57b864a4d76ec38f6cc.png" alt="alt"></p>
<h3><a id="toc-799" class="anchor" href="#toc-799"></a>功能按钮</h3>
<p><img src="/static/upload/20180821/upload_8d9356f859472de4e202c10f74146369.png" alt="alt">  </p>
<ul>
<li><p>Home 单击它可以返回原始视图， 在浏览图表之前单击此按钮将不会生效。</p>
</li>
<li><p>Forward/Back  像浏览器中的前进和后退按钮一样使用。 可以单击这些来移回到之前的位置，或再次前进。</p>
</li>
<li><p>Pan 点击之后可以拖拽图表。</p>
</li>
<li><p>Zoom 单击并拖动出要放大的方形区域。 放大需要<strong>左键</strong>单击并拖动。 你也可以<strong>右键</strong>单击并拖动来缩小。</p>
</li>
<li><p>Configure Subplots 此可以对图形和绘图配置各种间距选项。
<img src="/static/upload/20180821/upload_8ef12724f071e0122102ba8bd3862551.png" alt="alt"><br>wspace和hspace对应于绘制多个子图时，它们的水平或竖直间距。</p>
</li>
<li><p>Save 允许以各种形式保存图形。</p>
</li>
</ul>
<h3><a id="toc-55d" class="anchor" href="#toc-55d"></a>图例、标题和标签</h3>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> matplotlib.pyplot <span class="hljs-keyword">as</span> plt
<span class="hljs-keyword">import</span> numpy <span class="hljs-keyword">as</span> np
x = np.linspace(<span class="hljs-number">-5</span>, <span class="hljs-number">5</span>, <span class="hljs-number">100</span>)
y = np.sin(x)
y1 = np.cos(x)

<span class="hljs-comment"># 直接画在一起</span>
<span class="hljs-comment"># plt.plot(x,y,x,y1)</span>

<span class="hljs-comment"># 中文乱码</span>
<span class="hljs-comment"># plt.xlabel("x轴")</span>
<span class="hljs-comment"># plt.ylabel("y轴")</span>

plt.xlabel(<span class="hljs-string">"x"</span>)
plt.ylabel(<span class="hljs-string">"y"</span>)

plt.title(<span class="hljs-string">''title''</span>)

plt.plot(x, y, label=<span class="hljs-string">''sin''</span>)
plt.plot(x, y1, label=<span class="hljs-string">''cos''</span>)
<span class="hljs-comment"># 生成图例</span>
plt.legend()
plt.show()
</code></pre>
<p><img src="/static/upload/20180822/upload_f6d7d9164b0fa84845d335945d485dff.png" alt="alt"></p>
<h3><a id="toc-3a3" class="anchor" href="#toc-3a3"></a>条形图</h3>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> matplotlib.pyplot <span class="hljs-keyword">as</span> plt

x=[<span class="hljs-number">1</span>,<span class="hljs-number">3</span>,<span class="hljs-number">5</span>,<span class="hljs-number">7</span>,<span class="hljs-number">9</span>]
y=[<span class="hljs-number">1</span>,<span class="hljs-number">2</span>,<span class="hljs-number">3</span>,<span class="hljs-number">5</span>,<span class="hljs-number">4</span>]

x1=[<span class="hljs-number">2</span>,<span class="hljs-number">4</span>,<span class="hljs-number">6</span>,<span class="hljs-number">8</span>,<span class="hljs-number">10</span>]
y1=[<span class="hljs-number">5</span>,<span class="hljs-number">4</span>,<span class="hljs-number">3</span>,<span class="hljs-number">1</span>,<span class="hljs-number">2</span>]

plt.bar(x,y)
plt.bar(x1,y1)
plt.show()
</code></pre>
<p><img src="/static/upload/20180822/upload_3643533a5b2a2ed79e845017d3fc3d4e.png" alt="alt"></p>
<h3><a id="toc-c64" class="anchor" href="#toc-c64"></a>直方图</h3>
<p>直方图非常像条形图，倾向于通过将区段组合在一起来显示分布</p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> matplotlib.pyplot <span class="hljs-keyword">as</span> plt
y = [<span class="hljs-number">23</span>, <span class="hljs-number">56</span>,  <span class="hljs-number">63</span>, <span class="hljs-number">46</span>,  <span class="hljs-number">22</span>, <span class="hljs-number">23</span>, <span class="hljs-number">35</span>, <span class="hljs-number">43</span>,  <span class="hljs-number">43</span>, <span class="hljs-number">5</span>, <span class="hljs-number">100</span>, <span class="hljs-number">123</span>, <span class="hljs-number">131</span>, <span class="hljs-number">112</span>, <span class="hljs-number">116</span>, <span class="hljs-number">113</span>, <span class="hljs-number">81</span>, <span class="hljs-number">76</span>,   <span class="hljs-number">66</span>,  <span class="hljs-number">55</span>]
print(y)
bins = [<span class="hljs-number">0</span>, <span class="hljs-number">50</span>, <span class="hljs-number">100</span>, <span class="hljs-number">150</span>]
<span class="hljs-comment">#plt.hist(y, 10, rwidth=0.8)</span>
plt.hist(y, bins, rwidth=<span class="hljs-number">0.8</span>)
plt.show()
</code></pre>
<p><img src="/static/upload/20180822/upload_7246de998f84c0b667fe18dbd8f57752.png" alt="alt"></p>
<h3><a id="toc-927" class="anchor" href="#toc-927"></a>散点图</h3>
<pre><code class="hljs lang-routeros">import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(-5, 5, 100)
y = np.sin(x)

plt.scatter(x,y,<span class="hljs-attribute">label</span>=<span class="hljs-string">''sin''</span>, <span class="hljs-attribute">color</span>=<span class="hljs-string">''b''</span>, <span class="hljs-attribute">s</span>=3, <span class="hljs-attribute">marker</span>=<span class="hljs-string">"o"</span>)#颜色，大小，形状
plt.legend()
plt.show()
</code></pre><p><img src="/static/upload/20180822/upload_926338acadce3b8f9c79c2810dfd0836.png" alt="alt"></p>
<h3><a id="toc-f02" class="anchor" href="#toc-f02"></a>展示图片</h3>
<p><strong>png</strong></p>
<pre><code class="hljs lang-python"><span class="hljs-keyword">import</span> matplotlib.pyplot <span class="hljs-keyword">as</span> plt
<span class="hljs-keyword">import</span> matplotlib.image <span class="hljs-keyword">as</span> mpimg 

<span class="hljs-comment"># 读取图片</span>
lena = mpimg.imread(<span class="hljs-string">''lena.png''</span>)
<span class="hljs-comment"># 绘制图片</span>
plt.imshow(lena)
<span class="hljs-comment"># 关闭坐标轴</span>
plt.axis(<span class="hljs-string">''off''</span>)
plt.show()
</code></pre>
', 1, '2018-08-21 16:53:44', '2018-08-22 12:24:09', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('67', '5', '1', 0, 0, 'opencv', 'python-opencv', '<p>Open Source Computer Vision Library<br>官网<a href="https://opencv.org/">https://opencv.org</a><br>应用领域:人机互动、物体识别、图像分割、人脸识别、动作识别、运动跟踪、机器人、运动分析、机器视觉、结构分析、汽车安全驾驶</p>
', 'Open Source Computer Vision Library  
官网[https://opencv.org](https://opencv.org/)  
应用领域:人机互动、物体识别、图像分割、人脸识别、动作识别、运动跟踪、机器人、运动分析、机器视觉、结构分析、汽车安全驾驶
<!--more-->
## 图像
### 读取图像
cv2.imread(文件名，标记)读入图像，
cv2.IMREAD_COLOR（）：读入彩色图像
cv2.IMREAD_GRAYSCALE（）：以灰度模式读入图像
`import numpy as np
import cv2
img = cv2.imread(''45.jpg'',0) `', '<div class="toc"><ul>
<li><a href="#toc-e1b">图像</a><ul>
<li><a href="#toc-868">读取图像</a></li>
</ul>
</li>
</ul>
</div><p>Open Source Computer Vision Library<br>官网<a href="https://opencv.org/">https://opencv.org</a><br>应用领域:人机互动、物体识别、图像分割、人脸识别、动作识别、运动跟踪、机器人、运动分析、机器视觉、结构分析、汽车安全驾驶
<!--more--></p>
<h2><a id="toc-e1b" class="anchor" href="#toc-e1b"></a>图像</h2>
<h3><a id="toc-868" class="anchor" href="#toc-868"></a>读取图像</h3>
<p>cv2.imread(文件名，标记)读入图像，
cv2.IMREAD_COLOR（）：读入彩色图像
cv2.IMREAD_GRAYSCALE（）：以灰度模式读入图像
<code>import numpy as np
import cv2
img = cv2.imread(&#39;45.jpg&#39;,0)</code></p>
', 1, '2018-08-22 15:30:17', '2018-08-22 15:59:00', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('68', '0', '1', 1, 3, '  ', 'tool', '', '<script>
var nums=[''''];
function get(){
var idx=Math.floor(Math.random()*nums.length);
document.getElementById(''ctn'').innerHTML=nums[idx];
}
</script>

<p id="ctn">----</p>
<button onclick="get()">  ☠️  </button>', '<script>
var nums=[''''];
function get(){
var idx=Math.floor(Math.random()*nums.length);
document.getElementById(''ctn'').innerHTML=nums[idx];
}
</script>
<p id="ctn">----</p>
<button onclick="get()">  ☠️  </button>', 0, '2018-09-10 11:12:43', '2019-03-04 15:40:20', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('69', '0', '1', 0, 3, '还原window自带app', 'restore-win10-apps', '<blockquote>
<p> 复制以下代码再<code>powershell</code>运行   </p>
</blockquote>
<hr>
<p><code>`</code></p>
<h1 id="get-all-the-provisioned-packages">Get all the provisioned packages</h1>
<p>$Packages = (get-item &#39;HKLM:\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications&#39;) | Get-ChildItem</p>
', '>  复制以下代码再`powershell`运行   
 
----------
```
# Get all the provisioned packages
$Packages = (get-item ''HKLM:\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications'') | Get-ChildItem

<!--more-->
# Filter the list if provided a filter
$PackageFilter = $args[0]
if ([string]::IsNullOrEmpty($PackageFilter))
{
	echo "No filter specified, attempting to re-register all provisioned apps."
}
else
{
	$Packages = $Packages | where {$_.Name -like $PackageFilter} 

	if ($Packages -eq $null)
	{
		echo "No provisioned apps match the specified filter."
		exit
	}
	else
	{
		echo "Registering the provisioned apps that match $PackageFilter"
	}as
}

ForEach($Package in $Packages)
{
	# get package name & path
	$PackageName = $Package | Get-ItemProperty | Select-Object -ExpandProperty PSChildName
	$PackagePath = [System.Environment]::ExpandEnvironmentVariables(($Package | Get-ItemProperty | Select-Object -ExpandProperty Path))

	# register the package	
	echo "Attempting to register package: $PackageName"

	Add-AppxPackage -register $PackagePath -DisableDevelopmentMode
}
```', '<div class="toc"></div><blockquote>
<p> 复制以下代码再<code>powershell</code>运行   </p>
</blockquote>
<hr>
<pre><code class="hljs lang-awk"><span class="hljs-comment"># Get all the provisioned packages</span>
<span class="hljs-variable">$Packages</span> = (get-item <span class="hljs-string">''HKLM:\Software\Microsoft\Windows\CurrentVersion\Appx\AppxAllUserStore\Applications''</span>) | Get-ChildItem

&lt;!--more--&gt;
<span class="hljs-comment"># Filter the list if provided a filter</span>
<span class="hljs-variable">$PackageFilter</span> = <span class="hljs-variable">$args</span>[<span class="hljs-number">0</span>]
<span class="hljs-keyword">if</span> ([string]::IsNullOrEmpty(<span class="hljs-variable">$PackageFilter</span>))
{
    echo <span class="hljs-string">"No filter specified, attempting to re-register all provisioned apps."</span>
}
<span class="hljs-keyword">else</span>
{
    <span class="hljs-variable">$Packages</span> = <span class="hljs-variable">$Packages</span> | where {<span class="hljs-variable">$_</span>.Name -like <span class="hljs-variable">$PackageFilter</span>} 

    <span class="hljs-keyword">if</span> (<span class="hljs-variable">$Packages</span> -eq <span class="hljs-variable">$null</span>)
    {
        echo <span class="hljs-string">"No provisioned apps match the specified filter."</span>
        <span class="hljs-keyword">exit</span>
    }
    <span class="hljs-keyword">else</span>
    {
        echo <span class="hljs-string">"Registering the provisioned apps that match $PackageFilter"</span>
    }as
}

ForEach(<span class="hljs-variable">$Package</span> <span class="hljs-keyword">in</span> <span class="hljs-variable">$Packages</span>)
{
    <span class="hljs-comment"># get package name &amp; path</span>
    <span class="hljs-variable">$PackageName</span> = <span class="hljs-variable">$Package</span> | Get-ItemProperty | Select-Object -ExpandProperty PSChildName
    <span class="hljs-variable">$PackagePath</span> = [System.Environment]::ExpandEnvironmentVariables((<span class="hljs-variable">$Package</span> | Get-ItemProperty | Select-Object -ExpandProperty Path))

    <span class="hljs-comment"># register the package    </span>
    echo <span class="hljs-string">"Attempting to register package: $PackageName"</span>

    Add-AppxPackage -register <span class="hljs-variable">$PackagePath</span> -DisableDevelopmentMode
}
</code></pre>', 1, '2018-11-15 16:47:17', '2018-11-15 16:47:17', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('70', '0', '1', 0, 3, 'json web token', 'jwt', '<p>JWT是<code>json web token</code>缩写。<br><a href="https://jwt.io/">官网</a>
它将用户信息加密到token里，服务器不保存任何用户信息。服务器通过使用保存的密钥验证token的正确性，只要正确即通过验证。</p>
<ul>
<li>优点是在分布式系统中，很好地解决了单点登录问题，很容易解决了<code>session</code>共享的问题。 </li>
<li>缺点是无法作废已颁布的令牌/不易应对数据过期。</li>
</ul>
', 'JWT是`json web token`缩写。  
[官网](https://jwt.io/)
它将用户信息加密到token里，服务器不保存任何用户信息。服务器通过使用保存的密钥验证token的正确性，只要正确即通过验证。

- 优点是在分布式系统中，很好地解决了单点登录问题，很容易解决了`session`共享的问题。 
- 缺点是无法作废已颁布的令牌/不易应对数据过期。
<!--more-->

数据格式  
- Header
- Payload
- Signature

**xxxxx.yyyyy.zzzzz**

Signature=
![alt](/static/upload/20181116/upload_1dfb2cd508f882b1850bd9561fb4f063.png)

常用库  
`go get github.com/dgrijalva/jwt-go`

使用实例

- 携带数据
```
// JwtClaims jwt
type JwtClaims struct {
	Id   int    `json:"id"`
	Name string `json:"name"`
	Num  string `json:"num"`
	Role Role   `json:"role"`
	jwt.StandardClaims
}
```
- 生成token
```
	claims := model.JwtClaims{
		Id:   mod.Id,
		Name: mod.Name,
		Num:  mod.Num,
		Role: mod.Role,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Hour * 2).Unix(),
		},
	}
	// 保存唯一登陆信息
	util.Save(claims.Id, claims.Rand)
	// Create token with claims
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	// Generate encoded token and send it as response.
	jwtStr, err := token.SignedString([]byte("xxxx"))
	if err != nil {
		return ctx.JSON(util.NewFail(`凭证生成失败,请重试`, err.Error()))
	}
```
- 验证token
```
// midJwt 中间件-jwt验证
func midJwt(next echo.HandlerFunc) echo.HandlerFunc {
	return func(ctx echo.Context) error {
		// query form 查找 token
		tokenString := ctx.FormValue("token")
		if tokenString == "" {
			// header 查找token
			tokenString = ctx.Request().Header.Get(echo.HeaderAuthorization)
			if tokenString == "" {
				ctx.JSON(util.NewErrJwt(`未发现jwt认证信息`))
				return nil
			}
			// Bearer token
			tokenString = tokenString[7:] //len("Bearer ")
		}
		jwtAuth := &model.JwtClaims{}
		jwt, err := jwt.ParseWithClaims(tokenString, jwtAuth, func(token *jwt.Token) (interface{}, error) {
			return []byte("xxxx"), nil
		})
		if err == nil && jwt.Valid {
			ctx.Set("auth", jwtAuth)
		} else {
			return ctx.JSON(util.NewErrJwt(`对不起，请重新登陆^_^!","jwt验证失败`))
		}
		ctx.Response().Header().Set(echo.HeaderServer, "by zxysilent")
		return next(ctx)
	}
}
```', '<div class="toc"></div><p>JWT是<code>json web token</code>缩写。<br><a href="https://jwt.io/">官网</a>
它将用户信息加密到token里，服务器不保存任何用户信息。服务器通过使用保存的密钥验证token的正确性，只要正确即通过验证。</p>
<ul>
<li>优点是在分布式系统中，很好地解决了单点登录问题，很容易解决了<code>session</code>共享的问题。 </li>
<li>缺点是无法作废已颁布的令牌/不易应对数据过期。<!--more-->
</li>
</ul>
<p>数据格式  </p>
<ul>
<li>Header</li>
<li>Payload</li>
<li>Signature</li>
</ul>
<p><strong>xxxxx.yyyyy.zzzzz</strong></p>
<p>Signature=
<img src="/static/upload/20181116/upload_1dfb2cd508f882b1850bd9561fb4f063.png" alt="alt"></p>
<p>常用库<br><code>go get github.com/dgrijalva/jwt-go</code></p>
<p>使用实例</p>
<ul>
<li>携带数据<pre><code class="hljs lang-clean"><span class="hljs-comment">// JwtClaims jwt</span>
type JwtClaims struct {
  Id   int    `json:<span class="hljs-string">"id"</span>`
  Name string `json:<span class="hljs-string">"name"</span>`
  Num  string `json:<span class="hljs-string">"num"</span>`
  Role Role   `json:<span class="hljs-string">"role"</span>`
  jwt.StandardClaims
}
</code></pre></li>
<li>生成token<pre><code class="hljs lang-pgsql">  claims := model.JwtClaims{
      Id:   mod.Id,
      <span class="hljs-type">Name</span>: mod.Name,
      Num:  mod.Num,
      <span class="hljs-keyword">Role</span>: mod.<span class="hljs-keyword">Role</span>,
      StandardClaims: jwt.StandardClaims{
          ExpiresAt: <span class="hljs-type">time</span>.Now().<span class="hljs-keyword">Add</span>(<span class="hljs-type">time</span>.Hour * <span class="hljs-number">2</span>).Unix(),
      },
  }
  // 保存唯一登陆信息
  util.Save(claims.Id, claims.Rand)
  // <span class="hljs-keyword">Create</span> token <span class="hljs-keyword">with</span> claims
  token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
  // Generate encoded token <span class="hljs-keyword">and</span> send it <span class="hljs-keyword">as</span> response.
  jwtStr, err := token.SignedString([]byte("xxxx"))
  <span class="hljs-keyword">if</span> err != nil {
      <span class="hljs-keyword">return</span> ctx.JSON(util.NewFail(`凭证生成失败,请重试`, err.Error()))
  }
</code></pre></li>
<li>验证token<pre><code class="hljs lang-go"><span class="hljs-comment">// midJwt 中间件-jwt验证</span>
<span class="hljs-function"><span class="hljs-keyword">func</span> <span class="hljs-title">midJwt</span><span class="hljs-params">(next echo.HandlerFunc)</span> <span class="hljs-title">echo</span>.<span class="hljs-title">HandlerFunc</span></span> {
  <span class="hljs-keyword">return</span> <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(ctx echo.Context)</span> <span class="hljs-title">error</span></span> {
      <span class="hljs-comment">// query form 查找 token</span>
      tokenString := ctx.FormValue(<span class="hljs-string">"token"</span>)
      <span class="hljs-keyword">if</span> tokenString == <span class="hljs-string">""</span> {
          <span class="hljs-comment">// header 查找token</span>
          tokenString = ctx.Request().Header.Get(echo.HeaderAuthorization)
          <span class="hljs-keyword">if</span> tokenString == <span class="hljs-string">""</span> {
              ctx.JSON(util.NewErrJwt(<span class="hljs-string">`未发现jwt认证信息`</span>))
              <span class="hljs-keyword">return</span> <span class="hljs-literal">nil</span>
          }
          <span class="hljs-comment">// Bearer token</span>
          tokenString = tokenString[<span class="hljs-number">7</span>:] <span class="hljs-comment">//len("Bearer ")</span>
      }
      jwtAuth := &amp;model.JwtClaims{}
      jwt, err := jwt.ParseWithClaims(tokenString, jwtAuth, <span class="hljs-function"><span class="hljs-keyword">func</span><span class="hljs-params">(token *jwt.Token)</span> <span class="hljs-params">(<span class="hljs-keyword">interface</span>{}, error)</span></span> {
          <span class="hljs-keyword">return</span> []<span class="hljs-keyword">byte</span>(<span class="hljs-string">"xxxx"</span>), <span class="hljs-literal">nil</span>
      })
      <span class="hljs-keyword">if</span> err == <span class="hljs-literal">nil</span> &amp;&amp; jwt.Valid {
          ctx.Set(<span class="hljs-string">"auth"</span>, jwtAuth)
      } <span class="hljs-keyword">else</span> {
          <span class="hljs-keyword">return</span> ctx.JSON(util.NewErrJwt(<span class="hljs-string">`对不起，请重新登陆^_^!","jwt验证失败`</span>))
      }
      ctx.Response().Header().Set(echo.HeaderServer, <span class="hljs-string">"by zxysilent"</span>)
      <span class="hljs-keyword">return</span> next(ctx)
  }
}
</code></pre></li>
</ul>
', 1, '2018-11-16 16:16:52', '2019-02-24 14:37:19', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('71', '1', '1', 0, 3, '使用visual studio code 写c语言', 'vs-code-c', '<h3 id="-">所需软件</h3>
<ul>
<li><a href="https://code.visualstudio.com/#alt-downloads">vscode</a>
  推荐下载 <img src="https://blog.zxysilent.com/static/upload/20190224/upload_d5c0164b43ed052f150a8a0086059ad5.png" alt="alt"></li>
<li><a href="https://mingw-w64.org">gcc(mingw64)</a> 官网下载略微复杂</li>
<li><a href="https://pan.baidu.com/s/10rwyP_21nKeVN00aZXObKw">百度网盘下载gcc(mingw64)</a></li>
</ul>
', '### 所需软件
- [vscode](https://code.visualstudio.com/#alt-downloads)
    推荐下载 ![alt](https://blog.zxysilent.com/static/upload/20190224/upload_d5c0164b43ed052f150a8a0086059ad5.png)
- [gcc(mingw64)](https://mingw-w64.org) 官网下载略微复杂
- [百度网盘下载gcc(mingw64)](https://pan.baidu.com/s/10rwyP_21nKeVN00aZXObKw)

<!--more-->
### 安装 vscdoe
- 选择合适的位置  
![alt](https://blog.zxysilent.com/static/upload/20190224/upload_d6ef14f44255bf12c06e1f7ce29ddf08.png)
- 最好都打上勾  
![alt](https://blog.zxysilent.com/static/upload/20190224/upload_e8515772ea8f048d26cee65e2a6a46fe.png)
### 配置gcc
- 解压`mingw64` 放到一个不会删除的地方(最好不包含中文路径)  
![alt](https://blog.zxysilent.com/static/upload/20190224/upload_ba15d6fbf1811b8474a20a21831e2b2c.png)
- 添加环境变量  
 ![alt](https://blog.zxysilent.com/static/upload/20190224/upload_9f80acfbaac6bb7386543df0ad3a5cc0.png)  
 ![alt](https://blog.zxysilent.com/static/upload/20190224/upload_40d606d0be029442f24eaae5d15445e2.png)
 ![alt](https://blog.zxysilent.com/static/upload/20190224/upload_a75d2cbc5bca2fcc5829c1fa2264eb99.png)
> 值就是刚刚解压路径下面的`bin`目录
### 安装c/c++插件
- ![alt](https://blog.zxysilent.com/static/upload/20190224/upload_ad409bd16314b85ef2568ad2164e7ece.png)
### 使用
**[视频步骤](https://pan.baidu.com/s/10rwyP_21nKeVN00aZXObKw)**   
- 新建一个目录并用`vscode`打开  
![alt](https://blog.zxysilent.com/static/upload/20190224/upload_2d3a52836ca0b9105ae0fe5071c3770b.png)
- 新建`.c`文件并写上代码  
![alt](https://blog.zxysilent.com/static/upload/20190224/upload_cf737b6bd9395769dac66288fd16f0d1.png)  
- `vscode` 中 `ctrl+~`启动命令行或者当前目录中`shift`+ 鼠标右键启动命令行，通过命令`gcc 文件名.c` 例如`gcc .\main.c`生成`a.exe`可执行文件  
![alt](https://blog.zxysilent.com/static/upload/20190224/upload_47462cd6740324d37d883414f7db388d.png)
- 运行 `a.exe`  
![alt](https://blog.zxysilent.com/static/upload/20190224/upload_51713ea7355158d6ab72b0b21ef1b1d9.png)  
**提示**输入文件名的时候 直接输入如`a.`+ tab键 就能自动输入好完整的路径  不用完整输入`.\a.exe`并且`cmd`命令行(windows10之前系统)不需要`.\`
', '<div class="toc"><ul>
<li><a href="#toc-ad0">所需软件</a></li>
<li><a href="#toc-eb4">安装 vscdoe</a></li>
<li><a href="#toc-7df">配置gcc</a></li>
<li><a href="#toc-e21">安装c/c++插件</a></li>
<li><a href="#toc-ecf">使用</a></li>
</ul>
</div><h3><a id="toc-ad0" class="anchor" href="#toc-ad0"></a>所需软件</h3>
<ul>
<li><a href="https://code.visualstudio.com/#alt-downloads">vscode</a>
  推荐下载 <img src="https://blog.zxysilent.com/static/upload/20190224/upload_d5c0164b43ed052f150a8a0086059ad5.png" alt="alt"></li>
<li><a href="https://mingw-w64.org">gcc(mingw64)</a> 官网下载略微复杂</li>
<li><a href="https://pan.baidu.com/s/10rwyP_21nKeVN00aZXObKw">百度网盘下载gcc(mingw64)</a></li>
</ul>
<!--more-->
<h3><a id="toc-eb4" class="anchor" href="#toc-eb4"></a>安装 vscdoe</h3>
<ul>
<li>选择合适的位置<br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_d6ef14f44255bf12c06e1f7ce29ddf08.png" alt="alt"></li>
<li>最好都打上勾<br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_e8515772ea8f048d26cee65e2a6a46fe.png" alt="alt"><h3><a id="toc-7df" class="anchor" href="#toc-7df"></a>配置gcc</h3>
</li>
<li>解压<code>mingw64</code> 放到一个不会删除的地方(最好不包含中文路径)<br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_ba15d6fbf1811b8474a20a21831e2b2c.png" alt="alt"></li>
<li>添加环境变量<br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_9f80acfbaac6bb7386543df0ad3a5cc0.png" alt="alt"><br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_40d606d0be029442f24eaae5d15445e2.png" alt="alt">
<img src="https://blog.zxysilent.com/static/upload/20190224/upload_a75d2cbc5bca2fcc5829c1fa2264eb99.png" alt="alt"><blockquote>
<p>值就是刚刚解压路径下面的<code>bin</code>目录</p>
</blockquote>
<h3><a id="toc-e21" class="anchor" href="#toc-e21"></a>安装c/c++插件</h3>
</li>
<li><img src="https://blog.zxysilent.com/static/upload/20190224/upload_ad409bd16314b85ef2568ad2164e7ece.png" alt="alt"><h3><a id="toc-ecf" class="anchor" href="#toc-ecf"></a>使用</h3>
<strong><a href="https://pan.baidu.com/s/10rwyP_21nKeVN00aZXObKw">视频步骤</a></strong>   </li>
<li>新建一个目录并用<code>vscode</code>打开<br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_2d3a52836ca0b9105ae0fe5071c3770b.png" alt="alt"></li>
<li>新建<code>.c</code>文件并写上代码<br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_cf737b6bd9395769dac66288fd16f0d1.png" alt="alt">  </li>
<li><code>vscode</code> 中 <code>ctrl+~</code>启动命令行或者当前目录中<code>shift</code>+ 鼠标右键启动命令行，通过命令<code>gcc 文件名.c</code> 例如<code>gcc .\main.c</code>生成<code>a.exe</code>可执行文件<br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_47462cd6740324d37d883414f7db388d.png" alt="alt"></li>
<li>运行 <code>a.exe</code><br><img src="https://blog.zxysilent.com/static/upload/20190224/upload_51713ea7355158d6ab72b0b21ef1b1d9.png" alt="alt"><br><strong>提示</strong>输入文件名的时候 直接输入如<code>a.</code>+ tab键 就能自动输入好完整的路径  不用完整输入<code>.\a.exe</code>并且<code>cmd</code>命令行(windows10之前系统)不需要<code>.\</code></li>
</ul>
', 1, '2019-02-24 13:45:34', '2019-02-24 14:35:17', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('72', '1', '1', 0, 3, '安装nodejs', 'install-nodejs', '<h2 id="nodejs">NodeJs</h2>
<p><code>Node.js</code> 是一个基于 <code>Chrome V8</code> 引擎的 <code>JavaScript</code> 运行环境。Node.js 使用了一个事件驱动、非阻塞式<code>I/O</code> 的模型，使其轻量又高效。<code>Node.js</code>的包管理器 <code>npm</code>，是全球最大的开源库生态系统。</p>
', '## NodeJs
`Node.js` 是一个基于 `Chrome V8` 引擎的 `JavaScript` 运行环境。Node.js 使用了一个事件驱动、非阻塞式` I/O` 的模型，使其轻量又高效。`Node.js `的包管理器 `npm`，是全球最大的开源库生态系统。

<!--more-->

## 下载安装
[官网](https://nodejs.org/en/)  
[中文官网](https://nodejs.org/zh-cn/)

推荐安装在 `D:\Program Files\nodejs` 则以下配置完全一样
## 配置
### 全局下载路径和缓存路径
`nodejs`的安装目录中找到`node_modules\npm.npmrc`文件修改如下
```
prefix = D:\Program Files\nodejs\node_global
cache = D:\Program Files\nodejs\node_cache
```
### 环境变量
方便后期安装包可以直接使用
#### 自定义环境变量
```
NODE_PATH
D:\Program Files\nodejs\node_global\node_modules
```
![alt](https://blog.zxysilent.com/static/upload/20190303/upload_95f7645ea8ed8d61ea6f2a018809ca3e.png)
#### PATH环境变量
```
D:\Program Files\nodejs\node_global
```
![alt](https://blog.zxysilent.com/static/upload/20190303/upload_53bc29989d5f19a25dff7a9570fab3ac.png)
## 基本使用
### 常见命令

``` 
npm help：查看帮助命令

npm -v：查看npm安装的版本

npm install <name> --save 
```
安装的同时，将信息写入`package.json`中,项目路径中如果`有package.json`文件时直接使用`npm install`方法就可以根据`dependencies`配置安装所有的依赖包，这样代码提交到`github`时，就不用提交`node_modules`这个文件夹了。  
将包安装到全局环境中  
```
npm install <name> -g
```
- `npm update moduleName`更新node模块
- `npm config ls -l`  可以查看当前的目录设置
- 针对某一项设置，可以通过 `npm config set` 属性名 属性值
- 读取某一项配置 `npm config get prefix` 

### 其他
```
npm install xxx 安装模块
npm install xxx@1.1.1   安装1.1.1版本的xxx
npm install xxx -g 将模块安装到全局环境中。
npm ls 查看安装的模块及依赖
npm ls -g 查看全局安装的模块及依赖
npm uninstall xxx  (-g) 卸载模块
npm cache clean 清理缓存
npm help xxx  查看帮助
npm view moudleName dependencies  查看包的依赖关系
npm view moduleNames  查看node模块的package.json文件夹
npm view moduleName labelName  查看package.json文件夹下某个标签的内容
npm view moduleName repository.url  查看包的源文件地址
npm view moduleName engines   查看包所依赖的Node的版本
npm help folders   查看npm使用的所有文件夹
npm rebuild moduleName    用于更改包内容后进行重建
npm outdated   检查包是否已经过时，此命令会列出所有已经过时的包，可以及时进行包的更新
npm update moduleName   更新node模块
npm uninstall moudleName：卸载node模块
```
### 下载慢
- 设置为国内淘宝镜像
```
npm config set registry http://registry.cnpmjs.org 
```
- 验证配置是否成功
```
npm info underscore （如果上面配置正确这个命令会有字符串response）
```

### 执行js

- 交互模式, 直接输入 `node`   
![alt](https://blog.zxysilent.com/static/upload/20190303/upload_1afb359df34f914b90aa2234fcd0731e.png)
- 运行某个`js`文件  
![alt](https://blog.zxysilent.com/static/upload/20190303/upload_2044576b1d95d53e6156e4190aeaf4aa.png)', '<div class="toc"><ul>
<li><a href="#nodejs">NodeJs</a></li>
<li><a href="#toc-deb">下载安装</a></li>
<li><a href="#toc-224">配置</a><ul>
<li><a href="#toc-3c5">全局下载路径和缓存路径</a></li>
<li><a href="#toc-386">环境变量</a><ul>
<li><a href="#toc-1d4">自定义环境变量</a></li>
<li><a href="#toc-ee5">PATH环境变量</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#toc-d19">基本使用</a><ul>
<li><a href="#toc-fa2">常见命令</a></li>
<li><a href="#toc-0d9">其他</a></li>
<li><a href="#toc-c79">下载慢</a></li>
<li><a href="#toc-9f3">执行js</a></li>
</ul>
</li>
</ul>
</div><h2><a id="nodejs" class="anchor" href="#nodejs"></a>NodeJs</h2>
<p><code>Node.js</code> 是一个基于 <code>Chrome V8</code> 引擎的 <code>JavaScript</code> 运行环境。Node.js 使用了一个事件驱动、非阻塞式<code>I/O</code> 的模型，使其轻量又高效。<code>Node.js</code>的包管理器 <code>npm</code>，是全球最大的开源库生态系统。</p>
<!--more-->
<h2><a id="toc-deb" class="anchor" href="#toc-deb"></a>下载安装</h2>
<p><a href="https://nodejs.org/en/">官网</a><br><a href="https://nodejs.org/zh-cn/">中文官网</a></p>
<p>推荐安装在 <code>D:\Program Files\nodejs</code> 则以下配置完全一样</p>
<h2><a id="toc-224" class="anchor" href="#toc-224"></a>配置</h2>
<h3><a id="toc-3c5" class="anchor" href="#toc-3c5"></a>全局下载路径和缓存路径</h3>
<p><code>nodejs</code>的安装目录中找到<code>node_modules\npm.npmrc</code>文件修改如下</p>
<pre><code class="hljs lang-taggerscript">prefix = D:<span class="hljs-symbol">\P</span>rogram Files<span class="hljs-symbol">\n</span>odejs<span class="hljs-symbol">\n</span>ode_global
cache = D:<span class="hljs-symbol">\P</span>rogram Files<span class="hljs-symbol">\n</span>odejs<span class="hljs-symbol">\n</span>ode_cache
</code></pre><h3><a id="toc-386" class="anchor" href="#toc-386"></a>环境变量</h3>
<p>方便后期安装包可以直接使用</p>
<h4><a id="toc-1d4" class="anchor" href="#toc-1d4"></a>自定义环境变量</h4>
<pre><code class="hljs lang-taggerscript">NODE_PATH
D:<span class="hljs-symbol">\P</span>rogram Files<span class="hljs-symbol">\n</span>odejs<span class="hljs-symbol">\n</span>ode_global<span class="hljs-symbol">\n</span>ode_modules
</code></pre><p><img src="https://blog.zxysilent.com/static/upload/20190303/upload_95f7645ea8ed8d61ea6f2a018809ca3e.png" alt="alt"></p>
<h4><a id="toc-ee5" class="anchor" href="#toc-ee5"></a>PATH环境变量</h4>
<pre><code class="hljs lang-taggerscript">D:<span class="hljs-symbol">\P</span>rogram Files<span class="hljs-symbol">\n</span>odejs<span class="hljs-symbol">\n</span>ode_global
</code></pre><p><img src="https://blog.zxysilent.com/static/upload/20190303/upload_53bc29989d5f19a25dff7a9570fab3ac.png" alt="alt"></p>
<h2><a id="toc-d19" class="anchor" href="#toc-d19"></a>基本使用</h2>
<h3><a id="toc-fa2" class="anchor" href="#toc-fa2"></a>常见命令</h3>
<pre><code class="hljs lang-coffeescript"><span class="hljs-built_in">npm</span> help：查看帮助命令

<span class="hljs-built_in">npm</span> -v：查看<span class="hljs-built_in">npm</span>安装的版本

<span class="hljs-built_in">npm</span> install &lt;name&gt; --save 
</code></pre><p>安装的同时，将信息写入<code>package.json</code>中,项目路径中如果<code>有package.json</code>文件时直接使用<code>npm install</code>方法就可以根据<code>dependencies</code>配置安装所有的依赖包，这样代码提交到<code>github</code>时，就不用提交<code>node_modules</code>这个文件夹了。<br>将包安装到全局环境中  </p>
<pre><code class="hljs lang-sql">npm <span class="hljs-keyword">install</span> &lt;<span class="hljs-keyword">name</span>&gt; -g
</code></pre><ul>
<li><code>npm update moduleName</code>更新node模块</li>
<li><code>npm config ls -l</code>  可以查看当前的目录设置</li>
<li>针对某一项设置，可以通过 <code>npm config set</code> 属性名 属性值</li>
<li>读取某一项配置 <code>npm config get prefix</code> </li>
</ul>
<h3><a id="toc-0d9" class="anchor" href="#toc-0d9"></a>其他</h3>
<pre><code class="hljs lang-coffeescript"><span class="hljs-built_in">npm</span> install xxx 安装模块
<span class="hljs-built_in">npm</span> install xxx@<span class="hljs-number">1.1</span><span class="hljs-number">.1</span>   安装<span class="hljs-number">1.1</span><span class="hljs-number">.1</span>版本的xxx
<span class="hljs-built_in">npm</span> install xxx -g 将模块安装到全局环境中。
<span class="hljs-built_in">npm</span> ls 查看安装的模块及依赖
<span class="hljs-built_in">npm</span> ls -g 查看全局安装的模块及依赖
<span class="hljs-built_in">npm</span> uninstall xxx  (-g) 卸载模块
<span class="hljs-built_in">npm</span> cache clean 清理缓存
<span class="hljs-built_in">npm</span> help xxx  查看帮助
<span class="hljs-built_in">npm</span> view moudleName dependencies  查看包的依赖关系
<span class="hljs-built_in">npm</span> view moduleNames  查看node模块的package.json文件夹
<span class="hljs-built_in">npm</span> view moduleName labelName  查看package.json文件夹下某个标签的内容
<span class="hljs-built_in">npm</span> view moduleName repository.url  查看包的源文件地址
<span class="hljs-built_in">npm</span> view moduleName engines   查看包所依赖的Node的版本
<span class="hljs-built_in">npm</span> help folders   查看<span class="hljs-built_in">npm</span>使用的所有文件夹
<span class="hljs-built_in">npm</span> rebuild moduleName    用于更改包内容后进行重建
<span class="hljs-built_in">npm</span> outdated   检查包是否已经过时，此命令会列出所有已经过时的包，可以及时进行包的更新
<span class="hljs-built_in">npm</span> update moduleName   更新node模块
<span class="hljs-built_in">npm</span> uninstall moudleName：卸载node模块
</code></pre><h3><a id="toc-c79" class="anchor" href="#toc-c79"></a>下载慢</h3>
<ul>
<li>设置为国内淘宝镜像<pre><code class="hljs lang-tcl">npm config <span class="hljs-keyword">set</span> <span class="hljs-keyword">registry</span> <span class="hljs-keyword">http</span>://<span class="hljs-keyword">registry</span>.cnpmjs.org 
</code></pre></li>
<li>验证配置是否成功<pre><code class="hljs lang-nginx"><span class="hljs-attribute">npm</span> <span class="hljs-literal">info</span> underscore （如果上面配置正确这个命令会有字符串response）
</code></pre></li>
</ul>
<h3><a id="toc-9f3" class="anchor" href="#toc-9f3"></a>执行js</h3>
<ul>
<li>交互模式, 直接输入 <code>node</code><br><img src="https://blog.zxysilent.com/static/upload/20190303/upload_1afb359df34f914b90aa2234fcd0731e.png" alt="alt"></li>
<li>运行某个<code>js</code>文件<br><img src="https://blog.zxysilent.com/static/upload/20190303/upload_2044576b1d95d53e6156e4190aeaf4aa.png" alt="alt"></li>
</ul>
', 1, '2019-03-03 18:19:06', '2019-03-03 20:06:47', 1, 0, '{"template":"","featuredImage":"","push_sites":[]}');
INSERT INTO "public"."post" VALUES ('8', '1', '1', 0, 3, '把json图片信息展示到页面', 'json-imgs-html', '<p>如数据库返回格式为</p>
<pre><code class="hljs lang-1c"> var datas = {
            count: <span class="hljs-number">3</span>,
            imgs: [
                ''https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=<span class="hljs-number">2905893513</span>,<span class="hljs-number">2695425341</span>&amp;fm=23&amp;gp=0.jpgg'',
                ''https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=<span class="hljs-number">3633691784</span>,<span class="hljs-number">3186862163</span>&amp;fm=23&amp;gp=0.jpg'',
                ''https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=<span class="hljs-number">3706772667</span>,<span class="hljs-number">1323205698</span>&amp;fm=23&amp;gp=0.jpg''
            ]
        }
</code></pre><p>如何把这些信息以图片的方式展现到</p>
', '如数据库返回格式为

```
 var datas = {
            count: 3,
            imgs: [
                ''https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905893513,2695425341&fm=23&gp=0.jpgg'',
                ''https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3633691784,3186862163&fm=23&gp=0.jpg'',
                ''https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3706772667,1323205698&fm=23&gp=0.jpg''
            ]
        }
```
如何把这些信息以图片的方式展现到
<!--more-->页面上呢。  
直接上源码：
```
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        img {
            width: 200px;
            margin-left: 10px;
        }
    </style>
</head>

<body>
    <!--图片容器-->
    <div id="container">
        <img src="">
    </div>
    <script>
        //借用百度图片
        //服务器返回如下格式数据
        //如何展示到页面上
        var datas = {
            count: 3,
            imgs: [
                ''https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905893513,2695425341&fm=23&gp=0.jpgg'',
                ''https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3633691784,3186862163&fm=23&gp=0.jpg'',
                ''https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3706772667,1323205698&fm=23&gp=0.jpg''
            ]
        }

        //准备容器
        var arr = [];
        //拼接图片标签
        for (var i = 0; i < datas.count; i++) {
            arr.push(''<img src="'' + datas.imgs[i] + ''">'');
        }
        //展现在容器中
        document.querySelector(''#container'').innerHTML = arr.join('''');
    </script>
</body>

</html>
```
效果图

![alt](https://blog.zxysilent.com\static\upload\20170408\SvPmIT2r9tdLQldo3s_0PZY8.png)

页面元素

![alt](http://blog.zxysilent.com\static\upload\20170408\x2ALYpMKRhTbOElR4d5hYhp3.png)', '<div class="toc"></div><p>如数据库返回格式为</p>
<pre><code class="hljs lang-scala"> <span class="hljs-keyword">var</span> datas = {
            count: <span class="hljs-number">3</span>,
            imgs: [
                <span class="hljs-symbol">''https</span>:<span class="hljs-comment">//ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905893513,2695425341&amp;fm=23&amp;gp=0.jpgg'',</span>
                <span class="hljs-symbol">''https</span>:<span class="hljs-comment">//ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3633691784,3186862163&amp;fm=23&amp;gp=0.jpg'',</span>
                <span class="hljs-symbol">''https</span>:<span class="hljs-comment">//ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3706772667,1323205698&amp;fm=23&amp;gp=0.jpg''</span>
            ]
        }
</code></pre><p>如何把这些信息以图片的方式展现到
<!--more-->页面上呢。<br>直接上源码：</p>
<pre><code class="hljs lang-xml"><span class="hljs-meta">&lt;!DOCTYPE html&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-name">html</span> <span class="hljs-attr">lang</span>=<span class="hljs-string">"en"</span>&gt;</span>

<span class="hljs-tag">&lt;<span class="hljs-name">head</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">charset</span>=<span class="hljs-string">"UTF-8"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">name</span>=<span class="hljs-string">"viewport"</span> <span class="hljs-attr">content</span>=<span class="hljs-string">"width=device-width, initial-scale=1.0"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">meta</span> <span class="hljs-attr">http-equiv</span>=<span class="hljs-string">"X-UA-Compatible"</span> <span class="hljs-attr">content</span>=<span class="hljs-string">"ie=edge"</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">title</span>&gt;</span>Document<span class="hljs-tag">&lt;/<span class="hljs-name">title</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">style</span>&gt;</span><span class="css">
        <span class="hljs-selector-tag">img</span> {
            <span class="hljs-attribute">width</span>: <span class="hljs-number">200px</span>;
            <span class="hljs-attribute">margin-left</span>: <span class="hljs-number">10px</span>;
        }
    </span><span class="hljs-tag">&lt;/<span class="hljs-name">style</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">head</span>&gt;</span>

<span class="hljs-tag">&lt;<span class="hljs-name">body</span>&gt;</span>
    <span class="hljs-comment">&lt;!--图片容器--&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">div</span> <span class="hljs-attr">id</span>=<span class="hljs-string">"container"</span>&gt;</span>
        <span class="hljs-tag">&lt;<span class="hljs-name">img</span> <span class="hljs-attr">src</span>=<span class="hljs-string">""</span>&gt;</span>
    <span class="hljs-tag">&lt;/<span class="hljs-name">div</span>&gt;</span>
    <span class="hljs-tag">&lt;<span class="hljs-name">script</span>&gt;</span><span class="javascript">
        <span class="hljs-comment">//借用百度图片</span>
        <span class="hljs-comment">//服务器返回如下格式数据</span>
        <span class="hljs-comment">//如何展示到页面上</span>
        <span class="hljs-keyword">var</span> datas = {
            <span class="hljs-attr">count</span>: <span class="hljs-number">3</span>,
            <span class="hljs-attr">imgs</span>: [
                <span class="hljs-string">''https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2905893513,2695425341&amp;fm=23&amp;gp=0.jpgg''</span>,
                <span class="hljs-string">''https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3633691784,3186862163&amp;fm=23&amp;gp=0.jpg''</span>,
                <span class="hljs-string">''https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3706772667,1323205698&amp;fm=23&amp;gp=0.jpg''</span>
            ]
        }

        <span class="hljs-comment">//准备容器</span>
        <span class="hljs-keyword">var</span> arr = [];
        <span class="hljs-comment">//拼接图片标签</span>
        <span class="hljs-keyword">for</span> (<span class="hljs-keyword">var</span> i = <span class="hljs-number">0</span>; i &lt; datas.count; i++) {
            arr.push(<span class="hljs-string">''&lt;img src="''</span> + datas.imgs[i] + <span class="hljs-string">''"&gt;''</span>);
        }
        <span class="hljs-comment">//展现在容器中</span>
        <span class="hljs-built_in">document</span>.querySelector(<span class="hljs-string">''#container''</span>).innerHTML = arr.join(<span class="hljs-string">''''</span>);
    </span><span class="hljs-tag">&lt;/<span class="hljs-name">script</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-name">body</span>&gt;</span>

<span class="hljs-tag">&lt;/<span class="hljs-name">html</span>&gt;</span>
</code></pre><p>效果图</p>
<p><img src="https://blog.zxysilent.com\static\upload\20170408\SvPmIT2r9tdLQldo3s_0PZY8.png" alt="alt"></p>
<p>页面元素</p>
<p><img src="http://blog.zxysilent.com\static\upload\20170408\x2ALYpMKRhTbOElR4d5hYhp3.png" alt="alt"></p>
', 1, '2017-04-08 09:59:40', '2018-02-01 12:21:25', 1, 0, '{"template":"","push_sites":[]}');

-- ----------------------------
-- Table structure for post_tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."post_tag";
CREATE TABLE "public"."post_tag" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "post_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tag_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of post_tag
-- ----------------------------
INSERT INTO "public"."post_tag" VALUES ('52', '10', '6');
INSERT INTO "public"."post_tag" VALUES ('253', '13', '11');
INSERT INTO "public"."post_tag" VALUES ('50', '14', '6');
INSERT INTO "public"."post_tag" VALUES ('43', '19', '1');
INSERT INTO "public"."post_tag" VALUES ('44', '19', '2');
INSERT INTO "public"."post_tag" VALUES ('45', '19', '4');
INSERT INTO "public"."post_tag" VALUES ('46', '19', '6');
INSERT INTO "public"."post_tag" VALUES ('48', '19', '9');
INSERT INTO "public"."post_tag" VALUES ('54', '22', '2');
INSERT INTO "public"."post_tag" VALUES ('427', '30', '3');
INSERT INTO "public"."post_tag" VALUES ('116', '31', '1');
INSERT INTO "public"."post_tag" VALUES ('443', '33', '1');
INSERT INTO "public"."post_tag" VALUES ('79', '35', '10');
INSERT INTO "public"."post_tag" VALUES ('78', '35', '4');
INSERT INTO "public"."post_tag" VALUES ('441', '36', '11');
INSERT INTO "public"."post_tag" VALUES ('424', '37', '12');
INSERT INTO "public"."post_tag" VALUES ('425', '37', '13');
INSERT INTO "public"."post_tag" VALUES ('147', '38', '14');
INSERT INTO "public"."post_tag" VALUES ('158', '39', '15');
INSERT INTO "public"."post_tag" VALUES ('157', '39', '2');
INSERT INTO "public"."post_tag" VALUES ('155', '40', '16');
INSERT INTO "public"."post_tag" VALUES ('202', '41', '17');
INSERT INTO "public"."post_tag" VALUES ('185', '43', '1');
INSERT INTO "public"."post_tag" VALUES ('186', '43', '3');
INSERT INTO "public"."post_tag" VALUES ('259', '44', '3');
INSERT INTO "public"."post_tag" VALUES ('260', '44', '4');
INSERT INTO "public"."post_tag" VALUES ('434', '47', '1');
INSERT INTO "public"."post_tag" VALUES ('435', '47', '2');
INSERT INTO "public"."post_tag" VALUES ('436', '47', '4');
INSERT INTO "public"."post_tag" VALUES ('426', '48', '1');
INSERT INTO "public"."post_tag" VALUES ('372', '51', '4');
INSERT INTO "public"."post_tag" VALUES ('373', '52', '2');
INSERT INTO "public"."post_tag" VALUES ('374', '52', '4');
INSERT INTO "public"."post_tag" VALUES ('428', '53', '2');
INSERT INTO "public"."post_tag" VALUES ('433', '57', '2');
INSERT INTO "public"."post_tag" VALUES ('439', '59', '2');
INSERT INTO "public"."post_tag" VALUES ('438', '60', '2');
INSERT INTO "public"."post_tag" VALUES ('376', '61', '2');
INSERT INTO "public"."post_tag" VALUES ('401', '66', '19');
INSERT INTO "public"."post_tag" VALUES ('1111', '66', '4');
INSERT INTO "public"."post_tag" VALUES ('412', '67', '12');
INSERT INTO "public"."post_tag" VALUES ('413', '67', '20');
INSERT INTO "public"."post_tag" VALUES ('456', '71', '3');
INSERT INTO "public"."post_tag" VALUES ('55', '8', '1');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS "public"."student";
CREATE TABLE "public"."student" (
  "id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "tid" int4 NOT NULL,
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO "public"."student" VALUES (1, 'string', 1, '2022-01-21 23:29:18', '2037-01-01 00:00:00');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS "public"."tag";
CREATE TABLE "public"."tag" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "intro" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO "public"."tag" VALUES ('1', 'web', 'web');
INSERT INTO "public"."tag" VALUES ('10', 'node', 'node');
INSERT INTO "public"."tag" VALUES ('11', 'nginx', 'nginx');
INSERT INTO "public"."tag" VALUES ('12', 'python', 'python');
INSERT INTO "public"."tag" VALUES ('13', 'numpy', 'numpy');
INSERT INTO "public"."tag" VALUES ('14', 'javascript', 'javascript');
INSERT INTO "public"."tag" VALUES ('15', 'ga', 'ga');
INSERT INTO "public"."tag" VALUES ('16', 'java', 'java');
INSERT INTO "public"."tag" VALUES ('17', 'machinelearning', 'ml');
INSERT INTO "public"."tag" VALUES ('18', 'ds', 'ds');
INSERT INTO "public"."tag" VALUES ('19', 'matplotlib', 'matplotlib');
INSERT INTO "public"."tag" VALUES ('2', 'go', 'go');
INSERT INTO "public"."tag" VALUES ('20', 'opencv', 'opencv');
INSERT INTO "public"."tag" VALUES ('3', 'c', 'c');
INSERT INTO "public"."tag" VALUES ('4', 'mysql', 'mysql');
INSERT INTO "public"."tag" VALUES ('6', 'teach', 'teach');
INSERT INTO "public"."tag" VALUES ('7', 'learn', 'learn');
INSERT INTO "public"."tag" VALUES ('9', 'beego', 'beego');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS "public"."teacher";
CREATE TABLE "public"."teacher" (
  "id" int4 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "update_time" timestamp(6)
)
;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO "public"."teacher" VALUES (1, 'string', 'string', '2022-01-21 23:29:40', '2022-01-21 23:29:40');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
  "id" varchar(32) COLLATE "pg_catalog"."default" NOT NULL,
  "username" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "age" int4,
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "num" varchar COLLATE "pg_catalog"."default",
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "ecount" varchar(255) COLLATE "pg_catalog"."default",
  "ltime" timestamptz(6),
  "ctime" timestamptz(6)
)
;
COMMENT ON COLUMN "public"."user"."ecount" IS '错误次数';
COMMENT ON COLUMN "public"."user"."ltime" IS '上次登录';
COMMENT ON COLUMN "public"."user"."ctime" IS '创建时间';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO "public"."user" VALUES ('0', 'yzq', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('1', 'Abe Shino', 'lbVCgJWcjJ', 842, 'shabe2@yahoo.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('2', 'Ku Wai San', 'i5JDJCjssE', 245, 'wsk1@outlook.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('3', 'Shao Xiuying', 'UNxz1VdDFQ', 167, 'xiuyingsha00@mail.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('4', 'Lo Ho Yin', '7UHKr1a695', 771, 'hol01@hotmail.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('5', 'Chung Wing Suen', 'mqBJCmtnfp', 600, 'wingsuenchung9@icloud.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('6', 'Imai Miu', 'wVbYjDUabl', 626, 'imaim@mail.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('7', 'Wei Yuning', '9YbLmRr32l', 232, 'ywei@icloud.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('8', 'Xia Lu', 'gHhGlPIxlo', 802, 'luxia@icloud.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('9', 'Nakajima Riku', 'lea8Jt0iQy', 366, 'nakajimari@outlook.com', NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."user" VALUES ('10', 'Vincent Murray', 'vvNVhZmnhY', 121, 'murravinc@gmail.com', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Primary Key structure for table student
-- ----------------------------
ALTER TABLE "public"."student" ADD CONSTRAINT "student_pkey" PRIMARY KEY ("id", "tid");

-- ----------------------------
-- Primary Key structure for table teacher
-- ----------------------------
ALTER TABLE "public"."teacher" ADD CONSTRAINT "teacher_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("id");
