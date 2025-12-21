package controller;

import model.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.AdminRecruitService;
import java.time.LocalDate;

@Controller
@RequestMapping("/admin/recruit")
public class AdminRecruitController {

    @Autowired private AdminRecruitService adminRecruitService;

    @GetMapping("/list")
    public String list(Model model){
        model.addAttribute("recruits", adminRecruitService.findAll());
        return "admin/recruit/list";
    }

    @GetMapping("/add")
    public String addForm(Model model){
        model.addAttribute("recruit", new Recruit());
        return "admin/recruit/add";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute Recruit recruit){
        adminRecruitService.insertRecruit(recruit);
        return "redirect:/admin/recruit/list";
    }

    @GetMapping("/edit")
    public String editForm(@RequestParam("id") int id, Model model){
        model.addAttribute("recruit", adminRecruitService.findById(id));
        return "admin/recruit/edit";
    }


    @PostMapping("/update")
    public String update(@ModelAttribute Recruit recruit,
                         @RequestParam(value = "deadline", required = false) String deadlineStr) {

        // deadline은 LocalDate 바인딩이 400의 주범이라 직접 처리
        if (deadlineStr == null || deadlineStr.trim().isEmpty()) {
            recruit.setDeadline(null);
        } else {
            recruit.setDeadline(LocalDate.parse(deadlineStr)); // yyyy-MM-dd
        }

        adminRecruitService.updateRecruit(recruit);
        return "redirect:/admin/recruit/list";
    }


    @PostMapping("/delete")
    public String delete(@RequestParam("id") int id){
        adminRecruitService.deleteRecruit(id);
        return "redirect:/admin/recruit/list";
    }
}
