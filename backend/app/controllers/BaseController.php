<?php

class BaseController extends AutenticacionController {
    protected $tabla;
    protected $consultas;

    public function __construct($tabla = null) {
        parent::__construct();
        if ($tabla) {
            $this->tabla = $tabla;
            $this->consultas = new ConsultasSQL($tabla);
        }
    }

    public function obtener($f3, $params) {
        return $this->ejecutarOperacion(function() use ($params) {
            try {
                // Si no hay ID, obtener todos los registros
                if (!isset($params['id'])) {
                    $registros = $this->consultas->obtenerTodos();
                    return $this->respuestaExito(
                        $registros,
                        "Registros de {$this->tabla} obtenidos correctamente"
                    );
                }

                // Si hay ID, validar y obtener registro específico
                $id = $params['id'];
                $validacionId = $this->validarId($id, $this->tabla);
                if ($validacionId !== true) {
                    return $validacionId;
                }

                $registro = $this->consultas->obtenerPorId($id);
                if (!$registro) {
                    return $this->errorRegistroNoEncontrado($id, $this->tabla);
                }

                return $this->respuestaExito(
                    $registro,
                    "Registro de {$this->tabla} obtenido correctamente"
                );
                
            } catch (\PDOException $e) {
                $this->logger->error("Error en base de datos al obtener {$this->tabla}: " . $e->getMessage());
                throw $e;
            }
        }, "Error al obtener {$this->tabla}");
    }

    public function obtenerTodos($f3) {
        return $this->ejecutarOperacion(function() {
            return $this->respuestaExito(
                $this->consultas->obtenerTodos()
            );
        }, 'Error al obtener los registros');
    }

    private function procesarGuardado($datos, $id = null) {
        $validador = new Validador($this->f3);
        $resultado = $validador->validar($this->tabla, $datos, $id !== null);

        if (!$resultado['valido']) {
            return $this->respuestaError(
                'Datos inválidos',
                422,
                $resultado['errores']
            );
        }

        try {
            $operacion = $id ? 'actualizar' : 'crear';
            $registro = $id ? 
                $this->consultas->actualizar($id, $resultado['datos_limpios']) :
                $this->consultas->insertar($resultado['datos_limpios']);

            if (!$registro) {
                throw new \Exception("Error al $operacion el registro");
            }

            return $this->respuestaExito(
                $registro,
                "Registro {$operacion}do correctamente",
                $id ? 200 : 201
            );
        } catch (\Exception $e) {
            return $this->respuestaError($e->getMessage(), 500);
        }
    }

    public function guardarnuevo($f3) {
        return $this->ejecutarOperacion(function() use ($f3) {
            $resultadoJSON = $this->decodificarJSON($f3->get('BODY'));
            if ($resultadoJSON['error']) {
                return $resultadoJSON['response'];
            }

            return $this->procesarGuardado($resultadoJSON['datos']);
        }, 'Error al crear el registro');
    }

    public function guardar($f3, $params) {
        return $this->ejecutarOperacion(function() use ($f3, $params) {
            $validacionId = $this->validarId($params['id'] ?? null, $this->tabla);
            if ($validacionId !== true) return $validacionId;

            $resultadoJSON = $this->decodificarJSON($f3->get('BODY'));
            if ($resultadoJSON['error']) {
                return $resultadoJSON['response'];
            }

            $registro = $this->consultas->obtenerPorId($params['id']);
            if (!$registro) {
                return $this->errorRegistroNoEncontrado($params['id'], $this->tabla);
            }

            return $this->procesarGuardado($resultadoJSON['datos'], $params['id']);
        }, 'Error al actualizar el registro');
    }

    public function borrar($f3, $params) {
        return $this->ejecutarOperacion(function() use ($params) {
            $validacionId = $this->validarId($params['id'] ?? null, $this->tabla);
            if ($validacionId !== true) return $validacionId;

            if (!$this->consultas->eliminar($params['id'])) {
                return $this->respuestaError('Error al eliminar el registro', 500);
            }

            return $this->respuestaExito(null, 'Registro eliminado correctamente');
        }, 'Error al eliminar el registro');
    }

    public function obtenerConFiltros($f3) {
        return $this->ejecutarOperacion(function() use ($f3) {
            $filtros = array_filter($f3->get('GET'), function($valor) {
                return !empty($valor);
            });
            
            return $this->respuestaExito(
                $this->consultas->buscarConFiltros(
                    $filtros,
                    $f3->get('GET.orden'),
                    $f3->get('GET.limite')
                )
            );
        }, 'Error al obtener los registros');
    }

    public function buscarPorTexto($f3) {
        return $this->ejecutarOperacion(function() use ($f3) {
            $texto = $f3->get('GET.texto');
            if (!$texto) {
                return $this->respuestaError('Texto de búsqueda no proporcionado');
            }
            
            $campos = $f3->get('GET.campos') ? 
                      explode(',', $f3->get('GET.campos')) : 
                      ['nombre'];
            
            return $this->respuestaExito(
                $this->consultas->buscarTexto($campos, $texto)
            );
        }, 'Error en la búsqueda');
    }

    public function obtenerPaginado($f3, $params) {
        return $this->ejecutarOperacion(function() use ($params) {
            $pagina = (int)($params['pagina'] ?? 1);
            $porPagina = (int)($params['por_pagina'] ?? 10);
            
            $resultadoConsulta = $this->consultas->obtenerPaginado($pagina, $porPagina);
            
            // Verificar si hay error en la consulta
            if ($resultadoConsulta['estado'] === 'error') {
                return $this->respuestaError(
                    $resultadoConsulta['mensaje'],
                    $resultadoConsulta['detalles'] ?? null
                );
            }

            // Extraer los datos de paginación
            $datos = $resultadoConsulta['datos'];
            
            return $this->respuestaExito($datos['datos'], null, 200, [
                'paginacion' => [
                    'total' => $datos['total'],
                    'pagina_actual' => $datos['pagina_actual'],
                    'por_pagina' => $datos['por_pagina'],
                    'total_paginas' => $datos['total_paginas']
                ]
            ]);
        }, 'Error al obtener los registros');
    }
} 