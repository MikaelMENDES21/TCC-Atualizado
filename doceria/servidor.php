<?php
    define('servidor','localhost');
    define('usuario','root');
    define('senha','');
    define('banco','doce_julietta');
    define('porta','3306');   
    
     $banco = mysqli_connect( servidor, usuario, senha, banco, porta);

       if(!$banco){
           die( "Falha na conexão, motivo : " . mysqli_connect_erro());
       } 
?>