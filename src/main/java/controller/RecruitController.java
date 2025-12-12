package controller;

import service.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import java.io.IOException;

@WebServlet("/recruit/detail")
public class RecruitController extends HttpServlet {
    private final RecruitService recruitService = new RecruitServiceImpl();
    private final ApplicationService appService = new ApplicationServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int recruitId = Integer.parseInt(req.getParameter("id"));

        req.setAttribute("recruit", recruitService.detail(recruitId));
        req.setAttribute("apps", appService.listByRecruit(recruitId));

        req.getRequestDispatcher("/WEB-INF/views/recruit/detail.jsp").forward(req, resp);
    }
}
