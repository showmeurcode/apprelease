package cn.apprelease.seivice.version;

import cn.apprelease.pojo.AppVersion;

import java.util.List;

/**
 * @author zwy
 * 2017/11/9 上午 8:48
 */
public interface VersionService {
    //添加版本信息
    int addVersion(AppVersion appVersion);
    //修改版本信息
    int updateVersion(AppVersion appVersion);
    //查询所有版本信息
    List<AppVersion> findAllAppVersions(AppVersion appVersion);
    //删除版本信息
    int deleteVersionById(AppVersion appVersion);
}
