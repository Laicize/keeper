package com.zzu.employee.service;

public interface IEmployeeService {

    Object[] paging(int pageNo);

    boolean employeeDelete (String id);
}
