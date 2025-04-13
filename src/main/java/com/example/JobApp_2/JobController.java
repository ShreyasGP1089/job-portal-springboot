package com.example.JobApp_2;


import com.example.JobApp_2.model.Job;
import com.example.JobApp_2.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class JobController {
    @Autowired
    JobService service;

    @RequestMapping({"/","home"})
    public String home(){
        return "home";
    }

    @RequestMapping(value ="addjob",method = {RequestMethod.GET,RequestMethod.POST})
    public String addjob(){
        return "addjob";
    }

    @PostMapping("handleForm")
    public String handle(Job job, Model model){
        model.addAttribute("jobPost",job);
        service.addjob(job);
        return "success";
    }

    @RequestMapping(value ="viewalljobs",method = {RequestMethod.GET,RequestMethod.POST})
    public String viewalljobs(Model model){
        List<Job> jobs=service.viewalljobs();
        model.addAttribute("jobPosts",jobs);
        return "viewalljobs";
    }

    @GetMapping("viewall/del/{id}")
    public String del(@PathVariable("id") int id,Model model){
          service.delete(id);
        List<Job> jobs=service.viewalljobs();
        model.addAttribute("jobPosts",jobs);
        return "viewalljobs";
    }

    @GetMapping("viewall/update")
    public String update(){
        return "addjob";
    }

    @GetMapping("viewalljobs/search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        List<Job> jobs = service.search(keyword);
        model.addAttribute("jobPosts", jobs);
        if (jobs.isEmpty()) {
            model.addAttribute("searchWarning", "Please enter at least 2 characters to search.");
        }
        return "viewalljobs";
    }

}
