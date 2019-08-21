package testt;

import biz.UserMapper;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import javabean.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserDao {

    @Resource
    private UserMapper userMapper;

    public UserDao(){

    }
    /**
     * 注册
     * @param frontUsers
     * @return
     */
    public boolean insert(FrontUsers frontUsers){
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        userMapper.inserUser(frontUsers);
        return true;
    }

    /**
     * 登录
     * @param userName
     * @return
     */
    public FrontUser select(String userName){
        System.out.println("================2次"+userName);
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        FrontUser frontUser =  userMapper.selectUser(userName);
        return frontUser;

    }

    /**
     * 动态菜单获取
     * @param occid
     * @return
     */
    public Map<String, List<FrontMenu>> selectMenu(String occid){
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        Map<String, List<FrontMenu>> frontMenuHashMap = new HashMap<String, List<FrontMenu>>();
        List<FrontMenu> frontMenus = new ArrayList<FrontMenu>();
        frontMenus = userMapper.selectMenu(occid);
        System.out.println(frontMenus.get(0).getMenu_Name());
        frontMenuHashMap.put("menuname",frontMenus);
        return frontMenuHashMap;
    }

    /**
     * 人员信息
     * @return
     */
    public List<FrontUser> selectUserInfo(){
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        List<FrontUser> list = new ArrayList<FrontUser>();
        list = userMapper.selectUserInfo();
        return list;
    }

    /**
     * 获取菜单ID
     */
    public List<View_FrontMenu> selectViewMenu(){
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        List<View_FrontMenu> list = new ArrayList<View_FrontMenu>();
        list = userMapper.selectViewMenu();
        return list;
    }

    /**
     * 单独只获取菜单ID和菜单名字
     * @param occname
     * @return
     */
    public Map<String, List<View_FrontMenu>> selectViewMenuCoo(String occname){
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        List<View_FrontMenu> list = new ArrayList<View_FrontMenu>();
        list = userMapper.selectViewMenuCoo(occname);
        Map<String,List<View_FrontMenu>> frontMenuHashMap = new HashMap<>();
        frontMenuHashMap.put("menuname",list);
        return frontMenuHashMap;
    }

    /**
     * 获取学历
     * @return
     */
    public List<FrontEducation> selectEduca(){
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        List<FrontEducation> list = new ArrayList<FrontEducation>();
        list = userMapper.selectEduca();
        return list;
    }

    /**
     * 获取职业
     * @return
     */
    public List<FrontOccupation> selectOccupa(){
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        List<FrontOccupation> list = new ArrayList<FrontOccupation>();
        list = userMapper.selectOccupa();
        return list;
    }

    /**
     * 登录时获取职业全部信息放入session中
     * @param occname 职业ID
     * @return
     */
    public Map<String,FrontOccupation> selectOccupaAndUser(String occname){
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        FrontOccupation frontOccupation = new FrontOccupation();
        Map<String,FrontOccupation> frontOccupationMap = new HashMap<String,FrontOccupation>();
        frontOccupation = userMapper.selectOccupaAndUser(occname);
        frontOccupationMap.put("occ",frontOccupation);
        return frontOccupationMap;
    }

    /**
     * 登录验证账号是否可以登录
     * @param userName
     * @return
     */
    public FrontUser selectVerifica(String userName){
        System.out.println(userName);
//        ApplicationContext app =  new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserMapper userMapper = app.getBean("userMapper",UserMapper.class);
        FrontUser frontUsers = new FrontUser();
        frontUsers = userMapper.selectVerifica(userName);
        return frontUsers;
    }

    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
}
