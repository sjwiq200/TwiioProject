package com.twiio.good.service.common;

public interface CommonDao
{
  public void addReport() throws Exception;

  public void addReply() throws Exception;

  public void addFriend() throws Exception;

  public void listReport() throws Exception;

  public void listReply() throws Exception;

  public void listFriend() throws Exception;

  public void deleteFriend() throws Exception;

  public void deleteReply() throws Exception;

  public void updateReply() throws Exception;

  public void getReport() throws Exception;
}