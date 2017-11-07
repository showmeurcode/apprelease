package cn.apprelease.dao.devuser;

import cn.apprelease.pojo.DevUser;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;

/**前台用户接口
 * @author kongxiangzhong
 * 2017/11/7 9:25
 */
public interface DevUserMapper {

    //添加新用户
    int addUser(DevUser devUser) throws SQLException;
    //删除用户
    int deleteUser(@Param("id")Integer id) throws SQLException;
    //更新用户信息
    int updateUser(DevUser devUser);
    //根据用户名称查找用户是否存在
    DevUserMapper findUserByname(String devName) throws SQLException;
    //根据用户名称和密码确认用户登录
    DevUserMapper userLogin(String devName, String devPassword) throws SQLException;

}
