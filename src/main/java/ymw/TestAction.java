package ymw;

import com.opensymphony.xwork2.ActionContext;
import javabean.*;
import org.springframework.stereotype.Controller;
import testt.UserDao;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;
@Controller
public class TestAction{
    /**
     * 登录名字
     */
    private String name ;
    /**
     * 登录密码
     */
    private String pwd ;
    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getName() {
        return name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }


    private FrontUser frontUser;
    public JsonMsg jsonMsg;
    public Map<String,Object> session;
    public HashMap<String,Object> map = new HashMap<>();
    public HashMap<String, List> listHashMap = new HashMap<>();
    public HashMap<String,Object> educationMap = new HashMap<>();
    public HashMap<String,Object> occuoationMap = new HashMap<>();
    public List<FrontEducation> frontEducations = new ArrayList<>();
    public List<FrontOccupation> frontOccupations = new ArrayList<>();
    private String code;
    private String user;
    private String yzm;
    private String loginusername;
    private String loginpwd;
    private String loginyzm;
    @Resource
    private UserDao userDaoss;
    private FrontUsers frontUsers;

    public TestAction() {
        /**
         * 实例化USER
         */
//        frontUser = new FrontUser();
        /**
         * 实例化参数类
         */
        jsonMsg = new JsonMsg();
        /**
         * 实例化接口实现类
         */
        userDaoss = new UserDao();
    }

    //登录验证
    public String execute()throws Exception{

//		String name = request.getParameter("name");
//		String pwd = request.getParameter("pwd");
//		ServletActionContext.getRequest().getSession().setAttribute();
        System.out.println("========================="+loginusername);
        session = ActionContext.getContext().getSession();
        code = (String) session.get("image");
        FrontUser frontUsers = new FrontUser();
        frontUsers =  userDaoss.select(loginusername);
        Map<String,FrontOccupation> frontOccupationMap = userDaoss.selectOccupaAndUser(frontUsers.getOccupation_Id());
        //用户输入的值是否和数据库中的数据相等
        System.out.println(loginyzm);
        System.out.println(code);
        System.out.println((frontOccupationMap.get("occ")).getOccupation_Name());
        if (loginyzm.equals(code)){
            if ((loginusername).equals(frontUsers.getUserName())){
                if ((loginpwd).equals(frontUsers.getUserPwd())){
                    System.out.println("登录成功");
                    session.put("user",loginusername);
                    session.put("occ",(frontOccupationMap.get("occ")).getOccupation_Name());
                    session.put("occid",(frontOccupationMap.get("occ")).getOccupation_Id());
                    user = loginusername;
                    map.put("ver","登录成功");
                }else{
                    map.put("ver","密码错误");
                }
            }else{
                map.put("ver","用户名已存在");
            }
        }else{
            map.put("ver","验证码错误");
        }
        return jsonMsg.getVERIFIC();
    }

    /**
     * 注册方法
     * @return 是否成功
     * @throws Exception
     */
    public String reg()throws Exception {
        System.out.println("================="+frontUsers.getUserName());
        userDaoss.insert(frontUsers);
            return jsonMsg.getLOGIN();
//        }

    }
    //是否可以登录
    public String TestLogin()throws Exception{
        System.out.println(userName);
        FrontUser frontUsers = new FrontUser();
        frontUsers = userDaoss.selectVerifica(userName);
        if(frontUsers==null){
            System.out.println("账号不存在");
            map.put("sss","账号不存在");
        }
        else{
            System.out.println("可以登录");
            map.put("sss","可以登录");
        }

        return jsonMsg.getTEST();
    }
    //下拉框使用新方法传输数据
    public String dropdownBox()throws Exception{
        frontEducations = userDaoss.selectEduca();
        frontOccupations = userDaoss.selectOccupa();
        listHashMap.put("education", frontEducations);
        listHashMap.put("occupation", frontOccupations);
        return jsonMsg.getDOWNBOX();
    }



    public FrontUser getFrontUser() {
        return frontUser;
    }

    public void setFrontUser(FrontUser frontUser) {
        this.frontUser = frontUser;
    }


    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    public HashMap<String, Object> getMap() {
        return map;
    }

    public void setMap(HashMap<String, Object> map) {
        this.map = map;
    }

    public JsonMsg getJsonMsg() {
        return jsonMsg;
    }

    public void setJsonMsg(JsonMsg jsonMsg) {
        this.jsonMsg = jsonMsg;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getYzm() {
        return yzm;
    }

    public void setYzm(String yzm) {
        this.yzm = yzm;
    }

    public String getLoginusername() {
        return loginusername;
    }

    public void setLoginusername(String loginusername) {
        this.loginusername = loginusername;
    }

    public String getLoginpwd() {
        return loginpwd;
    }

    public void setLoginpwd(String loginpwd) {
        this.loginpwd = loginpwd;
    }

    public String getLoginyzm() {
        return loginyzm;
    }

    public void setLoginyzm(String loginyzm) {
        this.loginyzm = loginyzm;
    }

    public HashMap<String, Object> getEducationMap() {
        return educationMap;
    }

    public void setEducationMap(HashMap<String, Object> educationMap) {
        this.educationMap = educationMap;
    }

    public HashMap<String, Object> getOccuoationMap() {
        return occuoationMap;
    }

    public void setOccuoationMap(HashMap<String, Object> occuoationMap) {
        this.occuoationMap = occuoationMap;
    }

    public UserDao getUserDaoss() {
        return userDaoss;
    }

    public void setUserDaoss(UserDao userDaoss) {
        this.userDaoss = userDaoss;
    }

    public FrontUsers getFrontUsers() {
        return frontUsers;
    }

    public void setFrontUsers(FrontUsers frontUsers) {
        this.frontUsers = frontUsers;
    }

    public HashMap<String, List> getListHashMap() {
        return listHashMap;
    }

    public void setListHashMap(HashMap<String, List> listHashMap) {
        this.listHashMap = listHashMap;
    }

    public List<FrontEducation> getFrontEducations() {
        return frontEducations;
    }

    public void setFrontEducations(List<FrontEducation> frontEducations) {
        this.frontEducations = frontEducations;
    }

    public List<FrontOccupation> getFrontOccupations() {
        return frontOccupations;
    }

    public void setFrontOccupations(List<FrontOccupation> frontOccupations) {
        this.frontOccupations = frontOccupations;
    }
}
