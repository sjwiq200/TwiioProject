package com.twiio.good.web.common;

import com.twiio.good.service.common.CommonService;
import java.io.PrintStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/common/*"})
public class CommonController
{

  @Autowired
  @Qualifier("commonServiceImpl")
  private CommonService commonService;

  public CommonController()
  {
    System.out.println(getClass());
  }

  @RequestMapping(value={"addReport"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String addReport() throws Exception {
    System.out.println("/common/addReport : GET");
    return "forward:/common/addReport.jsp";
  }
  @RequestMapping(value={"addFriend"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String addFriend() throws Exception {
    System.out.println("/common/addFriend : GET");
    return "forward:/common/addFriend.jsp";
  }
  @RequestMapping(value={"addReply"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String addReply() throws Exception {
    System.out.println("/common/addReply : GET");
    return "forward:/common/addReply.jsp";
  }

  @RequestMapping(value={"listReport"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String listReport()
    throws Exception
  {
    System.out.println("/common/listReport : GET");
    return "forward:/common/listReport.jsp";
  }
  @RequestMapping(value={"listFriend"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String listFriend() throws Exception {
    System.out.println("/common/listFriend : GET");
    return "forward:/common/listFriend.jsp";
  }
  @RequestMapping(value={"listReply"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String listReply() throws Exception {
    System.out.println("/common/listReply : GET");
    return "forward:/common/listReply.jsp";
  }

  @RequestMapping(value={"getReport"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String getReport()
    throws Exception
  {
    System.out.println("/common/getReport : GET");
    return "forward:/common/getReport.jsp";
  }

  @RequestMapping(value={"deleteFriend"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String deleteFriend()
    throws Exception
  {
    System.out.println("/common/deleteFriend : GET");
    return "forward:/common/deleteFriend.jsp";
  }
  @RequestMapping(value={"deleteReply"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String deleteReply() throws Exception {
    System.out.println("/common/deleteReply : GET");
    return "forward:/common/deleteReply.jsp";
  }

  @RequestMapping(value={"updateReply"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String updateReply()
    throws Exception
  {
    System.out.println("/common/updateReply : GET");
    return "forward:/common/updateReply.jsp";
  }
}