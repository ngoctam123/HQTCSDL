<?php
$product = loadModel('product');
$id = $_REQUEST['id'];
$product->product_deltrash($id);
header('location: index.php?option=product');
?>