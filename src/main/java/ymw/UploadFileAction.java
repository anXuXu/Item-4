package ymw;

import javabean.JsonMsg;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class UploadFileAction {
    public File[] myfile;
    public JsonMsg jsonMsg;
    public List<String> myfileFileName;   //命名取法是  前页面上form中文件命名)+FileName
    public HashMap<String,Object> map = new HashMap<>();
    public UploadFileAction (){
        jsonMsg = new JsonMsg();
    }
    public String upload() {
        System.out.println(myfile);
        String root = ServletActionContext.getRequest().getRealPath("/upload");
        System.out.println(root);
        for (int i = 0; i < myfile.length; i++) {
            File file = myfile[i];
            System.out.println("---"+file.getName());
            File destf = new File(root+"\\"+myfileFileName.get(i));
            saveFile(file,destf);

        }
        map.put("sss","上传成功");

        return jsonMsg.getLOGIN();
    }

    public File[] getMyfile() {
        return myfile;
    }

    public void setMyfile(File[] myfile) {
        this.myfile = myfile;
    }






    public void saveFile(File srcFile, File destFile) {


        try {
            InputStream is = new FileInputStream(srcFile); // 构建输入流

            String root = ServletActionContext.getRequest().getRealPath(
                    "/upload"); // 设置文件上传的路径


            OutputStream os = new FileOutputStream(destFile); // 构建输出流

            byte[] buffer = new byte[400]; // 以下为读写文件操作

            int length = 0;

            while ((length = is.read(buffer)) > 0) {
                os.write(buffer, 0, length);
                os.flush();
            }
            is.close();
            os.close();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    public List<String> getMyfileFileName() {
        return myfileFileName;
    }

    public void setMyfileFileName(List<String> myfileFileName) {
        this.myfileFileName = myfileFileName;
    }
}
