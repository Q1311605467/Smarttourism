package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Admin;
import pojo.User;

import java.util.List;

public interface AdminMapper {
    public Admin getAdmin(@Param("admin_account") String admin_account) throws Exception;

    int getCount();
    List<Admin> getAdminList(@Param("currentPageNo") Integer currentPageNo, @Param("pageSize") Integer pageSize);

    int insertAdmin(Admin admin);

    List<Admin> getAdminListByName(@Param("admin_account") String admin_account);

    Admin selectByPrimaryKey(Integer admin_id);

    int updateByPrimaryKey(Admin admin);

}
