package cn.apprelease.service.version;

import cn.apprelease.dao.version.VersionMapper;
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
public class VersionServiceImpl implements VersionService{

    @Resource
    private VersionMapper versionMapper;

    @Override
    public int addVersion(AppVersion appVersion) {
        return versionMapper.addVersion(appVersion);
    }

    @Override
    public int updateVersion(AppVersion appVersion) {
        return versionMapper.updateVersion(appVersion);
    }

    @Override
    public List<AppVersion> findAllAppVersions(AppVersion appVersion) {
        List<AppVersion> list  = new ArrayList<>();
        list=versionMapper.findAllAppVersions(appVersion);
        if(list.size()==0){

            list=null;
        }
        return list;
    }

    @Override
    public int deleteVersionById(AppVersion appVersion) {
        return versionMapper.deleteVersionById(appVersion);
    }
}
