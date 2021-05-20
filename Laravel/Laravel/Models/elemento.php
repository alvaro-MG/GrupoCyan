<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class elemento extends Model
{
    use HasFactory;
}

public function elemento()

{

return $this->belongsTo('App\Models\actividades');
return $this->belongsTo('App\Models\contenido');
return $this->belongsTo('App\Models\multimedia');
return $this->belongsTo('App\Models\modulo');


}
