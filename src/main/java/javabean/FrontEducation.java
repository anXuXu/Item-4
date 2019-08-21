package javabean;

import java.util.ArrayList;
import java.util.List;

public class FrontEducation {

    private String education_Id;
    private String education_Name;
    private List<FrontUser> frontUserList = new ArrayList<FrontUser>();
    public FrontEducation() {

    }

    public FrontEducation(String education_Id, String education_Name, List<FrontUser> frontUserList) {
        this.education_Id = education_Id;
        this.education_Name = education_Name;
        this.frontUserList = frontUserList;
    }

    public String getEducation_Id() {
        return education_Id;
    }

    public void setEducation_Id(String education_Id) {
        this.education_Id = education_Id;
    }

    public String getEducation_Name() {
        return education_Name;
    }

    public void setEducation_Name(String education_Name) {
        this.education_Name = education_Name;
    }

    public List<FrontUser> getFrontUserList() {
        return frontUserList;
    }

    public void setFrontUserList(List<FrontUser> frontUserList) {
        this.frontUserList = frontUserList;
    }
}
