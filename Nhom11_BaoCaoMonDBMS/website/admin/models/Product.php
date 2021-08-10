<?php 
class Product extends Database{
    function __construct()
    {
        //parent sẽ giúp bạn gọi đến hàm của class cha
        //Hàm parent::__construct() sẽ giúp bạn gọi đến hàm __construct() của class cha.
        parent::__construct();
        $this->table = $this->TableName('sanpham');
        
        
    }
    #lấy tất cả các sản phẩm trong bảng sanpham với điều kiện giá trị ThungRac = 0 và dữ 
    #liệu được sắp xếp theo thứ tự
    #dùng trong file insert.php
    function selectAll(){
        $sql = "SELECT * FROM $this->table WHERE ThungRac='0' ORDER BY TenSP DESC";
        return $this->QueryAll($sql);
    }
    #lấy chi tiết của 1 sản phẩm trong bảng sanpham theo MaSP
    function product_detail($id){
        $sql = "SELECT * FROM $this->table WHERE MaSP = '$id'
        ";
        return $this->QueryOne($sql);
    }
    // function product_status($status, $id){
    //     $sql = "UPDATE $this->table SET TrangThai = '$status' AND MaSP = '$id'";
    //     $this->QueryNoResult($sql);
    // }
    #lấy các sản phẩm trong table sanpham với với điều kiện giá trị ThungRac = 1 và dữ
    #liệu được sắp xếp
    #dùng trong file trash.php để hiển thị các sản phẩm đã xóa
    function product_view_trash(){
        $sql = "SELECT * FROM $this->table WHERE ThungRac='1' ORDER BY TenSP DESC";
        return $this->QueryAll($sql);
    }
    
    #dùng trong file trash.php
    function product_deltrash($id){
        $sql = "UPDATE $this->table SET ThungRac = '1' WHERE MaSP = '$id'";
        return $this->QueryNoResult($sql);
    }
    function product_restrash($id){
        $sql = "UPDATE $this->table SET ThungRac = '0' WHERE MaSP = '$id'";
        $this->QueryNoResult($sql);
    }
    function product_delete($id){
        $sql = "DELETE FROM $this->table WHERE MaSP = '$id'";
        $this->QueryNoResult($sql);
    }

    #
    function product_insert($data){
        $strk="";
        $strv="";
        foreach($data as $key=>$values){
            $strk.=$key.",";
            $strv.="'$values',";
        }
        $strk=trim($strk,",");
        $strv=trim($strv,',');
        $sql = "INSERT INTO $this->table($strk)
        VALUES($strv)";
        
        echo $sql;
        $re=$this->QueryNoResult($sql);
        
    }
    #Update
    function product_update($data, $id){
        $strset="";
        foreach($data as $key=>$values){
            $strset.= $key."='$values',";
        }
        $strset=trim($strset,",");
        $sql = "UPDATE $this->table SET $strset WHERE MaSP = '$id'";
        echo $sql;
        $this->QueryNoResult($sql);
    }
}
?>
