// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.domain;

import com.darkhorse.getsporty.domain.Academy;
import com.darkhorse.getsporty.domain.User;
import java.util.List;

privileged aspect Academy_Roo_JavaBean {
    
    public User Academy.getUser() {
        return this.user;
    }
    
    public void Academy.setUser(User user) {
        this.user = user;
    }
    
    public List<String> Academy.getFacilityAvailable() {
        return this.facilityAvailable;
    }
    
    public void Academy.setFacilityAvailable(List<String> facilityAvailable) {
        this.facilityAvailable = facilityAvailable;
    }
    
    public List<String> Academy.getFaculityAvailable() {
        return this.faculityAvailable;
    }
    
    public void Academy.setFaculityAvailable(List<String> faculityAvailable) {
        this.faculityAvailable = faculityAvailable;
    }
    
    public List<String> Academy.getTimeSlotAvailable() {
        return this.timeSlotAvailable;
    }
    
    public void Academy.setTimeSlotAvailable(List<String> timeSlotAvailable) {
        this.timeSlotAvailable = timeSlotAvailable;
    }
    
    public List<String> Academy.getSourceAvailable() {
        return this.sourceAvailable;
    }
    
    public void Academy.setSourceAvailable(List<String> sourceAvailable) {
        this.sourceAvailable = sourceAvailable;
    }
    
}