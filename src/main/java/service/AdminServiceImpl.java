package service;

import dao.AdminMapper;
import org.springframework.stereotype.Service;
import pojo.Admin;

import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;
    @Override
    public Admin login(String admin_account, String admin_password) throws Exception {
        Admin admin = adminMapper.getAdmin(admin_account);
        if (null!=admin){
            if(!admin.getAdmin_password().equals(admin_password))
            {
                admin = null;
            }
        }

        return admin;
    }
}
