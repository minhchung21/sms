package bean;

import java.io.Serializable;

public class Subject implements Serializable {

    // ===== 科目コード =====
    private String cd;

    // ===== 科目名 =====
    private String name;

    // ===== 学校コード =====
    private String school_cd;



    // ===== getter =====

    public String getCd() {
        return cd;
    }

    public String getName() {
        return name;
    }

    public String getSchool_cd() {
        return school_cd;
    }



    // ===== setter =====

    public void setCd(String cd) {
        this.cd = cd;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSchool_cd(String school_cd) {
        this.school_cd = school_cd;
    }

}