// 2019-5-4
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import online.yangxiao.entity.Category;
import online.yangxiao.service.CategoryService;

@ContextConfiguration(locations = {"classpath:spring-mybatis.xml", "classpath:spring-mvc.xml"})
public class TestCategory extends AbstractJUnit4SpringContextTests {
    @Autowired
    private CategoryService categoryService;

    @Test
    public void testSave() {
        Integer cid = 1;
        categoryService.deleteById(cid);
    }
}
