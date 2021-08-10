<?php
$category = loadModel('category');
$list = $category->selectAll();
?>

<div class="panel panel-default" style="width: 100%;">
    <div class="panel-heading">
        <div class="row">
            <div class="col-md-6">
                <h3 class="panel-title">Danh sách loại sản phẩm</h3>
            </div>
            <div class="col-md-6 text-right">
            <a class="btn btn-success" href="#" role="button">
                <span class="glyphicon glyphicon-plus"></span> Thêm
            </a>
            <a class="btn btn-primary" href="#" role="button">
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
                    <th style="width:50px;">#</th>
                    <th>Tên loại sản phẩm</th>
                    <th>Trạng thái</th>
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
                    <td><?php echo $row['TenLoaiSP']; ?></td>
                    <td></td>
                    <td style="text-align: center;">
                        <a class="btn btn-default btn-warning" href="#" role="button">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                    </td>
                    <td style="text-align: center;">
                        <a class="btn btn-default btn-danger" href="#" role="button">
                            <span class="glyphicon glyphicon-trash"></span>
                        </a>
                    </td>
                    <td style="text-align: center;font-weight: bold;"><?php echo $row['MaLoaiSP']; ?></td>
                    </tr>
                <?php endforeach;?>
            </table>
        </div>
    </div>
</div>