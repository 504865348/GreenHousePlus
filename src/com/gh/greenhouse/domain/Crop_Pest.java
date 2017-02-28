package com.gh.greenhouse.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 农药使用信息
 * @author 吴奇俊
 * 2015-10-18 下午7:03:44
 */
public class Crop_Pest {
	
/**
 * 农作物批次号
 */
private String Crop_no;

/**
 * 农药编号
 */
private Integer Pest_id;

/**
 * 农药数量
 */
private String Pest_num;

/**
 * 施用时间
 */
@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
private java.util.Date Pest_time;

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

public String getCrop_no() {
	return Crop_no;
}
public void setCrop_no(String crop_no) {
	Crop_no = crop_no;
}
public Integer getPest_id() {
	return Pest_id;
}
public void setPest_id(Integer pest_id) {
	Pest_id = pest_id;
}
public String getPest_num() {
	return Pest_num;
}
public void setPest_num(String pest_num) {
	Pest_num = pest_num;
}
public java.util.Date getPest_time() {
	return Pest_time;
}
public void setPest_time(java.util.Date pest_time) {
	Pest_time = pest_time;
}



}
