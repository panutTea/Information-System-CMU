<?php
require 'StudentInfoCtrl.php';


session_start();

$username = $_SESSION['username_student'];
$stdCtrl = new StudentInfoCtrl();
$user_credit = $stdCtrl->getCreditCourse();
$pixel = 868;

if(!isset($_SESSION['username_student'])){
    header( "location: http://127.0.0.1/OODProject/Login.php");
}

class StudentInfoUI{
    public $pixel;

    function __construct($pixel){
        $this->pixel = $pixel;
    }

    public function setDefaultPixel($pixel){
        $this->pixel = $pixel;
    }


    public function showSubject($data){
        $subject = array();
        array_push($subject, $data); 
        $pi_sub = 0;
        $C1 = strval($data['study_start']); //แปลงเวลาเริ่มเรียนเป็น str
        $Part1 = substr($C1, 0, 1); //อักษรเวลาตัวเเรก สมมุติ 8:00 ก็คือ เลข 8
        $Part2 = substr($C1, 1, 1); //ตัว :
        $Part3 = substr($C1, 2, 1); //เลข 0
        $Part4 = substr($C1, 3, 1); //เลข 0
        if ((int)$Part1 == 1){ //จุดคำนวณ pixel //ถ้าเวลาเริ่มเรียนเป็น 10 โมงขึ้นไป
            $pi_sub = (((int)($Part1)) * 1240) + (((int)($Part2)) * 124) + ((((int)($Part4))/3) * 62);
        }
        else{ //เวลาเรียน 7-9 โมง ที่ต้องเเยกเพราะว่า 10 โมงขึ้นไปจะมีตัวเลขตัวเลข 1 เข้ามาเพิ่ม
            if((int)substr($C1, 1,1) > 0){
                $Part1 = substr($C1, 1,1);
            }
            $pi_sub = (((int)($Part1)) * 124) + ((((int)($Part3))/3) * 62);
        }
        $Remain = $pi_sub - $this->pixel; //คำนวณหาช่องว่างที่ต้องมีก่อน ถ้า remain เป็น 0 ก็ไม่มีช่องว่างคั่น
        $this->pixel += $Remain;
        while($Remain != 0){
            if($Remain >= 124){
                echo "<div class='col' style = 'width: 124px; height: 120px; text-align: center; padding:30;'></div>";
                $Remain -= 124;
            }
            else if ($Remain >= 62){
                echo "<div class='col' style = 'width: 62px; height: 120px; text-align: center; padding:30;'></div>";
                $Remain -= 62;
            }
        }
        $C2 = strval($data['study_finish']);  //เหมือนกับข้างบน เเต่เป็นเวลาที่เรียนเสร็จ
        $Part1_stop = substr($C2, 0, 1);
        $Part2_stop = substr($C2, 1, 1); 
        $Part3_stop = substr($C2, 2, 1);
        $Part4_stop = substr($C2, 3, 1);
        $Study_time = 0;  //เวลาเรียน
        $stop = 0; //คำนวน pixel ที่ต้องใช้ในคาบเรียน
        if ($Part1_stop == 1){
            $stop = (((int)($Part1_stop)) * 1240) + (((int)($Part2_stop)) * 124) + ((((int)($Part4_stop))/3) * 62);
        }
        else{
            if((int)substr($C2, 1,1) > 0){
                $Part1_stop = substr($C1, 1,1);
            }
            $stop = (((int)($Part1_stop)) * 124) + ((((int)($Part3_stop))/3) * 62);
        }
        $Study_time = $stop - $pi_sub; //คำนวน pixel ที่ต้องใช้ในคาบเรียน
        $this->pixel += $Study_time;
        return $Study_time;
    }
}

?>







<html>
    <title>Registration System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <div class="container-fluid" style = "background-color: #eee; height:67px;">
        <div class="row">
            <div class="col-sm">
                <img src = "picture/logo.png" width = "64" height = "64" style = "float: left;">
                <div style = "margin:"><h5>ระบบจัดตารางสอนตารางสอบหลักสูตรปริญญาตรี</h5>
                <h5>มหาวิทยาลัยเชียงใหม่</h5></div>
            </div>
            <div class="col-sm" style = "text-align: right; margin: 13px">
                <a style ="background-color:grey; border-color:grey;" href="http://127.0.0.1/OODProject/Logout.php" class="btn btn-primary" tabindex="-1" role="button" aria-disabled="true">ออกจากระบบ/Logout</a>
            </div>
        </div>
    </div>
    <body>
    <style>
    table {
    border-collapse: collapse;
    width: 100%;
    }

    tr:nth-child(even) {
    background-color: #EBF5FF;
    }
    </style>
    <div class="container-fluid">
        <div class="row" style = "top: 15%; position: absolute;">
            <div class="col-md-auto" style = "text-align: center;">
                <h3><span class="badge bg-secondary"><img src="picture/user_icon.png" width = "30" height = "30" style = "margin: 5px; ">ข้อมูลนักศึกษา</span><h3>
                <img src=<?="picture/",$username,'.jpg'?> width = "160" height = "180">
                <table style = "text-align: left; margin: 20; font-size:20px;">
                <?php
                    $rlt = $stdCtrl->getStudentInfo($username);
                ?>
                    <?php foreach($rlt as $data){ ?>
                        <tr>
                            <td><strong>รหัสนักศึกษา: </strong></td>
                            <td><?=$data['std_id']?></td>
                        </tr>
                        <tr>
                            <td><strong>ชื่อ-สกุล: </strong></td>
                            <td><?=$data['std_fname'],' ',$data['std_lname']?></td>
                        </tr>
                        <tr>
                            <td><strong>คณะ: </strong></td>
                            <td><?=$data['fac_name']?></td>
                        </tr>
                        <tr>
                            <td><strong>สาขา: </strong></td>
                            <td><?=$data['dept_name']?></td>
                        </tr>
                        <tr>
                            <td><strong>ชั้นปีที่: </strong></td>
                            <td><?=65-intval(substr($data['std_id'],0,2))?></td>
                        </tr>
                        <tr>
                            <td><strong>หน่วยกิต: </strong></td>
                            <td><?=65-intval(substr($data['std_id'],0,2))?></td>
                        </tr>
                    <?php } ?>
                </table>
                <button class="tablinks" onclick="SelectMenuTab(event, 'เเก้ไขข้อมูล')">เเก้ไขข้อมูล</button>
            </div>
            <div class="col-md-auto" style =  "text-align: center; margin-left: 15;">
                <ul class="nav nav-tabs" style="font-size:22px; font-weight:bold;">
                    <li class="nav-item">
                        <a class="nav-link active" href="http://127.0.0.1/OODProject/StudentInfo.php">หน้าเเรก</a>
                    </li>
                </ul>
                <style>
                    .tab {
                        overflow: hidden;
                        border: 1px solid #ccc;
                        background-color: #f1f1f1;
                    }
                    
                    .tab button {
                    background-color: inherit;
                    float: left;
                    border: none;
                    outline: none;
                    cursor: pointer;
                    padding: 14px 16px;
                    transition: 0.3s;
                    font-size: 17px;
                    }

                    .tab button:hover {
                    background-color: #ddd;
                    }
                    .tab button.active {
                        background-color: #ccc;
                    }
                    .tabcontent {
                        display: none;
                        padding: 6px 12px;
                        border: 1px solid #ccc;
                        border-top: none;
                    }
                    .mix, .mix td {
                        border: 3px solid #999;
                    }
                    .mix td {
                        height: 100px;
                        width: 124px;
                    }
                </style>
                <div class="tab">
                    <button class="tablinks" onclick="SelectMenuTab(event, 'เพิ่มข้อมูลนักศึกษา')">เพิ่มข้อมูลนักศึกษา</button>
                    <button class="tablinks" onclick="SelectMenuTab(event, 'ตารางเรียน')">ตารางเรียน</button>
                    <button class="tablinks" onclick="SelectMenuTab(event, 'ตารางสอบ')">ตารางสอบ</button>
                </div>

                <div id="เพิ่มข้อมูลนักศึกษา" class="tabcontent">
                    <?php
                        $dept_data = $stdCtrl->getDepartment();
                        if(isset($_POST['std_ID'])){
                            $std_ID = $_POST['std_ID'];
                            $std_fname = $_POST['std_fname'];
                            $std_lname = $_POST['std_lname'];
                            $email = $_POST['email'];
                            $department = $_POST['department'];
                            $stdCtrl->selectInsertFunction($std_ID,$std_fname,$std_lname,$email,$department);
                        }
                    ?>
                    <form method = "post">
                        <h5 style = "margin-top: 15; text-align: left;">รหัสนักศึกษา</h5>
                        <input style="width:300px;" type="text" class="form-control" id="std_ID" name = "std_ID">
                        <h5 style = "margin-top: 15; text-align: left;">ชื่อ</h5>
                        <input style="width:300px;" type="text" class="form-control" id="std_fname" name = "std_fname">
                        <h5 style = "margin-top: 15; text-align: left;">นามสกุล</h5>
                        <input style="width:300px;" type="text" class="form-control" id="std_lname" name = "std_lname">
                        <h5 style = "margin-top: 15; text-align: left;">email</h5>
                        <input style="width:300px;" type="text" class="form-control" id="email" name = "email">
                        <div class = 'from-group'>
                            <div class="clo-sm-12" style="margin-top: 20;">
                                <select name="department" class="form-contorl">
                                    <option value="" selected="selected">- สาขา -</option>
                                    <?php foreach($dept_data as $dept){ ?>
                                    <option value= '<?=$dept['dept_id']?>'><?=$dept['dept_name']?></option>
                                    <?php } ?>
                                </select><br>
                            </div>
                        </div>
                        <input style = "margin-top: 20;" type = "submit"></input>
                    </form>
                </div>
                
                <div id="เเก้ไขข้อมูล" class="tabcontent">
                    <?php
                        if(isset($_POST['fname'])){
                            $fname = $_POST['fname'];
                            $lname = $_POST['lname'];
                            $stdCtrl->selectUpdateFunction($username,$fname,$lname);
                        }
                    ?>
                    <form method = "post">
                    <h5 style = "margin-top: 15; text-align: left;">ชื่อ</h5>
                    <input style="width:300px;" type="text" class="form-control" id="fname" name = "fname">
                    <h5 style = "margin-top: 15; text-align: left;">นามสกุล</h5>
                    <input style="width:300px;" type="text" class="form-control" id="lname" name = "lname">
                    <button style = "margin-top: 20;" type = "submit" class = "tablinks">เเก้ไขข้อมูล</button>
                    </form>
                    
                </div>

                <div id="ตารางเรียน" class="tabcontent">
                    <style>
                        .mix, .mix td {
                            border: 3px solid #999;
                        }
                        .mix td {
                            height: 120px;
                            width: 124px;
                        }
                    </style>
                    <table class = "mix" style = "margin-top: 15; text-align: center; margin-bottom: 100;">
                    <tr>
                        <td>รหัสวิชา</td>
                        <td>ชื่อกระบวนวิชา</td>
                        <td>Lec</td>
                        <td>Lab</td>
                        <td>Sec</td>
                        <td>เวลาเรียน</td>
                        <td>วันที่เรียน</td>
                        <td>อาจารย์ผู้สอน</td>
                        <td>จำนวนรับ</td>
                    </tr>
                    <?php
                        $day = "";
                        $enrolled = $stdCtrl->getEnrollCourseData($username,$day);
                    ?>
                    <?php foreach($enrolled as $en){ ?>
                        <tr>
                            <td><?=$en['course_id']?></td>
                            <td><?=$en['course_name_th']?></td>
                            <td><?=$en['lec_credit']?></td>
                            <td><?=$en['lab_credit']?></td>
                            <td><?=$en['en_sec']?></td>
                            <td><?=$en['study_start'],'-',$en['study_finish']?></td>
                            <td><?=$en['study_day']?></td>
                            <td><?=$en['t_fname'],' ',$en['t_lname']?></td>
                            <td><?=$en['capacity']?></td>
                        </tr>
                        <?=$user_credit += var_dump(is_int($en['lec_credit'])) + var_dump(is_int($en['lab_credit']))?>
                    <?php } ?>
                    </table>
                    <table class = "mix" style = "margin-top: 15; text-align: center; margin-bottom: 150;">
                        <tr>
                            <td>Day/Period</td>
                            <td>8:00</td>
                            <td>9:00</td>
                            <td>10:00</td>
                            <td>11:00</td>
                            <td>12:00</td>
                            <td>13:00</td>
                            <td>14:00</td>
                            <td>15:00</td>
                            <td>16:00</td>
                            <td>17:00</td>
                        </tr>
                        <tr>
                            <td>Monday</td>
                            <?php
                                $day = 'MTh';
                                $data = $stdCtrl->getEnrollCourseData($username,$day);
                                $stdUI = new StudentInfoUI($pixel);
                            ?>
                            <td colspan = "12">
                                <div class="row row-cols-6" style = "margin-left: 0;">
                                <?php 
                                        foreach($data as $data){
                                        $Study_time = $stdUI->showSubject($data);
                                        ?>
                                        <div class="col" style = "border-left: 1px solid #999; border-right: 1px solid #999; width: <?=$Study_time ?>px; height: 120px; text-align: center; padding:15; background-color: yellow"><?=$data['course_name_th']?><br><?=$data['course_id'],' (',$data['en_sec'],')'?><br><?=$data['study_start'],'-',$data['study_finish']?><br></div>
                                        <?php } ?>
                                </div>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Tuesday</td>
                            <?php
                                $day = 'TuF';
                                $data = $stdCtrl->getEnrollCourseData($username,$day);
                                $stdUI->setDefaultPixel($pixel);
                            ?>
                            <td colspan = "12">
                                <div class="row row-cols-6" style = "margin-left: 0;">
                                   <?php 
                                        foreach($data as $data){
                                        $Study_time = $stdUI->showSubject($data);
                                        ?>
                                        <div class="col" style = "border-left: 1px solid #999; border-right: 1px solid #999; width: <?=$Study_time ?>px; height: 120px; text-align: center; padding:15; background-color: pink"><?=$data['course_name_th']?><br><?=$data['course_id'],' (',$data['en_sec'],')'?><br><?=$data['study_start'],'-',$data['study_finish']?><br></div>
                                        <?php } ?>
                                </div>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>Wednesday</td>
                            <?php
                                $day = 'We';
                                $data = $stdCtrl->getEnrollCourseData($username,$day);
                                $stdUI->setDefaultPixel($pixel);
                            ?>
                            <td colspan = "12">
                                <div class="row row-cols-6" style = "margin-left: 0;">
                                   <?php 
                                        foreach($data as $data){
                                        $Study_time = $stdUI->showSubject($data);
                                        ?>
                                        <div class="col" style = "border-left: 1px solid #999; border-right: 1px solid #999; width: <?=$Study_time ?>px; height: 120px; text-align: center; padding:15; background-color: orange"><?=$data['course_name_th']?><br><?=$data['course_id'],' (',$data['en_sec'],')'?><br><?=$data['study_start'],'-',$data['study_finish']?><br></div>
                                        <?php } ?>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Thursday</td>
                            <?php
                                $day = 'MTh';
                                $data = $stdCtrl->getEnrollCourseData($username,$day);
                                $stdUI->setDefaultPixel($pixel);
                            ?>
                            <td colspan = "12">
                                <div class="row row-cols-6" style = "margin-left: 0;">
                                   <?php 
                                        foreach($data as $data){
                                        $Study_time = $stdUI->showSubject($data);
                                        ?>
                                        <div class="col" style = "border-left: 1px solid #999; border-right: 1px solid #999; width: <?=$Study_time ?>px; height: 120px; text-align: center; padding:15; background-color: orange"><?=$data['course_name_th']?><br><?=$data['course_id'],' (',$data['en_sec'],')'?><br><?=$data['study_start'],'-',$data['study_finish']?><br></div>
                                        <?php } ?>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>Friday</td>
                            <?php
                                $day = 'TuF';
                                $data = $stdCtrl->getEnrollCourseData($username,$day);
                                $stdUI->setDefaultPixel($pixel);
                            ?>
                            <td colspan = "12">
                                <div class="row row-cols-6" style = "margin-left: 0;">
                                   <?php 
                                        foreach($data as $data){
                                        $Study_time = $stdUI->showSubject($data);
                                        ?>
                                        <div class="col" style = "border-left: 1px solid #999; border-right: 1px solid #999; width: <?=$Study_time ?>px; height: 120px; text-align: center; padding:15; background-color: pink"><?=$data['course_name_th']?><br><?=$data['course_id'],' (',$data['en_sec'],')'?><br><?=$data['study_start'],'-',$data['study_finish']?><br></div>
                                        <?php } ?>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="ตารางสอบ" class="tabcontent">
                    <style>
                    .mixs, .mixs td {
                        border: 1px solid #999;
                    }
                    .mixs td {
                        height: 120px;
                        width: 250px;
                    }
                    </style>
                   <table class = "mixs" style = "margin-top: 15; text-align: center;">
                        <tr>
                            <td>Day/Period</td>
                            <td>8:00-11:00 AM</td>
                            <td>12:00-15:00 PM</td>
                            <td>15:30-18:30 PM</td>
                            <?php
                                $data = $stdCtrl->getExamCourseData($username);
                            ?>
                            <?php foreach($data as $data){ ?>
                            <tr>
                                <td><?=$data['ex_date']?></td>
                                <td colspan = "3">
                                    <div class="row row-cols-3" style = "margin-left: -1;">
                                        <?php 
                                            $pixel = 0;
                                            $ex_start = $data['ex_start'];
                                            if(substr($ex_start,0,2) == '08'){
                                                $pixel += 250;
                                            }
                                            else if(substr($ex_start,0,2) == '12'){
                                                if($pixel == 0){
                                                    echo "<div class='col' style = 'width: 250px; height: 120px; text-align: center; padding:30;'></div>";
                                                    $pixel += 500;
                                                }
                                            }
                                            else{
                                                if($pixel == 0){
                                                    echo "<div class='col' style = 'width: 500px; height: 120px; text-align: center; padding:30;'></div>";
                                                }
                                                else if($pixel == 250){
                                                    echo "<div class='col' style = 'width: 250px; height: 120px; text-align: center; padding:30;'></div>";
                                                }
                                            }
                                        ?>
                                        <div class="col" style = "border: 1px solid #999; width: 250px; height: 120px; text-align: center; padding:15; background-color: #F4D03F"><?=$data['course_id']?><br><?='(',$data['en_sec'],')'?><br><?=$data['room_id']?></div>
                                    </div>
                                </td>
                            </tr>    
                        </tr>
                        <?php } ?>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        function SelectMenuTab(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

    </script>

    </body>
</html>