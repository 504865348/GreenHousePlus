package com.gh.core.dao;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.util.WebUtils;

import com.gh.core.controller.LoginController;
import com.gh.core.domain.User;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;

/**
 * @author Danny
 *
 */
@Repository
public class UserDao extends BasicDao<User> {

	public UserDao() {
		super("user", User.class);
	}
	
	/**登录函数，并返回登录的用户对象，如果用户名不存在或者密码错误则返回null
	 * @param username
	 * @param password
	 * @return
	 */
	public User login(HttpServletRequest request,String username,String password){
		User u = super.load(Cnd.where("username", "=", username).and("password", "=", password));
		WebUtils.setSessionAttribute(request, LoginController.ME, u);
		return u;
	}
	
	/**获取当前登录用户
	 * @param request
	 * @return
	 */
	public User getCurrentUser(HttpServletRequest request){
		
		return (User) WebUtils.getSessionAttribute(request, LoginController.ME);
	}
	
	/**
	 * 根据用户Id查看用户信息
	 * @param id
	 * @return
	 */
	public User findByUserid(Integer userId){
		return super.load(Cnd.where("User_id","=",userId));
	}
	/**
	 * 根据pid查询用户
	 * @param pid
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public Pager<User> listByPid(Integer pid, Integer pageSize,
			Integer pageNumber) {
		return super.listByPage(
				Cnd.where("deleted", "=", "N").and("pid", "=", pid),
				pageSize, pageNumber);
	}
	
	/**获取用户的二级密码，如果未找到返回null
	 * @param userId
	 * @return
	 */
	public String getSecondPassword(Integer userId){
		User u = super.load(new String[]{"sec_password"}, Cnd.where("User_id","=",userId));
		if(null == u) return null;
		return u.getSec_password();
	}
}
