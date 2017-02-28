package com.gh.greenhouse.domain;

import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.gh.core.domain.User;

/**
 * 温室信息
 * 
 * @author 吴奇俊 2015-10-18 下午7:18:07
 */
public class Greenhouse {

	/**
	 * 温室编号
	 */
	private Integer GH_id;

	/**
	 * 温室代号 "01","02"两位数
	 */
	private String GH_code;

	/**
	 * 温室面积
	 */
	private String GH_area;

	/**
	 * 建造时间
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.util.Date GH_build;

	/**
	 * 温室类型 1-文洛型温室 2-连栋温室 3-单栋温室 4-日光温室 0-其他
	 */
	private Integer GH_type;

	/**
	 * 覆盖材料 1-玻璃 2-塑料薄膜 3-PC板 0-其他
	 */
	private String Cover;

	/**
	 * 高度
	 */
	private String Height;

	/**
	 * 跨度
	 */
	private String Span;

	/**
	 * 跨数
	 */
	private String Num_span;

	/**
	 * 开间
	 */
	private String Bay;

	/**
	 * 开间数
	 */
	private String Num_bay;

	/**
	 * 备注
	 */
	private String Remark;

	/**
	 * 基地编号
	 */
	private Integer Base_id;

	/**
	 * 温室管理员编号
	 */
	private Integer User_id;

	/**
	 * 是否被删除
	 */
	private String deleted;

	/**
	 * 温室作物
	 */
	private ShedCrop crop;

	/**
	 * 温室检测类型和元素，按类型区分
	 */
	private List<TypeAndElements> typeAndElements;

	/**
	 * 室外检测设备
	 */
	private List<SetupCon> setupCons;
	
	private User user;
	
	/**
	 * 当前控制模式
	 */
	private Integer control_mode;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public Integer getGH_id() {
		return GH_id;
	}

	public void setGH_id(Integer gH_id) {
		GH_id = gH_id;
	}

	public String getGH_code() {
		return GH_code;
	}

	public void setGH_code(String gH_code) {
		GH_code = gH_code;
	}

	public String getGH_area() {
		return GH_area;
	}

	public void setGH_area(String gH_area) {
		GH_area = gH_area;
	}

	public java.util.Date getGH_build() {
		return GH_build;
	}

	public void setGH_build(java.util.Date gH_build) {
		GH_build = gH_build;
	}

	public Integer getGH_type() {
		return GH_type;
	}

	public void setGH_type(Integer gH_type) {
		GH_type = gH_type;
	}

	public String getCover() {
		return Cover;
	}

	public void setCover(String cover) {
		Cover = cover;
	}

	public String getHeight() {
		return Height;
	}

	public void setHeight(String height) {
		Height = height;
	}

	public String getSpan() {
		return Span;
	}

	public void setSpan(String span) {
		Span = span;
	}

	public String getNum_span() {
		return Num_span;
	}

	public void setNum_span(String num_span) {
		Num_span = num_span;
	}

	public String getBay() {
		return Bay;
	}

	public void setBay(String bay) {
		Bay = bay;
	}

	public String getNum_bay() {
		return Num_bay;
	}

	public void setNum_bay(String num_bay) {
		Num_bay = num_bay;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public Integer getBase_id() {
		return Base_id;
	}

	public void setBase_id(Integer base_id) {
		Base_id = base_id;
	}

	public Integer getUser_id() {
		return User_id;
	}

	public void setUser_id(Integer user_id) {
		User_id = user_id;
	}

	public ShedCrop getCrop() {
		return crop;
	}

	public void setCrop(ShedCrop crop) {
		this.crop = crop;
	}

	public List<SetupCon> getSetupCons() {
		return setupCons;
	}

	public void setSetupCons(List<SetupCon> setupCons) {
		this.setupCons = setupCons;
	}

	public Integer getControl_mode() {
		return control_mode;
	}

	public void setControl_mode(Integer control_mode) {
		this.control_mode = control_mode;
	}

	public List<TypeAndElements> getTypeAndElements() {
		return typeAndElements;
	}

	public void setTypeAndElements(List<TypeAndElements> typeAndElements) {
		this.typeAndElements = typeAndElements;
	}

}
