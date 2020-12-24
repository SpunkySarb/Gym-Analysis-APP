package fun.sarbzone.GymAnalysis.controller;


import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fun.sarbzone.GymAnalysis.dao.DatabaseConnectivity;
import fun.sarbzone.GymAnalysis.model.DatasetModel;

@org.springframework.stereotype.Controller
public class Controller {

    DatabaseConnectivity database = new DatabaseConnectivity();
    
    @RequestMapping("login")
    public String loginPage() {

        return "login.jsp";
    }

    @RequestMapping("dashboard")
    public ModelAndView dashboard(@RequestParam("userName") String username,
            @RequestParam("password") String password) {

        ModelAndView mv = new ModelAndView();

        if ((((username.contentEquals("paal") || username.contentEquals("Paal"))
                && (password.contentEquals("lubanaYenky")))
                || ((username.contentEquals("binda") || username.contentEquals("Binda"))
                        && (password.contentEquals("sarbSagar143")))) == false) {

            mv.setViewName("login.jsp");
            String error = "<br>\r\n" + "<p id=\"error\">Invalid Username or Password<br>\r\n"
                    + "Please try correct UserName and Password </p>\r\n" + "<br>";
            mv.addObject("error", error);

        } else if ((username.contentEquals("paal") || username.contentEquals("Paal"))
                && (password.contentEquals("lubanaYenky"))) {
            mv.setViewName("dashboard.jsp");
            mv.addObject("name", username + " ji");
            mv.addObject("passwordYes", password + "Yes");
            mv.addObject("passwordNo", password + "No");
            mv.addObject("paalData", readData(database.readUserData("Paal")));
            mv.addObject("bindaData", readData(database.readUserData("Binda")));

            
            
        } else if ((username.contentEquals("binda") || username.contentEquals("Binda"))
                && (password.contentEquals("sarbSagar143"))) {
            mv.setViewName("dashboard.jsp");
            mv.addObject("name", username + " ji");
            mv.addObject("passwordYes", password + "Yes");
            mv.addObject("passwordNo", password + "No");
            mv.addObject("paalData", readData(database.readUserData("Paal")));
            mv.addObject("bindaData", readData(database.readUserData("Binda")));
        }

        return mv;
    }

    
    
   
    @RequestMapping("response")
    public ModelAndView no(@RequestParam("input") String response){
        
        String userName="";
        if(response.contentEquals("lubanaYenkyYes")|| response.contentEquals("lubanaYenkyNo") ) {
            userName="Paal";
        }else if(response.contentEquals("sarbSagar143Yes")|| response.contentEquals("sarbSagar143No") ) {
            userName="Binda";
        }
        
        ArrayList<DatasetModel> list = database.readUserData(userName);
        
        int day= list.get(list.size()-1).getDays()+1;
        int yAxis=0;
        if(response.contentEquals("lubanaYenkyYes")) {
            yAxis= list.get(list.size()-1).getyAxis()+1;
        }else if(response.contentEquals("lubanaYenkyNo")) {
            yAxis= list.get(list.size()-1).getyAxis()-1;

        }else if(response.contentEquals("sarbSagar143No")) {
            yAxis= list.get(list.size()-1).getyAxis()-1;

        }else if(response.contentEquals("sarbSagar143Yes")) {
            yAxis= list.get(list.size()-1).getyAxis()+1;

        }
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.now();
       String today = (dtf.format(localDate));
        
        
ModelAndView mv = new ModelAndView();

database.addData(userName, day, yAxis, today);

if(database.getErrorReport()==0) {
mv.setViewName("dashboard2.jsp");
mv.addObject("paalData", readData(database.readUserData("Paal")));
mv.addObject("bindaData", readData(database.readUserData("Binda")));

} else if(database.getErrorReport()==1) {
    mv.setViewName("error.jsp");
    
}



        
        return mv;
        
        
        
    }
 

    
   public String readData(ArrayList<DatasetModel> dataset) {
       
       String data="";
       
       for (DatasetModel x : dataset) {
        
           data=data+"{x: 'Day "+x.getDays()+"', y: "+x.getyAxis()+"},";
           
           
    }
       
       
       
       
       return data;
   }
    
    
    
}
