package DAL;

import Model.Employee;
import Model.LeaveForm;
import Model.User;
import java.util.ArrayList;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FormDAO extends DBContext<LeaveForm> {

    /*public void insert(String username, String role, String department, String fromDay, String toDay, String reason, String status, String processedBy) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            java.util.Date parsedFromDate = sdf.parse(fromDay);
            java.util.Date parsedToDate = sdf.parse(toDay);
            java.sql.Date fromDate = new java.sql.Date(parsedFromDate.getTime());
            java.sql.Date toDate = new java.sql.Date(parsedToDate.getTime());

            String sql = "INSERT INTO [Form2] (username, role, department, fromDay, toDay, reason, status, processedBy) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
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
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }*/
    public ArrayList<LeaveForm> select(ArrayList<Employee> emps, User user) {
        ArrayList<LeaveForm> al = new ArrayList<>();

        try {
            String sql = "SELECT [id], [from]\n"
                    + "      ,[to]\n"
                    + "      ,[reason]\n"
                    + "      ,[status]\n"
                    + "      ,[createdBy]\n"
                    + "      ,[createdDate]\n"
                    + "      ,[processedBy]\n"
                    + "  FROM [LeaveForm] WHERE createdBy = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getEmployee().getName());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                LeaveForm lf = new LeaveForm();
                lf.setId(rs.getInt("id"));
                lf.setFrom(rs.getDate("from"));
                lf.setTo(rs.getDate("to"));
                lf.setReason(rs.getString("reason"));
                lf.setStatus(rs.getString("status"));
                lf.setCreatedBy(rs.getString("createdBy"));
                lf.setProcessedBy(rs.getString("processedBy"));
                lf.setCreatedDate(rs.getTimestamp("createdDate"));
                al.add(lf);
            }
            for (Employee emp : emps) {
                sql = "SELECT [id], [from]\n"
                        + "      ,[to]\n"
                        + "      ,[reason]\n"
                        + "      ,[status]\n"
                        + "      ,[createdBy]\n"
                        + "      ,[createdDate]\n"
                        + "      ,[processedBy]\n"
                        + "  FROM [LeaveForm] WHERE createdBy = ?";
                stm = connection.prepareStatement(sql);
                stm.setString(1, emp.getName());
                rs = stm.executeQuery();
                while (rs.next()) {
                    LeaveForm lf = new LeaveForm();
                    lf.setId(rs.getInt("id"));
                    lf.setFrom(rs.getDate("from"));
                    lf.setTo(rs.getDate("to"));
                    lf.setReason(rs.getString("reason"));
                    lf.setStatus(rs.getString("status"));
                    lf.setCreatedBy(rs.getString("createdBy"));
                    lf.setProcessedBy(rs.getString("processedBy"));
                    lf.setCreatedDate(rs.getTimestamp("createdDate"));
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

        try {
            for (Employee emp : emps) {
                String sql = "SELECT [id], [from]\n"
                        + "      ,[to]\n"
                        + "      ,[reason]\n"
                        + "      ,[status]\n"
                        + "      ,[createdBy]\n"
                        + "      ,[createdDate]\n"
                        + "      ,[processedBy]\n"
                        + "  FROM [LeaveForm] WHERE createdBy = ? AND status = ?";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, emp.getName());
                stm.setString(2, "In progress");
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    LeaveForm lf = new LeaveForm();
                    lf.setId(rs.getInt("id"));
                    lf.setFrom(rs.getDate("from"));
                    lf.setTo(rs.getDate("to"));
                    lf.setReason(rs.getString("reason"));
                    lf.setStatus(rs.getString("status"));
                    lf.setCreatedBy(rs.getString("createdBy"));
                    lf.setProcessedBy(rs.getString("processedBy"));
                    lf.setCreatedDate(rs.getTimestamp("createdDate"));
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

    public void updateFormStatus(Date from, Date to, String reason, String createdBy, String status, String processedBy) {
        try {
            String sql = "UPDATE [LeaveForm]\n"
                    + "   SET [status] = ?, [processedBy] = ?\n"
                    + " WHERE [from] = ? AND [to] = ? AND [reason] = ? AND createdBy = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, status);
            stm.setString(2, processedBy);
            stm.setDate(3, from);
            stm.setDate(4, to);
            stm.setString(5, reason);
            stm.setString(6, createdBy);
            stm.executeUpdate();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public ArrayList<LeaveForm> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(LeaveForm model) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [LeaveForm]\n"
                    + "           ([from]\n"
                    + "           ,[to]\n"
                    + "           ,[reason]\n"
                    + "           ,[status]\n"
                    + "           ,[createdBy]\n"
                    + "           ,[createdDate]\n"
                    + "           ,[processedBy])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE()\n"
                    + "           ,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, model.getFrom());
            stm.setDate(2, model.getTo());
            stm.setString(3, model.getReason());
            stm.setString(4, model.getStatus());
            stm.setString(5, model.getCreatedBy());
            stm.setString(6, model.getProcessedBy());
            stm.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(LeaveForm model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void approve(LeaveForm model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public LeaveForm get(ArrayList<Employee> emps, User user) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
