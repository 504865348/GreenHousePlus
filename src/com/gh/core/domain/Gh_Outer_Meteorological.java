package com.gh.core.domain;

public class Gh_Outer_Meteorological {
	/**
	 * 温室id
	 */
private int base_id;
/**
 * 空气温度
 */
private String air_temperature;
/**
 * 空气湿度
 */
private String air_humidity;
/**
 * 二氧化碳浓度
 */
private String cd_thickness;
/**
 * 光照度
 */
private String illuminance;
/**
 * 风速
 */
private String wind_speed;
/**
 * 风向
 */
private String wind_direction;
/**
 * 雨量
 */
private String rainfall;
public int getBase_id() {
	return base_id;
}
public void setBase_id(int base_id) {
	this.base_id = base_id;
}
public String getAir_temperature() {
	return air_temperature;
}
public void setAir_temperature(String air_temperature) {
	this.air_temperature = air_temperature;
}
public String getAir_humidity() {
	return air_humidity;
}
public void setAir_humidity(String air_humidity) {
	this.air_humidity = air_humidity;
}
public String getCd_thickness() {
	return cd_thickness;
}
public void setCd_thickness(String cd_thickness) {
	this.cd_thickness = cd_thickness;
}
public String getIlluminance() {
	return illuminance;
}
public void setIlluminance(String illuminance) {
	this.illuminance = illuminance;
}
public String getWind_speed() {
	return wind_speed;
}
public void setWind_speed(String wind_speed) {
	this.wind_speed = wind_speed;
}
public String getWind_direction() {
	return wind_direction;
}
public void setWind_direction(String wind_direction) {
	this.wind_direction = wind_direction;
}
public String getRainfall() {
	return rainfall;
}
public void setRainfall(String rainfall) {
	this.rainfall = rainfall;
}
}
