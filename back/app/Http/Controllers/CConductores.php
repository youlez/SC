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
        $parametros = ['identificacion' => $request->identificacion];
        $upsert = [];
        $upsert['apellido'] = $request->apellido;
        $upsert['nombre'] = $request->nombre;
        $upsert['telefono'] = $request->telefono;
        $upsert['direccion'] = $request->direccion;
        Conductores::updateOrCreate($parametros, $upsert);
    }
    public function delete(Request $request)
    {
        Conductores::find($request->id_conductor)->delete();
    }
}
