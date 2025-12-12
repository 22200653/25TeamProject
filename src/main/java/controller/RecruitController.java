package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.ApplicationService;
import service.RecruitService;

@Controller
@RequestMapping("/recruit")
public class RecruitController {

    @Autowired
    private RecruitService recruitService;

    @Autowired
    private ApplicationService applicationService;

    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id, Model model) {
        model.addAttribute("recruit", recruitService.detail(id));
        model.addAttribute("applications", applicationService.listByRecruitId(id));
        return "recruit/detail"; // /WEB-INF/views/recruit/detail.jsp
    }
}
