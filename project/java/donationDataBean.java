package project.java.book;

import java.sql.Timestamp;


public class donationDataBean {
	private int d_number;
	private String s_id;
	private String book_name;
	private int book_num;
    private String writer;
    private String publisher;
    private Timestamp date;
    private int department_id;
    private Timestamp p_date;
    private String status;
	
	public int getD_number() {
		return d_number;
	}
	public void setD_number(int d_number) {
		this.d_number = d_number;
	}

    public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

    public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

    public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

    public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

    public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

    public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}

    public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}

    public Timestamp getP_date() {
		return p_date;
	}
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}

    public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}