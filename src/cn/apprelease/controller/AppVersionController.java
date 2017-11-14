package cn.apprelease.controller;

import cn.apprelease.pojo.AppInfo;
import cn.apprelease.pojo.AppVersion;
import cn.apprelease.service.app_info.AppInfoService;
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
    @Resource
    private AppInfoService appInfoService;


    //—————————————————————————————————————————尹晓晨———————————————————————————————————————————————————
    @RequestMapping("/addAppVersion")
    public  String addAppVersion(@RequestParam("appId")String appId ,Model model){
        AppInfo appinfo =null;
        List<AppVersion> appVersionList=null;
        try {
            appinfo=appInfoService.findAppinfoByid(Integer.parseInt(appId));
            appVersionList = appVersionService.findAppVersionsByappId(Integer.parseInt(appId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("appInfo", appinfo);
        model.addAttribute("appVersionList", appVersionList);
        System.out.println("列表是不是空"+(appVersionList==null));


        return "developer/versionadd";
    }

    //—————————————————————————————————————————李高珊———————————————————————————————————————————————————



    //—————————————————————————————————————————张伟玉———————————————————————————————————————————————————


    //—————————————————————————————————————————孔祥忠———————————————————————————————————————————————————



}
