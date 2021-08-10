<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <link rel="stylesheet" href="../public/css/bootstrap.css">
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src = "../public/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../public/css/styleadmin.css">
</head>
<body>
    <div class="swapper">
        <div class="container-fluid">
            <div class="row header">
                
            </div>
            <div class="row mainmenu">
                <?php loadModule('mainmenu');?>
            </div>
            <div class="row main">
                <?php 
                    loadComponent();
                ?>
            </div>
            <div class="footer text-center" style="margin-top: 2em;">
                Demo 
            </div>
        </div>
    </div>
    
</body>
</html>