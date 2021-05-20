<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateElementoActividadesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('elemento_actividades', function (Blueprint $table) {
            $table->id('idelementoActividades')->unsigned(); //AUTO_INCREMENT
            $table->foreign('idelementoActividades')->references('idElemento')->on('elementoActividades')->unsigned();
            $table->foreign('idelementoActividades')->references('idActividades')->on('elementoActividades')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('elemento_actividades');
    }
}
