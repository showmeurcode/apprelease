﻿package cn.apprelease.dao.app_info;

import cn.apprelease.pojo.AppInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ligaoshan
 * 2017/11/8 13:14
 */
public interface AppInfoMapper {


    /**
     * 添加app信息测试哈哈哈
     * @param appInfo
     * @return
     */
    int addAppInfo( AppInfo appInfo)throws  Exception;

    /**
     * 删除app信息
     * @param id
     * @return
     */
    int delAppInfo(@Param("id") Integer id)throws  Exception;

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
    List<AppInfo> findAppInfoByAppInfo(AppInfo appInfo)throws  Exception;


    int findAppinfoCounts() throws Exception;


    AppInfo findAppinfoByid(@Param("id")Integer id) throws Exception;

    AppInfo updateSatus(@Param(value="status")Integer status,@Param(value="id")Integer id)throws Exception;

}
