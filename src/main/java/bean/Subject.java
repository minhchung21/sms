package bean;

import java.io.Serializable;

public class Subject implements Serializable {

    private String cd;        // 科目コード
    private String name;      // 科目名
    private School school;    // 学校（オブジェクト）

    // ===== getter =====
    public String getCd() {
        return cd;
    }

    public String getName() {
        return name;
    }

    public School getSchool() {
        return school;
    }

    // ===== setter =====
    public void setCd(String cd) {
        this.cd = cd;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSchool(School school) {
        this.school = school;
    }
}