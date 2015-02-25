package com.darkhorse.getsporty.web.controller.rest;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.darkhorse.getsporty.domain.Cred;
import com.darkhorse.getsporty.domain.Job;
import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.svc.UserSvc;
import com.darkhorse.getsporty.svc.job.JobSvc;
import com.darkhorse.getsporty.util.Utils;


/**
 * @author sanjeev
 */
@Controller
@RequestMapping("/gsapi")
public class RestApiController {

	private Logger logger = Logger.getLogger("apiAccessLogger");
	
    @Autowired
    private UserSvc userSvc;
    
    @Autowired
    private JobSvc jobSvc;
    
    @RequestMapping(value = "users", headers = "Accept=application/json", method=RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<String> userPost(@RequestBody Cred cred, HttpServletRequest request) {
	String message = "";
	User user = userSvc.findByEmail(cred.getEmail());
	if (user == null) {
	    message = "No user exists with this emailid.";
	    return new ResponseEntity<String>(message, HttpStatus.BAD_REQUEST);
	} else {
		if(!cred.getPasswd().equals(user.getPasswd())){
		    message = "Your Password is incorrect !!!";
		    return new ResponseEntity<String>(message, HttpStatus.BAD_REQUEST);
		}
		if(!user.getIsEnabled()){
		    message = "User is not activated !!!";
		    return new ResponseEntity<String>(message, HttpStatus.UNAUTHORIZED);
		}
	    String token = user.getId().toString();
	    return new ResponseEntity<String>(token, HttpStatus.OK);

	    }

    }
    
    @RequestMapping(value = "jobs/{token}/{deviceId}", method = RequestMethod.GET, headers = "Accept=application/json")
    public
	    ResponseEntity<String> jobs(@PathVariable("token") BigInteger token,
		    @PathVariable("deviceId") String deviceId,
		    HttpServletRequest request, @RequestParam(value = "pageNum", required = false) Integer pageNum,
		    @RequestParam(value = "pageSize", required = false) Integer pageSize) {
	System.out.println("In Jobs");
	User user = userSvc.findUser(token);
	pageNum = pageNum == null ? 1 : pageNum;
	pageSize = pageSize == null ? 50 : pageSize;
	String message = "";
	if (user == null) {
	    message = "No data available !!!";
	    return new ResponseEntity<String>(message, HttpStatus.BAD_REQUEST);
	} else {
	    List<Job> jobs = new ArrayList<Job>();
	    jobs = jobSvc.findAllJobs();
	    return new ResponseEntity<String>(Utils.getJSONSerializer().deepSerialize(jobs),
		    Utils.getJsonHttpHeaders(), HttpStatus.OK);

	}

    }

    
    /** Create a text file for logging purpose. which is publicly accesable. */

    private void addLog(String reqData, HttpServletRequest request, String methodName) {

	boolean debugMode = true;
	if (debugMode) {

	    String directory = request.getSession().getServletContext().getRealPath("/");
	    directory = directory + "/accessLog.txt";
	    File testFile = new File(directory);
	    if (!testFile.exists())
		testFile.mkdir();

	    try {
		FileWriter fileWriter = new FileWriter(directory, true);
		String requestData = "\n request for " + methodName + " at : " + new Date() + " request data is : " + reqData;
		fileWriter.write(requestData);
		fileWriter.close();

	    } catch (FileNotFoundException e) {

		e.printStackTrace();
	    } catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	    }

	}
    }
 
}
