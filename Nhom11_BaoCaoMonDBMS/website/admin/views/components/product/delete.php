<?php
$product = loadModel('product');
$id = $_REQUEST['id'];
$row = $product->product_detail($id);
$img = "../public/images/".$row['HinhAnh'];
if (file_exists($img)) {
    # code...
    unlink($img);
}
$product->product_delete($id);
header('location: index.php?option=product&cat=trash');
?>