package ymw;

import biz.UserMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.stereotype.Controller;
import testt.MybatisTools;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
public class JournalAction implements MethodBeforeAdvice, AfterReturningAdvice {
    public SqlSession sqlSession = null;


    /**
     *
     * @param name 注册人的名称
     */
    public void journal(String name) {

        String thing = "注册账号";

        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//时间
            sqlSession = MybatisTools.getSession();
            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            userMapper.journal(name);
            sqlSession.commit();
            sqlSession.close();
            /*************日志操作***************/
           //插入管理员日志表
            System.out.println("修改成功");
            System.out.println("时间："+df.format(new Date())+"用户:"+name+"做了什么事："+thing);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {

    }

    @Override
    public void before(Method method, Object[] objects, Object o) throws Throwable {
        journal("233");
    }
}
