<?php
    class Database{
        public $data ;
        
        function __construct(){
            $connect = mysqli_connect('localhost', 'root', '', 'register');
            $this->dbcon = $connect ;
            $data = $connect ;
        }


        public function checklogin($username, $password){
            $checkuser = mysqli_query($this->dbcon, "SELECT * FROM login where username = '$username' and password = '$password'");
            $row = mysqli_fetch_assoc($checkuser);
            return $row ;
        }

        public function getDatabase(){
            return $this->dbcon;
        }


    }








?>