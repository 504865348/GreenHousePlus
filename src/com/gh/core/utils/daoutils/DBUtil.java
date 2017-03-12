package com.gh.core.utils.daoutils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.gh.core.utils.JDBCUtils;


/**
 * 
 */
public class DBUtil<T> {

	private String tbName;
	
/*	private static String DB_URL="jdbc:oracle:thin:@localhost:1521:xe";
	private static String DB_USERNAME="DANNY";
	private static String DB_PASSWORD="804956748";
	private static String DB_DRIVER="oracle.jdbc.driver.OracleDriver";*/
	
	/**
	 */
	private Class<?> beanclass;

	public DBUtil(String tbName, Class<?> beanclass) {
		super();
		this.tbName = tbName;
		this.beanclass = beanclass;
	}

	/**
	 * 
	 * @return
	 */
	public static Connection getConnection() {

		Connection con = null;
		try {
			con = JDBCUtils.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

	/**閸忔娊妫存潻鐐村复鐎电钖�
	 * @param con
	 * @param ps
	 * @param rs
	 */
	public void closeConnection(Connection con,Statement ps,ResultSet rs) {

		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(null!= con)
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	/**
	 * 
	 * @param obj
	 * @return
	 */
	public int insert(T obj) {
		Connection con = getConnection();
		int ret = 0;

		StringBuilder insField = new StringBuilder(), insSymbol = new StringBuilder();
		BeanField[] fields = findFieldsOfBean(obj, true);

		int i_beanfields = 0;
		for (BeanField field : fields) {
			insField.append((i_beanfields == 0 ? "" : ",") + field.fieldName);
			insSymbol.append((i_beanfields == 0 ? "" : ",") + "?");
			i_beanfields++;
		}

		String preSql = "insert into " + tbName + "(" + insField + ") values("
				+ insSymbol + ")";
		PreparedStatement ps = null;

		System.out.println("==================[#SQL]========:========:"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);
			for (int i = 0, len = fields.length; i < len; i++) {
				DBUtil.setStatementVal(ps, i + 1, fields[i].fieldVal);
			}
			ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected.");
		return ret;
	}

	/**
	 * 
	 * @param cnd
	 * @return
	 * @see com.test.dbutil.Cnd
	 */
	public int delete(Cnd cnd) {
		Connection con = getConnection();
		int ret = 0;

		String preSql = "delete from " + tbName + cnd.toPreparedSql();
		PreparedStatement ps = null;

		System.out.println("=========[#SQL]========::"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);

			cnd.setAllStatementsVal(ps, 1);

			ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected.");
		return ret;
	}

	/**
	 * 闁哄洤鐡ㄩ弻濠囧箼瀹ュ嫮绋婇柨娑樼焷閸ゆ粓宕濋妸銉﹀闁伙綆娅瀠ll閻庢稒顨濋锟�	 * 
	 * @return
	 */
	public int update(T obj, Cnd cnd) {
		BeanField[] fields = findFieldsOfBean(obj, true);
		return _update(fields, cnd);
	}
	
	public int updatePass(int userid,String newpass) {
		return _updatePass(userid, newpass);
	}
	
	public int updateMode(int userid,String control_mode) {
		return _updateMode(userid, control_mode);
	}
	
	public int update(Map<String,?> param, Cnd cnd) {
		BeanField[] fields = findFieldsOfMap(param);
		return _update(fields, cnd);
	}
	
	/**
	 * 袁健炜 2017-2-28 night add
	 */
	public int update_devie(String ghid,String modify_device_value) {
		 return _update_device_status(ghid, modify_device_value);
	}
	
	/**
	 * 袁健炜 2017-2-28 night add
	 */
	public int update_setting(String ghid,String modify_device_value) {
		 return _update_device_setting(ghid, modify_device_value);
	}
	/**
	 * 袁健炜 2017-2-28 night add
	 */
	public int update_crop_info(String ghid,String corp_id,String name,String code,String type,String date) {
		 return _update_crop_info(ghid, corp_id,name,code,type,date);
	}
	
	/**
	 * 袁健炜 2017-2-28 night add
	 */
	public int update_irr(String base_id,String modify_device_value) {
		 return _update_irr(base_id, modify_device_value);
	}
	
	/**update私有函数
	 * @param fields
	 * @param cnd
	 * @return
	 */
	private int _update(BeanField[] fields, Cnd cnd){
		Connection con = getConnection();
		int ret = 0;

		String setState = "", whereClause = cnd.toPreparedSql();
		

		for (int i = 0, len = fields.length; i < len; i++) {
			setState += (i == 0 ? "" : ",") + fields[i].fieldName + "=?";
		}

		String preSql = "update " + tbName + " set " + setState + whereClause;
		PreparedStatement ps = null;

		System.out.println("=========[#SQL]========::"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);
			for (int i = 0, len = fields.length; i < len; i++) {
				DBUtil.setStatementVal(ps, i + 1, fields[i].fieldVal);
			}

			cnd.setAllStatementsVal(ps, fields.length + 1);

			ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected.");
		return ret;
	}
	
	/*
	 * 袁健炜 2017-2-28 night add
	 */
	/**update私有函数
	 * @param fields
	 * @param cnd
	 * @return
	 */
	private int _updatePass(int userid,String newpass){
		Connection con = getConnection();
		int ret = 0;

		String preSql = "update user set Password='"+newpass +"' where User_id='"+userid+"'";
		PreparedStatement ps = null;

		System.out.println("=========[#SQL]========::"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);
			ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected.");
		return ret;
	}
	
	/*
	 * 袁健炜 2017 -3-4  night add
	 */
	/**update私有函数
	 * @param fields
	 * @param cnd
	 * @return
	 */
	private int _updateMode(int ghid,String control_mode){
		Connection con = getConnection();
		int ret = 0;

		String preSql = "update greenhouse set control_mode='"+control_mode +"' where GH_id='"+ghid+"'";
		PreparedStatement ps = null;

		System.out.println("=========[#SQL]========::"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);
			ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected.");
		return ret;
	}
	/**update私有函数
	 * @param fields
	 * @param cnd
	 * @return
	 */
	private int _update_device_status(String ghid,String  modify_device_value){
		// 传递的参数比如为：外遮阳电机:0;天窗:0;
		Connection con = getConnection();
		int ret = 0;
        int para_length = modify_device_value.length()-1;
		String[] modify_device_value_list = modify_device_value.substring(0, para_length).split(";");
		// 外遮阳电机:0    天窗:0
		String sql_one = "";
		String sql_two="";
	    for(int i=0;i<modify_device_value_list.length;i++){
	    	String[] first_split = modify_device_value_list[i].toString().split(":");
	    	sql_one +=  " WHEN '" +first_split[0].toString()+"' THEN " +first_split[1].toString();
	        sql_two +="'"+ first_split[0].toString() +"',";
	    }
        
		String preSql ="UPDATE setup_con SET Control = CASE Name " + sql_one +" END WHERE Name IN (" +sql_two.substring(0, sql_two.length()-1)+" ) and GH_id="+ghid;
		PreparedStatement ps = null;

		System.out.println("=========[#SQL]========::"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);
		    ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected."); 
		return ret;
	}
	
	/*
	 * 袁健炜 2017-3-1 night add
	 */

	/**update私有函数
	 * @param fields
	 * @param cnd
	 * @return
	 */
	private int _update_device_setting(String ghid,String  modify_device_value){
		// 传递的参数比如为：外遮阳电机:0;天窗:0;
		Connection con = getConnection();
		int ret = 0;
		String updateSQL = "";
		String[] all_updateValue_list = modify_device_value.split("&&&");
		for(int i=0;i<all_updateValue_list.length;i++){
			System.out.println("对应的值为"+all_updateValue_list[i]);
		}
		String[] one_split = all_updateValue_list[0].split(";");
		updateSQL += "period_one_start = '" + one_split[0] + "',period_one_end='" + one_split[1] + "',period_one_wd='"+one_split[2] +"',period_one_sd='"+ one_split[3] +"',period_one_gzd='"+ one_split[4] +"',period_one_nd='" +one_split[5]+"'";
		
		String[] two_split = all_updateValue_list[0].split(";");
		updateSQL += ",period_two_start = '" + two_split[0] + "',period_two_end='" + two_split[1] + "',period_two_wd='"+two_split[2] +"',period_two_sd='"+ two_split[3] +"',period_two_gzd='"+ two_split[4] +"',period_two_nd='" +two_split[5]+"'";
		
		String[] three_split = all_updateValue_list[0].split(";");
		updateSQL += ",period_three_start = '" + three_split[0] + "',period_three_end='" + three_split[1] + "',period_three_wd='"+three_split[2] +"',period_three_sd='"+ three_split[3] +"',period_three_gzd='"+ three_split[4] +"',period_three_nd='" +three_split[5]+"'";
		
		String[] four_split = all_updateValue_list[0].split(";");
		updateSQL += ",period_four_start = '" + four_split[0] + "',period_four_end='" + four_split[1] + "',period_four_wd='"+four_split[2] +"',period_four_sd='"+ four_split[3] +"',period_four_gzd='"+ four_split[4] +"',period_four_nd='" +four_split[5]+"'";
        
		String preSql ="UPDATE gh_setting_control SET " + updateSQL +" where gh_id="+ghid;
		PreparedStatement ps = null;

		System.out.println("=========[#SQL]========::"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);
		    ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected."); 
		return ret;
	}
	
	/**update私有函数
	 * @param fields
	 * @param cnd
	 * @return
	 */
	private int _update_crop_info(String ghid,String corp_id,String name,String code,String type,String date){
		// 传递的参数比如为：外遮阳电机:0;天窗:0;
		Connection con = getConnection();
		int ret = 0;
		String preSql ="UPDATE crop SET Crop_name='" + name +"',Crop_type='"+type+"',Crop_date='"+date+"' where Crop_id="+corp_id;
		PreparedStatement ps = null;

		System.out.println("=========[#SQL]========::"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);
		    ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected."); 
		return ret;
	}
	/*
	 * 袁健炜 2017-3-1 day add
	 */

	/**update私有函数
	 * @param fields
	 * @param cnd
	 * @return
	 */
	private int _update_irr(String base_id,String  modify_device_value){
		// 传递的参数比如为：外遮阳电机:0;天窗:0;
		Connection con = getConnection();
		int ret = 0;
		
		String preSql ="update irrigation_fertilization_information set "+ modify_device_value +"  where base_id="+base_id;
		PreparedStatement ps = null;

		System.out.println("=========[#SQL]========::"+preSql.toUpperCase());
		try {
			ps = con.prepareStatement(preSql);
		    ret = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		closeConnection(con,ps,null);
		System.out.println(ret + " colum(s) effected."); 
		return ret;
	}
	
	/**闁哄被鍎撮…鍧楁晬瀹�拷娼岄柡鍫濐樆閸ら亶寮敓绲歯d濞戞捁娅ｉ埞鏍蓟閵夘煈鍤勯柟纰夋嫹濠�拷
	 * @param selectCols
	 * @param selectAll
	 * @param cnd
	 * @return
	 */
	private List<T> _list_mon(int ghId,int elementType,int pageSize,int pageNumber) {
		List<T> result = new ArrayList<T>();
		Connection con = getConnection();
		 
		
		String  preSql = "select * from   mon_"+ghId+"_"+elementType +" Order by control_time  DESC  limit 1,20 ";
		 
		PreparedStatement ps = null;
		ResultSet rs = null;

		System.out.println("=========[#SQL]========::"+preSql);
		try {
			ps = con.prepareStatement(preSql);
			rs = ps.executeQuery();
			while(rs.next()){
				result.add(getBeanFromResultSet(rs));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(result.size() + " record(s) listed.");
		return result;
	}
	
	/**闁哄被鍎撮…鍧楁晬瀹�拷娼岄柡鍫濐樆閸ら亶寮敓绲歯d濞戞捁娅ｉ埞鏍蓟閵夘煈鍤勯柟纰夋嫹濠�拷
	 * @param selectCols
	 * @param selectAll
	 * @param cnd
	 * @return
	 */
	private List<T> _list(String[] selectCols,Cnd cnd,boolean pager,int pageSize,int pageNumber) {
		List<T> result = new ArrayList<T>();
		Connection con = getConnection();
		
		String colsStr = selectCols == null?"*":Utils.joinString(selectCols, ",");
		String preSql = "";
		
		preSql += "select "+colsStr+" from " + tbName + (null == cnd ?"":cnd.toPreparedSql());
		
		if(pager){
			preSql += " limit "+(pageNumber-1)*pageSize+","+pageSize+" ";
		}
		
		PreparedStatement ps = null;
		ResultSet rs = null;

		System.out.println("=========[#SQL]========::"+preSql);
		try {
			ps = con.prepareStatement(preSql);
			if(null!=cnd) cnd.setAllStatementsVal(ps, 1);
			rs = ps.executeQuery();
			while(rs.next()){
				result.add(getBeanFromResultSet(rs));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		closeConnection(con,ps,rs);
		System.out.println(result.size() + " record(s) listed.");
		return result;
	}
	
	
	/**闁哄被鍎撮…鍧楁晬瀹�拷娼岄柡鍫濐樆閸ら亶寮敓绲歯d濞戞捁娅ｉ埞鏍蓟閵夘煈鍤勯柟纰夋嫹濠�拷
	 * @param selectCols
	 * @param selectAll
	 * @param cnd
	 * @return
	 */
	private List<T> _list_nolimit(String[] selectCols,Cnd cnd,boolean pager) {
		List<T> result = new ArrayList<T>();
		Connection con = getConnection();
		
		String colsStr = selectCols == null?"*":Utils.joinString(selectCols, ",");
		String preSql = "";
		
		preSql += "select "+colsStr+" from " + tbName + (null == cnd ?"":cnd.toPreparedSql());
		 
		
		PreparedStatement ps = null;
		ResultSet rs = null;

		System.out.println("=========[#SQL]========::"+preSql);
		try {
			ps = con.prepareStatement(preSql);
			if(null!=cnd) cnd.setAllStatementsVal(ps, 1);
			rs = ps.executeQuery();
			while(rs.next()){
				result.add(getBeanFromResultSet(rs));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		closeConnection(con,ps,rs);
		System.out.println(result.size() + " record(s) listed.");
		return result;
	}
	/**返回list&lt;map>结果集
	 * @param selectCols
	 * @param cnd
	 * @param pager
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	private List<Mapper> _listMap(String[] selectCols,Cnd cnd,boolean pager,int pageSize,int pageNumber){
		List<Mapper> result = new ArrayList<Mapper>();
		Connection con = getConnection();
		
		String colsStr = selectCols == null?"*":Utils.joinString(selectCols, ",");
		String preSql = "";
		
		preSql += "select "+colsStr+" from " + tbName + (null == cnd ?"":cnd.toPreparedSql());
		
		if(pager){
			preSql += " limit "+(pageNumber-1)*pageSize+","+pageSize+" ";
		}
		
		PreparedStatement ps = null;
		ResultSet rs = null;

		System.out.println("=========[#SQL]========::"+preSql);
		try {
			ps = con.prepareStatement(preSql);
			if(null!=cnd) cnd.setAllStatementsVal(ps, 1);
			rs = ps.executeQuery();
			while(rs.next()){
				
				result.add(getMapperFromResultSet(rs));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		closeConnection(con,ps,rs);
		System.out.println(result.size() + " record(s) listed.");
		return result;
	}
	
	
	/**返回list&lt;map>结果集
	 * @param selectCols
	 * @param cnd
	 * @param pager
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	private List<Mapper> _listMap_nolimit(String[] selectCols,Cnd cnd,boolean pager){
		List<Mapper> result = new ArrayList<Mapper>();
		Connection con = getConnection();
		
		String colsStr = selectCols == null?"*":Utils.joinString(selectCols, ",");
		String preSql = "";
		
		preSql += "select "+colsStr+" from " + tbName + (null == cnd ?"":cnd.toPreparedSql());
		
		PreparedStatement ps = null;
		ResultSet rs = null;

		System.out.println("=========[#SQL]========::"+preSql);
		try {
			ps = con.prepareStatement(preSql);
			if(null!=cnd) cnd.setAllStatementsVal(ps, 1);
			rs = ps.executeQuery();
			while(rs.next()){
				
				result.add(getMapperFromResultSet(rs));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		closeConnection(con,ps,rs);
		System.out.println(result.size() + " record(s) listed.");
		return result;
	}
	
	/**
	 * @param cnd
	 * @return
	 */
	public List<T> list(Cnd cnd) {
		return _list(null,cnd,false,0,0);
	}
	
	public List<Mapper> listMap(Cnd cnd){
		return _listMap(null,cnd,false,0,0);
	}
	
	/**
	 * @param cnd
	 * @return
	 */
	public List<T> list(String[] selectCols,Cnd cnd) {
		return _list(selectCols,cnd,false,0,0);
	}
	public List<Mapper> listMap(String[] selectCols,Cnd cnd) {
		return _listMap(selectCols,cnd,false,0,0);
	}
	
	public List<T> listByPage_mon(int ghId,int elementType,int pageSize,int pageNumber){
		return _list_mon(ghId,elementType, pageSize, pageNumber);
	}
	
	public List<T> listByPage(Cnd cnd,int pageSize,int pageNumber){
		return _list(null,cnd,true,pageSize,pageNumber);
	}
	
	public List<T> listByPage_nolimt(Cnd cnd){
		return _list_nolimit(null,cnd,true);
	}
	
	public List<Mapper> listMapByPage(Cnd cnd,int pageSize,int pageNumber){
		return _listMap(null,cnd,true,pageSize,pageNumber);
	}
	
	public List<Mapper> listMapByPage_nolimt(Cnd cnd){
		return _listMap_nolimit(null,cnd,true);
	}
	
	public List<T> listByPage(String[] selectCols,Cnd cnd,int pageSize,int pageNumber){
		return _list(selectCols,cnd,true,pageSize,pageNumber);
	}
	public List<Mapper> listMapByPage(String[] selectCols,Cnd cnd,int pageSize,int pageNumber){
		return _listMap(selectCols,cnd,true,pageSize,pageNumber);
	}
	
	public List<Mapper> listMapByPage_nolimit(String[] selectCols,Cnd cnd){
		return _listMap_nolimit(selectCols,cnd,true);
	}
	
	
	/**鐎垫壆锟絜sultset濞戞搩鍘艰ぐ鍥礄缁拷va bean闁圭鎷峰〒鍓佹啺娴ｇ儤鐣遍悗娑欘殱椤斿矂鏁嶅畝鍐闁搞儳鍋為弻濠囨儍閸掔棏va bean
	 * @param rs
	 * @return java bean object
	 */
	@SuppressWarnings("unchecked")
	private T getBeanFromResultSet(ResultSet rs){
		T bean = null;
		try {
			bean = (T) beanclass.newInstance();
			Method[] methods = beanclass.getDeclaredMethods(); // public闁哄倽顬冪涵锟�			
			for (Method m : methods) {
				String methodName = m.getName();
				if (methodName.startsWith("set")) {
					String fakeFieldName = methodName.substring(3);
					String fieldName =fakeFieldName.substring(0,1).toLowerCase()+fakeFieldName.substring(1);
					Class<?> fieldType = m.getParameterTypes()[0];
					
					try{
						Object setVal = null;
						if(fieldType == String.class){
							setVal = rs.getString(fieldName);
						}
						else if(fieldType == Integer.class || fieldType==int.class){
							setVal = rs.getInt(fieldName);
						}
						else if(fieldType == Double.class || fieldType==double.class){
							setVal = rs.getDouble(fieldName);
						}
						else if(fieldType == java.util.Date.class){
							if(rs.getTimestamp(fieldName) == null ) setVal = null;
							else setVal = new java.util.Date( rs.getTimestamp(fieldName).getTime());
						}
						else if(fieldType == java.sql.Date.class){
							setVal = rs.getDate(fieldName);
						}
						System.out.print("["+fieldName+"]:"+setVal+",");
						m.invoke(bean, setVal);
					}
					catch(java.sql.SQLException e){
						
					}
					catch(Exception e){
						e.printStackTrace();
					}
				}
			}
//			System.out.println();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		
		return bean;
	}

	/**从结果集中返回map对象
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	private Mapper getMapperFromResultSet(ResultSet rs) throws SQLException{
		ResultSetMetaData meta = rs.getMetaData();
		int colNum = meta.getColumnCount();
		Mapper mapper = Mapper.make();
		for(int i = 1;i<=colNum;i++){
			mapper.put(meta.getColumnName(i), rs.getObject(i));
		}
		
		return mapper;
	}
	
	public static void setStatementVal(PreparedStatement ps, int index,
			Object value) {
		if(null == value){value="NULL";}
		Class<?> type= value.getClass();
		
		try {
			if (type == String.class) {
				ps.setString(index, (String) value);
			} else if (type ==  Integer.class || type == int.class) {
				ps.setInt(index, (Integer) value);
			} else if (type == java.sql.Date.class) {
				ps.setDate(index, (java.sql.Date) value);
			} else if (type == java.util.Date.class) {
				ps.setTimestamp(index, new Timestamp(((java.util.Date) value)
						.getTime()));
			} else if (type == Float.class || type== float.class) {
				ps.setFloat(index, (Float) value);
			} else if (type == Double.class || type==double.class) {
				ps.setDouble(index, (Double) value);
			} else if(type == Character.class || type == char.class ){
				ps.setString(index, (Character)value+"");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.print("set["+index+"]:"+value+",");
	}

	/**
	 * 濞达綀娉曢弫銈夊矗瀹ュ懐娈搁柨娑樼焷楠炲繘宕ｉ弶宄歷abean闁汇劌瀚崹姘跺川閿燂拷	 * 
	 * @param javabean
	 *            javabean閻庣數顢婇挅锟�	 * @param ignoreNull
	 *            闁哄嫷鍨伴幆浣界疀閻ｅ本娈ｉ柛濠囨？鐠愮劆ull闁汇劌瀚悺褍鈻撻敓锟� * @return BeanField闁轰焦澹嗙划锟�	 */
	private BeanField[] findFieldsOfBean(Object javabean, boolean ignoreNull) {
		List<BeanField> fields = new ArrayList<BeanField>();
		Class<?> clz = javabean.getClass();
		Method[] methods = clz.getDeclaredMethods(); // 

		for (Method m : methods) {
			String methodName = m.getName();
			if (methodName.startsWith("get")) {

				try {
					Object fieldVal = m.invoke(javabean);

					if (ignoreNull && null == fieldVal)
						continue; // 	
					String fieldName = methodName.substring(3).toUpperCase();

					fields.add(new BeanField(fieldName, fieldVal));
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}

			}

		}

		return (BeanField[]) fields.toArray(new BeanField[0]);
	}
	
	/**将map转化成beanfield数组
	 * @param param
	 * @return
	 */
	private BeanField[] findFieldsOfMap(Map<String,?> param) {
		List<BeanField> fields = new ArrayList<BeanField>();
		Set<?> keys = param.keySet();
		for(Object key:keys){
			fields.add(new BeanField((String)key,param.get(key)));
		}
		return (BeanField[]) fields.toArray(new BeanField[0]);
	}

	/**
	 * @param cnd
	 * @return
	 */
	public T load(Cnd cnd){
		List<T> list = listByPage(cnd,1,1);
		if(list.size()==0) return null;
		return list.get(0);
	}
	public Mapper loadMap(Cnd cnd){
		List<Mapper> list = listMapByPage(cnd,1,1);
		if(list.size()==0) return null;
		return list.get(0);
	}
	public T load(String[] selectCols,Cnd cnd){
		List<T> list = listByPage(selectCols,cnd,1,1);
		if(list.size()==0) return null;
		return list.get(0);
	}
	public Mapper loadMap(String[] selectCols,Cnd cnd){
		List<Mapper> list = listMapByPage(selectCols,cnd,1,1);
		if(list.size()==0) return null;
		return list.get(0);
	}
	
	public T loadBySql(String sql,Object...params ){
		T result = null;
		Connection con = getConnection();
		
		System.out.println("=========[#SQL]========::"+sql);
		PreparedStatement state = null;
		ResultSet rs = null;
		try {
			state = con.prepareStatement(sql);
			if(params !=null ){
				for (int i = 0, len = params.length; i < len; i++) {
					DBUtil.setStatementVal(state, i + 1, params[i]);
				}
			}			
			//ps = con.prepareStatement(preSql);
			rs = state.executeQuery();
			while(rs.next()){
				
				result = getBeanFromResultSet(rs);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		closeConnection(con,state,rs);
		return result;
	}
	public List<T> listBySql(String sql,Object... params){
		List<T> result = new ArrayList<T>();
		Connection con = getConnection();
		
		System.out.println("=========[#SQL]========::"+sql);
		PreparedStatement state = null;
		ResultSet rs = null;
		try {
			state= con.prepareStatement(sql);
			
			if(params !=null ){
				for (int i = 0, len = params.length; i < len; i++) {
					DBUtil.setStatementVal(state, i + 1, params[i]);
				}
			}
			
			rs = state.executeQuery();
			while(rs.next()){
				
				result .add(getBeanFromResultSet(rs)) ;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		closeConnection(con,state,rs);
		return result;
	}
	
	/**
	 * @param sql
	 * @param t 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <K> K loadObjectBySql(String sql,Class<K> t,Object... params){
		Object setVal = null;
		Connection con = getConnection();
		
		System.out.println("=========[#SQL]========::"+sql);
		PreparedStatement state= null;
		ResultSet rs = null;
		try {
			state= con.prepareStatement(sql);
			if(params !=null ){
				for (int i = 0, len = params.length; i < len; i++) {
					DBUtil.setStatementVal(state, i + 1, params[i]);
				}
			}
			rs = state.executeQuery();
			rs.next();
				
				if(t == String.class){
					setVal = rs.getString(1);
				}
				else if(t == Integer.class){
					setVal = rs.getInt(1);
				}
				else if(t == Double.class){
					setVal = rs.getDouble(1);
				}
				else if(t == java.util.Date.class){
					setVal = new java.util.Date( rs.getTimestamp(1).getTime());
				}
				else if(t == java.sql.Date.class){
					setVal = rs.getDate(1);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		closeConnection(con,state,rs);
		return (K)setVal;
	}
	
	/**鐠佲剝鏆�
	 * @param cnd
	 * @return
	 */
	public int count(Cnd cnd){
		int setVal = 0;
		Connection con = getConnection();
		
		String preSql = "select count(*) from " + tbName + cnd.toPreparedSql();
		System.out.println("=========[#SQL]========::"+preSql);
		
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(preSql);
			if(null!=cnd) cnd.setAllStatementsVal(ps, 1);
			rs = ps.executeQuery();
			rs.next();
				
			setVal = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		closeConnection(con,ps,rs);
		return setVal;
	}
	
	/**閹笛嗩攽閺囧瓨鏌婇惃鍓唓l鐠囶厼褰�
	 * @param sql
	 * @param params prepared閸欏倹鏆�
	 * @return
	 */
	public int executeUpdate(String sql,Object... params){
		int setVal = 0;
		Connection con = getConnection();
		
		System.out.println("=========[#SQL]========::"+sql);
		
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			if(params!=null){
				for(int i = 0;i<params.length;i++){
					ps.setObject(i+1, params[i]);
				}
			}
			setVal = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		closeConnection(con,ps,null);
		return setVal;
	}

	public String getTbName() {
		return tbName;
	}

	public void setTbName(String tbName) {
		this.tbName = tbName;
	}

	public Class<?> getBeanclass() {
		return beanclass;
	}

	public void setBeanclass(Class<?> beanclass) {
		this.beanclass = beanclass;
	}
	
	/**给指定表添加字段
	 * @param fieldName 字段名称
	 * @param fieldDbType 字段的数据库类型，如：VARCHAR(20)
	 * @return
	 */
	public int addField(String tbName,String fieldName){
		String sql = "ALTER TABLE "+tbName +" ADD COLUMN "+fieldName+" DOUBLE ";
		return executeUpdate(sql);
	}
	
	/**建表
	 * @param tableName
	 * @return
	 */
	public int createTable(String tableName){
		String sql = "CREATE TABLE IF NOT EXISTS "+tableName +"(id int primary key not null auto_increment,control_time datetime)";
		return executeUpdate(sql);
	}
	public List<T> PlistByPage(Cnd cnd,int pageSize,int pageNumber){
		return _Plist(null,cnd,true,pageSize,pageNumber);
	}

private List<T> _Plist(String[] selectCols,Cnd cnd,boolean pager,int pageSize,int pageNumber) {
		List<T> result = new ArrayList<T>();
		Connection con = getConnection();
		
		String colsStr = selectCols == null?"*":Utils.joinString(selectCols, ",");
		String preSql = "";
		String value = cnd.toPreparedSql();
		System.out.println(cnd.toString());
		System.out.println("value等于"+value);
		/*preSql += "select "+colsStr+" from " + tbName + (null == cnd ?"":cnd.toPreparedSql()) ;*/
		preSql += "select "+colsStr+" from " + tbName + " WHERE deleted = ? AND Crop_code = any(select Crop_id from cropgh where GH_id =? )  Order by  Crop_id  DESC " ;
		//" Crop_code = (select Crop_id from Cropgh where GH_id =21 )"
		if(pager){
			preSql += " limit "+(pageNumber-1)*pageSize+","+pageSize+" ";
		}
		
		PreparedStatement ps = null;
		ResultSet rs = null;

		System.out.println("=========[#SQL]========::"+preSql);
		try {
			ps = con.prepareStatement(preSql);
			if(null!=cnd) cnd.setAllStatementsVal(ps, 1);
			rs = ps.executeQuery();
			while(rs.next()){
				
				result.add(getBeanFromResultSet(rs));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		closeConnection(con,ps,rs);
		System.out.println(result.size() + " record(s) listed.");
		return result;
	}
 

}
