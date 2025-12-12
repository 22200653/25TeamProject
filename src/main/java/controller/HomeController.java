package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import service.RecruitService;

@Controller
public class HomeController {

    @Autowired
    private RecruitService recruitService;

    @GetMapping({"/", "/home"})
    public String home(Model model) {
        model.addAttribute("recruits", recruitService.list());
        return "home"; // /WEB-INF/views/home.jsp
    }
}
