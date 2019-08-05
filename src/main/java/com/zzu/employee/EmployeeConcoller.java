package com.zzu.employee;

import com.zzu.employee.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 *
 *
 * @author 王文重
 */

@Controller
@RequestMapping("/employee")
public class EmployeeConcoller {

    @Autowired
    private IEmployeeService employeeService;

    public void getModle(int pageNo, Map<String ,Object> map){
        map.put("pageTotal",employeeService.paging(pageNo)[0]);
        map.put("employees",employeeService.paging(pageNo)[1]);
    }

    @RequestMapping("/employeeView.do")
    public String commodityView(Map<String ,Object> map){
        getModle(1,map);
        return "employee/employeeView";
    }

    @RequestMapping("employeeViewFrag.do")
    public String commodityViewFrag(int pageNo,Map<String ,Object> map){
        getModle(pageNo, map);
        return "employee/employeeViewFrag";
    }

    @ResponseBody
    @RequestMapping("/employeeDelete.do")
    public boolean employeeDelete(String id){
        return employeeService.employeeDelete(id);
    }

}
