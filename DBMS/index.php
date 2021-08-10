<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body>
  <div class="content read">
    <a href="add.php" class="button">Thêm sinh viên</a>
    <table>
      <thead>
        <tr>
          <td>MSSV</td>
          <td>Họ tên</td>
          <td>Năm sinh</td>
          <td>Điểm môn 1</td>
          <td>Điểm môn 2</td>
          <td>Điểm môn 3</td>
          <td>Email</td>
          <td>Phone</td>
          <td>#</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <?php require_once 'pdoconfig.php';
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $c11 = $conn->prepare("SELECT * FROM SinhVien");
        $c11->execute();
        $c11->setFetchMode(PDO::FETCH_ASSOC);
        $result = $c11->fetchAll();
        foreach ($result as $item) : ?>
          <tr>
            <td><?= $item['MSSV'] ?></td>
            <td><?= $item['HoTen'] ?></td>
            <td><?= $item['NamSinh'] ?></td>
            <td><?= $item['DiemMon1'] ?></td>
            <td><?= $item['DiemMon2'] ?></td>
            <td><?= $item['DiemMon3'] ?></td>
            <td><?= $item['Email'] ?></td>
            <td><?= $item['DienThoai'] ?></td>
            <td class="actions">
              <a href="update.php?id=<?= $item['MSSV'] ?>" class="button">Cập nhật</a>
              <a href="delete.php?id=<?= $item['MSSV'] ?>" class="button">Xóa</a>
            </td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>
  </div>
</body>

</html>