package Model;

import java.util.Date;


public class LeaveForm {
    private String user;
    private String role;
    private Date fromDay;
    private Date toDay;
    private String reason;

    public String getUser() {
        return user;
    }

    public String getRole() {
        return role;
    }

    public Date getFromDay() {
        return fromDay;
    }

    public Date getToDay() {
        return toDay;
    }

    public String getReason() {
        return reason;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setFromDay(Date fromDay) {
        this.fromDay = fromDay;
    }

    public void setToDay(Date toDay) {
        this.toDay = toDay;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
