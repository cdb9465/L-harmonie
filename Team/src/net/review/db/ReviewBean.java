package net.review.db;

import java.sql.Date;

public class ReviewBean {
	private int mem_num;
	private int review_num;
	  private String content;
	  private int rating;
	  private Date date;
	  private String file;
	  private String location;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}


}
