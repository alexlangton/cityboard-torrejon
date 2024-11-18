<?php
// Mostrar todos los errores para depuración
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Cargar las dependencias de Composer
require 'vendor/autoload.php';

// Inicializar la instancia de Fat-Free Framework
$f3 = \Base::instance();

// Activar el modo de depuración en Fat-Free
$f3->set('DEBUG', 3);

// Cargar configuración desde archivos INI
$f3->config('config/config.ini');
$f3->config('config/routes.ini');




// Registrar el inicio del proceso de actualización
RegistroSucesos::escribir('Actualizando info de contadores en tabla parkings');

// Importar la clase ContadoresController
require_once 'app/controllers/ContadoresController.php';

// Ejecutar el método actualizarJsonCountersParking del controlador
try {
   $contadores = new ContadoresController($f3);
   $contadores->actualizarTodosLosContadores($f3);
   echo "Actualización de contadores realizada con éxito.\n";

   // Registrar el éxito de la actualización
   RegistroSucesos::escribir('Actualización de contadores finalizada exitosamente');
} catch (\Exception $e) {
   // En caso de excepción, capturar el error y mostrar el mensaje
   echo "Error al ejecutar la actualización de contadores: " . $e->getMessage() . "\n";

   // Registrar el error en los sucesos
   RegistroSucesos::escribir('Error al actualizar contadores: ' . $e->getMessage());
}
