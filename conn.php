<?php
  $servername = "localhost:3307";
  $database = "pembayaran";
  $username = "root";
  $password = "";
  $mysqli=mysqli_connect($servername, $username, $password) or die('Connect Failed !!!');
  mysqli_select_db($mysqli,$database) or die('Database Not Found !!!');
?>