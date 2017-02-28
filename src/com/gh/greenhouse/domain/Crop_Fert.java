package com.gh.greenhouse.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 肥料使用信息
 * @author 吴奇俊
 * 2015-10-18 下午7:01:20
 */
public class Crop_Fert {
	
/**
 * 农作物批次号
 */
private String Crop_no;

/**
 * 肥料编号
 */
private Integer Fert_id;

private Fertilizer fertilizer;

/**
 * 肥料数量
 */
private String Fert_num;

/**
 * 施用时间
 */
@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
private java.util.Date Fert_time;
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
public Integer getFert_id() {
	return Fert_id;
}
public void setFert_id(Integer fert_id) {
	Fert_id = fert_id;
}
public String getFert_num() {
	return Fert_num;
}
public void setFert_num(String fert_num) {
	Fert_num = fert_num;
}
public java.util.Date getFert_time() {
	return Fert_time;
}
public void setFert_time(java.util.Date fert_time) {
	Fert_time = fert_time;
}

public Fertilizer getFertilizer() {
	return fertilizer;
}

public void setFertilizer(Fertilizer fertilizer) {
	this.fertilizer = fertilizer;
}


}
