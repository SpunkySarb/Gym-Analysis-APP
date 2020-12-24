package fun.sarbzone.GymAnalysis.model;

import org.springframework.stereotype.Component;

@Component
public class DatasetModel {

    private int yAxis, Days;
    private String userName;

    public int getyAxis() {
        return yAxis;
    }

    public void setyAxis(int yAxis) {
        this.yAxis = yAxis;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getDays() {
        return Days;
    }

    public void setDays(int days) {
        Days = days;
    }

  

}
