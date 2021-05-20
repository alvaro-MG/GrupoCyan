<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class alumno extends Model
{
    use HasFactory;
}

public function alumno()

{

return $this->hasOne(subscripcion::class);
return $this->belongsTo('App\Models\users');



}
