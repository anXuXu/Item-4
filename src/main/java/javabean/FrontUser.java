package javabean;

/**
 * 前端账号登录
 * @author Administrator
 */
public class FrontUser {

    private String userName;
    private String userPwd;
    private String userEmall;
    private String education_Id;
    private String education_Name;
    private String occupation_Id;
    private String occupation_Name;
    private String sex;
    public FrontUser() {

    }

    public FrontUser(String userName, String userPwd, String userEmall, String education_Id, String education_Name, String occupation_Id, String occupation_Name, String sex) {
        this.userName = userName;
        this.userPwd = userPwd;
        this.userEmall = userEmall;
        this.education_Id = education_Id;
        this.education_Name = education_Name;
        this.occupation_Id = occupation_Id;
        this.occupation_Name = occupation_Name;
        this.sex = sex;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserEmall() {
        return userEmall;
    }

    public void setUserEmall(String userEmall) {
        this.userEmall = userEmall;
    }

    public String getEducation_Id() {
        return education_Id;
    }

    public void setEducation_Id(String education_Id) {
        this.education_Id = education_Id;
    }

    public String getOccupation_Id() {
        return occupation_Id;
    }

    public void setOccupation_Id(String occupation_Id) {
        this.occupation_Id = occupation_Id;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getEducation_Name() {
        return education_Name;
    }

    public void setEducation_Name(String education_Name) {
        this.education_Name = education_Name;
    }

    public String getOccupation_Name() {
        return occupation_Name;
    }

    public void setOccupation_Name(String occupation_Name) {
        this.occupation_Name = occupation_Name;
    }
}
