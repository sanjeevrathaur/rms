// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.domain;

import com.darkhorse.getsporty.domain.Image;
import java.math.BigInteger;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;

privileged aspect Image_Roo_Mongo_Entity {
    
    declare @type: Image: @Persistent;
    
    @Id
    private BigInteger Image.id;
    
    public BigInteger Image.getId() {
        return this.id;
    }
    
    public void Image.setId(BigInteger id) {
        this.id = id;
    }
    
}
