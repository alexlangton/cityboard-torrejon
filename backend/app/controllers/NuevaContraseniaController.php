<?php class NuevaContraseniaController extends JSONController
{
   public function guardarNuevaContrasenia($f3){
      $data = json_decode($f3['BODY'], true);
      RegistroSucesos::escribir($data);
      $this->json_respuesta = bdOperadores::actualizarContrasenia($f3, $data['email'], $data['password'], $data['token']);

   }
}
