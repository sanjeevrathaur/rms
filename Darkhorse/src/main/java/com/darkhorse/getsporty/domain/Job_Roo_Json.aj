// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.domain;

import com.darkhorse.getsporty.domain.Job;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Job_Roo_Json {
    
    public String Job.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Job.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Job Job.fromJsonToJob(String json) {
        return new JSONDeserializer<Job>()
        .use(null, Job.class).deserialize(json);
    }
    
    public static String Job.toJsonArray(Collection<Job> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Job.toJsonArray(Collection<Job> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Job> Job.fromJsonArrayToJobs(String json) {
        return new JSONDeserializer<List<Job>>()
        .use("values", Job.class).deserialize(json);
    }
    
}