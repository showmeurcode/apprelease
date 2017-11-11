package cn.apprelease.dao.app_category;

import cn.apprelease.pojo.AppCategory;
import cn.apprelease.service.app_category.AppCategoryService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ligaoshan
 * 2017/11/8 13:14
 */
public interface AppCategoryMapper {


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
    int delAppCategory(@Param("id") Integer id)throws  Exception;

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
    List<AppCategory> findAppcategoryByAppCategoryInfo(@Param("appCategory") AppCategory appCategory)throws  Exception;

    AppCategory findAppCategoryByid(@Param("id") Integer id) throws  Exception;
    //查找父级id为某id的分类列表
    List<AppCategory> findAppCategorysByParentId( @Param("parentId") Integer parentId) throws  Exception;
    //查找某个等级的分类列表
    List<AppCategory> findAppCategorysBylevel( @Param("level") Integer level) throws  Exception;

}
