<h1>Thêm sinh viên</h1>


<?php
class TableRows extends RecursiveIteratorIterator
{
  function __construct($it)
  {
    parent::__construct($it, self::LEAVES_ONLY);
  }

  function current()
  {
    return "<td style='width:150px;border:1px solid black;'>"
      . parent::current() . "</td>";
  }

  function beginChildren()
  {
    echo "<tr>";
  }

  function endChildren()
  {
    echo "</tr>" . "\n";
  }
}
require_once 'pdoconfig.php';
try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $MSSV = "";
  $HoTen = "";
  $NamSinh = "";
  $DiemMon1 = "";
  $DiemMon2 = "";
  $DiemMon3 = "";
  $Email = "";
  $DienThoai = "";
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["MSSV"])) {
      $MSSV = $_POST['MSSV'];
    }
    if (isset($_POST["HoTen"])) {
      $HoTen = $_POST['HoTen'];
    }
    if (isset($_POST["NamSinh"])) {
      $NamSinh = $_POST['NamSinh'];
    }
    if (isset($_POST["DiemMon1"])) {
      $DiemMon1 = $_POST['DiemMon1'];
    }
    if (isset($_POST["DiemMon2"])) {
      $DiemMon2 = $_POST['DiemMon2'];
    }
    if (isset($_POST["DiemMon3"])) {
      $DiemMon3 = $_POST['DiemMon3'];
    }
    if (isset($_POST["Email"])) {
      $Email = $_POST['Email'];
    }
    if (isset($_POST["DienThoai"])) {
      $DienThoai = $_POST['DienThoai'];
    }
    $sql = "INSERT INTO SinhVien VALUES ('$MSSV', '$HoTen', '$NamSinh', '$DiemMon1', '$DiemMon2', '$DiemMon3','$Email', '$DienThoai')";
  }
  $conn->exec($sql);
  echo "Table SinhVien created successfully";
} catch (PDOException $e) {
}
$conn = null;
?>

<form action="" method="post">
  <table>
    <tr>
      <th>Mã số sinh viên:</th>
      <td><input type="number" name="MSSV" value=""></td>
    </tr>

    <tr>
      <th>Họ tên:</th>
      <td><input type="text" name="HoTen" value=""></td>
    </tr>

    <tr>
      <th>Năm sinh:</th>
      <td><input type="number" name="NamSinh" value=""></td>
    </tr>

    <tr>
      <th>Điểm môn 1:</th>
      <td><input type="number" name="DiemMon1"></input></td>
    </tr>

    <tr>
      <th>Điểm môn 2:</th>
      <td><input type="number" name="DiemMon2"></input></td>
    </tr>

    <tr>
      <th>Điểm môn 3:</th>
      <td><input type="number" name="DiemMon3"></input></td>
    </tr>

    <tr>
      <th>Email:</th>
      <td><input type="text" name="Email"></input></td>
    </tr>

    <tr>
      <th>Điện thoại:</th>
      <td><input type="number" name="DienThoai"></input></td>
    </tr>
  </table>
  <button type="submit">Thêm</button>
</form>