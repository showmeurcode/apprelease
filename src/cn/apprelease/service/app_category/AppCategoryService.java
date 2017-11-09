package cn.apprelease.service.app_category;

import cn.apprelease.pojo.AppCategory;

import java.util.List;

/**
 * @author ligaoshan
 * 2017/11/8 14:21
 */
public interface AppCategoryService {


    /**
     * 添加分类
     * @param appCategory
     * @return
     */
    int addAppCategory(AppCategory appCategory);

    /**
     * 删除分类
     * @param id
     * @return
     */
    int delAppCategory(Integer id);

    /**
     * 修改分类
     * @param appCategory
     * @return
     */
    int updateAppCategory(AppCategory appCategory);

    /**
     * 根据分类信息查找分类
     * @param appCategory
     * @return
     */
    List<AppCategory> findAppcategoryByAppCategoryInfo(AppCategory appCategory);



}
