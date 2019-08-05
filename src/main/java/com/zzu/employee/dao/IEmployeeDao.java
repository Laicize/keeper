package com.zzu.employee.dao;

import com.zzu.vo.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IEmployeeDao {

    /**
     *
     *
     *
     *@author 王文重
     */
    int getCount();

    /**
     *
     *
     *
     *@author 王文重
     */
    List<Employee> paging(@Param("position") int position, @Param("pageSize") int pageSize);

    boolean employeeDelete(String id);
}
