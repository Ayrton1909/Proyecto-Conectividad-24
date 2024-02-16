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
            <p>Busqueda</p>
        </div>
        <form method="post" action="busqueda.php">
            <div class="barra-busqueda">
                <?php
                    echo '<input type="text" name="busqueda" placeholder="Buscar..." value="'.$_POST["busqueda"].'">';
                ?>
                <button type="submit"><i class="bx bx-search icon"></i></button>
            </div>
        </form>
        <div class="container">
                <?php
                    include("conexion.php");
                    $busqueda = $_POST['busqueda'];
                    $query = "SELECT * FROM maquinaria WHERE descripcion LIKE '%$busqueda%' OR nombre LIKE '%$busqueda%'";
                    $resultado = $conexion->query($query);
                    $rows = 0;
                    if($busqueda != ""){
                        while($row = $resultado->fetch_assoc()){
                ?>
                            <div class="card">
                                <img src="data:image/jpg;base64, <?php echo base64_encode($row['imagen']);?>">
                                <h4><?php echo $row['nombre'];?></h4>
                                <a href="#">ver detalles</a>
                            </div>
                <?php
                        $rows++;
                        }   
                    }else
                    echo "<div class='text secundario'>
                        <p>No se encontraron incidencias</p>
                    </div>"; 
                ?>
        </div>
        <?php
            if($busqueda != ""){
                if($rows == 1)
                    echo "<div class='text secundario'>
                        <p>Se encontro ".$rows." incidencia de '$busqueda'</p>
                    </div>"; 
                else
                    echo "<div class='text secundario'>
                        <p>Se encontraron ".$rows." incidencias de '$busqueda'</p>
                    </div>"; 
            }
        ?>
        <footer>

        </footer>
    </section>
    <script src="../js/script.js?v=<?php echo time(); ?>"></script>
</body>
</html>