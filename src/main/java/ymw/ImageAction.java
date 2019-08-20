package ymw;

import com.opensymphony.xwork2.ActionContext;
import javabean.ImageUtil;
import javabean.JsonMsg;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import java.awt.image.BufferedImage;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
@Controller
public class ImageAction {

    public JsonMsg jsonMsg;
    private InputStream imageStream;
    private Map<String, BufferedImage> map = new HashMap<String, BufferedImage>();
    public ImageAction (){
        /**
         * 实例化参数类
         */
        jsonMsg = new JsonMsg();
        /**
         * 实例化接口实现类
         */
    }

    public String verificAtion() throws Exception{
        map = ImageUtil.createImage();
        String code = map.keySet().iterator().next();
        BufferedImage image = map.get(code);
        imageStream = ImageUtil.getInputStream(image);
//        ServletActionContext.getRequest().getSession().setAttribute();
        Map<String, Object> mapIMG = ActionContext.getContext().getSession();
//        for (BufferedImage  img : map.values()) {
//            System.out.println("img = " + img);
//        }
        mapIMG.put("image",code);
        return jsonMsg.getLOGIN();
    }

    public JsonMsg getJsonMsg() {
        return jsonMsg;
    }

    public void setJsonMsg(JsonMsg jsonMsg) {
        this.jsonMsg = jsonMsg;
    }

    public Map<String, BufferedImage> getMap() {
        return map;
    }

    public void setMap(Map<String, BufferedImage> map) {
        this.map = map;
    }

    public InputStream getImageStream() {
        return imageStream;
    }

    public void setImageStream(InputStream imageStream) {
        this.imageStream = imageStream;
    }
}
