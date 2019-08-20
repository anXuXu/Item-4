package inter;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import javabean.JsonMsg;

import java.util.Map;

public class LoginInter implements Interceptor {
    public JsonMsg jsonMsg;
    public LoginInter (){
        jsonMsg = new JsonMsg();
    }
    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        System.out.println("拦截器");
        Map<String , Object> map = actionInvocation.getInvocationContext().getSession();
        Object uname = map.get("user");
        String path;
        if (null == uname){
            path = jsonMsg.getLOGIN();
        }else {
            path = actionInvocation.invoke();
        }
        return path;
    }

    public JsonMsg getJsonMsg() {
        return jsonMsg;
    }

    public void setJsonMsg(JsonMsg jsonMsg) {
        this.jsonMsg = jsonMsg;
    }
}
