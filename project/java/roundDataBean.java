package project.java.book;

import java.sql.Timestamp;

public class roundDataBean {
    private int r_info;
	private Timestamp start_date;
	private Timestamp end_date;
    private String status;

    public int getR_info() {
		return r_info;
	}
	public void setR_info(int r_info) {
		this.r_info = r_info;
	}

    public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}

    public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
    
    public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
