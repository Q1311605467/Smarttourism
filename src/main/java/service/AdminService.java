package service;

import pojo.Admin;

public interface AdminService {

    public  Admin login(String admin_account, String admin_password) throws Exception;
}
