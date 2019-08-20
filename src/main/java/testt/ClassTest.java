package testt;

import biz.UserMapper;
import ch.qos.logback.classic.spi.ClassPackagingData;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

public class ClassTest {

    public static void main(String[] args) {

        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        List list = userMapper.selectOccupa();
        System.out.println(list.size());
    }
}
