<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateConductoresTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('conductores', function (Blueprint $table) {
            $table->integerIncrements("id_conductor");
            $table->string("identificacion", 100)->nullable();
            $table->string("apellido", 500)->nullable();
            $table->string("nombre", 500)->nullable();
            $table->bigInteger("telefono")->unsigned()->nullable();
            $table->string("direccion", 500)->nullable();
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
        Schema::dropIfExists('conductores');
    }
}
