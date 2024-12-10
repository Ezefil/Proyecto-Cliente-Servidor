<?php
// Conectar a la base de datos
$conectar = mysqli_connect('localhost', 'root', '', 'galgo_medical');

// Verificar conexión
if (!$conectar) {
    die("Conexión fallida: " . mysqli_connect_error());
}

// Obtener los datos del formulario
$nombre = $_POST['nombre'];
$rol = $_POST['rol'];
$correo = $_POST['correo'];
$password = $_POST['password'];
$fecha_registro = date('Y-m-d'); // Fecha actual
$estado = $_POST['estado'];

// Preparar la consulta SQL
$sql = "INSERT INTO usuarios (nombre, rol, correo_electronico, contraseña, fecha_registro, estado) VALUES ('$nombre', '$rol', '$correo', '$password', '$fecha_registro', '$estado')";

// Ejecutar la consulta
if (mysqli_query($conectar, $sql)) {
    echo "Datos almacenados correctamente.";
    header("Location: login.html"); // Redirigir al usuario después de insertar
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conectar);
}

// Cerrar conexión
mysqli_close($conectar);
?>