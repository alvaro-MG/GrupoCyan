<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subscripcion extends Model
{
    use HasFactory;
}

public function subscripcion()

{


return $this->belongsTo('App\Models\subscripcion');



}
