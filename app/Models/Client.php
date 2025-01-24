<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Client extends Model
{
    protected $fillable = [
        'name',
        'contact_person',
        'email',
        'phone',
        'type',
        'status',
        'metadata'
    ];

    protected $casts = [
        'metadata' => 'array'
    ];

    public function projects(): HasMany
    {
        return $this->hasMany(Project::class);
    }

    public function epcProjects(): HasMany
    {
        return $this->hasMany(Project::class, 'epc_id');
    }
}
