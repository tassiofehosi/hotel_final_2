<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>Cadastro realizado com sucesso</title>
    <meta charset="UTF-8"/> 
    <link rel="stylesheet" type="text/css" href="css/estilo1.css" />

  </head>

  <body>

    

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
                <li><a href="acesso.html">consulte sua reserva</a></li>
                <li><a href="contato.html">contato</a></li>
              </ul>
            </nav>
          </div>
        </header>
      </div>
    </div><br/><br/><br/><br/><br/>

    <?php


      foreach ($_GET as $key => $value) { #Alocando dinamnicamente os valores dos formularios
        # code...
        $$key = $value;

      }

      
   

      $link = mysql_connect('localhost:3306', 'root', 'xampp');
        if (!$link) {
        die('Não foi possível conectar: ' . mysql_error());
        }


      $db_selected = mysql_select_db('hotel', $link);
      if (!$db_selected) {
        die ('Não foi possivel selecionar o BD hotel : ' . mysql_error());
      }


   
    $consultaCPF = mysql_query("SELECT * FROM cliente WHERE CPF_cliente='$CPF'");
    $linhaCPF = mysql_num_rows($consultaCPF);
 
 
      if($linhaCPF == 0){
      // o usuário não existe, faça a inserção do mesmo;

        $resultinserirCliente = mysql_query($inserirCliente);

          if (!$resultinserirCliente) {
            die ('Não foi possivel realizar o cadastro' . mysql_error());
          }else{
            echo "Reserva efetuada com sucesso";
          }

      }
      else
      {
      // o usuário existe;
        echo "Cliente: $Nome_cliente já possui uma reserva ativa.  ";
      }


      $efetivarReserva = "INSERT INTO hospedagem_reserva(CPF_cliente, Numero_apto, Data_entrada, Data_saida)
                          VALUES ('$CPF','$Numero_apto','$Data_entrada','$Data_saida')";


      $consultaApartamento = mysql_query("SELECT * FROM hospedagem_reserva WHERE Numero_apto='$Numero_apto'");
      $linhaApartamento = mysql_num_rows($consultaApartamento);
 
 
      if($linhaApartamento == 0){
      // o usuário não existe, faça a inserção do mesmo;

        $resultEfetivarReserva = mysql_query($efetivarReserva);

          if (!$resultEfetivarReserva) {
            die ('Não foi possivel realizar o cadastro' . mysql_error());
          }

      }
      else
      {
      // o usuário existe;
        echo "O apartamento: $Numero_apto já está reservado";
      }



  
  
  mysql_close($link);

?><br/><br/><br/><br/><br/>   

    <div class="controls">
    <center><a href="index.html">Voltar à página inicial</a>
    </div><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>


    

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


 