package com.zzu.vo;

/**
 * @author 王文重
 */
public class Employee {

    private String id;
    private String name;
    private String mobile;
    private String address;
    private String permission;

    public Employee(String id, String name, String mobile, String address, String permission) {
        this.id = id;
        this.name = name;
        this.mobile = mobile;
        this.address = address;
        this.permission = permission;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }
}
