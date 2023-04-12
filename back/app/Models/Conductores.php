<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Conductores extends Model
{
    protected $table = 'conductores';
    public $timestamps = true;
    protected $primaryKey = 'id_conductor';
    protected $fillable = [
        'identificacion',
        'apellido',
        'nombre',
        'telefono',
        'direccion'
    ];
}
