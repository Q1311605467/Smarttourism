package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Admin;

public interface AdminMapper {
    public Admin getAdmin(@Param("admin_account") String admin_account) throws Exception;
}
