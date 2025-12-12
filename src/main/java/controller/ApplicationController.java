package controller;

import model.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import service.ApplicationService;

@Controller
@RequestMapping("/application")
public class ApplicationController {

    @Autowired
    private ApplicationService appService;

    @GetMapping("/add")
    public String addForm(@RequestParam("recruitId") int recruitId, Model model) {
        // add.jsp에서 recruitId hidden으로 쓰기 좋게
        model.addAttribute("recruitId", recruitId);
        return "application/add";
    }

    @PostMapping("/create")
    public String create(
            @RequestParam("recruitId") int recruitId,
            @RequestParam("name") String name,
            @RequestParam(value = "grade", required = false) String grade,
            @RequestParam(value = "major", required = false) String major,
            @RequestParam(value = "message", required = false) String message
    ) {
        Application app = new Application();
        app.setRecruitId(recruitId);
        app.setName(name);
        app.setGrade(parseIntOrNull(grade));
        app.setMajor(major);
        app.setMessage(message);

        appService.create(app);
        return "redirect:/recruit/detail?id=" + recruitId;
    }

    @GetMapping("/view")
    public String view(@RequestParam("id") int id, Model model) {
        model.addAttribute("app", appService.detail(id));
        return "application/view";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") int id, Model model) {
        model.addAttribute("app", appService.detail(id));
        return "application/edit";
    }

    @PostMapping("/update")
    public String update(
            @RequestParam("id") int id,
            @RequestParam("recruitId") int recruitId,
            @RequestParam("name") String name,
            @RequestParam(value = "grade", required = false) String grade,
            @RequestParam(value = "major", required = false) String major,
            @RequestParam(value = "message", required = false) String message
    ) {
        Application app = new Application();
        app.setId(id);
        app.setRecruitId(recruitId);
        app.setName(name);
        app.setGrade(parseIntOrNull(grade));
        app.setMajor(major);
        app.setMessage(message);

        appService.edit(app);
        return "redirect:/recruit/detail?id=" + recruitId;
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") int id, @RequestParam("recruitId") int recruitId) {
        appService.remove(id);
        return "redirect:/recruit/detail?id=" + recruitId;
    }

    private Integer parseIntOrNull(String s) {
        if (s == null) return null;
        s = s.trim();
        if (s.isEmpty()) return null;
        return Integer.parseInt(s);
    }
}
