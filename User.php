<?php

class User{

    function __construct($username){
        $this->user = $username;
    }

    public function getStudentInfo($username){
        $student_info = "SELECT * FROM student,department,faculty where email = '$username' AND student.d_ID = department.dept_ID AND department.fac_ID = faculty.fac_ID";
        return $student_info ;
    }

    public function getTeacherInfo($username){
        $teacher_info = "SELECT * FROM teacher,department,faculty where t_email = '$username' AND teacher.dt_ID = department.dept_ID AND department.fac_ID = faculty.fac_ID";
        return $teacher_info ;
    }

    public function getAdminInfo($username){
        $admin_info = "SELECT * FROM admin,department,faculty where ad_email = '$username' AND admin.dept_ID = department.dept_ID AND department.fac_ID = faculty.fac_ID";
        return $admin_info ;
    }

    public function updateStudentInfo($username){

    }



}



?>