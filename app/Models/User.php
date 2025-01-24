<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasRoles; // Corrected trait order

    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    public function tasks()
    {
        return $this->belongsToMany(Task::class, 'task_assignments')
            ->withPivot('metadata')
            ->withTimestamps();
    }

    public function projectPositions(): BelongsToMany
    {
        return $this->belongsToMany(Project::class, 'user_project_positions', 'user_id', 'project_id')
            ->withPivot('position_id') // Include position IDs in the pivot
            ->withTimestamps();
    }


    public function positions(): BelongsToMany
    {
        return $this->belongsToMany(Position::class, 'user_project_positions')
            ->withPivot('project_id')
            ->withTimestamps();
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($user) {
            if (empty($user->email)) {
                throw new \Exception('User email is required.');
            }
        });
    }
}
