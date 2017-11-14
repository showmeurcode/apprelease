package cn.apprelease.controller;

import cn.apprelease.pojo.AppVersion;
import cn.apprelease.service.version.AppVersionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author yinxiaochen
 * 2017/11/13 17:25
 */
@Controller
@RequestMapping("/appVersion")
public class AppVersionController {
    @Resource
    private  AppVersionService appVersionService;

    @RequestMapping("/addAppVersion")
    public  String addAppVersion(@RequestParam("appId")String appId ,Model model){
        List<AppVersion> appVersionList=null;
        try {
            appVersionList = appVersionService.findAppVersionsByappId(Integer.parseInt(appId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("appVersionList", appVersionList);


        return "developer/versionadd";
    }


}
