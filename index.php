<?php
    include 'db.php';
    $kontak = mysqli_query($conn,"SELECT admin_telp, admin_email, admin_address from tb_admin WHERE admin_id = 1 ");
    $a = mysqli_fetch_object($kontak);
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
                <input type="text" name="search" placeholder="cari produk">
                <input type="submit" name="cari" value="cari produk">
            </form>
        </div>
    </div>

    <!-- category -->
    <div class="section">
        <div class="container">
            <h3>Kategori</h3>
                <div class="box">
                    <?php
                        $kategori = mysqli_query($conn, "SELECT * FROM tb_category ORDER BY category_id DESC");
                    if(mysqli_num_rows($kategori)> 0){
                        while($k = mysqli_fetch_array($kategori)){
                    ?>
            <a href="produk.php?kat=<?php echo $k['category_id']?>">
                 <div class="col-5">
                 <i class="fa-solid fa-list" style="margin-bottom: 5px;"></i>
                  <p><?php echo $k['category_name'] ?></p>
             </div>
             </a>
             <?php  }}else{?>
                <p>Kategori Tidak ada</p>
                <?php }?>
        </div>
    </div>

    <!-- new produk -->

    <div class="section">
        <div class="container">
            <h3>Produk Terbaru</h3>
            <div class="box">
                <?php 
                    $produk = mysqli_query($conn, "SELECT * FROM tb_product  ORDER BY product_id DESC LIMIT 8");
                        if(mysqli_num_rows($produk) >0){
                            while($p = mysqli_fetch_array($produk)){
                ?>
                <a href="detail-produk.php?id=<?php echo $p['product_id']?>">
                <div class="col-4">
                    <img class="poto-p" src="produk/<?php echo $p['product_image'] ?>" >
                    <p class="nama"><?php echo substr($p['product_name'], 0, 30) ?></p>
                    <p class="harga">Rp.<?php echo number_format($p['product_price']); ?></p>
                    <p><a href="https://wa.me/62881023803721?text=Hallo,%20saya%20tertarik%20dengan%20produk%20anda" target="_blank"><img src="img/wa.png" class="wa-link"></a></p>
                    <p class="status"><?php echo ($p['product_status'] == 0)? 'Tidak Tersedia':'Tersedia'; ?></p>
                </div>
                </a>
                    <?php }}else{ ?>
                        <p>Produk tidak ada</p>
                        <?php } ?>
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