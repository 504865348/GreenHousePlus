package com.gh.greenhouse.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**温室作物信息
 * @author Danny
 *
 */
public class ShedCrop {

	/**农作物批次号
	 * 按温室代号+品种代号+育苗开始时间,如:010220150805
	 */
	private String Crop_no;
	
	/**
	 * 温室编号
	 */
	private Integer Shed_id;
	
	/**
	 * 农作物编号
	 */
	private Integer Crop_id;
	
	private Crop crop;
	
	/**
	 * 栽培面积
	 */
	private Double Crop_area;
	
	/**
	 * 栽培数量
	 */
	private Double Crop_num;
	
	/**
	 * 栽培土壤id
	 */
	private Integer Soil_id;
	
	private Soil soil;
	
	/**
	 * 栽培时间
	 */
	@DateTimeFormat(pattern="yyyy-dd-MM HH:mm:ss")
	private java.util.Date crop_time;
	
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

	public Integer getShed_id() {
		return Shed_id;
	}

	public void setShed_id(Integer shed_id) {
		Shed_id = shed_id;
	}

	public Integer getCrop_id() {
		return Crop_id;
	}

	public void setCrop_id(Integer crop_id) {
		Crop_id = crop_id;
	}

	public Double getCrop_area() {
		return Crop_area;
	}

	public void setCrop_area(Double crop_area) {
		Crop_area = crop_area;
	}

	public Double getCrop_num() {
		return Crop_num;
	}

	public void setCrop_num(Double crop_num) {
		Crop_num = crop_num;
	}

	public Integer getSoil_id() {
		return Soil_id;
	}

	public void setSoil_id(Integer soil_id) {
		Soil_id = soil_id;
	}

	public Crop getCrop() {
		return crop;
	}

	public void setCrop(Crop crop) {
		this.crop = crop;
	}

	public Soil getSoil() {
		return soil;
	}

	public void setSoil(Soil soil) {
		this.soil = soil;
	}

	public java.util.Date getCrop_time() {
		return crop_time;
	}

	public void setCrop_time(java.util.Date crop_time) {
		this.crop_time = crop_time;
	}
}
