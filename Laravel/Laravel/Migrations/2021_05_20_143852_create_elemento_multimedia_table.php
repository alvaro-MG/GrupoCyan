<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateElementoMultimediaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('elementoMultimedia', function (Blueprint $table) {
            $table->id('elementoMultimedia')->unsigned();
            $table->foreign('idElemento')->references('elemento')->on('idElemento');
            $table->foreign('idMultimedia')->references('multimedia')->on('idMultimedia');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('elementoMultimedia');
    }
}
