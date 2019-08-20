package ymw;

import com.opensymphony.xwork2.ActionContext;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import javabean.FrontMenu;
import javabean.FrontUser;
import javabean.JsonMsg;
import javabean.View_FrontMenu;
import org.springframework.stereotype.Controller;
import testt.UserDao;

import javax.annotation.Resource;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class UserAction {
    public Map<String,Object> session;
    public JsonMsg jsonMsg;
    @Resource
    public UserDao userDaoss;
    private List<FrontUser> list = new ArrayList<FrontUser>();
    private List<View_FrontMenu> frontMenus = new ArrayList<View_FrontMenu>();
    private HashMap<String,ArrayList> map = new HashMap<>();
    private Map<String, List<FrontMenu>> frontMenuHashMap = new HashMap<>();
    private Map<String, List<View_FrontMenu>> viewmenu = new HashMap<>();
    private String occname;
    public UserAction(){
        /*
        * 实例化参数类
                */
        jsonMsg = new JsonMsg();
        /**
         * 实例化接口实现类
         */
        userDaoss = new UserDao();
    }

    /**
     * 获取用户管理数据
     * @return
     */
    public String userData() throws Exception{
        list = userDaoss.selectUserInfo();
        return jsonMsg.getUSERDATA();
    }

    /**
     * 获取动态菜单
     * @return
     */
    public String dynamicMenu()throws Exception{
        session = ActionContext.getContext().getSession();
        List<FrontMenu> fro = new ArrayList<>();
        System.out.println((String) session.get("occid"));
        String occid  = (String) session.get("occid");
        frontMenuHashMap = userDaoss.selectMenu(occid);
        return jsonMsg.getMENU();
    }

    /**
     * 获取权限管理分配和未分配的值
     * @return
     * @throws Exception
     */

    public String occRloe()throws Exception{
        //所有菜单
        frontMenus = userDaoss.selectViewMenu();
        //当前下拉框选择的角色拥有的菜单
        viewmenu = userDaoss.selectViewMenuCoo(occname);
        //拿到Map中的集合
        List<View_FrontMenu> frontMenuList = viewmenu.get("menuname");
        //遍历获取未用于的值
        //已拥有
        for (int i = 0; i < frontMenuList.size(); i++) {
            //所有
            for (int j = 0; j < frontMenus.size(); j++) {
                //如果有相等的，就移除掉==未拥有的属性
                if(frontMenuList.get(i).getMenu_Name().equals(frontMenus.get(j).getMenu_Name())) {
                    frontMenus.remove(j);
                }
            }
        }
        viewmenu.put("haves",  frontMenuList);
        viewmenu.put("loses",  frontMenus);
        return jsonMsg.getDOWNBOX();
    }


    public JsonMsg getJsonMsg() {
        return jsonMsg;
    }

    public void setJsonMsg(JsonMsg jsonMsg) {
        this.jsonMsg = jsonMsg;
    }

    public List<FrontUser> getList() {
        return list;
    }

    public void setList(List<FrontUser> list) {
        this.list = list;
    }

    public HashMap<String, ArrayList> getMap() {
        return map;
    }

    public void setMap(HashMap<String, ArrayList> map) {
        this.map = map;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public UserDao getUserDaoss() {
        return userDaoss;
    }

    public void setUserDaoss(UserDao userDaoss) {
        this.userDaoss = userDaoss;
    }

    public Map<String, List<FrontMenu>> getFrontMenuHashMap() {
        return frontMenuHashMap;
    }

    public void setFrontMenuHashMap(Map<String, List<FrontMenu>> frontMenuHashMap) {
        this.frontMenuHashMap = frontMenuHashMap;
    }

    public void setViewmenu(Map<String, List<View_FrontMenu>> viewmenu) {
        this.viewmenu = viewmenu;
    }

    public String getOccname() {
        return occname;
    }

    public void setOccname(String occname) {
        this.occname = occname;
    }

    public List<View_FrontMenu> getFrontMenus() {
        return frontMenus;
    }

    public void setFrontMenus(List<View_FrontMenu> frontMenus) {
        this.frontMenus = frontMenus;
    }

    public Map<String, List<View_FrontMenu>> getViewmenu() {
        return viewmenu;
    }
}
