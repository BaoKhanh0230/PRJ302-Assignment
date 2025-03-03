package DAL;

import Model.Employee;
import Model.LeaveForm;
import Model.User;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FormDAO extends DBContext<LeaveForm> {

    public void insert(String username, String role, String department, String fromDay, String toDay, String reason, String status, String processedBy) {
        Connection con = null;
        DBContext db = new DBContext();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date parsedFromDate = sdf.parse(fromDay);
            java.util.Date parsedToDate = sdf.parse(toDay);
            java.sql.Date fromDate = new java.sql.Date(parsedFromDate.getTime());
            java.sql.Date toDate = new java.sql.Date(parsedToDate.getTime());

            con = db.getConection();
            String sql = "INSERT INTO [Form2] (username, role, department, fromDay, toDay, reason, status, processedBy) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, role);
            stm.setString(3, department);
            stm.setDate(4, fromDate);
            stm.setDate(5, toDate);
            stm.setString(6, reason);
            stm.setString(7, status);
            stm.setString(8, processedBy);
            stm.executeUpdate();
            stm.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<LeaveForm> select(ArrayList<Employee> emps, User user) {
        ArrayList<LeaveForm> al = new ArrayList<>();
        Connection con = null;
        DBContext db = new DBContext();

        try {
            con = db.getConection();
            String sql = "SELECT username, role, department, fromDay, toDay, reason, status, processedBy FROM [Form2] WHERE username = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, user.getEmployee().getName());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String role = rs.getString(2);
                String department = rs.getString(3);
                Date fromDate = rs.getDate(4);
                Date toDate = rs.getDate(5);
                String reason = rs.getString(6);
                String status = rs.getString(7);
                String processedBy = rs.getString(8);
                LeaveForm lf = new LeaveForm(username, role, department, fromDate, toDate, reason, status, processedBy);
                al.add(lf);
            }
            for (Employee emp : emps) {
                sql = "SELECT username, role, department, fromDay, toDay, reason, status, processedBy FROM [Form2] WHERE username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, emp.getName());
                rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString(1);
                    String role = rs.getString(2);
                    String department = rs.getString(3);
                    Date fromDate = rs.getDate(4);
                    Date toDate = rs.getDate(5);
                    String reason = rs.getString(6);
                    String status = rs.getString(7);
                    String processedBy = rs.getString(8);
                    LeaveForm lf = new LeaveForm(username, role, department, fromDate, toDate, reason, status, processedBy);
                    al.add(lf);
                    //rs.close();
                    //stm.close();
                    //con.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, "Database error", ex);
        }
        return al;
    }

    public ArrayList<LeaveForm> selectApprove(ArrayList<Employee> emps, User user) {
        ArrayList<LeaveForm> al = new ArrayList<>();
        Connection con = null;
        DBContext db = new DBContext();

        try {
            con = db.getConection();
            for (Employee emp : emps) {
                String sql = "SELECT username, role, department, fromDay, toDay, reason, status, processedBy FROM [Form2] WHERE username = ? AND status = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, emp.getName());
                stm.setString(2, "In progress");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    String username = rs.getString(1);
                    String role = rs.getString(2);
                    String department = rs.getString(3);
                    Date fromDate = rs.getDate(4);
                    Date toDate = rs.getDate(5);
                    String reason = rs.getString(6);
                    String status = rs.getString(7);
                    String processedBy = rs.getString(8);
                    LeaveForm lf = new LeaveForm(username, role, department, fromDate, toDate, reason, status, processedBy);
                    al.add(lf);
                    //rs.close();
                    //stm.close();
                    //con.close();
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, "Database error", ex);
        }
        return al;
    }

    public void updateFormStatus(String username, String role, String department, String fromDate, String toDate, String status) {
        Connection con = null;
        DBContext db = new DBContext();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date parsedFromDate = sdf.parse(fromDate);
            java.util.Date parsedToDate = sdf.parse(toDate);
            java.sql.Date fromDay = new java.sql.Date(parsedFromDate.getTime());
            java.sql.Date toDay = new java.sql.Date(parsedToDate.getTime());

            con = db.getConection();
            String sql = "UPDATE [Form2] SET status = ? WHERE username = ? AND role = ? AND department = ? AND fromDay = ? AND toDay = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, username);
            stm.setString(3, role);
            stm.setString(4, department);
            stm.setDate(5, fromDay);
            stm.setDate(6, toDay);
            stm.executeUpdate();
            stm.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
