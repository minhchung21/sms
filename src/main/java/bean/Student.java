package bean;

import java.io.Serializable;

public class Student implements Serializable {

    // ===== 学生番号 =====
    private String no;

    // ===== 氏名 =====
    private String name;

    // ===== 入学年度 =====
    private int entYear;

    // ===== クラス番号 =====
    private String classNum;

    // ===== 在学フラグ =====
    private boolean attend;

    // ===== 学校コード =====
    private String school_cd;



    // ===== getter =====

    public String getNo() {
        return no;
    }

    public String getName() {
        return name;
    }

    public int getEntYear() {
        return entYear;
    }

    public String getClassNum() {
        return classNum;
    }

    public boolean isAttend() {
        return attend;
    }

    public String getSchool_cd() {
        return school_cd;
    }



    // ===== setter =====

    public void setNo(String no) {
        this.no = no;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEntYear(int entYear) {
        this.entYear = entYear;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }

    public void setAttend(boolean attend) {
        this.attend = attend;
    }

    public void setSchool_cd(String school_cd) {
        this.school_cd = school_cd;
    }

}