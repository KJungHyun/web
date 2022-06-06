package project.java.book;

public class when_useDataBean{
    private int id;
    private String book_name;
	private int department_id;
    private Short use_date;
    private String grade;
    private String semester;
    private String prof_name;
    private String class_name;

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBook_name() {
		return this.book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getDepartment_id(){
		return this.department_id;
	}
	public void setDepartment_id(int department_id){
		this.department_id = department_id;
	}

	public Short getUse_date() {
		return this.use_date;
	}

	public void setUse_date(Short use_date) {
		this.use_date = use_date;
	}

	public String getGrade() {
		return this.grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSemester() {
		return this.semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getProf_name() {
		return this.prof_name;
	}

	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}

	public String getClass_name() {
		return this.class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

}