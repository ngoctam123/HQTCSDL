<?php
    //khởi tạo session để lưu lại các biến khi đăng nhập
    session_start();
    //ngăn truy cập trực tiếp
    define('BASEPATH', true);
    //gọi tập tin cấu hình config.php
    include_once('../config.php');
    //gọi tập tin thực hiện kết nối với CSDL
    include_once('../admin/core/Database.php');
    // loadTemplate('layout');
    include_once('../admin/core/load.php');
    loadTemplate('layoutadmin');
?>