package service;

import dao.AdminMapper;
import org.springframework.stereotype.Service;
import pojo.Admin;
import pojo.User;

import javax.annotation.Resource;
import java.util.List;

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

    @Override
    public int getCount() {
        int count = adminMapper.getCount();
        return count;
    }
    @Override
    public List<Admin> getAdminList(int currentPageNo, int pageSize) {
        List<Admin> adminList = null;
        currentPageNo = (currentPageNo - 1) * pageSize;
        adminList = adminMapper.getAdminList(currentPageNo, pageSize);
        return adminList;
    }

    @Override
    public int insertAdmin(Admin admin) {
        int flag = adminMapper.insertAdmin(admin);
        return flag;
    }

    @Override
    public List<Admin> getAdminListByName(String admin_account) {
        List<Admin> adminList = null;
        adminList = adminMapper.getAdminListByName(admin_account);
        return adminList;
    }

    @Override
    public int ActivatingAdmin(String admin_id) {
        Integer id = Integer.parseInt(admin_id);
        Admin admin = adminMapper.selectByPrimaryKey(id);
        int flag = 0;
        if(admin.getAdmin_supreme()==1){
            return flag;
        }
        Integer isActive = admin.getAdmin_isActive() ^ 1;
        admin.setAdmin_isActive(isActive);
        flag = adminMapper.updateByPrimaryKey(admin);
        return flag;
    }

    @Override
    public int LogoutAdmin(String admin_id) {
        Integer id = Integer.parseInt(admin_id);
        Admin admin = adminMapper.selectByPrimaryKey(id);
        int flag = 0;
        if(admin.getAdmin_supreme()==1){
            return flag;
        }
        Integer isActive = admin.getAdmin_isActive() ^ 1;
        admin.setAdmin_isActive(isActive);
        flag = adminMapper.updateByPrimaryKey(admin);
        return flag;
    }
}
