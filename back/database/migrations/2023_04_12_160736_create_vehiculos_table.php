<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVehiculosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('vehiculos', function (Blueprint $table) {
            $table->integerIncrements("id_vehiculo");
            $table->integer("fk_id_conductor")->unsigned()->nullable();
            $table->foreign("fk_id_conductor")->references("id_conductor")->on("conductores");
            $table->string("placa", 50)->nullable();
            $table->string("modelo", 50)->nullable();
            $table->string("capacidad", 50)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('vehiculos');
    }
}
