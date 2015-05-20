/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.Donations;
import model.HibernateUtil;
import model.Logs;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;
//import org.springframework.web.util.*;
/**
 *
 *
 * @author Noman Rafi
 */
@Controller
public class LogsController {
    
        @RequestMapping(value = "/logForm", method = RequestMethod.GET)
   public ModelAndView donationForm() {
       
       
      return new ModelAndView("logs", "command", new Logs());
//       model.addAttribute("command", new Donations());
//        return "commeindex.htm#tallModelnts";
     
   }
    
  @RequestMapping(value = "/addLog", method = RequestMethod.POST)
   public ModelAndView addDonation(@ModelAttribute("SpringWeb")Logs log, 
   ModelMap model) {
       

             Session session = HibernateUtil.getSessionFactory().getCurrentSession();
      try{
          //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
          session.beginTransaction();
          session.save(log);
          session.getTransaction().commit();          
      } catch (Exception e){
          session.getTransaction().rollback();
          e.printStackTrace();
      }
      
      return new ModelAndView(new RedirectView("/Test2/map"));
     
   }
    
}
