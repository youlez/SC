<?php

namespace App\Http\Controllers;

use App\Models\Vehiculos;

use Illuminate\Http\Request;

class CVehiculos extends Controller
{
    public function all()
    {
        return Vehiculos::whit('conductor')->all();
    }
    public function store(Request $request)
    {
        $parametros = ['placa' => $request->placa];
        $upsert = [];
        $upsert['modelo'] = $request->modelo;
        $upsert['capacidad'] = $request->capacidad;
        Vehiculos::updateOrCreate($parametros, $upsert);
    }
    public function destroy(Request $request)
    {
        Vehiculos::find($request->id_vehiculo)->delete();
    }
    public function vehiculosByConductor($id_conductor)
    {
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
