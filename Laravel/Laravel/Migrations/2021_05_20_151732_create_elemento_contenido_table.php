<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateElementoContenidoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('elementoContenido', function (Blueprint $table) {
            $table->id('idelementoContenido')->unsigned();
            $table->foreign('idElemento')->references('elemento')->on('idElemento');
            $table->foreign('idContenido')->references('contenido')->on('idContenido');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('elementoContenido');
    }
}
