package ltweb.models;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class User implements Serializable {
    private int id;
    private String email;
    private String username;
    private String fullname;
    private String password;
    private String avatar;
    private int roleid;
    private String phone;
    private Date createddate;

    public User() {}

    public User(String email, String userName, String fullName, String passWord,
                String avatar, int roleid, String phone, Date createdDate) {
        this.email = email;
        this.username = userName;
        this.fullname = fullName;
        this.password = passWord;
        this.avatar = avatar;
        this.roleid = roleid;
        this.phone = phone;
        this.createddate = createdDate;
    }

    // getters/setters...
}
