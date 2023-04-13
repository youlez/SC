<?php

namespace App\Http\Controllers;

use App\Models\Vehiculos;

use Illuminate\Http\Request;

class CVehiculos extends Controller
{
    public function all()
    {
        return Vehiculos::with('conductor')->get();
    }
    public function save(Request $request)
    {
        $datos = json_decode($request->formData);
        $parametros = ['placa' => $datos->placa];
        $upsert = [];
        $upsert['modelo'] = $datos->modelo;
        $upsert['capacidad'] = $datos->capacidad;
        Vehiculos::updateOrCreate($parametros, $upsert);
    }
    public function delete(Request $request)
    {
        Vehiculos::find($request->id_vehiculo)->delete();
    }
    public function vehiculosByConductor($id_conductor)
    {
        if ($id_conductor == "null") {
            $id_conductor = null;
        }
        return Vehiculos::where('fk_id_conductor', $id_conductor)
            ->get();
    }
    public function asociarConductor(Request $request)
    {
        $vehiculo = Vehiculos::find($request->id_vehiculo);
        $vehiculo['fk_id_conductor'] = $request->id_conductor;
        $vehiculo->save();
    }
}
