package bean;

import java.io.Serializable;

public class Student implements Serializable {

    private String no;        // 学生番号
    private String name;      // 氏名
    private int entYear;      // 入学年度
    private String classNum;  // クラス番号
    private boolean attend;   // 在学フラグ
    private School school;    // 学校（オブジェクト）

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

    public School getSchool() {
        return school;
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

    public void setSchool(School school) {
        this.school = school;
    }
}