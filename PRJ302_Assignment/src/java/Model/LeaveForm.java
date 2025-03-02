package Model;

import java.util.Date;


public class LeaveForm {
    private String user;
    private String role;
    private String department;
    private Date fromDay;
    private Date toDay;
    private String reason;
    private String status;
    private String processedBy;

    public LeaveForm(String user, String role, String department, Date fromDay, Date toDay, String reason, String status, String processedBy) {
        this.user = user;
        this.role = role;
        this.department = department;
        this.fromDay = fromDay;
        this.toDay = toDay;
        this.reason = reason;
        this.status = status;
        this.processedBy = processedBy;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProcessedBy() {
        return processedBy;
    }

    public void setProcessedBy(String processedBy) {
        this.processedBy = processedBy;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

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
