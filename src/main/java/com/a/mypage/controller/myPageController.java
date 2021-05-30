package com.a.mypage.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a.dto.MemberDto;
import com.a.mypage.service.myPageService;

@Controller
public class myPageController {
   
   @Autowired
   myPageService myService;
   
   @RequestMapping(value="myMainPage.do", method = {RequestMethod.POST,RequestMethod.GET})
   public String myMainPage(){
      System.out.println("myMainPage로 넘어가기!");
      
      return "myPage/myMainPage";
   }
   
   @RequestMapping(value="myMainPage2.do", method = {RequestMethod.POST,RequestMethod.GET})
   public String myMainPage2(HttpSession session,Model model) throws Exception{
      System.out.println("myMainPage2로 넘어가기!");
      /*
      MemberDto memberInfo = (MemberDto)session.getAttribute("memberInfo");
      String email = memberInfo.getEmail();
      System.out.println("email ==>"+email);
      Map<String, Object> nowChallenge = myService.getNowCh(email);
      Integer nowPercent = Integer.parseInt(String.valueOf(nowChallenge.get("NOWCNT2"))) * 100 / Integer.parseInt(String.valueOf(nowChallenge.get("TOTAL")));
      System.out.println("nowPercent ==>"+nowPercent);
      model.addAttribute("nowPercent", nowPercent);
      */
      return "myPage/myMainPage2";
   }
}