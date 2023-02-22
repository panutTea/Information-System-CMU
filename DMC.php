<?php
    class DMC{
        public $dbcon ;
        
        function __construct(){
            $connect = mysqli_connect('localhost', 'root', '', 'info_system');
            $this->dbcon = $connect ;
        }


        public function checklogin($username){
            $checkuser = mysqli_query($this->dbcon, "SELECT * FROM student where std_email = '$username'"); #and password = '$password'");
            $row = mysqli_fetch_assoc($checkuser);
            return $row ;
        }

        public function getDatabase(){
            return $this->dbcon;
        }

        public function selectStudentInfo($username){
            $details = "SELECT * FROM student,department,faculty where std_email = '$username' AND student.dept_id = department.dept_id AND department.fac_id = faculty.fac_id";
            $query = mysqli_query($this->dbcon,$details);
            return $query;
        }

        public function selectEnrollCourseData($username,$day){
            if($day == ""){
                $details = "SELECT * FROM `enroll`
                INNER JOIN course
                ON enroll.course_id = course.course_id
                INNER JOIN student 
                ON enroll.std_id = student.std_id
                INNER JOIN open_course
                ON enroll.course_id = open_course.course_id
                INNER JOIN study_time
                ON open_course.comp_study = study_time.comp_study
                INNER JOIN teach
                ON enroll.course_id = teach.course_id
                INNER JOIN teacher
                ON teach.t_id = teacher.t_id
                WHERE student.std_email = '$username' AND enroll.en_sec = open_course.sec AND enroll.en_sec = teach.t_sec AND open_course.year = teach.t_year;";
            }
            else{
                $details = "SELECT * FROM `enroll`
                INNER JOIN course
                ON enroll.course_id = course.course_id
                INNER JOIN student 
                ON enroll.std_id = student.std_id
                INNER JOIN open_course
                ON enroll.course_id = open_course.course_id
                INNER JOIN study_time
                ON open_course.comp_study = study_time.comp_study
                INNER JOIN teach
                ON enroll.course_id = teach.course_id
                INNER JOIN teacher
                ON teach.t_id = teacher.t_id
                WHERE student.std_email = '$username' AND enroll.en_sec = open_course.sec AND enroll.en_sec = teach.t_sec AND open_course.year = teach.t_year AND study_time.study_day = '$day'
                ORDER BY study_time.comp_study ASC;";
            }
            $query = mysqli_query($this->dbcon,$details);
            return $query;
        }

        public function selectExamCourseData($username){
            $details = "SELECT * FROM `enroll` 
            INNER JOIN schedule_exam
            ON enroll.course_id = schedule_exam.course_id
            INNER JOIN student
            ON enroll.std_id = student.std_id
            INNER JOIN exam_time
            ON schedule_exam.comp_exam = exam_time.comp_exam
            WHERE student.std_email = '$username';";
            $query = mysqli_query($this->dbcon,$details);
            return $query;
        }

        public function insertStudentInfo($std_ID,$std_fname,$std_lname,$email,$department){
            $sql = "INSERT INTO student (std_id, std_fname, std_lname, std_email, dept_id) VALUES('$std_ID','$std_fname','$std_lname','$email','$department')";
            $query_run = mysqli_query($this->dbcon,$sql);
            if($query_run){
                echo '<script type ="text/javascript"> alert("เพิ่มข้อมูลสำเร็จ") </script>';
            } else {
                echo '<script type ="text/javascript"> alert("มีข้อมูลอยู่ในระบบเเล้ว") </script>';
            }
        }



        public function updateStudentInfo($email,$std_fname,$std_lname){
            $sql = "UPDATE `student` SET std_fname = '$std_fname',std_lname = '$std_lname' WHERE std_email = '$email' ";
            $query_run = mysqli_query($this->dbcon,$sql);
            if($query_run){
                echo '<script type ="text/javascript"> alert("เเก้ไขสำเร็จ") </script>';
            } else {
                echo '<script type ="text/javascript"> alert("ไม่สามารถเเก้ไขสำเร็จ") </script>';
            } 
        }

        public function selectDepartment(){
            $sql = "SELECT * FROM `department`;";
            $query = mysqli_query($this->dbcon,$sql);
            return $query;
        }



    }








?>