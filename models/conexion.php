<?php
class Conexion{
    public function conectar(){
        $servername = "bhlut4j4kuhxsivd4hrp-mysql.services.clever-cloud.com";
        $username = "uvhyhfvxsavrkktw";
        $password = "2w5zMYBaRxgZ5aeDVXTw";
        $dbname = "bhlut4j4kuhxsivd4hrp";
        
        $conn = mysqli_connect($servername, $username, $password, $dbname);
        
        if (!$conn) {
            // Registrar el error o lanzar una excepción
            die("Error en la conexión: " . mysqli_connect_error());
        }
        
        return $conn;
    }
}


?>