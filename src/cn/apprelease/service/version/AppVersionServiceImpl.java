package cn.apprelease.service.version;

import cn.apprelease.dao.version.AppVersionMapper;
import cn.apprelease.pojo.AppVersion;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zwy
 * 2017/11/9 上午 8:48
 */
@Service("versionService")
public class AppVersionServiceImpl implements AppVersionService {

    @Resource
    private AppVersionMapper appVersionMapper;

    @Override
    public int addVersion(AppVersion appVersion)throws  Exception {
        return appVersionMapper.addVersion(appVersion);
    }

    @Override
    public int updateVersion(AppVersion appVersion)throws  Exception {
        return appVersionMapper.updateVersion(appVersion);
    }

    @Override
    public List<AppVersion> findAllAppVersions(AppVersion appVersion)throws  Exception {
        List<AppVersion> list  = new ArrayList<>();
        list=appVersionMapper.findAllAppVersions(appVersion);
        if(list.size()==0){

            list=null;
        }
        return list;
    }

    @Override
    public int deleteVersionById(AppVersion appVersion)throws  Exception {
        return appVersionMapper.deleteVersionById(appVersion);
    }

    @Override
    public AppVersion findAppVersionByid(Integer id) {
        return  appVersionMapper.findAppVersionByid(id);
    }
}
