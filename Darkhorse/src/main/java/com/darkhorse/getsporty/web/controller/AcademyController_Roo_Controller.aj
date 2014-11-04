// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.web.controller;

import com.darkhorse.getsporty.domain.Academy;
import com.darkhorse.getsporty.svc.UserSvc;
import com.darkhorse.getsporty.svc.academy.AcademySvc;
import com.darkhorse.getsporty.web.controller.AcademyController;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AcademyController_Roo_Controller {
    
    @Autowired
    AcademySvc AcademyController.academySvc;
    
    @Autowired
    UserSvc AcademyController.userSvc;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AcademyController.create(@Valid Academy academy, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, academy);
            return "academys/create";
        }
        uiModel.asMap().clear();
        academySvc.saveAcademy(academy);
        return "redirect:/academys/" + encodeUrlPathSegment(academy.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AcademyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Academy());
        return "academys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AcademyController.show(@PathVariable("id") BigInteger id, Model uiModel) {
        uiModel.addAttribute("academy", academySvc.findAcademy(id));
        uiModel.addAttribute("itemId", id);
        return "academys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AcademyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("academys", academySvc.findAcademyEntries(firstResult, sizeNo));
            float nrOfPages = (float) academySvc.countAllAcademys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("academys", academySvc.findAllAcademys());
        }
        return "academys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AcademyController.update(@Valid Academy academy, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, academy);
            return "academys/update";
        }
        uiModel.asMap().clear();
        academySvc.updateAcademy(academy);
        return "redirect:/academys/" + encodeUrlPathSegment(academy.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AcademyController.updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
        populateEditForm(uiModel, academySvc.findAcademy(id));
        return "academys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AcademyController.delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Academy academy = academySvc.findAcademy(id);
        academySvc.deleteAcademy(academy);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/academys";
    }
    
    void AcademyController.populateEditForm(Model uiModel, Academy academy) {
        uiModel.addAttribute("academy", academy);
        uiModel.addAttribute("users", userSvc.findAllUsers());
    }
    
    String AcademyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
