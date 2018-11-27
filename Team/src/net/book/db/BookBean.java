package net.book.db;

import java.sql.Date;

public class BookBean
{
	private int mem_num;
	private int book_count;
	private String book_num;
	private String location;
	private Date date;
	private String time;
	private int guest;
	private int tablenum;
	private String request;
	
	public int getMem_num() { return mem_num; }
	public void setMem_num(int mem_num) { this.mem_num = mem_num; }
	
	public int getBook_count() { return book_count; }
	public void setBook_count(int book_count) { this.book_count = book_count; }
	
	public String getBook_num() { return book_num; }
	public void setBook_num(String book_num) { this.book_num = book_num; }
	
	public String getLocation() { return location; }
	public void setLocation(String location) { this.location = location; }
	
	public Date getDate() { return date; }
	public void setDate(Date date) { this.date = date; }
	
	public String getTime() { return time; }
	public void setTime(String time) { this.time = time; }
	
	public int getGuest() { return guest; }
	public void setGuest(int guest) { this.guest = guest; }
	
	public int getTablenum() { return tablenum; }
	public void setTablenum(int tablenum) { this.tablenum = tablenum; }
	
	public String getRequest() { return request; }
	public void setRequest(String request) { this.request = request; }

}
