<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RD RENTAL</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../css/style.css?v=<?php echo time(); ?>">
</head>
<body>
    <nav class="sidebar close">
        <header>
            <div class="text logo">
                <a href="index.php"><img src='../img/RDRENTAL1.png' alt='logo RDRENTAL' style='object-fit: contain;'/></a>
            </div>
            <i class="bx bx-menu toggle"></i>
        </header>
        <div class="menu-bar">
            <div class="menu">
                <form method="post" action="busqueda.php">
                <li class="search-box">
                    <button type="submit"><i class="bx bx-search icon"></i></button>
                    <input type="text" name="busqueda" placeholder="Buscar...">
                </li>
                </form>
                <ul class="menu-link">
                    <li class="nav-link">
                        <a href="index.php">
                            <i class="bx bx-home-alt icon"></i>
                            <span class="text nav-text">Inicio</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="catalogo.php">
                            <i class="bx bxs-detail icon"></i>
                            <span class="text nav-text">Catalogo</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class="bx bx-bell icon"></i>
                            <span class="text nav-text">Notificaciones</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class="bx bx-package icon"></i>
                            <span class="text nav-text">Mis reservas</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class="bx bx-heart icon"></i>
                            <span class="text nav-text">Deseados</span>
                        </a>
                    </li>
                    <li class="nav-link">
                        <a href="#">
                            <i class="bx bx-basket icon"></i>
                            <span class="text nav-text">Mi carro</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="bottom-content">
                <li class="">
                    <a href="#">
                        <i class="bx bx-log-in icon"></i>
                        <span class="text nav-text">Ingresar</span>
                    </a>
                </li>
                <li class="mode">
                    <div class="sun-moon">
                        <i class="bx bx-moon icon moon"></i>
                        <i class="bx bx-sun icon sun"></i>
                    </div>
                    <span class="mode-text text">Dark mode</span>
                    <div class="toggle-switch">
                        <span class="switch"></span>
                    </div>
                </li>
            </div>
        </div>
    </nav>
    <section class="home">
        <div class="text principal">
            <p> RD RENTAL</p>
        </div>
        <div class="banner">
            <div class="banner-img">
                <img class="img1" src="../img/AGROINDUSTRIA/pulverizadora.jpg" alt="banner">
                <img class="img2" src="../img/AGROINDUSTRIA/portabins.jpg" alt="banner">
                <img class="img3" src="../img/MOVIMIENTO DE TIERRA/maquinaria.jpg" alt="banner">
            </div>
            <div class="puntos">
                <i class='bx bx-radio-circle-marked' ></i>
                <i class='bx bx-radio-circle'></i>
                <i class='bx bx-radio-circle'></i>
            </div>
            <i class='izq bx bx-chevron-left'></i>
            <i class='der bx bx-chevron-right'></i>
        </div>
        <div class="text secundario">
            <p>NUESTRA LÍNEA DE EQUIPOS EN ALQUILER</p>
        </div>
        <div class="container">
                <?php
                    include("conexion.php");
                    $query = "SELECT * FROM maquinaria";
                    $resultado = $conexion->query($query);
                    while($row = $resultado->fetch_assoc()){
                ?>
                            <div class="card">
                                <img src="data:image/jpg;base64, <?php echo base64_encode($row['imagen']);?>">
                                <h4><?php echo $row['nombre'];?></h4>
                                <a href="#">ver detalles</a>
                            </div>
                <?php
                    }
                ?>
        </div>
        <div class="text secundario">
            <p>SERVICIOS INTEGRALES</p>
        </div>
        <div class="container">
            <div class="card">
                <img src="../img/AGROINDUSTRIA/pulverizadora.jpg">
            </div>
            <div class="card">
                <img src="../img/GENERADORES/GRUPOS-ELECTROGENOS.png">
            </div>
            <div class="card">
                <img src="../img/MOVIMIENTO DE TIERRA/AUTOHORMIGONERA.png">
            </div>
            <div class="card">
                <img src="../img/TRABAJO DE ALTURA/MANIPULADOR ARTICULADO.png">
            </div>
        </div>
        <footer>

        </footer>
    </section>
    <script src="../js/script.js?v=<?php echo time(); ?>"></script>
</body>
</html>