package cn.apprelease.dao.app_info;

import cn.apprelease.pojo.AppCategory;
import cn.apprelease.pojo.AppInfo;
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
    int addAppInfo(@Param("appInfo") AppInfo appInfo);

    /**
     * 删除app信息
     * @param id
     * @return
     */
    int delAppInfo(@Param("id") Integer id);

    /**
     * 修改app信息
     * @param appInfo
     * @return
     */
    int updateAppInfo(@Param("appInfo") AppInfo appInfo);

    /**
     * 根据app信息查找app
     * @param appInfo
     * @return
     */
    List<AppInfo> findAppInfoByAppInfo(AppInfo appInfo, @RequestParam("from")Integer from,
                                       @RequestParam("num")Integer num);


    int findAppinfoCounts() throws Exception;

}
