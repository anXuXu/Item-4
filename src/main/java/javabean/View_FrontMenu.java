package javabean;

public class View_FrontMenu {

    private String menu_Id;
    private String menu_Name;

    public View_FrontMenu() {
    }

    public View_FrontMenu(String menu_Id, String menu_Name) {
        this.menu_Id = menu_Id;
        this.menu_Name = menu_Name;
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
}
