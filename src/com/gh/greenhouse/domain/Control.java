package com.gh.greenhouse.domain;

/**
 * 设备状态信息
 * @author 吴奇俊 
 * 2015-10-18 下午6:48:00
 */
public class Control {

	/**
	 * 主键id
	 */
	private Integer ID;

	/**
	 * 设备编号
	 */
	private Integer Equip_id;

	/**
	 * 设备状态 0-关，1-开
	 */
	private Integer Con_stage;

	/**
	 * 时间
	 */
	private java.util.Date Control_time;
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

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public Integer getEquip_id() {
		return Equip_id;
	}

	public void setEquip_id(Integer equip_id) {
		Equip_id = equip_id;
	}

	public Integer getCon_stage() {
		return Con_stage;
	}

	public void setCon_stage(Integer con_stage) {
		Con_stage = con_stage;
	}

	public java.util.Date getControl_time() {
		return Control_time;
	}

	public void setControl_time(java.util.Date control_time) {
		Control_time = control_time;
	}

}
