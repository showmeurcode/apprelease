package cn.apprelease.service.devuser;

import cn.apprelease.dao.devuser.DevUserMapper;
import cn.apprelease.pojo.DevUser;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 前台接口实现类
 * @author kongxiangzhong
 * 2017/11/7 14:22
 */
public class DevUserServiceImpl implements DevUserService {

    @Resource
    private DevUserMapper devUserMapper;


    @Override
    public boolean addUser(DevUser devUser) throws SQLException {
        boolean flag = false;

        Connection connection = null;
        try {

            connection.setAutoCommit(false);//开启JDBC事务管理
            int updateRows = devUserMapper.addUser(devUser);
            connection.commit();
            if(updateRows > 0){
                flag = true;
                System.out.println("add success!");
            }else{
                System.out.println("add failed!");
            }

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            try {
                System.out.println("rollback==================");
                connection.rollback();
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }


        }
        return flag;
    }

    @Override
    public boolean deleteUser(Integer id) throws SQLException {

        boolean flag = false;
        Connection connection = null;
        try {
            if(devUserMapper.deleteUser(id) > 0)
                flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean updateUser(DevUser devUser) throws SQLException {
        boolean flag = false;
        Connection connection = null;
        try{

            if(devUserMapper.updateUser(devUser) > 0)
                flag = true;
        }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{

        }
        return flag;
    }

    @Override
    public DevUser findUserByname(String devName) throws SQLException {
        DevUser  devUser = null;


        if(devUserMapper.findUserByname(devName) != null){

            if(!devUserMapper.findUserByname(devName).equals(devName)){
                devUser = null;
            }
        }

        return devUser;
    }

    @Override
    public DevUser userLogin(String devCode, String devPassword) throws SQLException {
        DevUser devUser = null;
        try {
            devUser = devUserMapper.getLoginUser("userCode");
            //匹配密码
            if(null != devUser){
                if(!devUser.getDevPassword().equals(devPassword))
                    devUser = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return devUser;
    }

    @Override
    public List<DevUser> findAllDevUser(DevUser devUser) throws SQLException {
        Connection connection = null;
        List<DevUser> devUserList = new ArrayList<>();
        try {
            devUser = devUserMapper.getfindAllDevUser(devUser);
            devUserList.add(devUser);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return devUserList;
    }
}
