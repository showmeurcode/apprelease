package cn.apprelease.dao.app_info;

import cn.apprelease.pojo.AppCategory;
import cn.apprelease.pojo.AppInfo;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.Appinfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author ligaoshan
 * 2017/11/8 13:14
 */
public interface AppInfoMapper {


    /**
     * 添加app信息
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

//获取所有appinfo的数量
    int findAppinfoCounts() throws Exception;

    AppInfo findAppinfoByid(@Param("id")Integer id) throws Exception;

}
