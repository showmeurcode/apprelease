package cn.apprelease.service.app_info;

import cn.apprelease.dao.app_info.AppInfoMapper;
import cn.apprelease.pojo.AppInfo;

import java.util.List;

/**
 * @author ligaoshan
 * 2017/11/8 14:57
 */
public class AppInfoServiceImpl implements AppInfoService {

    AppInfoMapper appInfoMapper;

    @Override
    public int addAppInfo(AppInfo appInfo) {
        return appInfoMapper.addAppInfo(appInfo);
    }

    @Override
    public int delAppInfo(Integer id) {
        return appInfoMapper.delAppInfo(id);
    }

    @Override
    public int updateAppInfo(AppInfo appInfo) {
        return appInfoMapper.updateAppInfo(appInfo);
    }

    @Override
    public List<AppInfo> findAppInfoByAppInfo(AppInfo appInfo) {
        return appInfoMapper.findAppInfoByAppInfo(appInfo);
    }
}
