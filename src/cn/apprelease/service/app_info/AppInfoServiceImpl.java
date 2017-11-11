package cn.apprelease.service.app_info;

import cn.apprelease.dao.app_info.AppInfoMapper;
import cn.apprelease.pojo.AppInfo;
import cn.apprelease.tools.PageSupport;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ligaoshan
 * 2017/11/8 14:57
 */
@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {

    @Resource
    private AppInfoMapper appInfoMapper;

    @Override
    public int addAppInfo(AppInfo appInfo)throws  Exception {
        return appInfoMapper.addAppInfo(appInfo);
    }

    @Override
    public int delAppInfo(Integer id)throws  Exception {
        return appInfoMapper.delAppInfo(id);
    }

    @Override
    public int updateAppInfo(AppInfo appInfo)throws  Exception {
        return appInfoMapper.updateAppInfo(appInfo);
    }

    @Override
    public List<AppInfo> findAppInfoByAppInfo(AppInfo appInfo)throws Exception {
        List<AppInfo> list = new ArrayList<AppInfo>();
        list = appInfoMapper.findAppInfoByAppInfo(appInfo);

        return list;
    }

    @Override
    public int findAppinfoCounts() throws Exception {
        return  appInfoMapper.findAppinfoCounts();
    }
}
