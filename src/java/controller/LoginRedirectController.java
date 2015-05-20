/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Donations;
import model.HibernateUtil;
import model.Login;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
//import org.springframework.web.servlet.mvc.Controller;


/**
 *
 * @author Noman Rafi
 */
@Controller
public class LoginRedirectController {

         @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
   public ModelAndView loginform() {
      return new ModelAndView("loginRedirect", "command", new Login());
//       model.addAttribute("command", new Donations());
//        return "commeindex.htm#tallModelnts";
     
   }
   @RequestMapping(value = "/loginRe", method = RequestMethod.POST)
   public ModelAndView logincheck(@ModelAttribute("SpringWeb")Login login, 
   ModelMap model) {
       

             Session session = HibernateUtil.getSessionFactory().getCurrentSession();

      try
      {
         //Session session = HibernateUtil.getSessionFactory().getCurrentSession();
          session.beginTransaction();
          List result = (List<Login>)session.createQuery("from Login").list();
          session.getTransaction().commit();
          //System.out.println("Printing ...");
         // System.out.println(result);
          for (int i = 0; i < result.size(); i++) {
			System.out.println(result.get(i));
		}
          String uname = login.getUsername();
          String pass = login.getPassword();
          for (int i = 0; i < result.size(); i++) {
              Login user =(Login) result.get(i);
              if(user.getUsername().equals(uname) && user.getPassword().equals(pass) ){
                System.out.println("Match found!");
                return new ModelAndView(new RedirectView("/Test2/map"));
              }
              else{
                  System.out.println("NO Match found!");
                return new ModelAndView(new RedirectView("/Test2/loginFailed"));
              }
	}
       }
      catch (Exception e){
          e.printStackTrace();
          
      }
           
       return new ModelAndView(new RedirectView("/Test2/loginform"));
    }

}
