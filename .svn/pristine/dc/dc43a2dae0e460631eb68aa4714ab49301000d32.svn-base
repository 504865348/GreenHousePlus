package com.gh.greenhouse.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**栽培管理日志
 * @author Danny
 *
 */
public class Record {

	/**
	 * id
	 */
	private Integer Record_id;
	
	/**
	 * 种植批次
	 */
	private Integer Crop_no;
	
	/**
	 * 农作物生长描述
	 */
	private String Crop_caption;
	
	/**
	 * 栽培管理时间
	 */
	@DateTimeFormat(pattern="yyyy-dd-MM hh:mm:ss")
	private java.util.Date Record_time;
	
	/**
	 * 栽培管理内容
	 */
	private String Content;
	
	/**
	 * 管理人
	 */
	private String Record_user;
	
	/**
	 * 是否被删除
	 */
	private String deleted;

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public Integer getRecord_id() {
		return Record_id;
	}

	public void setRecord_id(Integer record_id) {
		Record_id = record_id;
	}

	public Integer getCrop_no() {
		return Crop_no;
	}

	public void setCrop_no(Integer crop_no) {
		Crop_no = crop_no;
	}

	public String getCrop_caption() {
		return Crop_caption;
	}

	public void setCrop_caption(String crop_caption) {
		Crop_caption = crop_caption;
	}

	public java.util.Date getRecord_time() {
		return Record_time;
	}

	public void setRecord_time(java.util.Date record_time) {
		Record_time = record_time;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public String getRecord_user() {
		return Record_user;
	}

	public void setRecord_user(String record_user) {
		Record_user = record_user;
	}
}
