package cn.apprelease.dao.devuser;

import cn.apprelease.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**前台用户接口
 * @author kongxiangzhong
 * 2017/11/7 9:25
 */
public interface DevUserMapper {

    //添加新用户
    int addUser(DevUser devUser) throws Exception;
    //删除用户
    int deleteUser(@Param("id")Integer id) throws Exception;
    //更新用户信息
    int updateUser(DevUser devUser);
    //根据用户名称查找用户是否存在
    DevUser findUserByname(String devName) throws Exception;
    
    //通过userCode获取User
    DevUser getLoginUser(@Param("devCode")String userCode,@Param("devPassword")String devPassword)throws Exception;

    List<DevUser> getfindAllDevUser()throws Exception;

}
