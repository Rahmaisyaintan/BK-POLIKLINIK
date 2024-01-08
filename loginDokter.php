<?php
if (!isset($_SESSION)) {
    session_start();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nama = $_POST['nama'];
    $no_hp = $_POST['no_hp'];

    $query = "SELECT * FROM dokter WHERE nama = '$nama'";
    $result = $mysqli->query($query);

    if (!$result) {
        die("Query error: " . $mysqli->error);
    }

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        if (($no_hp == $row['no_hp'])) {
            $_SESSION['nama'] = $nama;
            $_SESSION['id'] = $id;
            header("Location: berandaDokter.php");
        } else {
            $error = "Password salah";
        }
    } else {
        $error = "Dokter tidak ditemukan";
    }
}
?>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card mt-5">
                <div class="card-header text-center" style="font-weight: bold; font-size: 32px; background-color:lightblue; font-style:oblique">Login Dokter</div>
                <div class="card-body">
                    <form method="POST" action="index.php?page=loginDokter">
                        <?php
                        if (isset($error)) {
                            echo '<div class="alert alert-danger">' . $error . '
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>';
                        }
                        ?>
                        <div class="form-group">
                            <label for="nama" style="font-size: 20px; font-style:normal">Nama</label>
                            <input type="text" style="font-size: 17px; font-style:oblique"name="nama" class="form-control" required placeholder="">
                        </div>
                        <div class="form-group">
                            <label for="no_hp" style="font-size: 20px; font-style:normal">Password</label>
                            <input type="number" style="font-size: 17px; font-style:oblique" name="no_hp" class="form-control" required placeholder="">
                        </div>
                        <div class="card-login text-center">
                            <button type="submit" class="btn btn-primary btn-block mt-3">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>