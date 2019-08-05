package com.zzu.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {

    @RequestMapping("/loginView.do")
    public String loginView(){

        return "login/login";
    }
}
