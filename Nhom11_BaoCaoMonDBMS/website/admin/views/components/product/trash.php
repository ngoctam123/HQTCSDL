<?php
$product = loadModel('product');
$list = $product->product_view_trash();
?>

<div class="panel panel-default" style="width: 100%;">
    <div class="panel-heading">
        <div class="row">
            <div class="col-md-6">
                <h3 class="panel-title">Thùng rác sản phẩm</h3>
            </div>
            <div class="col-md-6 text-right">
            <a class="btn btn-danger" href="index.php?option=product" role="button">
                <span class="glyphicon glyphicon-remove"></span> Thoát
            </a>
            </div>
        </div>
        
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                    <th style="width:50px;">
                    <input type="checkbox" name="" id="">
                    </th>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Khôi phục</th>
                    <th>Xóa vĩnh viễn</th>
                    <th>ID</th>
                    </tr>
                </thead>
                
                <?php foreach($list as $row):?>
                    <tr>
                    <td style="text-align: center;">
                        <input type="checkbox" name="" id="">
                    </td>
                    <td>
                    <img style="height: 110px;" src="../public/images/<?php echo $row['HinhAnh']; ?>" alt="<?php echo $row['HinhAnh']; ?>" srcset="">
                    </td>
                    <td><?php echo $row['TenSP']; ?></td>
                    
                    <td style="text-align: center;">
                        <a class="btn btn-default btn-warning" href="index.php?option=product&cat=reset&id=<?php echo $row['MaSP']; ?>" role="button">
                            <span class="glyphicon glyphicon-repeat"></span> Khôi phục
                        </a>
                    </td>
                    <td style="text-align: center;">
                        <a class="btn btn-default btn-danger" href="index.php?option=product&cat=delete&id=<?php echo $row['MaSP']; ?>" role="button">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </td>
                    <td style="text-align: center;font-weight: bold;"><?php echo $row['MaSP']; ?></td>
                    </tr>
                <?php endforeach;?>
            </table>
        </div>
    </div>
</div>