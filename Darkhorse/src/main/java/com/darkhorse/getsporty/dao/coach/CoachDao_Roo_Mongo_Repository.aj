// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.dao.coach;

import com.darkhorse.getsporty.dao.coach.CoachDao;
import com.darkhorse.getsporty.domain.Coach;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect CoachDao_Roo_Mongo_Repository {
    
    declare parents: CoachDao extends PagingAndSortingRepository<Coach, BigInteger>;
    
    declare @type: CoachDao: @Repository;
    
}
