package net.news.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.news.db.NewsBean;

public class NewsDAO {
	private Connection getConnection() throws Exception{
		Connection con = null;
		Context init=new InitialContext();
	    DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
	    con=ds.getConnection();
	    return con;
	} //Connection
	
	public void insertNews(NewsBean nb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		
		try{
			con=getConnection();
			String sql = "select max(news_num) as news_num from news";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt("news_num")+1;
			}
			String sql2="insert into news(news_num,title,content,file,date) values(?,?,?,?,now())";
			pstmt=con.prepareStatement(sql2);
			pstmt.setInt(1, num);
			pstmt.setString(2, nb.getTitle());
			pstmt.setString(3, nb.getContent());
			pstmt.setString(4, nb.getFile());
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
	} //insertNews()
	
	public int getNewsCount() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int count=0;
		
		try{
			con=getConnection();
	
			//select count(*) from board
			String sql = "select count(*) as count from news";
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
	} //getNewsCount
	
	public List<NewsBean> getNewsList() {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		List<NewsBean> newslist = new ArrayList<>();
		
		try{
			con=getConnection();
			
			String sql = "select * from news";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				NewsBean nb = new NewsBean();
				nb.setNews_num(rs.getInt("news_num"));
				nb.setTitle(rs.getString("title"));
				nb.setContent(rs.getString("content"));
				nb.setDate(rs.getDate("date"));
				nb.setFile(rs.getString("file"));
				newslist.add(nb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return newslist;
	}//getBoardList
	
	public NewsBean getNews(int a) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		NewsBean nb = new NewsBean();
		
		try{
			con=getConnection();
			
			String sql = "select * from news where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, a);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				nb.setNews_num(rs.getInt("news_num"));
				nb.setTitle(rs.getString("title"));
				nb.setContent(rs.getString("content"));
				nb.setDate(rs.getDate("date"));
				nb.setFile(rs.getString("file"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return nb;
	}//getNews
	
	public void deleteNews(NewsBean nb) {	
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			con=getConnection();
			
			String sql = "delete from news where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, nb.getNews_num());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(con!=null)try{con.close();}catch(SQLException ex){}
		}
		return;
	} //deleteNews
	
}
