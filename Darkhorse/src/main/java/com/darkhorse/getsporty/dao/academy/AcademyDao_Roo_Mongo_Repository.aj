// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.dao.academy;

import com.darkhorse.getsporty.dao.academy.AcademyDao;
import com.darkhorse.getsporty.domain.Academy;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect AcademyDao_Roo_Mongo_Repository {
    
    declare parents: AcademyDao extends PagingAndSortingRepository<Academy, BigInteger>;
    
    declare @type: AcademyDao: @Repository;
    
}
