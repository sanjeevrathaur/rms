package com.darkhorse.getsporty.domain;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.layers.repository.mongo.RooMongoEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooMongoEntity
@RooJson
public class Job {
	
	public enum JobType {
		Permanent,Contract,Parttime
	}
	
	private String title;
	
	private String organization;
	
	private String description;
	
	private String experience;
	
	/** Skills, Certifications, education */
	private String desiredSkills;
	
	private String location;
	
	private Contact contact;
	
	private String jobLinks;
	
	/** To whom need to send email regarding this job */
	private String mailTo;
	
	/** permanent or contract */
	private JobType jobType;
	
	/** phone/email/walk in */
	private String modeOfApply;
	
	private String salary;

    @Column(updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date created = new Date();

    private boolean enable=true;
    
    @DBRef
    private User createdByUser;
    
    @DBRef
    private Image logo;
    
    
}
