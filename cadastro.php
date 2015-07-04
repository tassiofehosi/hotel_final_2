<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>Hotel paraiso das águas</title>
    <meta charset="UTF-8"/> 
    <link rel="stylesheet" type="text/css" href="css/estilo1.css" />

  </head>

  <body>

    <?php
      $link = mysql_connect('localhost:3306', 'root', 'xampp');
        if (!$link) {
        die('Não foi possível conectar: ' . mysql_error());
        }else{
          echo 'Conexão bem sucedida ';
        }
  ?>

    <?php

      $db_selected = mysql_select_db('hotel', $link);
      if (!$db_selected) {
        die ('Não foi possivel selecionar o BD hotel : ' . mysql_error());
    }else{
      echo "Selecao DB 'hotel' bem sucedida"; 
    }
    ?> 

<?php
  mysql_close($link);
?>

    <div class="header">
      <div class="linha">
        <header>
          <div class="col4">
            <h1 class="logo">Hotel P. Águas</h1>
          </div>
          <div class="col8">
            <nav>
              <ul class="menu inline sem-marcador">
                <li><a href="index.html">home</a></li>
                <li><a href="cadastro.html">cadastro</a></li>
                <li><a href="acesso.html">acesse sua conta</a></li>
                <li><a href="contato.html">contato</a></li>
              </ul>
            </nav>
          </div>
        </header>
      </div>
    </div>

    <?php

      foreach ($_GET as $key => $value) { #Alocando dinamnicamente os valores dos formularios
        # code...
        $$key = $value;
      }

      
       echo "Reserva realizada com sucesso!";

    ?><br/>   

    <a href="index.html">Voltar à página inicial</a>
    
</div>
</body>


    

  <section>
  <div class="footer">
    <div class="linha">
      <footer>
        <div class="col12">
          <span>&copy; 2015 Tassio&Wellington Webdesingers.</span>
        </div>
      </footer>
  </section>
    </div>
  </div>
  </body>
</html>


 