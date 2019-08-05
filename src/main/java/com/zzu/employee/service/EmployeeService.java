package com.zzu.employee.service;

import com.zzu.employee.dao.IEmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 *
 * @author 王文重
 */

@Service
public class EmployeeService implements IEmployeeService {

    @Autowired
    IEmployeeDao employeeDao;

    @Override
    public Object[] paging(int pageNo) {
        int pageSize = 7;
        int position = (pageNo-1)*pageSize;
        Object [] datas = new Object[2];
        int count = employeeDao.getCount();
        datas[0]=count%pageSize==0?count/pageSize:count/pageSize+1;
        datas[1]=employeeDao.paging(position,pageSize);
        return datas;
    }

    @Override
    public boolean employeeDelete(String id) {
        System.out.println(id);
        return employeeDao.employeeDelete(id);
    }
}
