// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.dao;

import com.darkhorse.getsporty.dao.UserDao;
import com.darkhorse.getsporty.domain.User;
import java.math.BigInteger;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

privileged aspect UserDao_Roo_Mongo_Repository {
    
    declare parents: UserDao extends PagingAndSortingRepository<User, BigInteger>;
    
    declare @type: UserDao: @Repository;
    
}