<?php
require_once 'pdoconfig.php';
$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$msg = '';

if (isset($_GET['id'])) {
  // Select the record that is going to be deleted
  $stmt = $conn->prepare('SELECT * FROM SinhVien WHERE MSSV = ?');
  $stmt->execute([$_GET['id']]);
  $contact = $stmt->fetch(PDO::FETCH_ASSOC);
  if (!$contact) {
    exit('Contact doesn\'t exist with that ID!');
  }
  // Make sure the user confirms beore deletion
  if (isset($_GET['confirm'])) {
    if ($_GET['confirm'] == 'yes') {
      // User clicked the "Yes" button, delete record
      $stmt = $conn->prepare('DELETE FROM SinhVien WHERE MSSV = ?');
      $stmt->execute([$_GET['id']]);
      $msg = 'Bạn đã xóa thành công!';
    } else {
      // User clicked the "No" button, redirect them back to the read page
      header('Location: read.php');
      exit;
    }
  }
} else {
  exit('No ID specified!');
}
?>
<div class="content delete">
  <h2>Xóa MSSV #<?= $contact['MSSV'] ?></h2>
  <?php if ($msg) : ?>
    <p><?= $msg ?></p>
  <?php else : ?>
    <p>Bạc có chắc muốn xóa MSSV #<?= $contact['MSSV'] ?>?</p>
    <div class="yesno">
      <a href="delete.php?id=<?= $contact['MSSV'] ?>&confirm=yes">Có</a>
      <a href="delete.php?id=<?= $contact['MSSV'] ?>&confirm=no">Không</a>
    </div>
  <?php endif; ?>
</div>