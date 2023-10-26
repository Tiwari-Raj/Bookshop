package com.DOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;
import com.mysql.cj.exceptions.RSAException;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User us) {
		boolean f = false;
		try {
			String sql = "insert into User(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public User login(String email, String password) {
		User us = null;

		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return us;

	}

	@Override
	public boolean checkPassword(int id, String ps) {

		boolean f = false;
		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {

				f = true;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean updateProfile(User us) {

		boolean f = false;
		try {
			String sql = "update  User set name =?,email=?,phno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setInt(4, us.getId());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
@Override
public boolean checkUser(String em) {
	boolean f= true;
	try {
		
		String sql = "select * from  user where email=?";
		PreparedStatement ps = conn.prepareStatement(sql);	
		ps.setString(1, em);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			f=false;
		}
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return f;
}
@Override
public List<User> getalluser() {
	List<User> list=new ArrayList<User>();
	User u=null;
	try {
		String sql="select * from user";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			u=new User();
			u.setId(rs.getInt(1));
			u.setName(rs.getString(2));
			u.setEmail(rs.getString(3));
			u.setPhno(rs.getString(4));
			u.setPassword(rs.getString(5));
			list.add(u);
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	
	return list;
}

@Override
public boolean deleteUser(int id) {
	
	boolean f=false;
	try {
		String sql="delete from user where id=?";
		PreparedStatement ps =conn.prepareStatement(sql);
		ps.setInt(1, id);
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
	
}


}

