package cn.apprelease.service.devuser;

import cn.apprelease.dao.devuser.DevUserMapper;
import cn.apprelease.pojo.DevUser;

import java.sql.SQLException;

/**
 * 前台接口实现类
 * @author kongxiangzhong
 * 2017/11/7 14:22
 */
public class DevUserServiceImpl implements DevUserService {

    @Override
    public int addUser(DevUser devUser) throws SQLException {
        return 0;
    }

    @Override
    public int deleteUser(Integer id) throws SQLException {
        return 0;
    }

    @Override
    public int updateUser(DevUser devUser) throws SQLException {
        return 0;
    }

    @Override
    public DevUserMapper findUserByname(String devName) throws SQLException {
        return null;
    }

    @Override
    public DevUserMapper userLogin(String devName, String devPassword) throws SQLException {
        return null;
    }
}
