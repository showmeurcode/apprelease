package cn.apprelease.service.devuser;

import cn.apprelease.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;
import java.util.List;

/**
 * 前台接口
 * @author kongxiangzhong
 * 2017/11/7 14:21
 */
public interface DevUserService {

    //添加新用户
    boolean addUser(DevUser devUser) throws SQLException;
    //删除用户
    boolean deleteUser(@Param("id")Integer id) throws SQLException;
    //更新用户信息
    boolean updateUser(DevUser devUser)throws SQLException;
    //根据用户名称查找用户是否存在
    DevUser findUserByname(String devName) throws SQLException;
    //根据用户名称和密码确认用户登录
    DevUser userLogin(String devName, String devPassword) throws SQLException;
    //获取所有用户信息
    List<DevUser> findAllDevUser(DevUser devUser)throws SQLException;

}
