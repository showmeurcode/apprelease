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
                        "                  "+((appCategory1==null)?"":appCategory1.getCategoryName())+"》"+((appCategory2==null)?"":appCategory2.getCategoryName())+"》"+((appCategory3==null)?"":appCategory3.getCategoryName())+"" +
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
    @ResponseBody
    public Object updateApp(AppInfo appInfo, HttpSession session,HttpServletRequest request,
                            @RequestParam("isSubmit") String isSubmit,
                            @RequestParam(value = "s_logoLocPath",required = false) MultipartFile attach){

        String logoPicPath = appInfo.getLogoPicPath();
        if (!attach.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("statics"+File.separator+"uploadfiles");

            String oldFileName = attach.getOriginalFilename();//原文件名
            String prefix = FilenameUtils.getExtension(oldFileName);//原文件名后缀
            int filesize = 50000;
            if (attach.getSize() > filesize) { //上传大小不得超过50KB
                return "{\"status\":\"上传大小不得超过50KB\"}";
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")) {
                String fileName = System.currentTimeMillis()+RandomUtils.nextInt(1000000)+"_Personal.jpg";
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
                    return "{\"status\":\"上传失败！\"}";
                }
                logoPicPath = path+File.separator+fileName;
            } else {
                request.setAttribute("uploadFileError","* 上传图片格式不正确");
                return "{\"status\":\"上传图片格式不正确！\"}";
            }
        }
        if(isSubmit.equals("yes")){//检测是否提交审核
            appInfo.setStatus(1);
        }
        appInfo.setModifyBy(((DevUser)session.getAttribute("devUserSession")).getId());
        appInfo.setModifyDate(new Date());
        appInfo.setLogoPicPath(logoPicPath);
        int result = 0;
        try {
            result = appInfoService.updateAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(result > 0){
            return "{\"status\":\"success\"}";
        }
        return "{\"status\":\"未知错误！\"}";

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



//—————————————————————————————————————————————————张玮钰———————————————————————————————————————————————————————————————
    /*张伟玉你在搞什么，注释也不写，命名随心情乱起，方法乱写，后面的人还怎么维护*/
    /*@RequestMapping(value = "/addApp")
    public String addApp(AppInfo appInfo,Model model){
        int add=0;
        try {
            add=appInfoService.addAppInfo(appInfo);

        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("add",add);

        return "developer/frame";


    }*/


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

    @RequestMapping(value = "/addsave")
    @ResponseBody
    public Object addInfoSave(AppInfo appInfo, HttpSession session,
                              HttpServletRequest request,
                              @RequestParam(value="logoPicPath1",required = false) MultipartFile attach){
       // String JOSN="";

        String logoPicPath=null;
        String path=request.getSession().getServletContext().getRealPath("statics/uploadfiles");
        String olFileName="";
        //System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");


        //判断文件是否为空
        if(!attach.isEmpty()){
            //定义上传目标路径

            olFileName=attach.getOriginalFilename();//获取原文件名
            String prefix= FilenameUtils.getExtension(olFileName);//获取原文件后缀名
            int filesize=500000;//设置文件大小限制 50KB
            if(attach.getSize()>filesize){
                //request.setAttribute("uploadFileError","上传大小不能超过50KB");
                return  "{\"status\":\"上传大小不能超过500KB\"}";
            }else if(prefix.equalsIgnoreCase("jpg")
                    ||prefix.equalsIgnoreCase("jpeg")
                    ||prefix.equalsIgnoreCase("png")){
                //当前系统时间+随机数+"_Personal.jpg"
                String fileName=System.currentTimeMillis()
                        + RandomUtils.nextInt(1000000)+"_Personal.jpg";
                File targetFile=new File(path,fileName);
                if(!targetFile.exists()){
                    targetFile.mkdirs();//递归创建路径
                }
                //保存
                try {
                    attach.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
//                    request.setAttribute("uploadFileError","上传失败");
//                    JOSN= "{\"status\":\"errorfile\"}";
                }
                //按下标设置路径名
                logoPicPath=path+"/"+fileName;
            }else {
//                request.setAttribute("uploadFileError","上传文件格式不正确");
                return "{\"status\":\"上传文件格式不正确\"}";
            }
        }else {
            return "{\"status\":\"未选中文件，上传失败\"}";
        }


        //赋值
        appInfo.setDevId(((DevUser)session.getAttribute("devUserSession")).getId());
        appInfo.setCreationDate(new Date());
        appInfo.setLogoPicPath(logoPicPath);
        int rest = 0;
        try {
            rest = appInfoService.addAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(rest > 0){
            return "{\"status\":\"添加成功\"}";
        }
        return "{\"status\":\"添加失败\"}";


    }

    //APP删除
    @RequestMapping("/delApp")
    @ResponseBody
    public Object delApp(int id){
        int result=0;
        int result1=0;
        try {
            result=appInfoService.delAppInfo(id);
            result1=appVersionService.deleteVersionByappId(id);
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
                        "                  "+((appCategoryOne==null)?"":appCategoryOne.getCategoryName())+"》"+((appCategoryTwo==null)?"":appCategoryTwo.getCategoryName())+"》"+((appCategoryThree==null)?"":appCategoryThree.getCategoryName())+"" +
                        "                </td>" +
                        "                <td>" +
                        "                  <button type=\"button\" class='btn btn-success btn-xs'>"+DictionaryUtil.showStatusName(info.getStatus()) +"</button>" +
                        "                </td>" +
                        "                <td>" +
                        "                  "+info.getDownloads()+"" +
                        "                </td>" +
                        "                <td >" +
                        "                  "+((appVersion==null)?"":appVersion.getVersionNo())+"" +
                        "                </td>");


                //开始拼接按钮
                html.append("<td class='xxx'>" +
                        "                  <div class='btn-group'>" +
                        "                    <button type='button' class='btn btn-info dropdown-toggle' appinfoid='${appInfo.id }' status='${appInfo.status }'" +
                        "                        data-toggle='dropdown'>" +
                        "                      审核" +
                        "                      <span class='caret'></span>" +
                        "                    </button>" +
                        "                    <ul class='dropdown-menu' role='menu'>"+
                        "<li><a href='###' id='"+info.getId()+"' class='ToexamineAPP'>查看并审核APP</a> </li>"

                );



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

    @RequestMapping("/tojudge")//审核
    @ResponseBody
    public String checkSave(@RequestParam("appId") String appId,@RequestParam("tojudge") String tojudge){
        AppInfo  appInfo=null;
        int  result=0;
        try {

            appInfo = appInfoService.findAppinfoByid(Integer.parseInt(appId));

            if(tojudge.equals("yes")){
                appInfo.setStatus(2);//审核通过
            }else {
                appInfo.setStatus(3);//审核不通过
            }
            result= appInfoService.updateAppInfo(appInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(result>0) {
            return "审核操作成功！";
        }
        return "审核失败！";
    }
}
