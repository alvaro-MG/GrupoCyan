<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class modulo extends Model
{
    use HasFactory;
}

public function modulo()

{

return $this->hasOne(elemento::class);
return $this->hasOne(users::class);


}
