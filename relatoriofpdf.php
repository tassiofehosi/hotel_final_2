<?php
require('fpdf.php');

class PDF extends FPDF
{
// Page header
function Header()
{

    $this->SetFont('Arial','B',15);
    // Move to the right
    $this->Cell(80);
    // Title
    $this->Cell(30,10,'Relatуrio de hospedagem',0,1,'C');
    $this->SetFont('Arial','',12);
    $this->SetLeftMargin(40);
    $this->Cell(0,10,'CPF do cliente           Data de entrada                      Data de saнda',0,1,'L');

    $this->Line(5,30,205,30);
    // Line break
    //$this->Ln(20);
}

// Page footer
function Footer()
{
    // Position at 1.5 cm from bottom
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Page number
    $this->Line(10,284,200,284);

    $this->Cell(0,10,'Pбgina '.$this->PageNo().'/{nb}',0,0,'R');
}
}

// Instanciation of inherited class
$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Times','',12);

// Carrega os dados do BD
$pdo = new PDO("mysql:host=localhost;dbname=hotel", "root", "");
if(!$pdo){
   die('Erro ao criar a conexгo com BD');
}

// Executa sql e coloca no array rs
$rs = $pdo->query("SELECT CPF_cliente, Data_entrada, Data_saida FROM hospedagem_reserva")->fetchAll();
if(!$rs){
  print_r($pdo->errorInfo());
}

   foreach ($rs as $reg){

    $pdf->SetLeftMargin(40);
    $pdf->Cell(0,10,$reg['CPF_cliente'],0,0,'L');//esses parametros 0, 10... sгo de posiзгo e alinhamento

    $pdf->SetX(82);
    $pdf->Cell(0,10,$reg['Data_entrada'],0,0,'L');

    $pdf->SetX(140);
    $pdf->Cell(0,10,$reg['Data_saida'],0,1,'L');

   }

$pdf->Output();
?>