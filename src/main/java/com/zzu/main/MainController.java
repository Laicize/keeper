package com.zzu.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping("mainView.do")
    public String mainView(){

        return "main";
    }
}
