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
                            <a href="Productos.php" class="nav-item nav-link ">Productos</a>
                            <a href="Reporte.php" class="nav-item nav-link ">Reporte</a>
							<a href="Normas.php" class="nav-item nav-link">Normas</a>
                            <a href="Produccion.php" class="nav-item nav-link active">Produccion</a>
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
                    <span class="breadcrumb-item active">Produccion</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->


    <!-- Checkout Start -->
    <div class="container-fluid">
        <div class="row px-xl-3">
            <div class="col-lg-6">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Produccion</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="success"></div>
					<?php
					$total_registros = 1; 
					$id_producto = "";
					$cantidad_scrap = "";
					$cantidad_producida = "";
					$fecha_produccion = "";
					$observaciones = "";
					$message = "";

					// Obtener el máximo ID de producción para establecer el siguiente ID
					$sql = "SELECT MAX(id_produccion) as total FROM produccion";
					$result = $conn->query($sql);
					if ($result && $result->num_rows > 0) {
						$row = $result->fetch_assoc();
						$total_registros = $row['total'] !== null ? $row['total'] + 1 : 1;
					}

					// Procesar el formulario al enviarlo
					if ($_SERVER["REQUEST_METHOD"] == "POST") {
						// Recoger datos del formulario con validación
						$id_producto = isset($_POST['id_producto']) ? trim($_POST['id_producto']) : null;
						$cantidad_scrap = isset($_POST['cantidad_scrap']) ? trim($_POST['cantidad_scrap']) : null;
						$cantidad_producida = isset($_POST['cantidad_producida']) ? trim($_POST['cantidad_producida']) : null;
						$fecha_produccion = isset($_POST['fecha_produccion']) ? trim($_POST['fecha_produccion']) : null;
						$observaciones = isset($_POST['observaciones']) ? trim($_POST['observaciones']) : "";

						// Validar campos requeridos
						if (!empty($id_producto) && !empty($cantidad_scrap) && !empty($cantidad_producida) && !empty($fecha_produccion)) {
							// Preparar la consulta SQL usando declaraciones preparadas
							$stmt = $conn->prepare("INSERT INTO produccion (id_producto, fecha_produccion, cantidad_producida, cantidad_scrap, observaciones) VALUES (?, ?, ?, ?, ?)");
							if ($stmt) {
								$stmt->bind_param("sssss", $id_producto, $fecha_produccion, $cantidad_producida, $cantidad_scrap, $observaciones);

								// Ejecutar la consulta
								if ($stmt->execute()) {
									$message = "<div class='alert alert-success'>Nuevo registro creado exitosamente</div>";
								} else {
									$message = "<div class='alert alert-danger'>Error: " . htmlspecialchars($stmt->error) . "</div>";
								}

								// Cerrar declaración
								$stmt->close();
							} else {
								$message = "<div class='alert alert-danger'>Error al preparar la consulta: " . htmlspecialchars($conn->error) . "</div>";
							}
						} else {
							$message = "<div class='alert alert-warning'>Por favor completa todos los campos requeridos.</div>";
						}
					}

					// Consulta para obtener los id_producto disponibles en otra tabla
					$sql_productos = "SELECT id_producto FROM productos_medicos";
					$result_productos = $conn->query($sql_productos);
					?>
					<div class="success"><?php echo $message; ?></div>
					<form name="sentMessage" id="contactForm" novalidate="novalidate" action="" method="post">
						<div class="col-md-6 form-group">
							<label>ID de Producción: <?php echo htmlspecialchars($total_registros); ?></label>
							<input type="hidden" name="id_produccion" value="<?php echo htmlspecialchars($total_registros); ?>">
						</div>
						<div class="col-md-6 form-group">
							<label for="id_producto">ID Producto:</label>
							<select class="form-control" id="id_producto" name="id_producto" required>
								<?php
								// Llenar el menú desplegable con los resultados
								if ($result_productos && $result_productos->num_rows > 0) {
									while ($row_productos = $result_productos->fetch_assoc()) {
										echo "<option value='" . htmlspecialchars($row_productos['id_producto']) . "'>" . htmlspecialchars($row_productos['id_producto']) . "</option>";
									}
								} else {
									echo "<option value=''>No hay producciones disponibles</option>";
								}
								?>
							</select>
						</div>
						<div class="col-md-6 form-group">
							<label>Fecha de Producción</label>
							<input class="form-control" type="date" name="fecha_produccion" required>
						</div>
						<div class="col-md-6 form-group">
							<label>Cantidad Producida</label>
							<input class="form-control" type="text" name="cantidad_producida" placeholder="123456" required>
						</div>
						<div class="col-md-6 form-group">
							<label>Cantidad de Scrap</label>
							<input class="form-control" type="text" name="cantidad_scrap" placeholder="1234" required>
						</div>
						<div class="col-md-6 form-group">
							<label>Observaciones</label>
							<textarea id="Observaciones" name="observaciones" class="form-control" rows="5" maxlength="200" placeholder="Escribe tus observaciones aquí..."></textarea>
						</div>
						<div class="col-md-6 form-group">
							<input class="btn btn-primary py-2 px-4" type="submit" value="Enviar reporte">
						</div>
					</form>
				</div>
                 
                </div>
                <div class="collapse mb-5" id="shipping-address">
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                <div class="bg-light p-30 mb-5">
                    <img src="img/18.png" width="300" height="300"> </div>
                </div>
                <div class="mb-5">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Mas datos</span></h5>
                    <div class="bg-light p-30">
                       <button  onclick="location.href='Scraps.php'" class="btn  btn-primary font-weight-bold py-3">Scraps</button>
                    </div>
                </div>
            </div>
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