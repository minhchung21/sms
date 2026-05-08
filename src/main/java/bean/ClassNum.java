package bean;

public class ClassNum implements java.io.Serializable {

	private String class_num;
	//private School school;
	private String school;
	
//	public School getSchool() {
//		return school;
//	}
	public String getSchool() {
		return school;
	}
	public String getClass_num() {
		return class_num;
	}

//	public void setSchool(School school) {
//		this.school=school;
//	}
	public void setSchool(String school) {
		this.school=school;
	}
	public void setClass_num(String class_num) {
		this.class_num=class_num;
	}
}
