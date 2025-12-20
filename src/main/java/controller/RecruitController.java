package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.ApplicationService;
import service.RecruitService;
import model.Recruit;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@Controller
@RequestMapping("/recruit")
public class RecruitController {

    @Autowired
    private RecruitService recruitService;

    @Autowired
    private ApplicationService applicationService;

    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id, Model model) {

        // 1️⃣ 모집글 조회
        Recruit recruit = recruitService.detail(id);
        model.addAttribute("recruit", recruit);

        // 2️⃣ 지원서 목록
        model.addAttribute("apps", applicationService.listByRecruitId(id));

        // 3️⃣ D-day 계산 (⭐ 핵심 ⭐)
        long dday = -1; // 기본값: 마감
        if (recruit != null && recruit.getDeadline() != null) {
            LocalDate today = LocalDate.now();
            dday = ChronoUnit.DAYS.between(today, recruit.getDeadline());
        }

        model.addAttribute("dday", dday);

        return "recruit/detail";
    }
}
