<?php
require 'DMC.php';

class StudentInfoCtrl{
	
	public $curSem = 2;
	public $curYear = 2564;
	public $dmc;
	
	function __construct() {
		$this->dmc = new DMC();
	}

    public function getDatabase(){
        return $this->dmc;
    }
	
	public function getEnrollCourseData($username,$day) {
		return $this->dmc->selectEnrollCourseData($username,$day);
	}

    public function getExamCourseData($username){
        return $this->dmc->selectExamCourseData($username);
    }

    public function selectInsertFunction($std_ID,$std_fname,$std_lname,$email,$department){
        $result = $this->dmc->insertStudentInfo($std_ID,$std_fname,$std_lname,$email,$department);
    }

    public function selectUpdateFunction($email,$std_fname,$std_lname){
        $result = $this->dmc->updateStudentInfo($email,$std_fname,$std_lname);
    }

    public function getStudentInfo($username){
        $result = $this->dmc->selectStudentInfo($username);
        return $result;
    }

    public function getCreditCourse($username){
        echo "<div>WTF Bro</div>";
    }

    public function getDepartment(){
        $result = $this->dmc->selectDepartment();
        return $result;
    }

    

	


}
?>