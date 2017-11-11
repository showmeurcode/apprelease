package cn.apprelease.controller;

import cn.apprelease.pojo.AppCategory;
import cn.apprelease.service.app_category.AppCategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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


}
