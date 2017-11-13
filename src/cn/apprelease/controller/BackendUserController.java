package cn.apprelease.controller;

import cn.apprelease.pojo.BackendUser;
import cn.apprelease.service.backenduser.BackendUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author kongxiangzhong
 * 2017/11/12 19:26
 */
@Controller
@RequestMapping("/backenduser")
public class BackendUserController {
    @Resource
    BackendUserService backendUserService = null;

    @RequestMapping(value="/Blogin")//登录
    public String Blogin(@ModelAttribute("devUser") BackendUser backendUser , HttpSession session, HttpServletRequest request){
        BackendUser backendUser1=null;
        try {
            backendUser1=backendUserService.userLogin(backendUser.getUserCode(),backendUser.getUserPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(backendUser1 != null){
            //放入session
            session.setAttribute("backendUserSession", backendUser1);


            return "backend/frame";
        }else{
            request.setAttribute("error","用户名或密码不正确！");
            return "backendlogin";
        }

    }


    @RequestMapping("/Bloginout")
    public String Bloginout(HttpServletRequest request){//登出
        //    注销用户，使session失效。
        request.getSession().removeAttribute("backendUserSession");

        return "backendlogin";
    }

//    @RequestMapping(value="/backendUser/main")//拦截器
//    public String main(){
//
//        return "backend/frame";
//    }


}
