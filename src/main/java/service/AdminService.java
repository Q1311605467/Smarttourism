package service;

import pojo.Admin;
import pojo.User;

import java.util.List;

public interface AdminService {

    public  Admin login(String admin_account, String admin_password) throws Exception;
//    获取记录数
    public int getCount();
    //
    public List<Admin> getAdminList(int currentPageNo, int pageSize);

    public  int insertAdmin(Admin admin);

    public List<Admin> getAdminListByName(String admin_account);

    public int ActivatingAdmin(String admin_id);

    public int LogoutAdmin(String admin_id);
}
