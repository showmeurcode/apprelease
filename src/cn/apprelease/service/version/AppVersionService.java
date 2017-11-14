package cn.apprelease.service.version;

import cn.apprelease.pojo.AppVersion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zwy
 * 2017/11/9 上午 8:48
 */
public interface AppVersionService {
    //添加版本信息
    int addVersion(AppVersion appVersion)throws  Exception;
    //修改版本信息
    int updateVersion(AppVersion appVersion)throws  Exception;
    //查询所有版本信息
    List<AppVersion> findAllAppVersions(AppVersion appVersion)throws  Exception;
    //删除版本信息
    int deleteVersionById(AppVersion appVersion)throws  Exception;

    AppVersion findAppVersionByid(@Param("id")Integer id);

    List<AppVersion> findAppVersionsByappId(Integer appId)throws  Exception;

}
