<?php
/*if(isset($_POST['submit_btn'])){
       echo "Tvoje ime je: " . $_POST["firstname"] . "<br/>";
       header('Location:Index.html?status=success');//redirect to your html with status
    }*/

    if(isset($_POST["dodaj"])) 
    	{
    		$dbhost = "localhost:3308";
    		$dbuser = "root";
    		$dbpass ="";
    		$database="cisko";
    		$conn = new mysqli($dbhost,$dbuser,$dbpass,$database);   
			$ime = $_POST['ime'];
			$prezime=$_POST['prezime'];
			$email = $_POST['email'];
			$telefon = $_POST['telefon'];
			$adresa = $_POST['adresa'];
			$narudzba = $_POST['narudzba'];
			$samoCiscenje = false;
			$ciscenjeIPranje = false;
			if(isset($_POST['samoCiscenje'])) {$samoCiscenje = true;}
			if(isset($_POST['ciscenjeIPranje'])) {$ciscenjeIPranje = true;}
			$datum = $_POST['datum'];
			$sql = "INSERT INTO formanarudzbe ". "(ImeKorisnika, PrezimeKorisnika, EMailKorisnika, KontaktTelefonKorisnika, LokacijaNarudzbe, SifraUsluge, SamoCiscenje, CiscenjeIPranje, DatumNarudzbe) ". "VALUES('$ime','$prezime', '$email', '$telefon', '$adresa', '$narudzba', '$samoCiscenje', '$ciscenjeIPranje', '$datum' )";
			if($conn->query($sql)){
				echo '<script type="text/javascript">alert("Podaci su uneseni uspješno.");</script>';
			}
			if ($conn->errno) {
				echo '<script type="text/javascript">alert("Podaci nisu ispravno uneseni.");</script>';
			}
				$conn->close();//Zatvara se komunikacija sa bazom podataka
	}
?>