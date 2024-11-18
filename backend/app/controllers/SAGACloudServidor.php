<?php

class SAGACloudServidor
{
   public static function realizarPeticion($f3, $metodo, $codinsclo, $recurso, $contenido = NULL)
   {
      $fichero_log = "SAGACloudServidor/peticiones_codinsclo-$codinsclo.log";
      $respuesta = Web::instance()->request(
         $f3['SAGACloudServidor.URL_BASE'] . $recurso,
         [
            'method' => $metodo,
            'header' => [
               'X-API-Token:' . TokenSAGARestAPI::obtenerTokenSeguridad(),
               'Content-type: application/json'
            ],
            'content' => $contenido,
            'timeout' => 12
         ]
      );
      $respuesta['status_line'] = explode(' ', $respuesta['headers'][0], 3);
      // if ($f3['trazas.sagacloudservidor'] == 2)
      RegistroSucesos::registrar($fichero_log, 'Respuesta:' . "\r\n" . preg_replace('/\r\n|\r|\n/', "\r\n", print_r($respuesta, true)) . "\r\n" . '-----------------------------');
      if ($respuesta['error'] != '') {
         RegistroSucesos::registrar($fichero_log, 'Peticion:' . "\r\n" . '(GET) ' . $recurso . "\r\n" . preg_replace('/\r\n|\r|\n/', "\r\n", $contenido) .
            'Respuesta:' . "\r\n" . preg_replace('/\r\n|\r|\n/', "\r\n", print_r($respuesta, true)) . "\r\n" .
            '-----------------------------');

         throw new Exception($respuesta['error']);
      }
      return $respuesta['body'];
   }

   static function obtenerRegistrosConsultaSQL($f3, $codinsclo, $consulta)
   {
      return SELF::realizarPeticion($f3, 'POST', $codinsclo, "/api/parking/$codinsclo/system/sql", '{ "command": "' . $consulta . '" }');
   }

   static function obtenerStatusCounters($f3, $codinsclo)
   {
      return self::realizarPeticion($f3, 'GET', $codinsclo, "/api/parking/$codinsclo/status/counters");
   }

   static function obtenerConfiguracion($f3, $codinsclo)
   {
      return self::realizarPeticion($f3, 'GET', $codinsclo, "/api/parking/$codinsclo/configuration/parking");
   }
}
