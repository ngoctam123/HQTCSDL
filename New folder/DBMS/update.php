<?php
require_once 'pdoconfig.php';
$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$msg = '';

if (isset($_GET['id'])) {
  if (!empty($_POST)) {
    $MSSV = isset($_POST['MSSV']) ? $_POST['MSSV'] : NULL;
    $HoTen = isset($_POST['HoTen']) ? $_POST['HoTen'] : '';
    $NamSinh = isset($_POST['NamSinh']) ? $_POST['NamSinh'] : '';
    $DiemMon1 = isset($_POST['DiemMon1']) ? $_POST['DiemMon1'] : '';
    $DiemMon2 = isset($_POST['DiemMon2']) ? $_POST['DiemMon2'] : '';
    $DiemMon3 = isset($_POST['DiemMon3']) ? $_POST['DiemMon3'] : '';
    $Email = isset($_POST['Email']) ? $_POST['Email'] : '';
    $DienThoai = isset($_POST['DienThoai']) ? $_POST['DienThoai'] : '';

    // Update the record
    $stmt = $conn->prepare('UPDATE SinhVien SET MSSV = ?, HoTen = ?, NamSinh = ?, DiemMon1 = ?, DiemMon2 = ?, DiemMon3 = ?, Email = ?, DienThoai = ? WHERE MSSV = ?');
    $stmt->execute([$MSSV, $HoTen, $NamSinh, $DiemMon1, $DiemMon2, $DiemMon3, $Email, $DienThoai, $_GET['id']]);
    $msg = 'Updated Successfully!';
  }
  // Get the contact from the contacts table
  $stmt = $conn->prepare('SELECT * FROM SinhVien WHERE MSSV = ?');
  $stmt->execute([$_GET['id']]);
  $contact = $stmt->fetch(PDO::FETCH_ASSOC);
  if (!$contact) {
    exit('Contact doesn\'t exist with that ID!');
  }
} else {
  exit('No ID specified!');
}
?>

<div class="content update">
  <h2>Cập nhật sinh vien #<?= $contact['MSSV'] ?></h2>
  <form action="update.php?id=<?= $contact['MSSV'] ?>" method="post">
    <label for="MSSV">ID</label>
    <input type="text" name="MSSV" value="<?= $contact['MSSV'] ?>" id="MSSV">

    <label for="HoTen">Name</label>
    <input type="text" name="HoTen" value="<?= $contact['HoTen'] ?>" id="HoTen">

    <label for="email">Năm sinh</label>
    <input type="number" name="NamSinh" value="<?= $contact['NamSinh'] ?>" id="NamSinh">

    <label for="DiemMon1">DiemMon1</label>
    <input type="number" name="DiemMon1" value="<?= $contact['DiemMon1'] ?>" id="DiemMon1">

    <label for="DiemMon2">DiemMon2</label>
    <input type="text" name="DiemMon2" value="<?= $contact['DiemMon2'] ?>" id="DiemMon2">

    <label for="DiemMon3">DiemMon3</label>
    <input type="text" name="DiemMon3" value="<?= $contact['DiemMon3'] ?>" id="DiemMon3">

    <label for="Email">Email</label>
    <input type="text" name="Email" value="<?= $contact['Email'] ?>" id="Email">

    <label for="DienThoai">DienThoai</label>
    <input type="number" name="DienThoai" value="<?= $contact['DienThoai'] ?>" id="DienThoai">
    <input type="submit" value="Update">
  </form>
  <?php if ($msg) : ?>
    <p><?= $msg ?></p>
  <?php endif; ?>
</div>