package ymw;

import com.opensymphony.xwork2.ActionSupport;
import javabean.JsonMsg;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import util.DownloadUtil;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
@Controller
public class DownloadAction extends ActionSupport {

    private String downPath;        // 下载时的文件名
    private String contentType;     // 保存文件类型
    private String filename;        // 保存时的文件名
    private InputStream inputString;
    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getDownPath() {
        return downPath;
    }

//    public InputStream getInputStream() {
//        return inputStream;
//    }
//
//    public void setInputStream(InputStream inputStream) {
//        this.inputStream = inputStream;
//    }

    public void setDownPath(String downPath) {
        try {
            // 解决下载时候的中文文件乱码问题
//            downPath = new String(downPath.getBytes("ISO8859-1"),"UTF-8");
            downPath= URLDecoder.decode(downPath,"UTF-8");
        }catch (UnsupportedEncodingException e){
            e.printStackTrace();
        }
        this.downPath = downPath;
    }

    /*
     *下载用的Action返回一个InputString实例，该方法对应Action配置
     *里面的result的inputName参数，值为inputString
     *
     */

    public InputStream getInputString() throws UnsupportedEncodingException {
//        inputStream = ServletActionContext.getServletContext().getResourceAsStream(downPath);
//        return inputStream;
        return ServletActionContext.getServletContext().getResourceAsStream(downPath);
    }

    public void setInputString(InputStream inputString) {
        this.inputString = inputString;
    }

    @Override
    public String execute(){
        // 下载保存时的文件名和被下载的文件名一样
        filename = downPath;
        System.out.println("========"+filename);
        System.out.println("==========="+downPath);
        // 下载的文件路径，请在webapps目录下创建upload
        downPath = "upload/" + downPath;
        System.out.println("==========="+downPath);
        // 保存文件的类型

        contentType = "application/x-msdownload";

        /*
         *对下载的文件名按照UTF-8进行编码，解决下载窗口中的中文乱码问题
         * 其中,MyUtil是自己定义的一个类
         */

        filename = DownloadUtil.toUTF8String(filename);
        return SUCCESS;
    }
}
