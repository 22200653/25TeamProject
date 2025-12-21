package controller;

import model.Application;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import service.ApplicationService;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.util.UUID;

@Controller
@RequestMapping("/application")
public class ApplicationController {

    @Autowired private ApplicationService appService;
    @Autowired private ServletContext servletContext;

    @GetMapping("/add")
    public String addForm(@RequestParam("recruitId") int recruitId, Model model) {
        model.addAttribute("recruitId", recruitId);
        return "application/add";
    }

    @PostMapping("/create")
    public String create(
            @RequestParam("recruitId") int recruitId,
            @RequestParam("name") String name,
            @RequestParam(value = "grade", required = false) String grade,
            @RequestParam(value = "major", required = false) String major,
            @RequestParam(value = "message", required = false) String message,
            @RequestParam(value = "file", required = false) MultipartFile file
    ) throws Exception {

        Application app = new Application();
        app.setRecruitId(recruitId);
        app.setName(name);
        app.setGrade(parseIntOrNull(grade));
        app.setMajor(major);
        app.setMessage(message);

        // ✅ 파일 저장
        if (file != null && !file.isEmpty()) {
            String uploadDir = servletContext.getRealPath("/upload");
            if (uploadDir == null) throw new RuntimeException("uploadDir is null");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String original = file.getOriginalFilename();
            String safeName = UUID.randomUUID() + "_" + (original == null ? "file" : original);
            File saved = new File(dir, safeName);
            file.transferTo(saved);

            app.setFileName(original);
            app.setFilePath("/upload/" + safeName); // 웹 경로로 저장
        }

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
            @RequestParam(value = "message", required = false) String message,
            @RequestParam(value = "file", required = false) MultipartFile file
    ) throws Exception {

        Application app = appService.detail(id);
        if (app == null) return "redirect:/recruit/detail?id=" + recruitId;

        app.setName(name);
        app.setGrade(parseIntOrNull(grade));
        app.setMajor(major);
        app.setMessage(message);

        // ✅ 새 파일 업로드 시 덮어쓰기
        if (file != null && !file.isEmpty()) {
            String uploadDir = servletContext.getRealPath("/upload");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String original = file.getOriginalFilename();
            String safeName = UUID.randomUUID() + "_" + (original == null ? "file" : original);
            File saved = new File(dir, safeName);
            file.transferTo(saved);

            app.setFileName(original);
            app.setFilePath("/upload/" + safeName);
        }

        appService.edit(app);
        return "redirect:/recruit/detail?id=" + recruitId;
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("id") int id, @RequestParam("recruitId") int recruitId) {
        appService.remove(id);
        return "redirect:/recruit/detail?id=" + recruitId;
    }

    // ✅ 파일 다운로드
    @GetMapping("/file")
    public void download(@RequestParam("id") int id, HttpServletResponse res) throws Exception {
        Application app = appService.detail(id);
        if (app == null || app.getFilePath() == null) {
            res.setStatus(404);
            return;
        }

        String real = servletContext.getRealPath(app.getFilePath());
        File f = new File(real);
        if (!f.exists()) {
            res.setStatus(404);
            return;
        }

        String filename = app.getFileName() != null ? app.getFileName() : "file";
        res.setContentType(Files.probeContentType(f.toPath()));
        res.setHeader("Content-Disposition", "attachment; filename=\"" + new String(filename.getBytes("UTF-8"), "ISO-8859-1") + "\"");
        res.setContentLengthLong(f.length());

        try (InputStream in = new FileInputStream(f); OutputStream out = res.getOutputStream()) {
            byte[] buf = new byte[8192];
            int r;
            while ((r = in.read(buf)) != -1) out.write(buf, 0, r);
        }
    }

    private Integer parseIntOrNull(String s) {
        if (s == null) return null;
        s = s.trim();
        if (s.isEmpty()) return null;
        return Integer.parseInt(s);
    }
}
