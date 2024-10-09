<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WhoisRecord extends Model
{
    // Field yang boleh diisi menggunakan mass assignment
    protected $fillable = [
        'domain',
        'whois_data',
        'status',
    ];
}
