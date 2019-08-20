package javabean;

public class FrontUsers {
    private String userName;
    private String userPwd;
    private String userEmall;
    private String education_Id;
    private String occupation_Id;
    private String sex;
    private FrontOccupation frontOccupation;
    private FrontEducation frontEducation;
    public FrontUsers() {
    }

    public FrontUsers(String userName, String userPwd, String userEmall, String education_Id, String occupation_Id, String sex, FrontOccupation frontOccupation, FrontEducation frontEducation) {
        this.userName = userName;
        this.userPwd = userPwd;
        this.userEmall = userEmall;
        this.education_Id = education_Id;
        this.occupation_Id = occupation_Id;
        this.sex = sex;
        this.frontOccupation = frontOccupation;
        this.frontEducation = frontEducation;
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

    public FrontOccupation getFrontOccupation() {
        return frontOccupation;
    }

    public void setFrontOccupation(FrontOccupation frontOccupation) {
        this.frontOccupation = frontOccupation;
    }

    public FrontEducation getFrontEducation() {
        return frontEducation;
    }

    public void setFrontEducation(FrontEducation frontEducation) {
        this.frontEducation = frontEducation;
    }
}
