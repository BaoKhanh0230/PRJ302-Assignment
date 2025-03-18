package DAL;

import Model.Employee;
import Model.LeaveForm;
import Model.User;
import java.util.ArrayList;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FormDAO extends DBContext<LeaveForm> {

    public ArrayList<LeaveForm> getApprovedLeaves(LocalDate startDate, LocalDate endDate) {
        ArrayList<LeaveForm> al = new ArrayList<>();
        String sql = "SELECT * FROM [LeaveForm] WHERE status = ? "
                + "AND ([from] BETWEEN ? AND ? OR [to] BETWEEN ? AND ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, "Approved");
            pstmt.setDate(2, Date.valueOf(startDate)); // Convert LocalDate to java.sql.Date
            pstmt.setDate(3, Date.valueOf(endDate));
            pstmt.setDate(4, Date.valueOf(startDate));
            pstmt.setDate(5, Date.valueOf(endDate));

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                LeaveForm leave = new LeaveForm();
                leave.setId(rs.getInt("id"));
                leave.setCreatedBy(rs.getString("createdBy"));
                // Convert java.sql.Date to LocalDate
                leave.setFrom(rs.getDate("from"));
                leave.setTo(rs.getDate("to"));
                leave.setStatus(rs.getString("status"));
                al.add(leave);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return al;
    }

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

    public ArrayList<LeaveForm> selectUpdateableForms(ArrayList<Employee> emps, User user) {
        ArrayList<LeaveForm> al = new ArrayList<>();

        try {
            String sql = "SELECT [id], [from]\n"
                    + "      ,[to]\n"
                    + "      ,[reason]\n"
                    + "      ,[status]\n"
                    + "      ,[createdBy]\n"
                    + "      ,[createdDate]\n"
                    + "  FROM [LeaveForm] WHERE createdBy = ? AND [status] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getEmployee().getName());
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
                lf.setCreatedDate(rs.getTimestamp("createdDate"));
                al.add(lf);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, "Database error", ex);
        }
        return al;
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

    public LeaveForm getFormById(int id) {
        String sql = "SELECT [id], [from]\n"
                    + "      ,[to]\n"
                    + "      ,[reason]\n"
                    + "  FROM [LeaveForm] WHERE [id] = ?";
        LeaveForm lf = new LeaveForm();

        try (
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                lf.setId(rs.getInt("id"));
                lf.setFrom(rs.getDate("from"));
                lf.setTo(rs.getDate("to"));
                lf.setReason(rs.getString("reason"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lf;
    }

    public void updateForm(int id, Date from, Date to, String reason) {
        String sql = "UPDATE [LeaveForm]\n"
                    + "   SET [from] = ?, [to] = ?, [reason] = ?\n"
                    + " WHERE [id] = ?";

        try (
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

            
            pstmt.setDate(1, from);
            pstmt.setDate(2, to);
            pstmt.setString(3, reason);
            pstmt.setInt(4, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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
