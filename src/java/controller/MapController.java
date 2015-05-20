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
import model.Logs;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
//import org.springframework.web.servlet.mvc.Controller;

/**
 *
 * @author Noman Rafi
 */
@Controller
public class MapController {
    
    @RequestMapping(value="/map", method= RequestMethod.GET)
    public String showMap(ModelMap map) {
        
        System.out.println("in map");

      try
      {
          Session session = HibernateUtil.getSessionFactory().getCurrentSession();
          session.beginTransaction();
          List result = (List<Login>)session.createQuery("from Donations").list();
          map.put("donatetables", result);
          session.getTransaction().commit();
          System.out.println("");
         // System.out.println(result);
          
          for (int i = 0; i < result.size(); i++) {
			System.out.println(result.get(i));
		}
       }
      catch (Exception e){
          e.printStackTrace();
          
      }
        return "map";
    }

    @RequestMapping(value = "/deleteMarker", method = RequestMethod.POST)
    public ModelAndView deleteMarker(@RequestParam("json") String json,ModelMap log){
        json = json.replace("\"","");
        System.out.println(json);
       // ModelMap map = null;
         try
        {
         Session session = HibernateUtil.getSessionFactory().getCurrentSession();
          session.beginTransaction();
          List result = (List<Donations>)session.createQuery("from Donations where Id ="+json).list();
          //map.put("logintables", result);
          ;
          //System.out.println("Printing ...");
          Donations entry = new Donations();
          entry  = (Donations)result.get(0);
          System.out.println(entry.getName());
         // session.getTransaction().commit();
         // session.beginTransaction();
          Query query = session.createQuery("delete Donations where Id = :id");
            query.setParameter("id",json);
            int status = query.executeUpdate();
          //map.put("logintables", result);
            //ModelMap log = null;
            
            System.out.println("Before log.put..");
         // log.put("entry", result);
         session.getTransaction().commit();
            
            
                   
        }
      catch (Exception e){
          e.printStackTrace();
          
      }
        // return new ModelAndView("logs", "command", new Logs());
        // log.addAttribute("command", new Logs());
         //return "logs";
         //getServletContext().setAttribute("logEntry", json);
         return new ModelAndView(new RedirectView("/Test2/logForm"));
   }
}
