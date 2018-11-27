package net.menu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.menu.db.MenuBean;

public class MenuDAO {
	private Connection getConnection() throws Exception{
		Connection con = null;
		Context init=new InitialContext();
	    DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
	    con=ds.getConnection();
	    return con;
	} //Connection
	
	public void insertMenu(MenuBean mnb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		
		try{
			con=getConnection();
			String sql = "select max(num) as num from menu";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("num")+1;
			}
			String sql2="insert into menu(menu_num,category,name,content) values(?,?,?,?)";
			pstmt=con.prepareStatement(sql2);
			pstmt.setInt(1, num);
			pstmt.setString(2, mnb.getCategory());
			pstmt.setString(3, mnb.getName());
			pstmt.setString(4, mnb.getContent());
			pstmt.executeUpdate();
			 
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			try{
				pstmt.close();
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(con!=null)try{con.close();}catch(SQLException ex){}
			}
		}
		return;
	} //insertMenu()
	
	public int getMenuCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int count=0;
		
		try{
			con=getConnection();
	
			//select count(*) from board
			String sql = "select count(*) as count from menu";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt("count");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return count;
	} //getMenuCount
	
	public MenuBean getMenu(int a) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MenuBean mnb = new MenuBean();
		
		try{
			con=getConnection();
			
			String sql = "select * from menu where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, a);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				mnb.setMenu_num(rs.getInt("menu_num"));
				mnb.setCategory(rs.getString("category"));
				mnb.setName(rs.getString("name"));
				mnb.setContent(rs.getString("content"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return mnb;
	}//getMenu
	
	public void deleteMenu(MenuBean mnb) {	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=getConnection();
			
			String sql = "delete from Menu where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, mnb.getMenu_num());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return;
	} //deleteMenu
	
}
