package cn.apprelease.controller;

import cn.apprelease.pojo.AppCategory;
import cn.apprelease.pojo.AppInfo;
import cn.apprelease.pojo.AppVersion;
import cn.apprelease.service.app_category.AppCategoryService;
import cn.apprelease.service.app_info.AppInfoService;
import cn.apprelease.service.version.AppVersionService;
import cn.apprelease.tools.DictionaryUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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








}
