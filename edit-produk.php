
<?php
include 'db.php';
    session_start();
    if($_SESSION['status_login'] != true){
        echo '<script>window.location="login.php"</script>';
    }

    $produk = mysqli_query($conn, "select * FROM tb_product WHERE product_id = '".$_GET['id']."'");
    if(mysqli_num_rows($produk)==0){
        echo '<script>window.location="data-produk.php"</script>';
    }
    $p = mysqli_fetch_object($produk);
 
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital@1&display=swap" rel="stylesheet"> 
    <script src="https://cdn.ckeditor.com/4.20.0/standard/ckeditor.js"></script>
    <title>Ngawarung</title>
</head>
<body>
    <!-- header -->
    <header>
        <div class="container">
        <h1><a href="dashboard.php">Ngawarung</a></h1>
        <ul>
            <li><a href="dashboard.php">dashboard</a></li>
            <li><a href="profil.php">Profil</a></li>
            <li><a href="data-kategori.php">Data Kategori</a></li>
            <li><a href="data-produk.php">Data Produk</a></li>
            <li><a href="logout.php">Keluar</a></li>
        </ul>
        </div>
    </header>

    <!-- content -->
    <div class="section">
        <div class="container">
            <h3>Edit Data Produk</h3>
            <div class="box">
              <form action="" method="POST" enctype="multipart/form-data">
                <select class="input-control" name="kategori" required>
                    <option value="">----Pilih----</option>
                    <?php 
                        $kategori = mysqli_query($conn, "SELECT * FROM tb_category ORDER BY category_id DESC");
                        while($r = mysqli_fetch_array($kategori)){
                    ?>
                    <option value="<?php echo $r['category_id'] ?>" <?php echo ($r['category_id'] == $p->category_id)? 'selected' : '';?>><?php echo $r['category_name'] ?></option>
                    <?php } ?>
                </select>

              <input type="text" name="nama" class="input-control" value="<?php echo $p->product_name ?>"    required>
              <input type="text" name="harga" class="input-control" placeholder="Harga" value="<?php echo $p->product_price ?>"   required>

              <img src="produk/<?php echo $p->product_image ?>" width="150px">
              <input type="hidden" name="foto" value="<?php echo $p->product_image ?>">
              <input type="file" name="gambar" class="input-control" >
              <textarea name="deskripsi" class="input-control" placeholder="Deskripsi"> <?php echo $p->product_description ?></textarea><br>
              <select name="status" class="input-control">
                <option value="">===Pilih===</option>
                <option value="1" <?php echo ($p->product_status == 1)? 'selected':'';?>> Aktif</option>
                <option value="0" <?php echo ($p->product_status == 0)? 'selected':'';?>>Tidak Aktif</option>
              </select>
              <input type="submit" name="submit" value="Submit" class="btn">
            </form>
           <?php
                if(isset($_POST['submit'])){

                    //menampung data inputan dari form
                    $kategori    = $_POST['kategori'];
                    $nama        = $_POST['nama'];
                    $harga       = $_POST['harga'];
                    $deskripsi   = $_POST['deskripsi'];
                    $status      = $_POST['status'];
                    $foto        = $_POST['foto'];

                    //data gambar yang baru
                    $filename  = $_FILES['gambar']['name'];
                    $tmp_name  = $_FILES['gambar']['tmp_name'];
    
                    
                    //validasi jika admin ganti gambar
                    if ($filename != '') {
                        
                    $type1     = explode('.', $filename);
                    $type2     = $type1[1];
    
                    $newname = 'produk'. time().'.'.$type2;

                    $tipe_ijin = array('jpg', 'jpeg', 'png', 'gif');
                                    //   validasi format file
                                 if(!in_array($type2, $tipe_ijin)){
                                    //jika tidak sesuai
                                  echo '<scipt> alert("format tidak didukung")</scipt>';
                }else{
                    unlink('./produk/'.$foto);
                    move_uploaded_file($tmp_name, './produk/'. $newname);
                    $namagambar = $newname;
                }
             }else{
                    $namagambar = $foto;
                    }

                    //jquery update
                    $update = mysqli_query($conn, "UPDATE tb_product SET
                                            category_id = '".$kategori."',
                                            product_name = '".$nama."',
                                            product_price = '".$harga."',
                                            product_description = '".$deskripsi."',
                                            product_image = '".$namagambar."',
                                            product_status = '".$status."'
                                            WHERE product_id = '".$p->product_id."' ");
                         if($update){
                            echo '<script>alert("Data berhasil di ubah")</script>';
                             echo '<script>window.location="data-produk.php"</script>';
                        }else{
                            echo 'gagal'.mysqli_error($conn);
                         }
                }
           ?>
            </div>
        </div>
    </div>

    <!-- footer -->
    <footer>
        <div class="container">
            <small>Copyright $copy; 2022-Ngawarung dd</small>
        </div>
    </footer>
    <script>
                        CKEDITOR.replace( 'deskripsi' );
                </script>
</body>
</html>