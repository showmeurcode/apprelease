package cn.apprelease.controller;

import cn.apprelease.pojo.AppCategory;
import cn.apprelease.service.app_category.AppCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yinxiaochen
 * 2017/11/11 12:31
 */

@Controller
@RequestMapping("/appCategory")
public class AppCategoryController {
    @Resource
    AppCategoryService appCategoryService;


    @RequestMapping("/showlevelmethod1")
    @ResponseBody
    public List<AppCategory> showAllCategoryLevel1method1(){//显示所有的一级分类
        List<AppCategory> appCategory1List=null;
        try {
            appCategory1List = appCategoryService.findAppCategorysBylevel(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  appCategory1List;
    }

    @RequestMapping("/showlevelmethod2")
    public String showAllCategoryLevel1method2(Model model){//显示所有的一级分类
        List<AppCategory> appCategory1List=null;
        try {
            appCategory1List = appCategoryService.findAppCategorysBylevel(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("appCategory1List",appCategory1List);

        return  "developer/applist";
    }


    @RequestMapping("/showsonlevel.json")
    @ResponseBody
    public List<AppCategory> showSonLevel(@RequestParam("parentId")String parentId){//显示子分类
        List<AppCategory> sonappCategoryList=null;
        try {
            sonappCategoryList = appCategoryService.findAppCategorysByParentId(Integer.parseInt(parentId));
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(sonappCategoryList==null){
            sonappCategoryList=new ArrayList<>();//防止为nul导致转化json不成功
        }
        return  sonappCategoryList;
    }

//    ===================================================李高珊============================================================================

    @RequestMapping("/getlevelByparent")
    @ResponseBody
    public Object getCategoryListToHTML(@RequestParam("parentId")String parentId){

        List<AppCategory> sonappCategoryList= showSonLevel(parentId);

        StringBuffer html = new StringBuffer("");
        for (AppCategory appCategory:sonappCategoryList) {
            html.append(" <option value='"+appCategory.getId()+"'>"+appCategory.getCategoryName()+"</option> ");
        }
        return  html.toString();
    }

    @RequestMapping("/showlevelmethod2backend")
    public String showAllCategoryLevel1method2backend(Model model){//后台显示所有的一级分类
        List<AppCategory> appCategory1List=null;
        try {
            appCategory1List = appCategoryService.findAppCategorysBylevel(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("appCategory1List",appCategory1List);

        return  "backend/backendapplist";
    }

}
