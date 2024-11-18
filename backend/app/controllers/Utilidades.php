<?php

class Utilidades
{

   static function xor_string($string, $key)
   {

      for ($i = 0; $i < strlen($string); $i++)
         $string[$i] = ($string[$i] ^ $key[$i % strlen($key)]);

      return $string;
   }

   static function decodificarBase64AArray($base64, $clave)
   {
      // hay que quitar la cadena "eqpay:"
      /* el primer caracter es parte de la clave de decodificacion
      $caracter = substr($base64, 6, 1);
      $base64 = trim(substr($base64, 7));

      $datosQR = base64_decode($base64);
      $datosQR = self::xor_string($datosQR, $caracter . $clave);
      $vehiculoQR = JSON_decode($datosQR);

      return $vehiculoQR;*/

      $base64 = trim(substr($base64, 6));
      RegistroPeticiones::registrar($base64);
      $datosQR = base64_decode($base64);
      RegistroPeticiones::registrar($base64);
      $datosQR = self::xor_string($datosQR, $clave);
      $vehiculoQR = JSON_decode($datosQR);

      return $vehiculoQR;
   }

   static function distanciaMatriculas($matricula1, $matricula2)
   {

      $l1 = strlen($matricula1);
      $l2 = strlen($matricula2);

      if ((0 == $l1) && (0 == $l2)) {
         return 999;
      }

      if ($l2 != $l1) {
         return 999;
      }

      if (0 == $l1) {
         return $l2;
      }

      if (0 == $l2) {
         return $l1;
      }

      $distancia = 0;
      for ($i = 0; $i < $l1; $i++) {
         if ($matricula1[$i] != $matricula2[$i]) {
            $distancia++;
         }
      }

      return $distancia;
   }




   static function Mostrar($datos, $usar_tags_pre = true)
   {

      if ($usar_tags_pre) echo '<pre>';
      if (is_array($datos))
         print_r($datos);
      else
         var_dump($datos);
      if ($usar_tags_pre) echo '</pre>';

      die();
   }

   static function MostrarLogBD()
   {
      self::Mostrar(Base::instance()->get('DB')->log());
   }

   static function SangriaFrancesa($numero_caracteres, $texto)
   {
      return str_replace("\n", "\n" . str_repeat(' ', $numero_caracteres), $texto);
   }

   static function SangrarTextoDeEtiqueta($etiqueta, $texto)
   {
      return Self::SangriaFrancesa(strlen($etiqueta), $etiqueta . $texto);
   }

   static function IndentarTexto($numero_caracteres, $texto)
   {
      return str_repeat(' ', $numero_caracteres) . str_replace("\n", "\n" . str_repeat(' ', $numero_caracteres), $texto);
   }

   static function arrayAtexto($texto)
   {
      if (is_array($texto)) {
         $texto = json_encode($texto, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
      }

      $texto = str_replace('{', '', $texto);
      $texto = str_replace('}', '', $texto);
      $texto = str_replace('"', '', $texto);
      $texto = str_replace(',', '', $texto);

      return $texto;
   }

   static function array2ini($assoc_arr, $has_sections = FALSE)
   {
      $content = "";
      if ($has_sections) {
         foreach ($assoc_arr as $key => $elem) {
            $content .= "[" . $key . "]\n";
            foreach ($elem as $key2 => $elem2) {
               if (!is_array($elem2))
                  $content .= $key2 . "=" . $elem2 . "\n";
            }
            $content .= "\n";
         }
      } else {
         foreach ($assoc_arr as $key => $elem) {
            if (!is_array($elem))
               $content .= $key . "=" . $elem . "\n";
         }
      }
      return $content;
   }

   static function elementoArrayPorClave($array, $clave, $valor)
   {
      foreach ($array as $key => $value) {
         if ($value[$clave] == $valor)
            return $value;
      }
   }

   static function arrayDeClavesValores($array, $nombreClaves, $nombreValores)
   {
      foreach ($array as $elemento)
         $resultado[$elemento[$nombreClaves]] = $elemento[$nombreValores];
      return $resultado;
   }

   static function bound($x, $min, $max)
   {
      return min(max($x, $min), $max);
   }

   static function urlSinParametros($url)
   {
      return strtok($url, '?');
   }

   static function obtenerAvatar($arrayOperador)
   {
      if ($arrayOperador['admEqu'] == 1) {
         $avatar = "logo_equinsa_md.png";
      } else {
         $avatar = "user-male-icon.png";

         $ficheroAvatar = $arrayOperador['ficAva'];
         if ($ficheroAvatar != '') {
            $ruta = Base::instance()->get('UPLOADS') . 'avatars/';
            $rutaCompleta = $ruta . $ficheroAvatar;

            if (file_exists($rutaCompleta))
               $avatar = $ficheroAvatar;
         }
      }
      return $avatar;
   }

   static function borrarFicheroAvatar($ficheroAvatar)
   {
      if (($ficheroAvatar != '') && ($ficheroAvatar != 'user-male-icon.png') && ($ficheroAvatar != 'logo_equinsa_md.png')) {
         $ruta = Base::instance()->get('UPLOADS') . 'avatars/';
         $rutaCompleta = $ruta . $ficheroAvatar;

         if (file_exists($rutaCompleta))
            unlink($rutaCompleta);
      }
   }

   static function borrarFicheroLogo($ficheroLogo)
   {
      if (($ficheroLogo != '') && ($ficheroLogo != 'seleccioneLogo.png')) {
         $ruta = Base::instance()->get('UPLOADS') . 'logos/';
         $rutaCompleta = $ruta . $ficheroLogo;

         if (file_exists($rutaCompleta))
            unlink($rutaCompleta);
      }
   }

   static function calcularHash($correoElectronico, $contrasena)
   {
      return strtolower(md5(strtolower($correoElectronico) . '|' . $contrasena . '|' . Base::instance()->get('SALT_CONTRASENA')));
   }

   static function calcularHashContraseniaOperador($usuario, $contrasenia)
   {

      return md5(strtolower($usuario) . '|' . $contrasenia);
   }

   static function activar($paginas)
   {

      if (!is_array($paginas))
         $paginas = array($paginas);

      foreach ($paginas as $pagina) {
         $parte_url = '/' . $pagina . '/';
         $url_actual = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH) . '/';

         if (strpos($url_actual, $parte_url))
            return ' active';
      }
   }

   static function obtenerNombresLargosMesesDelAnio($pais)
   {

      switch ($pais) {
         case "es":
            return "['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']";
            break;

         default:
            return "['January','February','March','April','May','June','July','August','September','October','November','December']";
      }
   }

   static function obtenerNombresCortosDiasDeLaSemana($pais)
   {
      switch ($pais) {
         case "es":
            return "['Do','Lu','Ma','Mi','Ju','Vi','Sa']";
            break;

         default:
            return "['Mon','Tue','Wed','Thu','Fri','Sat','Sun']";
      }
   }

   static function obtenerSimboloMoneda($pais)
   {
      switch ($pais) {
         case "es":
            return "";
            break;

         default:
            return "$";
      }
   }

   static function obtenerSeparadorDecimal($pais)
   {
      switch ($pais) {
         case "es":
            return ",";
            break;

         default:
            return ".";
      }
   }

   static function obtenerSeparadorMillares($pais)
   {
      switch ($pais) {
         case "es":
            return ".";
            break;

         default:
            return ",";
      }
   }

   static function obtenerCantidadCifrasDecimales($pais)
   {
      switch ($pais) {
         case "es":
            return 2;
            break;

         default:
            return 1;
      }
   }

   static function convertirCantidad_A_formatoDinero($cantidad, $pais)
   {
      $cantidad = floatval($cantidad);
      $decimales = intval(self::obtenerCantidadCifrasDecimales($pais));
      $separadorDecimal = self::obtenerSeparadorDecimal($pais);
      $separadorMillar = self::obtenerSeparadorMillares($pais);
      $abreviatura = self::obtenerSimboloMoneda($pais);
      return number_format($cantidad, $decimales, $separadorDecimal, $separadorMillar) . ' ' . $abreviatura;
   }

   static function limpiaMatricula($matricula)
   {
      $matricula = strtoupper($matricula);
      $matricula = preg_replace('~[^A-Z0-9]~', '', $matricula);
      return $matricula;
   }

   // static function error_restapi($codigo_respuesta, $texto_error)
   // {
   //    header_remove('Set-Cookie'); // puesto que ha habido un error, eliminamos/cancelamos el envio de la cookie de sesion al cliente
   //    http_response_code($codigo_respuesta);
   //    return ['error' => $texto_error];
   //    die();
   // }

   static function formatearMethodUriLog($method, $uri)
   {
      return vsprintf(
         "%-6s %-0s",
         array(
            $method,
            $uri
         )
      );
   }

   static function crc16($data)
   {
      $crc = 0xFFFF;
      for ($i = 0; $i < strlen($data); $i++) {
         $x = (($crc >> 8) ^ ord($data[$i])) & 0xFF;
         $x ^= $x >> 4;
         $crc = (($crc << 8) ^ ($x << 12) ^ ($x << 5) ^ $x) & 0xFFFF;
      }
      return $crc;
   }

   static function comprobarAuthToken($token)
   {
      $parteDatos = substr($token, 0, 40);
      $parteHash = substr($token, -32);

      $clave = 'andesloqueandesnoandesporlosandes'; //TODO: Cambiar esto!
      $md5Clave = md5(strtolower($clave));

      $miHash = strtolower(md5($parteDatos . $md5Clave));

      return ($miHash == $parteHash);
   }


   // static function comprobarAuthToken2($cabeceras, $db)
   // {

   //    try {
   //       $token = $cabeceras['HTTP_X_AUTH_TOKEN'];
   //       $parteHash = substr($token, 0,  strpos($token, '.'));
   //       $parteDatos = substr($token, strpos($token, '.') + 1, strlen($token) - strpos($token, '.'));
   //       $datos = json_decode(base64_decode($parteDatos), true);
   //       $comando = end(explode("/", $cabeceras['REQUEST_URI']));

   //       if (false !== strpos($comando, '?')) {
   //          $comando = substr($comando, 0,  strpos($comando, '?'));
   //       }

   //       if ((null == $token) ||
   //          ('' == $parteHash) ||
   //          ('' == $parteDatos)
   //       ) {

   //          return false;
   //       }
   //    } catch (Exception $e) {
   //       RegistroPeticiones::registrar($e);
   //       return false;
   //    }

   //    $clave = 'andesloqueandesnoandesporlosandes'; //TODO: Cambiar esto!
   //    $md5Clave = md5(strtolower($clave));
   //    $miHash = strtolower(md5($md5Clave . dechex($datos['timeStamp']) . $parteDatos . $comando));

   //    if ($miHash != $parteHash) {
   //       // token invalido
   //       return false;
   //    }

   //    // creo la tabla en memoria si no existe
   //    BDaccesoComando::crearTabla($db);

   //    $tokenReciente = false;
   //    $ultimoAccesoComando = BDaccesoComando::obtenerUltimoAccesoComando($db, $cabeceras['REMOTE_ADDR'], $comando);
   //    if (isset($ultimoAccesoComando)) {
   //       // esta ip ya se ha conectado previamente

   //       if (($ultimoAccesoComando['timeStamp'] < $datos['timeStamp']) ||
   //          (($ultimoAccesoComando['timeStamp'] = $datos['timeStamp']) && ($ultimoAccesoComando['contador'] < $datos['contador']))
   //       ) {
   //          /* El timeStamp registrado es menor que el recibido o, si son iguales, el contador recibido es mayor que el registrado */

   //          $tokenReciente = true;
   //          BDaccesoComando::actualizarAccesoComando($db, $cabeceras['REMOTE_ADDR'], $comando, $datos['timeStamp'], $datos['contador'];
   //       }
   //    } else {
   //       // ip desconocida
   //       BDaccesoComando::registrarAccesoComando($db, $cabeceras['REMOTE_ADDR'], $comando, $datos['timeStamp'], $datos['contador'];
   //       $tokenReciente = true;
   //    }

   //    return $tokenReciente;
   // }

   static function generarAuthToken()
   {
      return 'b98443f25669eac21e96f2453d77ab6905d81fa8ffa9261a86bdd91867a70ca844ba9f97';
   }

   static function componerCodigoProducto($MediaType, $Id)
   {
      return "$MediaType|$Id";
   }

   static function extraerMediaTypeCodigoProducto($codigoproducto)
   {
      return substr($codigoproducto, 0, strpos($codigoproducto, "|"));
   }

   static function extraerIdCodigoProducto($codigoproducto)
   {
      return substr($codigoproducto, strpos($codigoproducto, "|") + 1);
   }

   static function generarTokenAutorizacion()
   {
      $miRandom = '';
      for ($i = 0; $i < 20; $i++) {
         $chr = sprintf('%02x', random_int(0, 255));
         $miRandom = $miRandom . $chr;
      }

      $miRandom = strtolower($miRandom);
      $miRandom = $miRandom . strtolower(
         md5(
            $miRandom . strtolower(Base::instance()->get('MD5_CLAVE_AUTH_TOKEN'))
         )
      );
      return $miRandom;
   }



   public static function caracteresEspeciales2Html($cadena)
   {

      $cadena = str_replace(
         array(
            "á", "é", "í", "ó", "ú",
            "ñ",
            "Á", "É", "Í", "Ó", "Ú", "Ñ",
            "€"
         ),
         array(
            "&aacute;", "&eacute;", "&iacute;", "&oacute;", "&uacute;",
            "&ntilde;",
            "&Aacute;", "&Eacute;", "&Iacute;", "&Oacute;", "&Uacute;", "&Ntilde;",
            "&euro;"
         ),
         $cadena
      );

      // Fix any bare linefeeds in the message to make it RFC821 Compliant.
      return preg_replace("#(?<!\r)\n#si", PHP_EOL, $cadena);
   }

   public static function checkearDominio($correoElectronico)
   {
      if (filter_var($correoElectronico, FILTER_VALIDATE_EMAIL)) {
         $dominio = explode("@", $correoElectronico)[1];
         return checkdnsrr($dominio, "MX");
      }
      return false;
   }

   public static function obtenerDominio($correoElectronico)
   {
      if (filter_var($correoElectronico, FILTER_VALIDATE_EMAIL)) {
         $var = explode("@", $correoElectronico)[1];
         $var = explode('.', $var);
         return strtolower($var[0]);
      }
   }
}
