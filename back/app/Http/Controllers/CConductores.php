<?php

namespace App\Http\Controllers;

use App\Models\Conductores;

use Illuminate\Http\Request;

class CConductores extends Controller
{
    public function all()
    {
        return Conductores::all();
    }
    public function save(Request $request)
    {
        $datos = json_decode($request->formData);
        $parametros = ['identificacion' => $datos->identificacion];
        $upsert = [];
        $upsert['apellido'] = $datos->apellido;
        $upsert['nombre'] = $datos->nombre;
        $upsert['telefono'] = $datos->telefono;
        $upsert['direccion'] = $datos->direccion;
        Conductores::updateOrCreate($parametros, $upsert);
    }
    public function delete(Request $request)
    {
        Conductores::find($request->id_conductor)->delete();
    }
}
