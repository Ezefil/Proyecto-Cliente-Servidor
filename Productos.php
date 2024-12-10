<?php
	// Conexión a la base de datos
		$servername = "localhost";
		$username = "root"; // Por defecto en XAMPP
		$password = ""; // Por defecto en XAMPP
		$database = "galgomedical";
		// Crear conexión
		$conn = new mysqli($servername, $username, $password, $database);

		// Verificar conexión
		if ($conn->connect_error) {
		die("Conexión fallida: " . $conn->connect_error);
		}
		
?>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Galgo Medical - Reporte de calidad</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
    </style>

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
<div class="container-fluid">
        <div class="row bg-secondary py-1 px-xl-5">
		<a href="" class="text-decoration-none">
                    <span class="h1 text-uppercase text-primary bg-dark px-2">Galgo</span>
                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Medical</span>
                </a>
            <div class="col-lg-2 d-none d-lg-block">
                <div class="d-inline-flex align-items-center h-100"> </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">My Account</button>
                        <div class="dropdown-menu dropdown-menu-right">
                             <a href="login.html" class="btn btn-sm btn-light">Sign Out</a>
                        </div>
                    </div>
                    <div class="btn-group mx-2">
                    </div>
                </div>
                
            </div>
        </div>
        
    </div>

    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid bg-dark mb-30">
        <div class="row px-xl-5">
            
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="index.html" class="nav-item nav-link">Inicio</a>
                            <a href="Productos.php" class="nav-item nav-link active">Productos</a>
                            <a href="Reporte.php" class="nav-item nav-link ">Reporte</a>
							<a href="Normas.php" class="nav-item nav-link">Normas</a>
                            <a href="Produccion.php" class="nav-item nav-link">Produccion</a>
                        </div>
                        
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <!-- Navbar End -->


    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="#">Home</a>
                    <span class="breadcrumb-item active">Productos</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Contact Start -->
    <div class="container-fluid">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Productos</span></h2>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form bg-light p-30">
					<div id="success"></div> <!-- Mensaje de éxito -->

					<?php
					// Inicializar variables
					$total_registros = 0;
					$nombre = "";
					$descripcion = "";
					$clasificacion = "";
					$fecha_creacion = "";
					$observaciones = "";

					// Obtener el total de registros para el ID del producto
						$sql = "SELECT MAX(id_producto) as total FROM productos_medicos"; // Cambia COUNT(*) por MAX(id_producto)
						$result = $conn->query($sql);

						if ($result && $result->num_rows > 0) {
							$row = $result->fetch_assoc();
							// Si no hay registros, inicializa total_registros a 0, de lo contrario usa el máximo + 1
							$total_registros = $row['total'] !== null ? $row['total'] + 1 : 1; // Asegúrate de que si no hay registros, empiece en 1
						} else {
							$total_registros = 1; // Si no hay resultados, inicializa a 1
						}

						// Procesar el formulario al ser enviado
						if ($_SERVER["REQUEST_METHOD"] == "POST") {
							// Recibir datos del formulario con validación
							$nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : null;
							$descripcion = isset($_POST['descripcion']) ? trim($_POST['descripcion']) : null;
							$clasificacion = isset($_POST['clasificacion']) ? trim($_POST['clasificacion']) : null;
							$fecha_creacion = isset($_POST['fecha_creacion']) ? trim($_POST['fecha_creacion']) : null;
							$observaciones = isset($_POST['observaciones']) ? trim($_POST['observaciones']) : "";

							// Validar campos requeridos
							if (!empty($nombre) && !empty($descripcion) && !empty($clasificacion) && !empty($fecha_creacion)) {
								// Preparar la consulta SQL usando declaraciones preparadas
								$stmt = $conn->prepare("INSERT INTO productos_medicos (nombre, descripcion, clasificacion, fecha_creacion, observaciones) VALUES (?, ?, ?, ?, ?)");
								if ($stmt) {
									$stmt->bind_param("sssss", $nombre, $descripcion, $clasificacion, $fecha_creacion, $observaciones);

									// Ejecutar la consulta
									if ($stmt->execute()) {
										echo "<div class='alert alert-success'>Nuevo registro creado exitosamente</div>";
									} else {
										echo "<div class='alert alert-danger'>Error: " . htmlspecialchars($stmt->error) . "</div>";
									}

									// Cerrar declaración
									$stmt->close();
								} else {
									echo "<div class='alert alert-danger'>Error al preparar la consulta: " . htmlspecialchars($conn->error) . "</div>";
								}
							} else {
								echo "<div class='alert alert-warning'>Por favor completa todos los campos requeridos.</div>";
							}
						}
						?>

						<form name="sentMessage" id="contactForm" novalidate="novalidate" action="" method="post">
							<div class="control-group">
								<label>ID de Producto: <?php echo htmlspecialchars($total_registros); ?></label>
								<p class="help-block text-danger"></p>
							</div>
							
							<div class="control-group">
								<label>Nombre de producto:</label>
								<input type="text" name="nombre" id="nombre" placeholder="Nombre del producto" required maxlength="100">
								<p class="help-block text-danger"></p>
							</div>

							<div class="control-group">
								<label>Descripción:</label>
								<textarea id="Descripcion" name="descripcion" class="form-control" rows="5" maxlength="150" placeholder="Escribe tu comentario aquí..." required></textarea>
								<p class="help-block text-danger"></p>
							</div>

							<div class="control-group">
								<label>Clasificación:</label>
								<input type="text" id="clasi" name="clasificacion" list="listaClasificacion" placeholder="Clasificación" required maxlength="10">
								<datalist id="listaClasificacion">
									<option value="Cuarto limpio">
									<option value="Cuarto anti estatica">
								</datalist>
								<p class="help-block text-danger"></p>
							</div>

							<div class="control-group">
								<label>Fecha de creación:</label>
								<input type="text" id="fecha" name="fecha_creacion" placeholder="AAAA-MM-DD" required pattern="\d{4}-\d{2}-\d{2}" maxlength="10">
								<small>Formato: AAAA-MM-DD</small>
							</div>

							<div class="control-group">
								<label>Observaciones:</label>
								<textarea id="Observaciones" name="observaciones" class="form-control" rows="5" maxlength="400" placeholder="Escribe tus observaciones aquí..."></textarea>
								<p class="help-block text-danger"></p>
							</div>

							<div>
								<input class="btn btn-primary py-2 px-4" type="submit" value="Enviar reporte">
							</div>
						</form>
						</div>
										
            </div>
            <div class="col-lg-5 mb-5">
                <div class="bg-light p-30 mb-5">
				<img src="img/productos medicos.png" width="500" height="400"> </div>
                    
                </div>
            </div>
				<table>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Descripción</th>
						<th>Clasificación</th>
						<th>Fecha de creación</th>
						<th>Observaciones</th>
						<th>Eliminar dato</th>
					</tr>

					<?php

					// Manejo de eliminación si se recibe un ID en la URL
					if (isset($_GET['id'])) {
						$id = $_GET['id'];

						// Usa declaraciones preparadas para evitar inyecciones SQL
						$stmt = $conn->prepare("DELETE FROM productos_medicos WHERE id_producto = ?");
						$stmt->bind_param("i", $id); // Suponiendo que id_producto es un entero

						if ($stmt->execute()) {
							echo json_encode(["success" => true]);
							exit; // Terminar aquí para evitar mostrar la tabla después
						} else {
							echo json_encode(["success" => false, "error" => $stmt->error]);
							exit; // Terminar aquí para evitar mostrar la tabla después
						}

						$stmt->close();
					}

					// Consulta para obtener datos
					$sql = "SELECT * FROM productos_medicos";
					$result = $conn->query($sql);

					// Verificar si hay resultados y mostrarlos
					if ($result->num_rows > 0) {
						while ($row = $result->fetch_assoc()) {
							echo "<tr>";
							echo "<td>" . htmlspecialchars($row["id_producto"]) . "</td>"; 
							echo "<td>" . htmlspecialchars($row["nombre"]) . "</td>";
							echo "<td>" . htmlspecialchars($row["descripcion"]) . "</td>";
							echo "<td>" . htmlspecialchars($row["clasificacion"]) . "</td>"; 
							echo "<td>" . htmlspecialchars($row["fecha_creacion"]) . "</td>"; 
							echo "<td>" . htmlspecialchars($row["observaciones"]) . "</td>"; 
							echo '<td><button class="botonBorrar" data-id="' . htmlspecialchars($row["id_producto"]) . '">Borrar</button></td>'; 
							echo "</tr>";
						}
					} else {
						echo "<tr><td colspan='7'>No hay datos disponibles</td></tr>";
					}

					$conn->close();
					?>
				</table>

				<script>
				document.addEventListener('DOMContentLoaded', function() {
					const botonesBorrar = document.querySelectorAll('.botonBorrar');

					botonesBorrar.forEach(button => {
						button.addEventListener('click', function() {
							const id = this.getAttribute('data-id'); // Obtiene el ID del producto

							// Confirmación antes de borrar
							if (confirm("¿Realmente quieres borrar este producto?")) {
								// Realiza la petición al servidor
								fetch(`Productos.php?id=${id}`, {
									method: 'GET'
								})
								.then(response => response.json())
								.then(data => {
									if (data.success) {
										// Elimina la fila de la tabla
										this.closest('tr').remove();
									} else {
										alert("Error al borrar el registro.");
									}
								})
								.catch(error => console.error('Error:', error));
							}
						});
					});
				});
				</script>
			<div class="h-100 bg-light p-30"></div>
        </div>
    </div>
    <!-- Contact End -->

    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>