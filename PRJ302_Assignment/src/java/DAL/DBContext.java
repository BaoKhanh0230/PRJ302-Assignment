package DAL;

import Model.Employee;
import Model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class DBContext<T> {
    protected Connection connection;

    public DBContext() {
        try {
            String user = "BaoKhanh";
            String pass = "123";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=IS1903_Student;encrypt=true;trustServerCertificate=true;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConection() {
        try {
            String user = "BaoKhanh";
            String pass = "12345";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=IS1903_Student;encrypt=true;trustServerCertificate=true;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public abstract ArrayList<T> list();
    public abstract T get(ArrayList<Employee> emps, User user);
    public abstract void insert(T model);
    public abstract void update(T model);
    public abstract void approve(T model);
}
