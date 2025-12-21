package controller;

import model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.MemberService;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired private MemberService memberService;

    @GetMapping("/login")
    public String loginForm() {
        return "auth/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String userid,
                        @RequestParam String password,
                        HttpServletRequest req,
                        Model model) {
        Member m = memberService.login(userid, password);
        if (m == null) {
            model.addAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "auth/login";
        }
        req.getSession().setAttribute("loginUser", m);
        return "redirect:/home";
    }

    @GetMapping("/signup")
    public String signupForm() {
        return "auth/signup";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam String userid,
                         @RequestParam String password,
                         @RequestParam String username,
                         Model model) {
        boolean ok = memberService.signup(userid, password, username);
        if (!ok) {
            model.addAttribute("error", "이미 존재하는 아이디입니다.");
            return "auth/signup";
        }
        return "redirect:/auth/login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest req) {
        req.getSession().invalidate();
        return "redirect:/home";
    }
}
