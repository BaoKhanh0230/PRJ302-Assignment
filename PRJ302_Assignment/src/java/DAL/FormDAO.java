package DAL;

import Model.LeaveForm;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FormDAO extends DBContext<LeaveForm> {
    public void insert(String username, String role, String department, Date fromDay, Date toDay, String reason) {
        Connection con = null;
        DBContext db = new DBContext();
        
        java.sql.Date fromDate = null;
        fromDate = new java.sql.Date(fromDay.getTime());
        
        java.sql.Date toDate = null;
        toDate = new java.sql.Date(toDay.getTime());

        try {
            con = db.getConection();
            String sql = "INSERT INTO Form (username, role, department, fromDay, toDay, reason) VALUES (?,?,?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, role);
            stm.setString(3, department);
            stm.setDate(4, fromDate);
            stm.setDate(5, toDate);
            stm.setString(6, reason);
            stm.executeQuery();
            stm.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(FormDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
