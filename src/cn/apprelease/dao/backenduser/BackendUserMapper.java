package cn.apprelease.dao.backenduser;

import cn.apprelease.pojo.BackendUser;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;

/**
 * 后台用户接口
 * @author kongxiangzhong
 * 2017/11/7 9:24
 */
public interface BackendUserMapper {

    //添加新用户
    int addUser(BackendUser backendUser) throws SQLException;
    //删除用户
    int deleteUser(@Param("id")Integer id) throws SQLException;
    //更新用户信息
    int updateUser(BackendUser backendUser);
    //根据用户名称查找用户是否存在
    BackendUser findUserByname(String userName) throws SQLException;
    //根据用户名称和密码确认用户登录
    BackendUser userLogin(String userName,String userPassword) throws SQLException;

}
