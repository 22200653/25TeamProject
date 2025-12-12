package controller;

import model.Application;
import service.ApplicationService;
import service.ApplicationServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/application/*")
public class ApplicationController extends HttpServlet {
    private final ApplicationService appService = new ApplicationServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo(); // /add, /view, /edit
        if (path == null) path = "";

        switch (path) {
            case "/add":
                req.getRequestDispatcher("/WEB-INF/views/application/add.jsp").forward(req, resp);
                break;

            case "/view": {
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("app", appService.detail(id));
                req.getRequestDispatcher("/WEB-INF/views/application/view.jsp").forward(req, resp);
                break;
            }

            case "/edit": {
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("app", appService.detail(id));
                req.getRequestDispatcher("/WEB-INF/views/application/edit.jsp").forward(req, resp);
                break;
            }

            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo(); // /create, /update, /delete
        if (path == null) path = "";

        req.setCharacterEncoding("UTF-8");

        switch (path) {
            case "/create": {
                Application app = new Application();
                app.setRecruitId(Integer.parseInt(req.getParameter("recruitId")));
                app.setName(req.getParameter("name"));
                app.setGrade(parseIntOrNull(req.getParameter("grade")));
                app.setMajor(req.getParameter("major"));
                app.setMessage(req.getParameter("message"));

                appService.create(app);
                resp.sendRedirect(req.getContextPath() + "/recruit/detail?id=" + app.getRecruitId());
                break;
            }

            case "/update": {
                Application app = new Application();
                app.setId(Integer.parseInt(req.getParameter("id")));
                app.setRecruitId(Integer.parseInt(req.getParameter("recruitId")));
                app.setName(req.getParameter("name"));
                app.setGrade(parseIntOrNull(req.getParameter("grade")));
                app.setMajor(req.getParameter("major"));
                app.setMessage(req.getParameter("message"));

                appService.edit(app);
                resp.sendRedirect(req.getContextPath() + "/recruit/detail?id=" + app.getRecruitId());
                break;
            }

            case "/delete": {
                int id = Integer.parseInt(req.getParameter("id"));
                int recruitId = Integer.parseInt(req.getParameter("recruitId"));

                appService.remove(id);
                resp.sendRedirect(req.getContextPath() + "/recruit/detail?id=" + recruitId);
                break;
            }

            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private Integer parseIntOrNull(String s) {
        if (s == null) return null;
        s = s.trim();               // Java 8 대체 (isBlank 대신)
        if (s.isEmpty()) return null;
        return Integer.parseInt(s);
    }
}
