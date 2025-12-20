package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.RecruitService;

@Controller
public class HomeController {

    @Autowired
    private RecruitService recruitService;

    @GetMapping({"/", "/home"})
    public String home(
            @RequestParam(value = "category", required = false, defaultValue = "전체") String category,
            Model model
    ) {
        model.addAttribute("category", category);                 // ✅ 탭 active 표시용
        model.addAttribute("recruits", recruitService.list(category)); // ✅ 필터된 리스트
        return "home";
    }
}
