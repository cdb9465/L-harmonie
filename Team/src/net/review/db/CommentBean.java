package net.review.db;

import java.sql.Date;

public class CommentBean {
	private int mem_num;
	private int review_num;
	private int comment_num;
	private String content;
	private Date date;
	private String name;
	  
	  public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
