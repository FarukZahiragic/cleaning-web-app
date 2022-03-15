<?php
/*if(isset($_POST['submit_btn'])){
       echo "Tvoje ime je: " . $_POST["firstname"] . "<br/>";
       header('Location:Index.html?status=success');//redirect to your html with status
    }*/

    if(isset($_POST["dodaj"])) 
    	{
    		$dbhost = "localhost";
    		$dbuser = "root";
    		$dbpass ="";
    		$database="čisko";
    		$conn = new mysqli($dbhost,$dbuser,$dbpass,$database);   
			$ime = $_POST['ime'];
			$prezime=$_POST['prezime'];
			$email = $_POST['email'];
			$adresa = $_POST['adresa'];
			$narudzba = $_POST['narudzba'];
			$telefon = $_POST['telefon'];
			$sql = "INSERT INTO studenti ". "(ime,prezime,email, adresa, narudzba, telefon) ". "VALUES('$ime','$prezime', '$email', '$adresa', '$narudzba', '$telefon')";
			if($conn->query($sql)){
				echo '<script type="text/javascript">alert("Podaci su uneseni uspješno.");</script>';
			}
			if ($conn->errno) {
				echo '<script type="text/javascript">alert("Podaci nisu ispravno uneseni.");</script>';
			}
				$conn->close();//Zatvara se komunikacija sa bazom podataka
	}
?>