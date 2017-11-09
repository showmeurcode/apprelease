package cn.apprelease.service.backenduser;

import cn.apprelease.pojo.BackendUser;

import java.util.List;

/**后台用户接口
 * @author kongxiangzhong
 * 2017/11/7 14:17
 */
public interface BackendUserService {

    //添加新用户
    int addUser(BackendUser backendUser) throws Exception;
    //删除用户
    int deleteUser(Integer id) throws Exception;
    //更新用户信息
    int updateUser(BackendUser backendUser)throws Exception;
    //根据用户名称查找用户是否存在
    BackendUser findUserByname(String userName) throws Exception;
    //根据用户名称和密码确认用户登录
    BackendUser userLogin(String userCode,String userPassword) throws Exception;
    //获取所有用户信息
    List<BackendUser> findAllBackendUser(BackendUser backendUser)throws Exception;


}
