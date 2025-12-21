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
            @RequestParam(value = "q", required = false) String q,
            Model model
    ) {
        model.addAttribute("category", category); // 탭 active 표시용
        model.addAttribute("q", q);               // 검색어 유지용

        // ✅ 검색 포함 리스트
        model.addAttribute("recruits", recruitService.list(category, q));

        // ✅ 랭킹(좋아요 Top3) - 홈에서 1~3등 따로 보여주려면
        model.addAttribute("top3", recruitService.top3ByLikes());

        return "home";
    }
}
