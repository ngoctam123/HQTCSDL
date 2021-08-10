<?php
$id=$_REQUEST['id'];
$product = loadModel('product');
$row = $product->product_detail($id);
$category = loadModel('category');
$supplier = loadModel('supplier');
$listcatid = $category->category_list();
$listsuppid = $supplier->selectAll();
$optioncatid = "";
foreach($listcatid as $c){
    if ($c['MaLoaiSP']==$row['MaLoaiSP']) {
        # code...
        $optioncatid.="<option selected value = '".$c['MaLoaiSP']."'>".$c['TenLoaiSP']."</option>";
    }
    else {
        $optioncatid.="<option  value = '".$c['MaLoaiSP']."'>".$c['TenLoaiSP']."</option>";
    }
}
$optionsuppid = "";
foreach($listsuppid as $s){
    if ($s['MaNCC']==$row['MaNCC']){
        $optionsuppid.="<option selected value = '".$s['MaNCC']."'>".$s['TenNhaCC']."</option>";
    }
    else {
    $optionsuppid.="<option value = '".$s['MaNCC']."'>".$s['TenNhaCC']."</option>";
    }
 }
?>
<form action="index.php?option=product&cat=xuly&id=<?php echo $row['MaSP'];?>" method="post" enctype="multipart/form-data" style="width: 100%;">
    <div class="panel panel-default" >
        <div class="panel-heading">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="panel-title">Cập nhật sản phẩm</h3>
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
                        <input type="text" class="form-control" name="MaSP" placeholder="TD01" readonly value="<?php echo $row['MaSP'];?>">
                        <small class="form-text text-muted">Mã sản phẩm bắt đầu bằng tên viết tắt (in HOA) của loại sản phẩm + số.</small>
                    </div>

                    <div class="form-group">
                        <label>Tên sản phẩm</label>
                        <input type="text" class="form-control" name="TenSP" value="<?php echo $row['TenSP'];?>">
                    </div>

                    <div class="form-group">
                        <label>Mô tả sản phẩm</label>
                        <textarea class="form-control" name="MoTa" rows="15"><?php echo $row['MoTa'];?></textarea>
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
                        <input type="number" class="form-control" name="SoLuongNhap" value="<?php echo $row['SoLuongNhap'];?>" min="1" step="1">
                    </div>
                    <div class="form-group">
                        <label>Giá bán (đ)</label>
                        <input type="number" class="form-control" name="GiaBan" value="<?php echo $row['GiaBan'];?>" min='1000'>
                    </div>
                    <div class="form-group">
                        <label>Giá khuyến mãi (đ)</label>
                        <input type="number" class="form-control" name="GiaKhuyenMai" value="<?php echo $row['GiaKhuyenMai'];?>" min="0">
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
                        <button name="CAPNHAT" type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-ok"></span> Lưu kết quả
                        </button>
                    </div>
                </div>
                
                
            </div>
        </div>
    </div>
</form>
