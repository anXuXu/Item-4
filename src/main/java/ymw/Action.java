package ymw;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
    //定义两个静态字符串常量（逻辑视图名）
    public static final String SUCCESS="success";
    //前端登录
    public static final String LOGIN="frontlogin";

    public static final String ERROR="error";

    public static final String HOME = "home";

    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
