<?php
$product = loadModel('product');
$list = $product->selectAll();
?>

<div class="panel panel-default" style="width: 100%;">
    <div class="panel-heading">
        <div class="row">
            <div class="col-md-6">
                <h3 class="panel-title">Danh sách sản phẩm</h3>
            </div>
            <div class="col-md-6 text-right">
            <a class="btn btn-success" href="index.php?option=product&cat=insert" role="button">
                <span class="glyphicon glyphicon-plus"></span> Thêm
            </a>
            <a class="btn btn-primary" href="index.php?option=product&cat=trash" role="button">
                <span class="glyphicon glyphicon-trash"></span> Thùng rác
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
                    <!-- <th>Trạng thái</th> -->
                    <th>Sửa</th>
                    <th>Xóa</th>
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
                        <!-- <td style="text-align: center;">
                            <a class="btn" href="index.php?option=product&cat=status&id=<?php echo $row['MaSP']; ?>">
                            <?php if ($row['TrangThai']== 1): ?>
                                <span class="glyphicon glyphicon-ok-circle xanh"></span>
                                
                            <?php else:?>
                                <span class="glyphicon glyphicon-remove-circle do"></span>
                            <?php endif;?>
                            
                        </td> -->
                        <td style="text-align: center;">
                            <a class="btn btn-default btn-warning" href="index.php?option=product&cat=update&id=<?php echo $row['MaSP']; ?>" role="button">
                                <span class="glyphicon glyphicon-pencil"></span>
                            </a>
                        </td>
                        <td style="text-align: center;">
                            <a class="btn btn-default btn-danger" href="index.php?option=product&cat=deltrash&id=<?php echo $row['MaSP']; ?>" role="button">
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