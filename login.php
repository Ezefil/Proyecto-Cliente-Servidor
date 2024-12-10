<?php
$host = "localhost";
$user = "root";
$pass = "";
$databaseName = "galgo_medical";

$link = mysqli_connect($host, $user, $pass, $databaseName);

if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = mysqli_real_escape_string($link, $_POST['nombre']);
    
    $query = "SELECT * FROM usuarios WHERE nombre='$nombre'";
    $result = mysqli_query($link, $query);

    if (mysqli_num_rows($result) > 0) {
        echo "existe"; // El usuario existe
    } else {
        echo "no existe"; // El usuario no existe
    }
}

mysqli_close($link);
?>