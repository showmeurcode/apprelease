package cn.apprelease.service.backenduser;

import cn.apprelease.dao.backenduser.BackendUserMapper;
import cn.apprelease.pojo.BackendUser;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.SQLException;

/**后台用户接口实现类
 * @author kongxiangzhong
 * 2017/11/7 14:18
 */
public class BackendUserServiceImpl implements BackendUserService {

     @Resource
     private BackendUserMapper backendUserMapper;

    @Override
    public boolean addUser(BackendUser backendUser) throws SQLException {

       boolean flag = false;

        Connection connection = null;
        try {

            connection.setAutoCommit(false);//开启JDBC事务管理
            int updateRows = backendUserMapper.addUser(backendUser);
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
            if(backendUserMapper.deleteUser(id) > 0)
                flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public boolean updateUser(BackendUser backendUser) throws SQLException {
        boolean flag = false;
        Connection connection = null;
        try{

            if(backendUserMapper.updateUser(backendUser) > 0)
                flag = true;
        }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{

        }
        return flag;
    }

    @Override
    public BackendUser findUserByname(String userName) throws SQLException {
        return null;
    }

    @Override
    public BackendUser userLogin(String userName, String userPassword) throws SQLException {

        return null;
    }

    @Override
    public BackendUser getBackendUser(BackendUser backendUser) throws SQLException {
        return null;
    }
}
