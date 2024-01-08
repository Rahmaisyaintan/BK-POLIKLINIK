<?php
session_start();
include_once("koneksi.php");
?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Poliklinik</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center justify-content-between">

    <h2 class="text-light"><a href="index.php"><span>POLIKLINIK</span></a></h2>

      <nav id="navbar" class="navbar">
        <ul>
        <li><a class="nav-link scrollto" href="index.php">Home</a></li>
            <li><a class="nav-link scrollto" href="index.php?page=daftarpasien">Daftar Pasien</a></li>
                <?php
                    if (isset($_SESSION['username'])) {
                    // Menu master jika pengguna sudah login
                        ?>
                        <li><a class="nav-link scrollto" href="index.php?page=obat">Obat</a></li>
                        <li><a class="nav-link scrollto " href="index.php?page=dokter">Dokter</a></li>
                        <li><a class="nav-link scrollto" href="index.php?page=poli">Poli</a></li>
                        <li><a class="nav-link scrollto" href="index.php?page=pasien">Pasien</a></li>
                        <?php
                    }
                    if (!isset($_SESSION['username'])) {
                    // Tombol "Get Started" hanya ditampilkan jika pengguna belum login
                    }
                ?>
        </ul>
        <?php
                    if (isset($_SESSION['username'])) {
                        // Jika pengguna sudah login, tampilkan tombol "Logout"
                    ?>
                        <ul class="navbar-nav ms-auto">
                            <li>
                                <a class="getstarted scrollto" href="logoutUser.php">Logout (<?php echo $_SESSION['username'] ?>)</a>
                            </li>
                        </ul>
                    <?php
                    }
                    ?>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- Main content -->
  <!-- ======= Hero Section ======= -->
  <main role="main" class="container">
        <?php
        if (isset($_GET['page'])) {
            include($_GET['page'] . ".php");
        } else {
            if (isset($_SESSION['username'])) {
                // Jika sudah login, tampilkan pesan selamat datang dengan username
                echo '
            <section id="hero" class="d-flex align-items-center">
                <div class="container text-center position-relative" data-aos="fade-in" data-aos-delay="200">
                    <h1>Selamat Datang di Sistem Informasi Poliklinik</h1>
                    <h2>Halo, ' . $_SESSION['username'] . '</h2>
                </div>
            </section>';
        } else {
            // Jika belum login, tampilkan pesan selamat datang tanpa username
            echo '
            <section id="hero" class="d-flex align-items-center">
                <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-9 text-center">
                    <h1>Sistem Informasi Poliklinik</h1>
                    <h2>Melayani berbagai layanan untuk masyarakat</h2>
                    </div>
                </div>
                <div class="text-center">
                    <a href="index.php?page=daftarpasien" class="btn-get-started scrollto">Daftar</a>
                </div>

                <div class="row icon-boxes">

                    <div class="col-md-6 d-flex align-items-stretch">
                    <div class="icon-box">
                        <div class="icon"><i class="ri-palette-line"></i></div>
                        <h4 class="title"><a href="index.php?page=loginUser">Login Admin</a></h4>
                        <p class="description">admin hanya perlu memasukkan username dan password</p>
                    </div>
                    </div>

                    <div class="col-md-6 d-flex align-items-stretch">
                    <div class="icon-box">
                        <div class="icon"><i class="ri-command-line"></i></div>
                        <h4 class="title"><a href="index.php?page=loginDokter">Login Dokter</a></h4>
                        <p class="description">dokter hanya perlu memasukan nama dan no telp</p>
                    </div>
                    </div>

                </div>
                </div>';
    }
    }
    ?>
</main>
  </section><!-- End Hero -->

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>