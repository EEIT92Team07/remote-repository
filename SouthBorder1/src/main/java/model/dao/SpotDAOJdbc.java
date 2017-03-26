package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.SpotBean;
import model.SpotDAO;


public class SpotDAOJdbc implements SpotDAO {
	private DataSource dataSource;
	public SpotDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		SpotDAO spotDao = new SpotDAOJdbc();
		SpotBean select = spotDao.select(2);
		System.out.println(select);
		
//		SpotBean update = spotDao.update();
		
		List<SpotBean> beans = spotDao.select();
		System.out.println("beans="+beans);
		
	}

	private static final String SELECT_BY_ID = "select * from Spot where spotID=?";
	/* (non-Javadoc)
	 * @see model.dao.SpotDAO#select(int)
	 */
	@Override
	public SpotBean select(int spotID) {
		SpotBean result = null;

		ResultSet rset = null;
		try(//Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			stmt.setInt(1, spotID);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new SpotBean();
				result.setSpotID(rset.getInt("spotID"));
				result.setSpotName(rset.getString("spotName"));
				result.setSuggestTime(rset.getString("suggestTime"));
				result.setAddr(rset.getString("addr"));
				result.setCoordinate(rset.getString("coordinate"));
				result.setInfo(rset.getString("Info"));
				result.setOpentime(rset.getString("opentime"));
				result.setPrice(rset.getFloat("price"));
				result.setType(rset.getString("type"));
				result.setPhoto(rset.getString("photo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}
		}
		return result;
	}
	
	private static final String SELECT_ALL = "select * from spot";
	/* (non-Javadoc)
	 * @see model.dao.SpotDAO#select()
	 */
	@Override
	public List<SpotBean> select() {
		List<SpotBean> result = null;
		
		try(//Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rset = stmt.executeQuery();) {
			
			result = new ArrayList<SpotBean>();
			while(rset.next()) {
				SpotBean row = new SpotBean();
				row.setSpotID(rset.getInt("spotID"));
				row.setSpotName(rset.getString("spotName"));
				row.setSuggestTime(rset.getString("suggestTime"));
				row.setAddr(rset.getString("addr"));
				row.setCoordinate(rset.getString("coordinate"));
				row.setInfo(rset.getString("Info"));
				row.setOpentime(rset.getString("opentime"));
				row.setPrice(rset.getFloat("price"));
				row.setType(rset.getString("type"));
				row.setPhoto(rset.getString("photo"));
				result.add(row);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String INSERT = "insert into Spot (spotID, spotName, suggestTime, addr,coordinate,Info,opentime ,price,type,photo) values (?, ?, ?, ?, ?,?, ?, ?, ?, ?)";
	/* (non-Javadoc)
	 * @see model.dao.SpotDAO#insert(model.SpotBean)
	 */
	@Override
	public SpotBean insert(SpotBean bean) {
		SpotBean result = null;
		try(//Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(INSERT);) {

			if(bean!=null) {
				stmt.setInt(1, bean.getSpotID());
				stmt.setString(2, bean.getSpotName());
				stmt.setString(3, bean.getSuggestTime());
				stmt.setString(4, bean.getAddr());
				stmt.setString(5, bean.getCoordinate());
				stmt.setString(6, bean.getInfo());
				stmt.setString(7, bean.getOpentime());
				stmt.setDouble(8, bean.getPrice());
				stmt.setString(9, bean.getType());
				stmt.setString(10, bean.getPhoto());
				int i = stmt.executeUpdate();
				if(i==1) {
					result = this.select(bean.getSpotID());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
//	spotID, spotName, suggestTime, addr,coordinate
//	,Info,opentime ,price,type,photo
	private static final String UPDATE = "update spot set spotName=?,"
			+ " suggestTime=?, addr=? ,coordinate=? ,Info=?,opentime=?,"
			+ " price=?, type=?,photo=? where spotID=?";
	/* (non-Javadoc)
	 * @see model.dao.SpotDAO#update(java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, double, java.lang.String, java.lang.String, int)
	 */
	@Override
	public SpotBean update(String spotName,String suggestTime,String  addr
			,String coordinate,String Info,String opentime,
			double price,String type,
			String photo,int spotID) {
		SpotBean result = null;
		try(//Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(UPDATE);) {

			stmt.setString(1, spotName);
		    stmt.setString(2, suggestTime);
		    stmt.setString(3, addr);
		    stmt.setString(4, coordinate);
		    stmt.setString(5,Info);
		    stmt.setString(6,opentime);
		    stmt.setDouble(7,price);
		    stmt.setString(8, type);
		    stmt.setString(9,photo);
		    stmt.setInt(10, spotID);

			int i = stmt.executeUpdate();
			if(i==1) {
				result = this.select(spotID);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private static final String DELETE = "delete from product where id=?";
	/* (non-Javadoc)
	 * @see model.dao.SpotDAO#delete(int)
	 */
	@Override
	public boolean delete(int id) {
		try(//Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(DELETE);) {
			
			stmt.setInt(1, id);
			int i = stmt.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	/* (non-Javadoc)
	 * @see model.dao.SpotDAO#update(int, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, java.lang.String, float, java.lang.String, java.lang.String)
	 */
	@Override
	public SpotBean update(int spotID, String spotName, String suggestTime, String addr, String coordinate, String Info,
			String opentime, float price, String type, String photo) {
		// TODO Auto-generated method stub
		return null;
	}
}
