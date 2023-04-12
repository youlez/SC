<?php

namespace App\Models;

use App\Models\Conductores;
use Illuminate\Database\Eloquent\Model;

class Vehiculos extends Model
{
    protected $table = 'vehiculos';
    public $timestamps = true;
    protected $primaryKey = 'id_vehiculo';
    protected $fillable = [
        'fk_id_conductor',
        'placa',
        'modelo',
        'capacidad'
    ];

    public function conductor()
    {
        return $this->hasOne(Conductores::class, 'id_conductor', 'fk_id_conductor');
    }
}
