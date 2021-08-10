<?php
$product = loadModel('product');
if (isset($_POST['THEM'])) {
    # code...
    $data = array(
        'TenSP'=>$_POST['TenSP'],
        'SoLuongNhap'=>$_POST['SoLuongNhap'],
        'GiaBan'=>$_POST['GiaBan'],
        'GiaKhuyenMai'=>$_POST['GiaKhuyenMai'],
        'MaNCC'=>$_POST['MaNCC'],
        'MaLoaiSP'=>$_POST['MaLoaiSP'],
        'MoTa'=>$_POST['MoTa'],
        'ThungRac'=>0
    );
    $name_img = $_FILES['HinhAnh']['name'];
    $temp_img = $_FILES['HinhAnh']['tmp_name'];
    $data['HinhAnh'] = $name_img;
    move_uploaded_file($temp_img,"../public/images/".$name_img);
    // echo "<pre>";
    // print_r($data);
    // echo "</pre>";
    $product->product_insert($data);
    header('location: index.php?option=product');
}

#Xu ly cap nhat san pham
if (isset($_POST['CAPNHAT'])) {
    $id = $_REQUEST['id'];
    # code...
    $data = array(
        
        'TenSP'=>$_POST['TenSP'],
        'SoLuongNhap'=>$_POST['SoLuongNhap'],
        'GiaBan'=>$_POST['GiaBan'],
        'GiaKhuyenMai'=>$_POST['GiaKhuyenMai'],
        'MaNCC'=>$_POST['MaNCC'],
        'MaLoaiSP'=>$_POST['MaLoaiSP'],
        'MoTa'=>$_POST['MoTa']
    );
    if (strlen($_FILES['HinhAnh']['name'])) {
        # code...
        $name_img = $_FILES['HinhAnh']['name'];
        $temp_img = $_FILES['HinhAnh']['tmp_name'];
        $data['HinhAnh'] = $name_img;
        move_uploaded_file($temp_img,"../public/images/".$name_img);
    }
    
    // echo "<pre>";
    // print_r($data);
    // echo "</pre>";
    $product->product_update($data, $id);
    header('location: index.php?option=product');
}
?>