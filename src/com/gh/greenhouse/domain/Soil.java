package com.gh.greenhouse.domain;

/**栽培土壤
 * @author Danny
 *
 */
public class Soil {

	/**
	 * id
	 */
	private Integer Soil_id;
	/**
	 * 名称
	 */
	private String Soil_name;
	/**
	 * 类型
	 */
	private String Soil_type;
	/**
	 * 其他说明
	 */
	private String Remark;
	
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
	public Integer getSoil_id() {
		return Soil_id;
	}
	public void setSoil_id(Integer soil_id) {
		Soil_id = soil_id;
	}
	public String getSoil_name() {
		return Soil_name;
	}
	public void setSoil_name(String soil_name) {
		Soil_name = soil_name;
	}
	public String getSoil_type() {
		return Soil_type;
	}
	public void setSoil_type(String soil_type) {
		Soil_type = soil_type;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
}
