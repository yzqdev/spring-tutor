## @Value 与 @ConfigurationProperties 对比

@Value 和 @ConfigurationProperties 注解都能读取配置文件中的属性值并绑定到 JavaBean 中，但两者存在以下不同。

#### 1. 使用位置不同

- @ConfigurationProperties：标注在 JavaBean 的类名上；
- @Value：标注在 JavaBean 的属性上。

#### 2. 功能不同

- @ConfigurationProperties：用于批量绑定配置文件中的配置；
- @Value：只能一个一个的指定需要绑定的配置。

#### 3. 松散绑定支持不同

@ConfigurationProperties：支持松散绑定（松散语法），例如实体类 Person 中有一个属性为 lastName，那么配置文件中的属性名支持以下写法：

- person.firstName
- person.first-name
- person.first_name
- PERSON_FIRST_NAME


@Vaule：不支持松散绑定。

#### 4. SpEL 支持不同

- @ConfigurationProperties：不支持 SpEL 表达式;
- @Value：支持 SpEL 表达式。

#### 5. 复杂类型封装

- @ConfigurationProperties：支持所有类型数据的封装，例如 Map、List、Set、以及对象等；
- @Value：只支持基本数据类型的封装，例如字符串、布尔值、整数等类型。

#### 6. 应用场景不同

@Value 和 @ConfigurationProperties 两个注解之间，并没有明显的优劣之分，它们只是适合的应用场景不同而已。

- 若只是获取配置文件中的某项值，则推荐使用 @Value 注解；
- 若专门编写了一个 JavaBean 来和配置文件进行映射，则建议使用 @ConfigurationProperties 注解。


我们在选用时，根据实际应用场景选择合适的注解能达到事半功倍的效果。

## @PropertySource

如果将所有的配置都集中到 application.properties 或 application.yml 中，那么这个配置文件会十分的臃肿且难以维护，因此我们通常会将与 Spring Boot 无关的配置（例如自定义配置）提取出来，写在一个单独的配置文件中，并在对应的 JavaBean 上使用 @PropertySource 注解指向该配置文件。


-----------------------------------------------------


通常情况下，Spring Boot 在启动时会将 resources 目录下的 application.properties 或 apllication.yml 作为其默认配置文件，我们可以在该配置文件中对项目进行配置，但这并不意味着 Spring Boot 项目中只能存在一个 application.properties 或 application.yml。

## 默认配置文件

Spring Boot 项目中可以存在多个 application.properties 或 apllication.yml。

Spring Boot 启动时会扫描以下 5 个位置的 application.properties 或 apllication.yml 文件，并将它们作为 Spring boot 的默认配置文件。

1. file:./config/
2. file:./config/*/
3. file:./
4. classpath:/config/
5. classpath:/

> 注：file: 指当前项目根目录；classpath: 指当前项目的类路径，即 resources 目录。
classpath 等价于 main/java + main/resources + 第三方jar包的根目录

以上所有位置的配置文件都会被加载，且它们优先级依次降低，序号越小优先级越高。其次，位于相同位置的 application.properties 的优先级高于 application.yml。

所有位置的文件都会被加载，高优先级配置会覆盖低优先级配置，形成互补配置，即：

- 存在相同的配置内容时，高优先级的内容会覆盖低优先级的内容；
- 存在不同的配置内容时，高优先级和低优先级的配置内容取并集。