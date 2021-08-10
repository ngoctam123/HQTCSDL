<?php
//Lớp Database được kế thừa từ lớp WebConfig
class Database extends WebConfig
{
    var $conn;
    function __construct()
    {
        $this->conn = mysqli_connect($this->servername, $this->username, 
                                        $this->password, $this->database);
        mysqli_set_charset($this->conn, 'utf8');
        // if (!$this->conn) {
        //     # code...
        //     echo "Lỗi";
        // }
        // else echo "Thành công";
        
    }
    function TableName($name){
        return $this->tiento.$name;
    }

    #truy vấn trả về 1 mẫu tin
    function QueryOne($sql){
        $result = mysqli_query($this->conn, $sql);
        $row = mysqli_fetch_assoc($result);
        return $row;
    }
    #truy vấn không trả về mẫu tin
    function QueryNoResult($sql){
        mysqli_query($this->conn, $sql);
    }
    function QueryAll($sql){
        $a = array();
        $result = mysqli_query($this->conn, $sql);
        while ($row = mysqli_fetch_assoc($result)){
            $a[] = $row;
        }
        return $a;
    }
}
?>