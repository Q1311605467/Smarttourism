package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import pojo.Admin;
import pojo.User;
import tools.Constants;

public class SysInterceptor extends HandlerInterceptorAdapter {
    private Logger logger = Logger.getLogger(SysInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.debug("SysInterceptor preHandle ==========================");
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Admin admin = (Admin) session.getAttribute(Constants.ADMIN_SESSION);

        if (null == user && null == admin) {
            response.sendRedirect(request.getContextPath() + "/QDlogin.html");
            return false;
        }
        return true;
    }
}
