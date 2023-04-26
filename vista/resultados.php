<?php
session_start();
if (empty($_SESSION['nombre']) and empty($_SESSION['apellido'])) {
    header('location:login/login.php');
}
if ($_GET["total"] != null) {

    $total = $_GET["total"];

    $_SESSION['fina'] = $total;
}
?>

<!-- primero se carga el topbar -->
<?php require('./layout/topbar.php'); ?>
<!-- luego se carga el sidebar -->
<?php require('./layout/sidebar.php'); ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.2.1/chart.js" integrity="sha512-Cv3WnEz5uGwmTnA48999hgbYV1ImGjsDWyYQakowKw+skDXEYYSU+rlm9tTflyXc8DbbKamcLFF80Cf89f+vOQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- inicio del contenido principal -->
<style>
    section {
        background-color: #ddd;
        padding: 20px;
        border-radius: 10px;
    }
</style>

<body>

    <div class="page-content">
        <section>
            <table>
                <tr>
                    <th>Subdominio</th>
                    <th>Raw Score</th>
                </tr>
                <tr>
                    <td>Receptiva</td>
                    <td><?= $_SESSION['receptiva']?></td>
                </tr>
                <tr>
                    <td>Expresiva</td>
                    <td><?= $_SESSION['expresiva']?></td>
                </tr>
            </table>

        </section>
        <canvas id="myChart" width="600" height="400"></canvas>
    </div>

    <!-- fin del contenido principal -->

</body>

<script src="../vista/inicio/js/grafica.js"></script>
<!-- por ultimo se carga el footer -->
<?php require('./layout/footer.php'); ?>