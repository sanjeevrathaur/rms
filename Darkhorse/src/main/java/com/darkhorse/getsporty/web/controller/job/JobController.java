package com.darkhorse.getsporty.web.controller.job;

import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.darkhorse.getsporty.domain.Job;
import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.svc.UserSvc;
import com.darkhorse.getsporty.util.Utils;

@RequestMapping("/jobs")
@Controller
@RooWebScaffold(path = "jobs", formBackingObject = Job.class)
public class JobController {

	@Autowired
	private UserSvc userSvc;

	@RequestMapping(method = RequestMethod.GET, value = "/new", produces = "text/html")
	public String createJob(Model uiModel) {
		Job job = new Job();
		uiModel.addAttribute("job", job);
		return "jobs/createJob";

	}

	@RequestMapping(value = "/new", method = RequestMethod.POST, produces = "text/html")
	public String saveEvent(Model uiModel, Job job, HttpServletRequest req) {

		if (Utils.isEmpty(job.getTitle()) || Utils.isEmpty(job.getLocation())
				|| Utils.isEmpty(job.getDesiredSkills())) {
			uiModel.addAttribute("job", job);
			String message = "Title, Location and Desired sills fiels are required !!!";
			uiModel.addAttribute("err", message);
			return "jobs/createJob";
		}

		User user = Utils.getCurrentLoggedInUser(userSvc);
		if (user != null) {
			job.setCreatedByUser(user);
		}
		jobSvc.saveJob(job);
		String message = "Job created successfully !!!!";
		uiModel.addAttribute("message", message);
		uiModel.addAttribute("jobs", jobSvc.findAllJobs());
		return "redirect:/jobs/list?success=" + message;
		
	}

	@RequestMapping(value = "edit/{id}", params = "form", produces = "text/html")
	public String showJob(@PathVariable("id") BigInteger id, Model uiModel) {

		Job job = jobSvc.findJob(id);
		if (job == null) {
			job = new Job();
		}
		User user = Utils.getCurrentLoggedInUser(userSvc);
		if (user != null) {
			job.setCreatedByUser(user);
		}

		uiModel.addAttribute("job", job);
		return "jobs/createJob";
	}

	@RequestMapping(value = "edit/{id}", params = "form", produces = "text/html", method = RequestMethod.POST)
	public String updateJob(@PathVariable("id") BigInteger id, Model uiModel, Job job) {

		if (Utils.isEmpty(job.getTitle()) || Utils.isEmpty(job.getLocation())
				|| Utils.isEmpty(job.getDesiredSkills())) {
			uiModel.addAttribute("job", job);
			String message = "Title, Location and Desired sills fiels are required !!!";
			uiModel.addAttribute("err", message);
			return "jobs/createJob";
		}

		User user = Utils.getCurrentLoggedInUser(userSvc);
		if (user != null) {
			job.setCreatedByUser(user);
		}
		jobSvc.updateJob(job);
		String message = "Job updated successfully !!!!";
		return "redirect:/jobs/list?success=" + message;

	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/list", produces = "text/html")
	public String listPlayers(Model uiModel,
			@RequestParam(value = "success", required = false) String success) {

		if (!Utils.isEmpty(success)) {
			uiModel.addAttribute("success", success);
		}
		List<Job> jobs = jobSvc.findAllJobs();
		uiModel.addAttribute("jobs", jobs);
		return "jobs/list";

	}
	
}
