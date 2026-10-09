package bean;

import java.io.Serializable;
import java.time.LocalDate;

public class Attendance
implements Serializable {

    private int id;

    private Student student;

    private Subject subject;

    private LocalDate attendanceDate;

    private String status;

    private String school_cd;



    // ===== getter =====

    public int getId() {
        return id;
    }

    public Student getStudent() {
        return student;
    }

    public Subject getSubject() {
        return subject;
    }

    public LocalDate getAttendanceDate() {
        return attendanceDate;
    }

    public String getStatus() {
        return status;
    }

    public String getSchool_cd() {
        return school_cd;
    }



    // ===== setter =====

    public void setId(int id) {
        this.id = id;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public void setAttendanceDate(
        LocalDate attendanceDate
    ) {
        this.attendanceDate =
            attendanceDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setSchool_cd(String school_cd) {
        this.school_cd = school_cd;
    }
}