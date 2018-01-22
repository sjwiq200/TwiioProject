package com.twiio.good.service.common;

public abstract interface CommonService
{
  public abstract void addReport()
    throws Exception;

  public abstract void addReply()
    throws Exception;

  public abstract void addFriend()
    throws Exception;

  public abstract void listReport()
    throws Exception;

  public abstract void listReply()
    throws Exception;

  public abstract void listFriend()
    throws Exception;

  public abstract void deleteFriend()
    throws Exception;

  public abstract void deleteReply()
    throws Exception;

  public abstract void updateReply()
    throws Exception;

  public abstract void getReport()
    throws Exception;
}