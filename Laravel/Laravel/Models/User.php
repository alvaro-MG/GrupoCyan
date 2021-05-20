<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class actividades extends Model
{
    use HasFactory;
}

public function users() 

{

    return $this->hasOne(profesor::class);
    return $this->hasOne(alumno::class);
    return $this->hasOne(modulo::class);

}


