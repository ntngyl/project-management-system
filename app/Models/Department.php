<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Department extends Model
{
    protected $fillable = [
        'name',
        'description',
        'metadata'
    ];

    protected $casts = [
        'metadata' => 'array'
    ];

    public function users()
    {
        return $this->belongsToMany(User::class, 'user_departments')
            ->withPivot('is_primary')
            ->withTimestamps();
    }
}
