package bean;

import java.io.Serializable;

public class ClassNum implements Serializable {

    // ===== クラス番号 =====
    private String class_num;

    // ===== 学校コード =====
    private String school_cd;



    // ===== getter =====

    public String getClass_num() {
        return class_num;
    }

    public String getSchool_cd() {
        return school_cd;
    }



    // ===== setter =====

    public void setClass_num(String class_num) {
        this.class_num = class_num;
    }

    public void setSchool_cd(String school_cd) {
        this.school_cd = school_cd;
    }

}