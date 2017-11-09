package cn.apprelease.seivice.version;

import cn.apprelease.dao.version.VersionMapper;
import cn.apprelease.pojo.AppVersion;

import java.util.List;

/**
 * @author zwy
 * 2017/11/9 上午 8:48
 */
public class VersionServiceImpl implements VersionService{
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
        return versionMapper.findAllAppVersions(appVersion);
    }

    @Override
    public int deleteVersionById(AppVersion appVersion) {
        return versionMapper.deleteVersionById(appVersion);
    }
}
