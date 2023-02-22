<?php include('DMC.php');

    session_start();
    
    $userdata = new DMC();

    $username = $_POST['username'];
    $password = $_POST['password'];

    $row = $userdata->checklogin($username);
    if($username == $row['std_email'] ){ #&& $password == $row['password'] ){
        $_SESSION['username_student'] = $username;
        header("location: http://127.0.0.1/OODProject/StudentInfo.php");
    }
    else{
        header("location: http://127.0.0.1/OODProject/Login.php");
    }

?>