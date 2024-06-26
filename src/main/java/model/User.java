package model;

import jakarta.persistence.*;

@Entity
@Table(name = "users")  // Optional: specify the table name if different
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    @Column(name = "id")
    protected int id;

    @Column(name = "name")
    private String name;

    @Column(name = "password")
    private String psw;

    @Column(name = "email")
    private String email;

    @Column(name = "mobile")
    private String mobile;
    @Column(name = "role")
    private int role; // Change the data type to int

    public User() {}

    public User(String name, String email, String psw, String mobile, int role) { // Update constructor
        this.name = name;
        this.psw = psw;
        this.email = email;
        this.mobile = mobile;
        this.role = role;
    }

    public int getRole() { // Change the return type to int
        return role;
    }

    public void setRole(int role) { // Update the parameter type to int
        this.role = role;
    }

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
