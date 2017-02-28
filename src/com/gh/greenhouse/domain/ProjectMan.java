package com.gh.greenhouse.domain;

/**项目管理
 * @author Danny
 *
 */
public class ProjectMan {

	/**
	 * id
	 */
	private Integer Project_id;
	
	/**
	 * 项目名称
	 */
	private String Project_name;
	
	/**
	 * 项目类别
	 */
	private Integer Project_type;
	
	/**
	 * 模型编号
	 */
	private Integer Model_id;
	
	/**
	 * 父模型编号
	 */
	private Integer Father;
	
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

	public Integer getProject_id() {
		return Project_id;
	}

	public void setProject_id(Integer project_id) {
		Project_id = project_id;
	}

	public String getProject_name() {
		return Project_name;
	}

	public void setProject_name(String project_name) {
		Project_name = project_name;
	}

	public Integer getProject_type() {
		return Project_type;
	}

	public void setProject_type(Integer project_type) {
		Project_type = project_type;
	}

	public Integer getModel_id() {
		return Model_id;
	}

	public void setModel_id(Integer model_id) {
		Model_id = model_id;
	}

	public Integer getFather() {
		return Father;
	}

	public void setFather(Integer father) {
		Father = father;
	}
}
