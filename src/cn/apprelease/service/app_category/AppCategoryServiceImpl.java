package cn.apprelease.service.app_category;

import cn.apprelease.dao.app_category.AppCategoryMapper;
import cn.apprelease.pojo.AppCategory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ligaoshan
 * 2017/11/8 14:22
 */
@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {

    @Resource
    private AppCategoryMapper appCategoryMapper;

    @Override
    public int addAppCategory(AppCategory appCategory)throws  Exception {
        return appCategoryMapper.addAppCategory(appCategory);
    }

    @Override
    public int delAppCategory(Integer id)throws  Exception {
        return appCategoryMapper.delAppCategory(id);
    }

    @Override
    public int updateAppCategory(AppCategory appCategory)throws  Exception {
        return appCategoryMapper.updateAppCategory(appCategory);
    }

    @Override
    public List<AppCategory> findAppcategoryByAppCategoryInfo(AppCategory appCategory)throws  Exception {
        List<AppCategory> list = new ArrayList<AppCategory>();
        list = appCategoryMapper.findAppcategoryByAppCategoryInfo(appCategory);
        if(list.size() == 0){
            list = null;
        }
        return list;
    }

    @Override
    public AppCategory findAppCategoryByid(Integer id) throws Exception {
        return  appCategoryMapper.findAppCategoryByid(id);
    }


}
