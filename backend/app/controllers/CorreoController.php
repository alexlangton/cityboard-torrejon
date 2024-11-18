<?php 

class CorreoController extends JSONController
{
   public function enviarEnlaceRecuperacion($f3)
   {
      utilCorreo::enviarEnlace($f3, json_decode($f3['BODY'], true));
   }
}
