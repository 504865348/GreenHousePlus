package com.gh.greenhouse.domain;

/**模型库
 * @author Danny
 *
 */
public class ModelBase {

	/**
	 * 模型编号
	 */
	private Integer Model_id;
	
	/**
	 * 模型名称
	 */
	private String Model_name;
	
	/**
	 * 模型类别
	 * 3-作物模型
		2-环境模型
		1-成本模型
		0-优化控制模型
	 */
	private Integer Monitor_type;
	
	/**
	 * 存储地址
	 */
	private String Monitor_path;
	
	/**
	 * 函数名称
	 */
	private String Function;
	
	/**
	 * 输入参数（XML文件地址）
	 */
	private String Input;
	
	/**
	 * 输出参数（XML）
	 */
	private String Output;
	
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

	public Integer getModel_id() {
		return Model_id;
	}

	public void setModel_id(Integer model_id) {
		Model_id = model_id;
	}

	public String getModel_name() {
		return Model_name;
	}

	public void setModel_name(String model_name) {
		Model_name = model_name;
	}

	public Integer getMonitor_type() {
		return Monitor_type;
	}

	public void setMonitor_type(Integer monitor_type) {
		Monitor_type = monitor_type;
	}

	public String getMonitor_path() {
		return Monitor_path;
	}

	public void setMonitor_path(String monitor_path) {
		Monitor_path = monitor_path;
	}

	public String getFunction() {
		return Function;
	}

	public void setFunction(String function) {
		Function = function;
	}

	public String getInput() {
		return Input;
	}

	public void setInput(String input) {
		Input = input;
	}

	public String getOutput() {
		return Output;
	}

	public void setOutput(String output) {
		Output = output;
	}
	
}
