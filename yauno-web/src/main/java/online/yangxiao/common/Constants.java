package online.yangxiao.common;

// 常量定义
public class Constants {

    public static final String OPEN_TYPE_QQ = "QQ";
    public static final String OPEN_TYPE_WEIXIN = "WEIXIN";
    public static final String OPEN_TYPE_WEIBO = "WEIBO";

    public static final Long ROLE_USER = 1L;
    public static final Long ROLE_ADMIN = 2L;

    public static final String QQ_LOGIN_URL = "/qq_login";

    public static final String  WEB_DOMAIN = "http://localhost:8080/";
    public static final String  CTX = "yaunoweb_war_exploded/";

    public static final String SERVER_RESOURCE_ROOT = "C:/Users/Yauno/IdeaProjects/Yauno/yauno-web/src/main/webapp";   // 资源存放绝对路径

    public static final String UPLOAD_DIR = "resources";    // 上传文件项目目录

    public static final String[] FILE_TYPE = {"webfile", "systemfile", "userfile"};    // 上传文件所在子目录
}