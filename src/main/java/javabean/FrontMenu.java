package javabean;

public class FrontMenu {

    private String menu_Id;
    private String menu_Name;
    private String menu_Pid;
    private String menu_Url;

    public FrontMenu() {
    }

    public FrontMenu(String menu_Id, String menu_Name, String menu_Pid, String menu_Url) {
        this.menu_Id = menu_Id;
        this.menu_Name = menu_Name;
        this.menu_Pid = menu_Pid;
        this.menu_Url = menu_Url;
    }

    public String getMenu_Id() {
        return menu_Id;
    }

    public void setMenu_Id(String menu_Id) {
        this.menu_Id = menu_Id;
    }

    public String getMenu_Name() {
        return menu_Name;
    }

    public void setMenu_Name(String menu_Name) {
        this.menu_Name = menu_Name;
    }

    public String getMenu_Pid() {
        return menu_Pid;
    }

    public void setMenu_Pid(String menu_Pid) {
        this.menu_Pid = menu_Pid;
    }

    public String getMenu_Url() {
        return menu_Url;
    }

    public void setMenu_Url(String menu_Url) {
        this.menu_Url = menu_Url;
    }
}
