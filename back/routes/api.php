<?php

use App\Http\Controllers\CConductores;
use App\Http\Controllers\CVehiculos;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'SC'], function () {
    $controllerConductores = "\App\Http\Controllers\CConductores";

    Route::apiResource('conductores', '\App\Http\Controllers\CConductores');
    Route::get('/conductores', $controllerConductores . '@all');
    Route::post('/guardarConductor', $controllerConductores . '@save');
    Route::delete('/eliminarConductor', $controllerConductores . '@delete');

    $controllerVehiculos = "\App\Http\Controllers\CConductores";

    Route::apiResource('vehiculos', '\App\Http\Controllers\CVehiculos');
    Route::get('/vehiculos', $controllerVehiculos . '@all');
    Route::post('/guardarVehiculo', $controllerVehiculos . '@save');
    Route::delete('/eliminarVehiculo', $controllerVehiculos . '@delete');
    Route::post('/asociarConductor', $controllerVehiculos . '@asociarConductor');
});
