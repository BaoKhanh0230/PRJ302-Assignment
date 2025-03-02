package Model;

import java.util.ArrayList;


public class Employee {
    private int id;
    private String name;
    private Employee manager;
    private Department dept;
    private ArrayList<Employee> staffs = new ArrayList<>();
    private ArrayList<Employee> directStaffs = new ArrayList<>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Employee getManager() {
        return manager;
    }

    public void setManager(Employee manager) {
        this.manager = manager;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public ArrayList<Employee> getStaffs() {
        return staffs;
    }

    public void setStaffs(ArrayList<Employee> staffs) {
        this.staffs = staffs;
    }

    public ArrayList<Employee> getDirectStaffs() {
        return directStaffs;
    }

    public void setDirectStaffs(ArrayList<Employee> directStaffs) {
        this.directStaffs = directStaffs;
    }
}
