package cn.apprelease.controller;

import cn.apprelease.pojo.AppCategory;
import cn.apprelease.pojo.AppInfo;
import cn.apprelease.pojo.AppVersion;
import cn.apprelease.pojo.DevUser;
import cn.apprelease.service.app_category.AppCategoryService;
import cn.apprelease.service.app_info.AppInfoService;
import cn.apprelease.service.version.AppVersionService;
import cn.apprelease.tools.DictionaryUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
            appCategory2List=appCategoryService.findAppCategorysBylevel(2);
            //所有三级分类
            appCategory3List=appCategoryService.findAppCategorysBylevel(3);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("appInfo",appInfo);
        model.addAttribute("appCategory1List",appCategory1List);
        model.addAttribute("appCategory2List",appCategory2List);
        model.addAttribute("appCategory3List",appCategory3List);

        return "developer/appchange";

    }


    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public Object updateAppInfo(AppInfo appInfo, HttpSession session){
        appInfo.setModifyBy(((DevUser)session.getAttribute("devUserSession")).getId());
        appInfo.setModifyDate(new Date());
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
        List<AppCategory> appCategoryList2=null;
        List<AppCategory> appCategoryList3=null;

        try {
            appCategoryList1=appCategoryService.findAppCategorysBylevel(1);
            appCategoryList2=appCategoryService.findAppCategorysBylevel(2);
            appCategoryList3=appCategoryService.findAppCategorysBylevel(3);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("appCategoryList1",appCategoryList1);
        model.addAttribute("appCategoryList2",appCategoryList2);
        model.addAttribute("appCategoryList3",appCategoryList3);

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

//————————————————————————————————————————————————孔祥忠————————————————————————————————————————————————————————————————

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
}
