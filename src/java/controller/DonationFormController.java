/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

//import java.net.BindException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import model.Donations;
import model.HibernateUtil;
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
 * @author Noman Rafi
 */
@Controller
//@RequestMapping(value = "/donation")
public class DonationFormController {
    
     @RequestMapping(value = "/donationform", method = RequestMethod.GET)
   public ModelAndView donationForm() {
      return new ModelAndView("donationform", "command", new Donations());
//       model.addAttribute("command", new Donations());
//        return "commeindex.htm#tallModelnts";
     
   }
   
   @RequestMapping(value = "/addDonation", method = RequestMethod.POST)
   public ModelAndView addDonation(@ModelAttribute("SpringWeb")Donations don, 
   ModelMap model) {
       

             Session session = HibernateUtil.getSessionFactory().getCurrentSession();
      try{
          //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
          session.beginTransaction();
          session.save(don);
          session.getTransaction().commit();          
      } catch (Exception e){
          session.getTransaction().rollback();
          e.printStackTrace();
      }
      
      return new ModelAndView(new RedirectView("/Test2/"));
     
   }
    
    
    
    
    
//    public DonationFormController(){
//        setCommandClass(Donations.class);
//        setCommandName("donations"); //Change to success page afterward
//       setSuccessView("index"); 
//        setFormView("donationform");
//    }
//    
//    @Override
//    protected ModelAndView onSubmit(Object command) throws Exception{
//      System.out.println("onsubmit called");
//      Donations don = (Donations) command;
//      Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//      try{
//          //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//          session.beginTransaction();
//          session.save(don);
//          session.getTransaction().commit();          
//      } catch (Exception e){
//          session.getTransaction().rollback();
//          e.printStackTrace();
//      }
//      
//      return new ModelAndView(new RedirectView("index.htm"));
//    } 
}
