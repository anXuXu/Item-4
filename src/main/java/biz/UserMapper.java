package biz;

import javabean.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface UserMapper {

    /**
     * 注册
     * @param frontUsers
     */
    public void inserUser(FrontUsers frontUsers);

    /**
     * 登录
     * @param userName
     * @return
     */
    public FrontUser selectUser(String userName);

    /**
     * 登录验证
     * @param userName
     * @return
     */
    public FrontUser selectVerifica(String userName);
    /**
     * 人员信息
     * @return
     */
    public List<FrontUser> selectUserInfo();

    /**
     * 动态菜单
     * @param cooid
     * @return
     */
    public List<FrontMenu> selectMenu(String cooid);

    /**
     * 查询所有菜单的ID和名字
     * @return
     */
    public List<View_FrontMenu> selectViewMenu();

    /**
     * 查询指定职业菜单ID和名字
     * @param occname
     * @return
     */
    public List<View_FrontMenu> selectViewMenuCoo(String occname);

    /**
     * 查询所有学历
     * @return
     */
    public List<FrontEducation> selectEduca();

    /**
     * 查询所有职业
     * @return
     */
    public List<FrontOccupation> selectOccupa();

    /**
     * 根据用户职业查询菜单
     * @param occname
     * @return
     */
    public FrontOccupation selectOccupaAndUser(String occname);

    public void journal(String userName);
}
