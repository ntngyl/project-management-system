<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;


class Position extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'role',
        'permissions',
    ];

    protected $casts = [
        'permissions' => 'array',
    ];

    /**
     * Get all users assigned to this position.
     */

    public function userProjects()
    {
        return $this->belongsToMany(User::class, 'user_project_positions')
            ->withPivot('project_id')
            ->withTimestamps();
    }
    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'user_project_positions')
            ->withPivot('project_id') // Track the project ID
            ->withTimestamps();
    }
}
