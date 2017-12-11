package cn.apprelease.controller;

import cn.apprelease.pojo.AppInfo;
import cn.apprelease.pojo.AppVersion;
import cn.apprelease.service.app_info.AppInfoService;
import cn.apprelease.service.version.AppVersionService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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

    @RequestMapping("/addAppVersionsave")
    @ResponseBody
    public  Object addAppVersionsave(AppVersion appVersion , @RequestParam(value = "attach", required = false)MultipartFile attach
            ,HttpServletRequest  request){
        String apkLocPath = null;
        String path = request.getSession().getServletContext().getRealPath("statics/uploadfiles");

        String fileName="";
        if (!attach.isEmpty()) {
            fileName = attach.getOriginalFilename();//获得原文件名
            System.out.println("初始文件名字是"+fileName);
            String prefix = FilenameUtils.getExtension(fileName);//获得原文件名后缀
            int fileSize = 5000000;//设置文件大小限制
            if (attach.getSize() > fileSize) {
                return "{\"errorInfo\":\"上传大小不得超过5m\"}";

            } else if (prefix.equalsIgnoreCase("apk") ) {
                System.out.println("第二初始文件名字是"+fileName);
                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();//递归创建路径
                }
                //保存
                try {
                    attach.transferTo(targetFile);
                } catch (IOException e) {
                    e.printStackTrace();

                }

                //按下标设置路径名

                apkLocPath  = path + "/" + fileName;


            } else {
                return "{\"errorInfo\":\"apk格式不正确\"}";

            }


        }else {
            return "{\"errorInfo\":\"上传失败,您尚未选择文件或文件字节为0\"}";

        }
        //赋值
        System.out.println("文件名字是" + fileName);
        appVersion.setApkFileName(fileName);
        appVersion.setApkLocPath(apkLocPath);
        int result = 0;
        try {
            result = appVersionService.addVersion(appVersion);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (result > 0) {

            return "{\"errorInfo\":\"上传成功\"}";
        }
        return "{\"errorInfo\":\"上传失败\"}";
    }

    //—————————————————————————————————————————李高珊———————————————————————————————————————————————————



    //—————————————————————————————————————————张伟玉———————————————————————————————————————————————————


    //—————————————————————————————————————————孔祥忠———————————————————————————————————————————————————

    @RequestMapping("/ToexamineAPPVersion")//查看并审核APP

    public String ToexamineAPPVersion(String appId,Model model){

        AppInfo appinfo =null;
        AppVersion latestAppVersion=null;


        try {
            appinfo=appInfoService.findAppinfoByid(Integer.parseInt(appId));//根据appId找到APP信息
            latestAppVersion=appVersionService.findAppVersionByid(appinfo.getVersionId());

        } catch (Exception e) {
            e.printStackTrace();

        }
        model.addAttribute("appInfo", appinfo);
        model.addAttribute("latestAppVersion", latestAppVersion);

        return "backend/toexamineapp";

    }





}
