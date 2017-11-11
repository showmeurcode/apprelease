package cn.apprelease.service.app_category;

import cn.apprelease.pojo.AppCategory;
import org.apache.ibatis.annotations.Param;

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
    int addAppCategory(AppCategory appCategory)throws  Exception;

    /**
     * 删除分类
     * @param id
     * @return
     */
    int delAppCategory(Integer id)throws  Exception;

    /**
     * 修改分类
     * @param appCategory
     * @return
     */
    int updateAppCategory(AppCategory appCategory)throws  Exception;

    /**
     * 根据分类信息查找分类
     * @param appCategory
     * @return
     */
    List<AppCategory> findAppcategoryByAppCategoryInfo(AppCategory appCategory)throws  Exception;

    AppCategory findAppCategoryByid(@Param("id") Integer id) throws  Exception;



}
