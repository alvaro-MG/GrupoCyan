<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class contenido extends Model
{
    use HasFactory;
}



public function contenido() 

{

    return $this->hasOne(elemento::class);

}

