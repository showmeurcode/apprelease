package cn.apprelease.controller;

import cn.apprelease.pojo.AppCategory;
import cn.apprelease.pojo.AppInfo;
import cn.apprelease.pojo.AppVersion;
import cn.apprelease.pojo.DevUser;
import cn.apprelease.service.app_category.AppCategoryService;
import cn.apprelease.service.app_info.AppInfoService;
import cn.apprelease.service.version.AppVersionService;
import cn.apprelease.tools.DictionaryUtil;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
    @Resource
    AppCategoryService appCategoryService;
    @Resource
    AppVersionService appVersionService;
/*尹晓晨工作区*/

    @RequestMapping("/showAllApps")
    @ResponseBody
    public Object showAllApps(AppInfo appInfo){
        StringBuffer html=new StringBuffer("");
       /* html.append("开发者id是"+appInfo.getDevId());*/
        List <AppInfo> appInfoList =new ArrayList<>();
        try {
            appInfoList=appInfoService.findAppInfoByAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(appInfoList==null){
            appInfoList=new ArrayList<>();
        }
        AppCategory appCategory1=null;
        AppCategory appCategory2=null;
        AppCategory appCategory3=null;
        AppVersion appVersion=null;

        for (AppInfo info : appInfoList) {
            try {
                appCategory1=appCategoryService.findAppCategoryByid(info.getCategoryLevel1());
                appCategory2=appCategoryService.findAppCategoryByid(info.getCategoryLevel2());
                appCategory3=appCategoryService.findAppCategoryByid(info.getCategoryLevel3());
                appVersion =appVersionService.findAppVersionByid(info.getVersionId());
                //拼接html
                html.append("<tr>" +
                        "                <td>"+info.getSoftwareName()+"</td>" +
                        "                <td>" +
                        "                  <a>"+info.getAPKName()+"</a>" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+((appVersion==null)?"":appVersion.getVersionSize())+"" +
                        "                </td>" +
                        "                <td class=\"project_progress\">" +
                        "                  "+ DictionaryUtil.showPlatformName(info.getFlatformId())+"" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+appCategory1.getCategoryName()+"》"+appCategory2.getCategoryName()+"》"+appCategory3.getCategoryName()+"" +
                        "                </td>" +
                        "                <td>" +
                        "                  <button type=\"button\" class='btn btn-success btn-xs'>"+DictionaryUtil.showStatusName(info.getStatus()) +"</button>" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+info.getDownloads()+"" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+((appVersion==null)?"":appVersion.getVersionInfo())+"" +
                        "                </td>");


                //开始拼接按钮
                html.append("<td>" +
                        "                  <div class='btn-group'>" +
                        "                    <button type='button' class='btn btn-info dropdown-toggle' data-toggle='dropdown'>" +
                        "                      点击操作" +
                        "                      <span class='caret'></span>" +
                        "                    </button>" +
                        "                    <ul class='dropdown-menu' role='menu'>"+
                        "<li><a href='###' id='"+info.getId()+"' class='addAppVersion'>新增版本</a> </li>"+
                        "<li><a href='###' id='"+info.getId()+"' class='changeAppVersion'>修改版本</a> </li>"+
                        "<li><a href='###' id='"+info.getId()+"' class='changeApp'>修改</a> </li>"+
                        "<li><a href='###' id='"+info.getId()+"' class='deleteApp'>删除</a> </li>"+
                        "<li><a href='###' id='"+info.getId()+"' class='viewApp'>查看</a> </li>"
                );
                if (info.getStatus()==5||info.getStatus()==2){
                    html.append("<li><a href='###' id='"+info.getId()+"' class='putonApp'>上架</a> </li>");
                }
                if (info.getStatus()==4){
                    html.append("<li><a href='###' id='"+info.getId()+"' class='putoffApp'>下架</a> </li>");
                }
                html.append("</ul>" +
                        "                  </div>" +
                        "                </td>" +
                        "              </tr>");



            } catch (Exception e) {
                e.printStackTrace();
            }


        }

        return  html.toString();
    }

//===================================================================李高珊工作区==============================================================\\



    @RequestMapping("/putonandoff")
    @ResponseBody
    public  Object putOnAndOff(AppInfo appInfo,@RequestParam("className")String className ){//app上下架
        String JSON="";
        List<AppInfo> appInfos=new ArrayList<>();
        AppInfo nowAppInfo=null;
        try {
            nowAppInfo = appInfoService.findAppInfoByAppInfo(appInfo).get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(className.equals("putonApp")){//说明当前状态为审核通过或者已下架，等待上架
            nowAppInfo.setStatus(4);
            JSON="{\"className\":\"putoffApp\",\"option\":\"下架\",\"statusName\":\"已上架\"}";
        }else{//说明当前状态为已上架，等待下架

            nowAppInfo.setStatus(5);
            JSON="{\"className\":\"putonApp\",\"option\":\"上架\",\"statusName\":\"已下架\"}";
        }

        try {
            appInfoService.updateAppInfo(nowAppInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return JSON;
    }



    @RequestMapping(value = "/changeApp")
    public String changeApp(Model model, String id){

        AppInfo appInfo = new AppInfo();
        appInfo.setId(Integer.valueOf(id));
        List<AppInfo> list = new ArrayList<AppInfo>();

        try {
            list = appInfoService.findAppInfoByAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (list !=null && list.size() != 0) {
            appInfo = list.get(0);
        } else {
            appInfo = null;
        }


        List<AppCategory> appCategory1List=null;
        List<AppCategory> appCategory2List=null;
        List<AppCategory> appCategory3List=null;

        try {
            //所有一级分类
            appCategory1List=appCategoryService.findAppCategorysBylevel(1);
            //所有二级分类
            appCategory2List=appCategoryService.findAppCategorysByParentId(appInfo.getCategoryLevel1());
            //所有三级分类
            appCategory3List=appCategoryService.findAppCategorysByParentId(appInfo.getCategoryLevel2());

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("appInfo",appInfo);
        model.addAttribute("appCategory1List",appCategory1List);
        model.addAttribute("appCategory2List",appCategory2List);
        model.addAttribute("appCategory3List",appCategory3List);

        return "developer/appchange";

    }


    @RequestMapping(value = "/updateApp")
    //@ResponseBody
    public Object updateApp(HttpSession session,HttpServletRequest request,
                            @RequestParam(value = "s_logoLocPath",required = false) MultipartFile attach){
            System.out.print("up仿 >>>>>>>>>>>>>>>>法规回复的更多========>");
        AppInfo appInfo = new AppInfo();
        String logoPicPath = appInfo.getLogoPicPath();
        if (!attach.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadfiles");
            System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>uploadFile path========>"+path);

            String oldFileName = attach.getOriginalFilename();//原文件名
            System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>uploadFile oldFileName========>"+oldFileName);

            String prefix = FilenameUtils.getExtension(oldFileName);//原文件名后缀
            System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>uploadFile prefix========>"+prefix);

            int filesize = 50000;
            System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>uploadFile size========>"+attach.getSize());

            if (attach.getSize() > filesize) { //上传大小不得超过50KB
                request.setAttribute("uploadFileError","* 上传大小不得超过50KB");
                return "{\"status\":\"over\"}";
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")) {
                String fileName = System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Personal.jpg";
                System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>new fileName========>"+attach.getName());

                File targetFile = new File(path,fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存
                try {
                    attach.transferTo(targetFile);
                } catch (IOException e) {
                    e.printStackTrace();
                    request.setAttribute("uploadFileError","* 上传失败！");
                    return "{\"status\":\"errorfile\"}";
                }
                logoPicPath = path+File.separator+fileName;
            } else {
                request.setAttribute("uploadFileError","* 上传图片格式不正确");
                return "{\"status\":\"format\"}";
            }
        }

        System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>进入方法，路径正确");
        appInfo.setModifyBy(((DevUser)session.getAttribute("devUserSession")).getId());
        appInfo.setModifyDate(new Date());
        appInfo.setLogoPicPath(logoPicPath);
        int result = 0;
        try {
            result = appInfoService.updateAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>更新完成，影响行数："+result);
        if(result > 0){
            return "{\"status\":\"success\"}";
        }
        return "{\"status\":\"error\"}";

    }

    @RequestMapping(value = "/viewApp")
    public String viewApp(Model model, String id){

        AppInfo appInfo = new AppInfo();
        appInfo.setId(Integer.valueOf(id));
        List<AppInfo> list = new ArrayList<AppInfo>();

        try {
            list = appInfoService.findAppInfoByAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (list !=null && list.size() != 0) {
            appInfo = list.get(0);
        } else {
            appInfo = null;
        }

        AppCategory appCategory1 = null;
        AppCategory appCategory2 = null;
        AppCategory appCategory3 = null;

        try {
            appCategory1 = appCategoryService.findAppCategoryByid(appInfo.getCategoryLevel1());
            appCategory2 = appCategoryService.findAppCategoryByid(appInfo.getCategoryLevel2());
            appCategory3 = appCategoryService.findAppCategoryByid(appInfo.getCategoryLevel3());
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("appInfo",appInfo);
        model.addAttribute("appCategory1",appCategory1);
        model.addAttribute("appCategory2",appCategory2);
        model.addAttribute("appCategory3",appCategory3);

        return "developer/appdetail";

    }

    @RequestMapping(value = "/CommitAndSave")
    @ResponseBody
    public Object CommitAndSave(AppInfo appInfo,HttpSession session,HttpServletRequest request,
                                @RequestParam(value = "s_logoLocPath",required = false) MultipartFile attach){


        String unloadfile = appInfo.getLogoPicPath();
        if (!attach.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "uploadfiles");
            System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>uploadFile path========>" + path);

            String oldFileName = attach.getOriginalFilename();//原文件名
            System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>uploadFile oldFileName========>" + oldFileName);

            String prefix = FilenameUtils.getExtension(oldFileName);//原文件名后缀
            System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>uploadFile prefix========>" + prefix);

            int filesize = 50000;
            System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>uploadFile size========>" + attach.getSize());

            if (attach.getSize() > filesize) { //上传大小不得超过50KB
                request.setAttribute("uploadFileError", "* 上传大小不得超过50KB");
                return "{\"status\":\"over\"}";
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")) {
                String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_Personal.jpg";
                System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>new fileName========>" + attach.getName());

                File targetFile = new File(path, fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存
                try {
                    attach.transferTo(targetFile);
                } catch (IOException e) {
                    e.printStackTrace();
                    request.setAttribute("uploadFileError", "* 上传失败！");
                    return "{\"status\":\"errorfile\"}";
                }
                unloadfile = path + File.separator + fileName;
            } else {
                request.setAttribute("uploadFileError", "* 上传图片格式不正确");
                return "{\"status\":\"format\"}";
            }
        }

        appInfo.setModifyBy(((DevUser)session.getAttribute("devUserSession")).getId());
        appInfo.setModifyDate(new Date());
        appInfo.setLogoPicPath(unloadfile);
        appInfo.setStatus(1);
        int result = 0;
        try {
            result = appInfoService.updateAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(result > 0){
            return "{\"status\":\"success\"}";
        }
        return "{\"status\":\"error\"}";

    }

//—————————————————————————————————————————————————张玮钰———————————————————————————————————————————————————————————————
    @RequestMapping(value = "/addApp")
    public String addApp(AppInfo appInfo,Model model){
        int add=0;
        try {
            add=appInfoService.addAppInfo(appInfo);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("add",add);

        return "developer/frame";


    }


    @RequestMapping("/add")
    public String add(Model model){
        List<AppCategory> appCategoryList1=null;


        try {
            appCategoryList1=appCategoryService.findAppCategorysBylevel(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("appCategoryList1",appCategoryList1);


        return "developer/appadd";
    }

    @RequestMapping("/apk")
    @ResponseBody
    public Object apkName(String APKName){
        String app="{\"status\":\"success\"}";
        try {
            List<AppInfo> list=appInfoService.findAppInfoByAppInfo(new AppInfo());
            for (AppInfo appinfo:list) {
                if(APKName.equals(appinfo.getAPKName())){
                    app="{\"status\":\"error\"}";
                    break;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return app;
    }

    @RequestMapping(value = "/updateadd",method = RequestMethod.POST)
    @ResponseBody
    public Object addInfoSave( HttpSession session,
                              HttpServletRequest request,
                              @RequestParam(value="logoPicPath",required = false) MultipartFile attach){
        String JOSN="";
        String logoPicPath=null;
        AppInfo appInfo=new AppInfo();
        System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

        appInfo.setCreatedBy(((DevUser)session.getAttribute("devUserSession")).getId());
        appInfo.setCreationDate(new Date());
        int rest = 0;
        try {
            rest = appInfoService.addAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(rest > 0){
            JOSN= "{\"status\":\"success\"}";
        }
        JOSN= "{\"status\":\"error\"}";



        //判断文件是否为空
        if(!attach.isEmpty()){
            //定义上传目标路径
            String path=request.getSession().getServletContext().getRealPath("statics"+ File.separator+"uploadfiles");
            String olFileName=attach.getOriginalFilename();
            String prefix= FilenameUtils.getExtension(olFileName);
            int filesize=50000;
            if(attach.getSize()>filesize){
                request.setAttribute("uploadFileError","上传大小不能超过50KB");
                return "developer/appadd";
            }else if(prefix.equalsIgnoreCase("jpg")
                    ||prefix.equalsIgnoreCase("jpeg")
                    ||prefix.equalsIgnoreCase("png")){
                //当前系统时间+随机数+"_Personal.jpg"
                String fileName=System.currentTimeMillis()
                        + RandomUtils.nextInt(1000000)+"_Personal.jpg";
                File targetFile=new File(path,fileName);
                if(!targetFile.exists()){
                    targetFile.mkdirs();
                }
                try {
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("uploadFileError","上传失败");
                    return "{\"status\":\"errorfile\"}";
                }
                logoPicPath=path+File.separator+fileName;
            }else {
                request.setAttribute("uploadFileError","上传文件格式不正确");
                return "{\"status\":\"format\"}";
            }
        }
        appInfo.setLogoPicPath(logoPicPath);
        int result=0;
        try {
            result=appInfoService.addAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(result>0){
            JOSN= "redirect:/developer/applist";
        }
        JOSN= "developer/appadd";
        return JOSN;
    }

    //APP删除
    @RequestMapping("/delApp")
    @ResponseBody
    public Object delApp(int id){
        int result=0;
        try {
            result=appInfoService.delAppInfo(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(result>0){
            return "{\"status\":\"success\"}";
        }else {
            return "{\"status\":\"error\"}";
        }
    }

//————————————————————————————————————————————————孔祥忠(后台APP信息展示)————————————————————————————————————————————————————————————————

    @RequestMapping("/showAllToexamineAPPS")
    @ResponseBody
    public String showAllToexamineAPPS(AppInfo appInfo){

        StringBuffer html=new StringBuffer("");
       /* html.append("开发者id是"+appInfo.getDevId());*/
        List <AppInfo> appInfoList =new ArrayList<>();
        try {
            appInfoList=appInfoService.findAppInfoByAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(appInfoList==null){
            appInfoList=new ArrayList<>();
        }
        AppCategory appCategoryOne=null;
        AppCategory appCategoryTwo=null;
        AppCategory appCategoryThree=null;
        AppVersion appVersion=null;

        for (AppInfo info : appInfoList) {
            try {
                appCategoryOne=appCategoryService.findAppCategoryByid(info.getCategoryLevel1());
                appCategoryTwo=appCategoryService.findAppCategoryByid(info.getCategoryLevel2());
                appCategoryThree=appCategoryService.findAppCategoryByid(info.getCategoryLevel3());
                appVersion =appVersionService.findAppVersionByid(info.getVersionId());
                //拼接html
                html.append("<tr>" +
                        "                <td>"+info.getSoftwareName()+"</td>" +
                        "                <td>" +
                        "                  <a>"+info.getAPKName()+"</a>" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+((appVersion==null)?"":appVersion.getVersionSize())+"" +
                        "                </td>" +
                        "                <td class=\"project_progress\">" +
                        "                  "+ DictionaryUtil.showPlatformName(info.getFlatformId())+"" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+appCategoryOne.getCategoryName()+"》"+appCategoryTwo.getCategoryName()+"》"+appCategoryThree.getCategoryName()+"" +
                        "                </td>" +
                        "                <td>" +
                        "                  <button type=\"button\" class='btn btn-success btn-xs'>"+DictionaryUtil.showStatusName(info.getStatus()) +"</button>" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+info.getDownloads()+"" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+((appVersion==null)?"":appVersion.getVersionInfo())+"" +
                        "                </td>");


                //开始拼接按钮
                html.append("<td>" +
                        "                  <div class='btn-group'>" +
                        "                    <button type='button' class='btn btn-info dropdown-toggle' data-toggle='dropdown'>" +
                        "                      审核" +
                        "                      <span class='caret'></span>" +
                        "                    </button>" +
                        "                    <ul class='dropdown-menu' role='menu'>"+
                        "<li><a href='###' id='"+info.getId()+"' class='ToexamineAPP'>查看并审核APP</a> </li>"

                );
                if (info.getStatus()==1){
                    html.append("<li><a href='###' id='"+info.getId()+"' class='putonApp'>待审核</a> </li>");
                }
                if (info.getStatus()==2){
                    html.append("<li><a href='###' id='"+info.getId()+"' class='putonApp'>审核通过</a> </li>");
                }

                html.append("</ul>" +
                        "                  </div>" +
                        "                </td>" +
                        "              </tr>");



            } catch (Exception e) {
                e.printStackTrace();
            }


        }

        return  html.toString();


    }
}
