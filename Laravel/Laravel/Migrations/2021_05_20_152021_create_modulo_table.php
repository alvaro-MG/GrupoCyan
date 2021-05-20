<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateModuloTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('modulo', function (Blueprint $table) {
            $table->id('idModulo')->unsigned();
            $table->string('nombre');
            $table->integer('nivel');
            $table->set('ramaProfesional', ['tipo1', 'tipo2', 'tipo3', 'tipo4', 'tipo5']);
            $table->set('duracion', ['corto', 'medio', 'largo']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('modulo');
    }
}
