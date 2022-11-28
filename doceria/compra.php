<?php session_start(); 
  include_once("servidor.php")
?>

<!DOCTYPE html>

<head>
    <title>COMPRA</title>
    <link rel="stylesheet" href="./css/compra.css">
</head>

<body>

    <h3 div class="TITULO">COMPRA</h3>
    <div class="carrinho-container">
        <?php
    $items = array( 
         ['nome'=>'Caixa com Bricadeiro Tradicional', 'imagem' => 'caixatradicional2.jpg','preco' => '1.89'],
         ['nome'=>'Barquinho', 'imagem' => 'barquinho.jpg','preco' => '2.39'],
         ['nome'=>'Caixa com Bricadeiro Gourmet', 'imagem' => 'caixagourmet2.jpg','preco' => '2.39'],
         ['nome'=>'Pote Plastico com Bricadeiro Gourmet 1', 'imagem' => 'poteplastico3.jpg','preco' => '2.39'],
         ['nome'=>'Unidade', 'imagem' => 'unidade.jpg','preco' => '2.39'],
         ['nome'=>'Caixinha com duas Unidades', 'imagem' => 'potecaixinha2.jpg','preco' => '2.39'],
         ['nome'=>'Pote Plastico com Bricadeiro Gourmet 2',  'imagem' => 'poteplastico2.jpg','preco' => '2.39']
        
        );

        foreach($items as $key => $value) {           
?>
        <div class="produto">
            <img src="<?php echo $value ['imagem']?>" />
            <a href="?ADICIONAR=<?php echo $key?>">ADICIONAR AO CARRINHO</a>

        </div>
        <?php
        }
?>
    </div>

    <?php

    if(isset($_GET['ADICIONAR'])){
       $idProduto = (int) $_GET['ADICIONAR'] ;
         if(isset($items[$idProduto])){
            if(isset($_SESSION['carrinho'][$idProduto])){
           (int)$_SESSION['carrinho'][ $idProduto]['Quantidade']++;
 
            }else{
              $_SESSION['carrinho'][$idProduto] = array('Quantidade'=>1 ,'nome' =>$items[$idProduto]['nome'],  'preco'=>$items[$idProduto]['preco']);

           
            }
            echo '<script>alert("O PRODUTO FOI ADICIONADO AO CARRINHO !")</script>';
         }else{
           die('Esse produto acabou !');
         }
    }
?>

    <h1 class="TITULO">CARRINHO</h1>
    <?php

echo "<table class='carrinho-produto'>";
  echo "<tr>
         <th>Produto</th>
         <th>Preco Unitário</th>
         <th>Quantidade</th>
         <th>Total do produto</th>
        </tr>";
      $totalCompra = 0;
if(isset($_SESSION['carrinho'])){
   foreach($_SESSION['carrinho'] as $key => $value){

    $valorTotalProduto = (float)$value['Quantidade']  *  (float) $value['preco'];

     echo "<tr> 
             <td> "
            . $value['nome']. 
             "</td>
             <td>"
             .number_format($value['preco'], 2, ',', '.').
             "</td>
             <td>"
             .$value['Quantidade'].
             "</td>
             <td>
                 R$" . number_format($valorTotalProduto, 2, ',', '.').
             "</td>
             </tr>";
             $totalCompra += $valorTotalProduto;
             
   }

  // $totalCompra += $valorTotalProduto;
      echo"<tr>
          <th>Valor Total: </th>
          <td>
            R$"  . number_format($totalCompra, 2, ',', '.') .
          "</td>
      </tr>";
}
echo "</table>";
?>
</body>

</html>