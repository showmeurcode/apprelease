package cn.apprelease.dao.version;

import cn.apprelease.pojo.AppVersion;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zwy
 * 2017/11/8 下午 1:33
 */
public interface AppVersionMapper {
    //添加版本信息
    int addVersion(AppVersion appVersion)throws  Exception;
    //修改版本信息
    int updateVersion(AppVersion appVersion)throws  Exception;
    //查询所有版本信息
    List<AppVersion> findAllAppVersions(AppVersion appVersion)throws  Exception;
    //删除版本信息
    int deleteVersionById( AppVersion appVersion)throws  Exception;

    //根据verionid查找version对象
    AppVersion findAppVersionByid(@Param("id")Integer id);

    //根据appId 查找对应的版本信息列表
    List<AppVersion> findAppVersionsByappId(@Param("appId") Integer appId)throws  Exception;
}
