package cn.apprelease.service.backenduser;

import cn.apprelease.pojo.BackendUser;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;

/**后台用户接口
 * @author kongxiangzhong
 * 2017/11/7 14:17
 */
public interface BackendUserService {

    //添加新用户
    boolean addUser(BackendUser backendUser) throws SQLException;
    //删除用户
    boolean deleteUser(@Param("id")Integer id) throws SQLException;
    //更新用户信息
    boolean updateUser(BackendUser backendUser)throws SQLException;
    //根据用户名称查找用户是否存在
    BackendUser findUserByname(String userName) throws SQLException;
    //根据用户名称和密码确认用户登录
    BackendUser userLogin(String userCode,String userPassword) throws SQLException;
    //获取所有用户信息
    BackendUser getBackendUser(BackendUser backendUser)throws SQLException;


}
