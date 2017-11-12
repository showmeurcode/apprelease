package cn.apprelease.controller;

import cn.apprelease.pojo.AppInfo;
import cn.apprelease.service.app_info.AppInfoService;
import com.mysql.jdbc.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zwy
 * 2017/11/10 上午 8:06
 */
@Controller
@RequestMapping("/appInfo")
public class AppInfoController {
    @Resource
    AppInfoService appInfoService;

    @RequestMapping(value = "/appadd.html",method = RequestMethod.GET)
    public String addInfo(@ModelAttribute("appInfo")AppInfo appInfo){
        return "addapp";
    }

    @RequestMapping(value = "/appaddsave.html",method = RequestMethod.POST)
    public String addInfoSave(AppInfo appInfo, HttpSession session){
        appInfo.setCreatedBy(((AppInfo)session.getAttribute("devUserSession")).getId());

        if(appInfoService.addAppInfo(appInfo)>0){
            return "redirect://applist.html";
        }
        return "applist";
    }
}
