package cn.apprelease.service.app_category;

import cn.apprelease.dao.app_category.AppCategoryMapper;
import cn.apprelease.pojo.AppCategory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
    public int addAppCategory(AppCategory appCategory) {
        return appCategoryMapper.addAppCategory(appCategory);
    }

    @Override
    public int delAppCategory(Integer id) {
        return appCategoryMapper.delAppCategory(id);
    }

    @Override
    public int updateAppCategory(AppCategory appCategory) {
        return appCategoryMapper.updateAppCategory(appCategory);
    }

    @Override
    public List<AppCategory> findAppcategoryByAppCategoryInfo(AppCategory appCategory) {
        return appCategoryMapper.findAppcategoryByAppCategoryInfo(appCategory);
    }


}
