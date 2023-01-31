<?php
    error_reporting(0);
    include 'db.php';
    $kontak = mysqli_query($conn,"SELECT admin_telp, admin_email, admin_address from tb_admin WHERE admin_id = 1 ");
    $a = mysqli_fetch_object($kontak);

    $produk = mysqli_query($conn, "SELECT * FROM tb_product WHERE product_id = '".$_GET['id']."'");
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital@1&display=swap" rel="stylesheet"> 
    <link href="img/vape.png" rel="shortcut icon">
    <title>Ngawarung</title>
</head>
<body>
    <!-- header -->
    <header>
        <div class="container">
        <h1><a href="index.php">VapeStore</a></h1>
        <ul>
            <li><a href="produk.php">Produk</a></li>
            
        </ul>
        </div>
    </header>
    <!-- search -->
    <div class="search">
        <div class="container">
            <form action="produk.php">
                <input type="text" name="search" placeholder="cari produk" value="<?php echo $_GET['search']?>">
                <input type="hidden" name="kat" value="<?php echo $_GET['kat'] ?>">
                <input type="submit" name="cari" value="cari produk">
            </form>
        </div>
    </div>

    <!-- detail produk -->
    <div class="section">
        <div class="container">
            <h3>DETAIL PRODUK</h3>    
        <div class="box">
            <div class="col-2">
                <img src="produk/<?php echo $p->product_image ?>" width="100%">
            </div>
            <div class="col-2">
                <h3><?php echo $p->product_name ?></h3>
                <h4>Rp. <?php echo number_format($p->product_price) ?></h4>
                <p>Deskripsi: <br>
                    <?php echo $p->product_description ?></p>
                    <p><a href="https://wa.me/62881023803721?text=Hallo,%20saya%20tertarik%20dengan%20produk%20anda">Hubungi via whatapps</a>
                    </p>
            </div>
            </div>
        </div>
    </div>



    <!-- footer -->
    <div class="footer">
        <div class="container">
            <h4>Alamat</h4>
            <p><?php echo $a->admin_address ?></p>
            <h4>Email</h4>
            <p>p<?php echo $a->admin_email ?></p>
            <h4>No Telepon</h4>
            <p><?php echo $a->admin_telp ?>
            <small style="float: right;">Copyright &copy; 2022 - VapeKembung</small>
            </p>
       
        </div>
    </div>
</body>

</html>