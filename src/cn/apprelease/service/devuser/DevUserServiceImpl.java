package cn.apprelease.service.devuser;

import cn.apprelease.dao.devuser.DevUserMapper;
import cn.apprelease.pojo.DevUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 前台接口实现类
 * @author kongxiangzhong
 * 2017/11/7 14:22
 */
@Service
public class DevUserServiceImpl implements DevUserService {

    @Resource
    private DevUserMapper devUserMapper;


    @Override
    public int addUser(DevUser devUser) throws Exception {
        int result=-1;
        result=devUserMapper.addUser(devUser);

        return result;
    }

    @Override
    public int deleteUser(Integer id) throws Exception {
        int result = 0;
        result = devUserMapper.deleteUser(id);
        return result;
    }

    @Override
    public int updateUser(DevUser devUser) throws Exception {
        int result = 0;
        result = devUserMapper.updateUser(devUser);

        return result;
    }

    @Override
    public DevUser findUserByname(String devName) throws Exception {

        return devUserMapper.findUserByname(devName);
    }

    @Override
    public DevUser userLogin(String devCode, String devPassword) throws Exception {

        return  devUserMapper.getLoginUser(devCode,devPassword);
    }

    @Override
    public List<DevUser> findAllDevUser(DevUser devUser) throws Exception {
        List<DevUser> devUserList = new ArrayList<>();
        devUserList= devUserMapper.getfindAllDevUser();
        if(devUserList.size()==0){

            devUserList=null;
        }
        return devUserList;
    }
}
