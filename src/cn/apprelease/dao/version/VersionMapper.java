package cn.apprelease.dao.version;

import cn.apprelease.pojo.AppVersion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zwy
 * 2017/11/8 下午 1:33
 */
public interface VersionMapper {
    //添加版本信息
    int addVersion(@Param("appVersion") AppVersion appVersion);
    //修改版本信息
    int updateVersion(@Param("appVersion") AppVersion appVersion);
    //查询所有版本信息
    List<AppVersion> findAllAppVersions(@Param("appVersion") AppVersion appVersion);
    //删除版本信息
    int deleteVersionById(@Param("appVersion") AppVersion appVersion);
}
