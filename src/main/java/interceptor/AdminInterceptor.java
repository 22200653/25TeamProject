package interceptor;

import model.Member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
        Member loginUser = (Member) req.getSession().getAttribute("loginUser");
        if (loginUser == null) {
            res.sendRedirect(req.getContextPath() + "/auth/login");
            return false;
        }
        if (!loginUser.isAdmin()) {
            res.sendRedirect(req.getContextPath() + "/home");
            return false;
        }
        return true;
    }
}
