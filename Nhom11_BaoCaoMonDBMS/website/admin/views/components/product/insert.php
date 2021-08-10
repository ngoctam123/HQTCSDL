<?php
$product = loadModel('product');
$category = loadModel('category');
$supplier = loadModel('supplier');
$listcatid = $category->category_list();
$listsuppid = $supplier->selectAll();
$optioncatid = "";
foreach($listcatid as $c){
     $optioncatid.="<option value = '".$c['MaLoaiSP']."'>".$c['TenLoaiSP']."</option>";
}
$optionsuppid = "";
foreach($listsuppid as $s){
    $optionsuppid.="<option value = '".$s['MaNCC']."'>".$s['TenNhaCC']."</option>";
 }
?>
<form action="index.php?option=product&cat=xuly" method="post" enctype="multipart/form-data" style="width: 100%;">
    <div class="panel panel-default" >
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="panel-title">Thêm sản phẩm</h3>
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
                <div class="col-md-8">
                    <div class="form-group">
                        <label>Mã sản phẩm</label>
                        <input type="text" class="form-control" name="MaSP" placeholder="Mã tự sinh" readonly>
                        
                    </div>

                    <div class="form-group">
                        <label>Tên sản phẩm</label>
                        <input type="text" class="form-control" name="TenSP">
                    </div>

                    <div class="form-group">
                        <label>Mô tả sản phẩm</label>
                        <textarea class="form-control" name="MoTa" rows="15"></textarea>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label>Loại sản phẩm</label>
                        <select class="form-control" name="MaLoaiSP">
                            <option value="">Chọn loại sản phẩm</option>
                            <?php echo $optioncatid;?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Số lượng sản phẩm </label>
                        <input type="number" class="form-control" name="SoLuongNhap" value="1" min="1" step="1">
                    </div>
                    <div class="form-group">
                        <label>Giá bán (đ)</label>
                        <input type="number" class="form-control" name="GiaBan" value="1000" min='1000'>
                    </div>
                    <div class="form-group">
                        <label>Giá khuyến mãi (đ)</label>
                        <input type="number" class="form-control" name="GiaKhuyenMai" value="0" min="0">
                    </div>
                    <div class="form-group">
                        <label>Nhà cung cấp</label>
                        <select class="form-control" name="MaNCC" >
                            <option value="">Chọn nhà cung cấp</option>
                            <?php echo $optionsuppid;?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Hình ảnh</label>
                        <input type="file" class="form-control-file" name="HinhAnh">
                    </div>
                    <div class="text-right">
                        <button name="THEM" type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-ok"></span> Lưu kết quả
                        </button>
                    </div>
                </div>
                <!-- <div class="col-md-12">
                    <p class="text-center" style="color: red; margin-top:1em;">------------------Thông tin sản phẩm đã thêm------------------</p>
                    <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                    <th>
                        Mã sản phẩm
                    </th>
                    <th></th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá bán</th>
                    <th>Giá khuyến mãi</th>
                    <th>Nhà cung cấp</th>
                    <th>Mô tả</th>
                    <th>Sửa</th>
                    </tr>
                </thead>
                
                    <tr>
                    <td style="text-align: center;"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    
                    <td style="text-align: center;">
                        <a class="btn btn-default btn-warning" href="index.php?option=product&cat=update" role="button">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                    </td>
                    </tr>
                
            </table>
                </div> -->
                
            </div>
        </div>
    </div>
</form>
