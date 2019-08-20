package testt.springmvc;

import com.opensymphony.xwork2.ActionContext;
import javabean.*;
import org.apache.struts2.ServletActionContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import testt.UserDao;
import testt.model.User;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller //此注释的含义是将该类设置成为浏览器提交的上来的类
@RequestMapping("/admin")
public class AdminHandler {


    public JsonMsg jsonMsg;
    public HashMap<String,Object> map = new HashMap<>();
    public HashMap<String, List> listHashMap = new HashMap<>();
    public HashMap<String,Object> educationMap = new HashMap<>();
    public HashMap<String,Object> occuoationMap = new HashMap<>();
    private Map<String, List<FrontMenu>> frontMenuHashMap = new HashMap<>();
    public List<FrontEducation> frontEducations = new ArrayList<>();
    public List<FrontOccupation> frontOccupations = new ArrayList<>();
    private List<FrontUser> list = new ArrayList<FrontUser>();
    private List<View_FrontMenu> frontMenus = new ArrayList<View_FrontMenu>();
    private Map<String, List<View_FrontMenu>> viewmenu = new HashMap<>();
    @Resource
    private UserDao userDaoss;
    public AdminHandler (){
        jsonMsg = new JsonMsg();
    }
    //localhost:8080/webproj12_springmvc/admin/hello.action
    @RequestMapping("/hello.action")
    public ModelAndView hello(){
        System.out.println("hello方法被调用了...");
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/hello.jsp");
        return mav;
    }

    //localhost:8080/webproj12_springmvc/index.jsp
    @RequestMapping(value="/userinfo.action")
    public ModelAndView userinfo(HttpServletRequest request,
                                 @RequestParam(value="username", required=true, defaultValue="empty")String name,
                                 String password){
        System.out.println(name + ":" + password);
        System.out.println("userinfo方法被调用了...");
        HttpSession session = request.getSession();
        session.setAttribute("user", new User(name, password));
        ModelAndView mav = new ModelAndView();
        mav.setViewName("userinfo");
        return mav;
    }

    //localhost:8080/webproj12_springmvc/index.jsp
    @RequestMapping(value="/userinfo2.action")
    public String userinfo2(HttpServletRequest request,
                            User user){
        System.out.println(user);
        System.out.println("userinfo2方法被调用了...");
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        return "userinfo"; //可通过String类型返回信息
    }

    //localhost:8080/webproj12_springmvc/index.jsp
    @RequestMapping(value="/userinfo3.action", method= RequestMethod.POST, produces="application/json;charset=utf-8")
    public @ResponseBody
    User userinfo3(String username, String password){
        System.out.println(username + ":" + password);
        System.out.println("userinfo3方法被调用了...");
        return new User(username, password);
    }

    //localhost:8080/webproj12_springmvc/index.jsp
    @RequestMapping(value="/userinfo4.action", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    public @ResponseBody User userinfo4(@RequestBody User user){
        System.out.println(user);
        System.out.println("userinfo4方法被调用了...");
        return user;
    }

    //localhost:8080/webproj12_springmvc/index.jsp
    @RequestMapping(value="/fileact.action", method=RequestMethod.POST)
    public ModelAndView fileact(MultipartFile fileact){
        String filename = fileact.getOriginalFilename();
        System.out.println("获取到的文件名:" + filename);
        try {
            fileact.transferTo(new File("D:/" + filename));
        } catch (IllegalStateException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        ModelAndView mav = new ModelAndView();
        mav.setViewName("userinfo");
        return mav;
    }

    /**
     * 注册
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/reg.action")
    public ModelAndView reg(FrontUsers frontUsers)throws Exception {
        System.out.println("================="+frontUsers.getUserName());
        userDaoss.insert(frontUsers);
        ModelAndView mav = new ModelAndView();
        mav.setViewName(jsonMsg.getLOGIN());
        return mav;
    }
    /**
     * 注册下拉框中的值
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/regDropdownBox.action", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    public @ResponseBody HashMap<String, List> dropdownBox()throws Exception{
        frontEducations = userDaoss.selectEduca();
        frontOccupations = userDaoss.selectOccupa();
        listHashMap.put("education", frontEducations);
        listHashMap.put("occupation", frontOccupations);
        return listHashMap;
    }

    /**
     * 账号是否可以登录
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/userTest.action", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    public @ResponseBody Map<String, Object> testLogin(String userName)throws Exception{
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

        return map;
    }


    /**
     * 登录
     * @param request
     * @param loginusername
     * @param loginyzm
     * @param code
     * @param loginpwd
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/userexecute.action", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    public @ResponseBody Map<String, Object> execute(HttpServletRequest request, String loginusername, String loginyzm,
                                       String code, String loginpwd)throws Exception{
        String user;
        System.out.println("========================="+loginusername);
        HttpSession session = request.getSession();
        code = (String) session.getAttribute("authCode");
        FrontUser frontUsers = new FrontUser();
        frontUsers =  userDaoss.select(loginusername);
        Map<String, FrontOccupation> frontOccupationMap = userDaoss.selectOccupaAndUser(frontUsers.getOccupation_Id());
        //用户输入的值是否和数据库中的数据相等
        System.out.println(loginyzm);
        loginyzm = loginyzm.toLowerCase();//转小写
        System.out.println(code);
        System.out.println((frontOccupationMap.get("occ")).getOccupation_Name());
        if (loginyzm.equals(code)){
            if ((loginusername).equals(frontUsers.getUserName())){
                if ((loginpwd).equals(frontUsers.getUserPwd())){
                    System.out.println("登录成功");
                    session.setAttribute("user",loginusername);
                    session.setAttribute("occ",(frontOccupationMap.get("occ")).getOccupation_Name());
                    session.setAttribute("occid",(frontOccupationMap.get("occ")).getOccupation_Id());
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
        return map;
    }

    /**
     * 菜单
     */
    @RequestMapping(value="/userMenu.action")
    public ModelAndView userMenu(HttpSession session){
        List<FrontMenu> fro = new ArrayList<>();
        System.out.println((String) session.getAttribute("occid"));
        String occid  = (String) session.getAttribute("occid");
        frontMenuHashMap = userDaoss.selectMenu(occid);
        ModelAndView mav = new ModelAndView();
        mav.addObject("frontMenuHashMap",frontMenuHashMap);//默认为类名的首字母小写
        mav.setViewName(jsonMsg.getHOME());
        return mav;
    }
    /**
     * 获取用户管理数据
     * @return
     */
    @RequestMapping(value="/userData.action")
    public ModelAndView userData() throws Exception{
        list = userDaoss.selectUserInfo();
        ModelAndView mav = new ModelAndView();
        mav.addObject("list",list);//默认为类名的首字母小写
        mav.setViewName(jsonMsg.getUSERDATA());
        return mav;
    }

    /**
     * 多文件上传
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/fileuPload.action")
    public ModelAndView fileuPload() throws Exception{
        ModelAndView mav = new ModelAndView();
        mav.setViewName(jsonMsg.getVERIFIC());
        return mav;
    }

    /**
     * 权限管理下拉框
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/roleDropdownBox.action")
    public ModelAndView roleDropdownBox()throws Exception{
        frontEducations = userDaoss.selectEduca();
        frontOccupations = userDaoss.selectOccupa();
        listHashMap.put("education", frontEducations);
        listHashMap.put("occupation", frontOccupations);
        ModelAndView mav = new ModelAndView();
        mav.addObject("listHashMap",listHashMap);//默认为类名的首字母小写
        mav.setViewName(jsonMsg.getDOWNBOX());
        return mav;
    }

    /**
     * 获取权限管理分配和未分配的值
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/occRloe.action", method=RequestMethod.POST, produces="application/json;charset=utf-8")
    public @ResponseBody Map<String, List<View_FrontMenu>> occRloe(String occname)throws Exception{
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
        return viewmenu;
    }

    /**
     * 文档管理
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/fronthome.action")
    public ModelAndView fronthome() throws Exception{
        ModelAndView mav = new ModelAndView();
        mav.setViewName(jsonMsg.getTEST());
        return mav;
    }

    /**
     * 文件上传
     * @param files
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/upload.action",method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public @ResponseBody boolean uploadFiles(@RequestParam("myfile") MultipartFile[] files, HttpServletRequest request) throws IOException {
        System.out.println("啊我要进来了");
        boolean result = false;
        String realPath;
        String root = request.getSession().getServletContext().getRealPath("/upload");
        for(int i=0;i<files.length;i++){
            if (!files[i].isEmpty()) {
                String uniqueName=files[i].getOriginalFilename();//得到文件名
                realPath=root+"\\"+ File.separator+uniqueName;//文件上传的路径这里为E盘
                files[i].transferTo(new File(realPath));  // 转存文件
                result = true;
                System.out.println(result+uniqueName);
            }
        }

        return result;
    }
    public UserDao getUserDaoss() {
        return userDaoss;
    }

    public void setUserDaoss(UserDao userDaoss) {
        this.userDaoss = userDaoss;
    }

    public HashMap<String, Object> getMap() {
        return map;
    }

    public void setMap(HashMap<String, Object> map) {
        this.map = map;
    }

    public Map<String, List<FrontMenu>> getFrontMenuHashMap() {
        return frontMenuHashMap;
    }

    public void setFrontMenuHashMap(Map<String, List<FrontMenu>> frontMenuHashMap) {
        this.frontMenuHashMap = frontMenuHashMap;
    }
}
