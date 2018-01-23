package com.twiio.good.service.domain;

public class Currency {


	private int currencyNo;
	private int result; //��ȸ ���
	private String cur_unit;//��ȭ�ڵ�
	private String ttb;//����ȯ(�۱�)�����Ƕ�
	private String tts; //����ȯ(�۱�)�����Ƕ�
	private String deal_bas_r;//�Ÿ� ������
	private String bkpr;//��ΰ���
	private String yy_efee_r;//��ȯ������
	private String ten_dd_efee_r;//10��ȯ������
	private String kftc_bkpr;//����ܱ�ȯ�߰���ΰ���
	private String kftc_deal_bas_r;//����ܱ�ȯ�߰�Ÿű�����
	private String cur_nm;//����/��ȭ��
	private String regDate;
	
	public Currency() {
	}
	
	public Currency(int result, String cur_unit, String ttb,  String tts, String deal_bas_r,
			String bkpr,String yy_efee_r, String ten_dd_efee_r ,String kftc_bkpr,  String kftc_deal_bas_r, String cur_nm) {
		
		this.result = result;
		this.cur_unit = cur_unit;
		this.ttb = ttb;
		this.tts = tts;
		this.deal_bas_r = deal_bas_r;
		this.bkpr = bkpr;
		this.yy_efee_r = yy_efee_r;
		this.ten_dd_efee_r = ten_dd_efee_r;
		this.kftc_bkpr = kftc_bkpr;
		this.kftc_deal_bas_r = kftc_deal_bas_r;
		this.cur_nm = cur_nm;
			
	}


	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getCur_unit() {
		return cur_unit;
	}

	public void setCur_unit(String cur_unit) {
		this.cur_unit = cur_unit;
	}

	public String getTtb() {
		return ttb;
	}

	public void setTtb(String ttb) {
		this.ttb = ttb;
	}

	public String getTts() {
		return tts;
	}

	public void setTts(String tts) {
		this.tts = tts;
	}

	public String getDeal_bas_r() {
		return deal_bas_r;
	}

	public void setDeal_bas_r(String deal_bas_r) {
		this.deal_bas_r = deal_bas_r;
	}

	public String getBkpr() {
		return bkpr;
	}

	public void setBkpr(String bkpr) {
		this.bkpr = bkpr;
	}

	public String getYy_efee_r() {
		return yy_efee_r;
	}

	public void setYy_efee_r(String yy_efee_r) {
		this.yy_efee_r = yy_efee_r;
	}

	public String getTen_dd_efee_r() {
		return ten_dd_efee_r;
	}

	public void setTen_dd_efee_r(String ten_dd_efee_r) {
		this.ten_dd_efee_r = ten_dd_efee_r;
	}

	public String getKftc_bkpr() {
		return kftc_bkpr;
	}

	public void setKftc_bkpr(String kftc_bkpr) {
		this.kftc_bkpr = kftc_bkpr;
	}

	public String getKftc_deal_bas_r() {
		return kftc_deal_bas_r;
	}

	public void setKftc_deal_bas_r(String kftc_deal_bas_r) {
		this.kftc_deal_bas_r = kftc_deal_bas_r;
	}

	public String getCur_nm() {
		return cur_nm;
	}

	public void setCur_nm(String cur_nm) {
		this.cur_nm = cur_nm;
	}
	
	public int getCurrencyNo() {
		return currencyNo;
	}

	public void setCurrencyNo(int currencyNo) {
		this.currencyNo = currencyNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String toString() {
		return "[��ȭ�ڵ�]"+cur_unit+"[�ŸŰ���]"+deal_bas_r+"[country]"+cur_nm;
	}


}
