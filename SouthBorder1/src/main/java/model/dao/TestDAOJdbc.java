package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.TestBean;
import model.TestDAO;

public class TestDAOJdbc implements TestDAO {
	private DataSource dataSource;

	public TestDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/xxx");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[]args){
		TestDAO testDAO=new TestDAOJdbc();
		 TestBean select = testDAO.select("春芳");
		 System.out.println(select);
	}

	private static final String select_by_name = "select * from Test where name=?";
	ResultSet rset = null;
	TestBean result = null;

	@Override
	public TestBean select(String name) {

		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(select_by_name);
			stmt.setString(1, name);
			rset = stmt.executeQuery();

			if (rset.next()) {
				result = new TestBean();
				result.setName(rset.getString("name"));
				result.setPassword(rset.getString("password"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}return result;
	}
}
