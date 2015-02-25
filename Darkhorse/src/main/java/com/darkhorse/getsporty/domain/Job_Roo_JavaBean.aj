// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.domain;

import com.darkhorse.getsporty.domain.Contact;
import com.darkhorse.getsporty.domain.Image;
import com.darkhorse.getsporty.domain.Job;
import com.darkhorse.getsporty.domain.User;
import java.util.Date;

privileged aspect Job_Roo_JavaBean {
    
    public String Job.getTitle() {
        return this.title;
    }
    
    public void Job.setTitle(String title) {
        this.title = title;
    }
    
    public String Job.getOrganization() {
        return this.organization;
    }
    
    public void Job.setOrganization(String organization) {
        this.organization = organization;
    }
    
    public String Job.getDescription() {
        return this.description;
    }
    
    public void Job.setDescription(String description) {
        this.description = description;
    }
    
    public String Job.getExperience() {
        return this.experience;
    }
    
    public void Job.setExperience(String experience) {
        this.experience = experience;
    }
    
    public String Job.getDesiredSkills() {
        return this.desiredSkills;
    }
    
    public void Job.setDesiredSkills(String desiredSkills) {
        this.desiredSkills = desiredSkills;
    }
    
    public String Job.getLocation() {
        return this.location;
    }
    
    public void Job.setLocation(String location) {
        this.location = location;
    }
    
    public Contact Job.getContact() {
        return this.contact;
    }
    
    public void Job.setContact(Contact contact) {
        this.contact = contact;
    }
    
    public String Job.getJobLinks() {
        return this.jobLinks;
    }
    
    public void Job.setJobLinks(String jobLinks) {
        this.jobLinks = jobLinks;
    }
    
    public String Job.getMailTo() {
        return this.mailTo;
    }
    
    public void Job.setMailTo(String mailTo) {
        this.mailTo = mailTo;
    }
    
    public JobType Job.getJobType() {
        return this.jobType;
    }
    
    public void Job.setJobType(JobType jobType) {
        this.jobType = jobType;
    }
    
    public String Job.getModeOfApply() {
        return this.modeOfApply;
    }
    
    public void Job.setModeOfApply(String modeOfApply) {
        this.modeOfApply = modeOfApply;
    }
    
    public String Job.getSalary() {
        return this.salary;
    }
    
    public void Job.setSalary(String salary) {
        this.salary = salary;
    }
    
    public Date Job.getCreated() {
        return this.created;
    }
    
    public void Job.setCreated(Date created) {
        this.created = created;
    }
    
    public boolean Job.isEnable() {
        return this.enable;
    }
    
    public void Job.setEnable(boolean enable) {
        this.enable = enable;
    }
    
    public User Job.getCreatedByUser() {
        return this.createdByUser;
    }
    
    public void Job.setCreatedByUser(User createdByUser) {
        this.createdByUser = createdByUser;
    }
    
    public Image Job.getLogo() {
        return this.logo;
    }
    
    public void Job.setLogo(Image logo) {
        this.logo = logo;
    }
    
}
