package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloController {    
      
    @GetMapping("/official")
    public String official() {
        return "official";
    }
    
    @GetMapping("/login")
    public String login() {
        return "login";
    }
    
    @GetMapping("/index")
    public String index() {
        return "index";
    }
    
    @GetMapping("/fanclub")
    public String fc() {
        return "fanclub";
    }
//
//    @GetMapping("/official/news")
//    public String Onews() {
//        return "/news";
//    }
//    
//    @GetMapping("/official/info")
//    public String Oinfo() {
//        return "/info";
//    }
//    
//    @GetMapping("/official/match")
//    public String Omatch() {
//        return "/match";
//    }
//    
//    @GetMapping("/official/goods")
//    public String Ogoods() {
//        return "/goods";
//    }
//    
//    @GetMapping("/official/conteact")
//    public String Onew() {
//        return "/contact";
//    }

    
    @GetMapping("/schedule")
    public String manager() {
        return "schedule";
    }


    
}
