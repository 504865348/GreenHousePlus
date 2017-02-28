package com.gh.core.domain;
/**
 * 推送消息
 * @author 吴奇俊
 * 2015-11-6 下午8:26:37
 */
public class Information {
	/**
	 * 编号
	 */
private Integer ID;
/**
 * 产生时间	
 */
private java.util.Date Mess_time;
/**
 * 内容
 */
private String Message;
/**
 * 类型
 * 0-系统提醒
 * 1-系统故障
 * 2-设备故障
 */
private Integer Mess_type;
/**
 * 是否处理
 * 0-否
 * 1-是
 */
private Integer Deal;

public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public java.util.Date getMess_time() {
		return Mess_time;
	}
	public void setMess_time(java.util.Date mess_time) {
		Mess_time = mess_time;
	}
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public Integer getMess_type() {
		return Mess_type;
	}
	public void setMess_type(Integer mess_type) {
		Mess_type = mess_type;
	}
	public Integer getDeal() {
		return Deal;
	}
	public void setDeal(Integer deal) {
		Deal = deal;
	}

}
