package cn.apprelease.controller;

import cn.apprelease.pojo.DevUser;
import cn.apprelease.service.devuser.DevUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author kongxiangzhong
 * 2017/11/9 16:45
 */
@Controller
@RequestMapping("/devuser")
public class DevUserController {
    @Resource
    DevUserService devUserService;

    @RequestMapping("/login")
    public String login(@ModelAttribute("devUser") DevUser devUser , HttpSession session){
        DevUser devUser1=null;
        try {
            devUser1=devUserService.userLogin(devUser.getDevCode(),devUser.getDevPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(devUser1 != null){
            //放入session
            session.setAttribute("devUserSession", devUser1);
            return "developer/frame";
        }else{

            return "developerlogin";
        }



    }

}
