package cn.apprelease.service.backenduser;

import cn.apprelease.dao.backenduser.BackendUserMapper;
import cn.apprelease.pojo.BackendUser;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**后台用户接口实现类
 * @author kongxiangzhong
 * 2017/11/7 14:18
 */
public class BackendUserServiceImpl implements BackendUserService {

     @Resource
     private BackendUserMapper backendUserMapper;


    @Override
    public int addUser(BackendUser backendUser) throws Exception {
        int result = -1;
        result=backendUserMapper.addUser(backendUser);
        return result;
    }

    @Override
    public int deleteUser(Integer id) throws Exception {
        int result = 0;

        result = backendUserMapper.deleteUser(id);

        return result;
    }

    @Override
    public int updateUser(BackendUser backendUser) throws Exception {
        return 0;
    }

    @Override
    public BackendUser findUserByname(String userName) throws Exception {

        return backendUserMapper.findUserByname(userName);
    }

    @Override
    public BackendUser userLogin(String userCode, String userPassword) throws Exception {

        return backendUserMapper.getLoginUser(userCode,userPassword);
    }

    @Override
    public List<BackendUser> findAllBackendUser(BackendUser backendUser) throws Exception {
        List<BackendUser> backendUserList = new ArrayList<>();

        backendUserList = backendUserMapper.getfindAllBackendUser();
        if(backendUserList.size()==0){

            backendUserList=null;
        }
        return backendUserList;
    }
}
