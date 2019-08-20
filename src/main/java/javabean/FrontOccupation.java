package javabean;

public class FrontOccupation {

    private String occupation_Id;
    private String occupation_Name;

    public FrontOccupation() {

    }

    public FrontOccupation(String occupation_Id, String occupation_Name) {
        this.occupation_Id = occupation_Id;
        this.occupation_Name = occupation_Name;
    }

    public String getOccupation_Id() {
        return occupation_Id;
    }

    public void setOccupation_Id(String occupation_Id) {
        this.occupation_Id = occupation_Id;
    }

    public String getOccupation_Name() {
        return occupation_Name;
    }

    public void setOccupation_Name(String occupation_Name) {
        this.occupation_Name = occupation_Name;
    }
}
