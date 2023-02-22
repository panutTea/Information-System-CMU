<?php

include ('Database.php');
include ('Enroll.php');
include ('User.php');


session_start();

$username = $_SESSION['username_student'];
$userdata = new Database();
$enroll = new Enroll();
$student = new User($username);

$connect = $userdata->getDatabase();


if(!isset($_SESSION['username_student'])){
    header( "location: http://127.0.0.1/OODProject/Login.php");
}


$CourseEnroll = $enroll->SearchEnroll($username);
$student_info = "SELECT * FROM student,department,faculty where email = '$username' AND student.d_ID = department.dept_ID AND department.fac_ID = faculty.fac_ID";
$rlt = mysqli_query($connect,$student_info);
$enrolled = mysqli_query($connect,$CourseEnroll);


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
                    <?php foreach($rlt as $data){ ?>
                        <tr>
                            <td><strong>รหัสนักศึกษา: </strong></td>
                            <td><?=$data['std_ID']?></td>
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
                            <td><?=65-intval(substr($data['std_ID'],0,2))?></td>
                        </tr>
                        <tr>
                            <td><strong>หน่วยกิต: </strong></td>
                            <td><?=65-intval(substr($data['std_ID'],0,2))?></td>
                        </tr>
                    <?php } ?>
                </table>
                <form method = "post" action = "http://127.0.0.1/OODProject/StudentInfo.php">
                <button type = "update" class = "btn btn-success">เเก้ไขข้อมูล</button>
                </form>
            </div>
            <div class="col-md-auto" style =  "text-align: center; margin-left: 15;">
                <ul class="nav nav-tabs" style="font-size:22px; font-weight:bold;">
                    <li class="nav-item">
                        <a class="nav-link" href="http://127.0.0.1/OODProject/StudentInfo.php">หน้าเเรก</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://127.0.0.1/OODProject/EnrollCourse.php">ลงทะเบียนเรียน</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="http://127.0.0.1/OODProject/StudyTable.php">ตารางเรียน</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://127.0.0.1/OODProject/StudentInfo.php">ตารางสอบ</a>
                    </li>
                </ul>
                <style>
                .mix, .mix td {
                    border: 3px solid #999;
                }
                .mix td {
                    height: 100px;
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
                <?php foreach($enrolled as $en){ ?>
                    <tr>
                        <td><?=$en['c_ID']?></td>
                        <td><?=$en['coursename']?></td>
                        <td><?=$en['lec_credit']?></td>
                        <td><?=$en['lab_credit']?></td>
                        <td><?=$en['en_sec']?></td>
                        <td><?=$en['study_start'],'-',$en['study_finish']?></td>
                        <td><?=$en['study_day']?></td>
                        <td><?=$en['t_fname'],' ',$en['t_lname']?></td>
                        <td><?=$en['capacity']?></td>
                    </tr>
                <?php } ?>
                </table>
            </div>
            
        </div>
    </div>
    </body>
</html>