package com.twiio.good.service.common.impl;

import com.twiio.good.service.common.CommonDao;
import com.twiio.good.service.common.CommonService;
import java.io.PrintStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("commonServiceImpl")
public class CommonServiceImpl implements CommonService{

  @Autowired
  @Qualifier("commonDaoImpl")
  private CommonDao commonDao;

  public void setCommonDao(CommonDao commonDao)
  {
    this.commonDao = commonDao;
  }

  public CommonServiceImpl()
  {
    System.out.println(getClass());
  }

  public void addReport() throws Exception
  {
  }

  public void addReply() throws Exception
  {
  }

  public void addFriend() throws Exception
  {
  }

  public void listReport() throws Exception
  {
  }

  public void listReply() throws Exception
  {
  }

  public void listFriend() throws Exception
  {
  }

  public void deleteFriend() throws Exception
  {
  }

  public void deleteReply() throws Exception
  {
  }

  public void updateReply() throws Exception
  {
  }

  public void getReport() throws Exception
  {
  }
}