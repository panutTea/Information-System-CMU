<?php

class Enroll{


    public function SearchEnroll($username){
        $details = "SELECT * FROM `enroll`
        INNER JOIN course
        ON enroll.c_ID = course.course_ID
        INNER JOIN student 
        ON enroll.s_ID = student.std_ID
        INNER JOIN schduling_lec
        ON enroll.c_ID = schduling_lec.course_lecID
        INNER JOIN slot_time
        ON schduling_lec.date = slot_time.comp_slot
        INNER JOIN teach
        ON enroll.c_ID = teach.course_ID
        INNER JOIN teacher
        ON teach.t_ID = teacher.t_ID
        WHERE student.email = '$username' AND enroll.en_sec = teach.t_sec AND enroll.en_sec = schduling_lec.section";
        return $details;
    }
}


?>