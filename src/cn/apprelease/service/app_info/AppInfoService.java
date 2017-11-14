package cn.apprelease.service.app_info;

import cn.apprelease.pojo.AppInfo;

import java.util.List;

/**
 * @author ligaoshan
 * 2017/11/8 14:55
 */
public interface AppInfoService {

    /**
     * 添加app信息
     * @param appInfo
     * @return
     */
    int addAppInfo(AppInfo appInfo)throws  Exception;

    /**
     * 删除app信息
     * @param id
     * @return
     */
    int delAppInfo(Integer id)throws  Exception;

    /**
     * 修改app信息
     * @param appInfo
     * @return
     */
    int updateAppInfo(AppInfo appInfo)throws  Exception;

    /**
     * 根据app信息查找app
     * @param appInfo
     * @return
     */
    List<AppInfo> findAppInfoByAppInfo(AppInfo appInfo) throws Exception;

    int findAppinfoCounts() throws Exception;

    List<AppInfo> findAppInfobyStatus( AppInfo status)throws  Exception;

    AppInfo findAppinfoByid(int i);
}
