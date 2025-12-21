package controller;

import model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.ApplicationService;
import service.RecruitService;
import model.Recruit;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@Controller
@RequestMapping("/recruit")
public class RecruitController {

    @Autowired private RecruitService recruitService;
    @Autowired private ApplicationService applicationService;

    @GetMapping("/detail")
    public String detail(@RequestParam("id") int id, Model model, HttpServletRequest req) {

        // ✅ 조회수 +1
        recruitService.increaseViewCount(id);

        Recruit recruit = recruitService.detail(id);
        model.addAttribute("recruit", recruit);

        model.addAttribute("apps", applicationService.listByRecruitId(id));

        long dday = -1;
        if (recruit != null && recruit.getDeadline() != null) {
            LocalDate today = LocalDate.now();
            dday = ChronoUnit.DAYS.between(today, recruit.getDeadline());
        }
        model.addAttribute("dday", dday);

        // ✅ 좋아요 상태(로그인 사용자면)
        Member loginUser = (Member) req.getSession().getAttribute("loginUser");
        boolean liked = false;
        if (loginUser != null) {
            liked = recruitService.isLikedByUser(id, loginUser.getId());
        }
        model.addAttribute("liked", liked);

        return "recruit/detail";
    }

    // ✅ 좋아요 토글 (로그인 필요)
    @PostMapping("/like")
    public String toggleLike(@RequestParam("recruitId") int recruitId, HttpServletRequest req) {
        Member loginUser = (Member) req.getSession().getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/auth/login";
        }
        recruitService.toggleLike(recruitId, loginUser.getId());
        return "redirect:/recruit/detail?id=" + recruitId;
    }
}
