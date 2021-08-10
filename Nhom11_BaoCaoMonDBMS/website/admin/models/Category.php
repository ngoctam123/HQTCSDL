<?php
class Category extends Database
{
    function __construct()
    {
        //parent sẽ giúp bạn gọi đến hàm của class cha
        //Hàm parent::__construct() sẽ giúp bạn gọi đến hàm __construct() của class cha.
        parent::__construct();
        $this->table = $this->TableName('loaisanpham');
        
        
    }
    function selectAll(){
        $sql = "SELECT * FROM $this->table";
        return $this->QueryAll($sql);
    }
    function category_list(){
        $sql = "SELECT MaLoaiSP, TenLoaiSP FROM $this->table ORDER BY TenLoaiSP DESC ";
        return $this->QueryAll($sql);
    }
}
?>