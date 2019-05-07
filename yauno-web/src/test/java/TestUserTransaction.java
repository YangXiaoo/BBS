// 2019-4-5
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import online.yangxiao.entity.User;
import online.yangxiao.service.UserService;

@ContextConfiguration(locations = {"classpath:spring-mybatis.xml", "classpath:spring-mvc.xml"})
public class TestUserTransaction extends AbstractJUnit4SpringContextTests {
    @Autowired
    private UserService userService;

    @Test
    public void testSave() {
        User user = new User();
        user.setUsername("杨潇-test1");
        user.setEmail("1270009836@qq.com");
        user.setPassword("Ab127000");
        user.setProfile("www.yangxiao.online/img/default_profile.jpg");
        userService.regist(user);
    }
}
