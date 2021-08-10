<?php
$product = loadModel('product');
$id = $_REQUEST['id'];
$product->product_restrash($id);
header('location: index.php?option=product&cat=trash');
?>