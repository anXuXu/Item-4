package ymw;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ActionServlet")
public class ActionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    ActionMappingManager man = null;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path=getPath(request);

        // 获取ActionMapping对象
        ActionMapping actionMapping = man.getActionMapping(path);



        // 获取action接口反射机制
        Action action = ActionManager.getActionClass(actionMapping.getClassname());

        try {
            String message = action.execute(request, response);


            String results = actionMapping.getResults(message);

            response.sendRedirect(results);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    /*
     * 获取请求的路径名
     */
    public String getPath(HttpServletRequest request) {
        // 项目+请求地址
        String requestURI = request.getRequestURI();
        // 项目名称
        String contextPath = request.getContextPath();
        // 具体请求
        String path = requestURI.substring(contextPath.length());
        //请求的action名
        String filename = path.substring(1, path.lastIndexOf("."));
//testAction
        return filename;
    }

    /*
     * 重写init,程序运行加载所有类
     */
    @Override
    public void init(ServletConfig config) throws ServletException {

        // config对象是javax.servlet.ServletConfig的对象，功能是获得初始化配置信息
        // config.getInitParameter是取得指定名称的初始化参数内容
        String filename = config.getInitParameter("config");
        String[] filenames = null;
        if (filename == null) {
            // 如果为空 ,
            filenames = new String[] { "framework.xml" };
        } else {
            // 若果有其他的配置参数信息，那么以，分隔存入数组中
            filenames = filename.split(",");
        }
        // 使用init方法进行初始化
        man = new ActionMappingManager(filenames);
    }

}
