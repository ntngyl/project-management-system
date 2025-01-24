<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'project_id',
        'name',
        'description',
        'estimated_time',
        'start_date',
        'end_date',
        'status',
        'priority',
        'metadata',
        'created_by',
    ];

    protected $casts = [
        'start_date' => 'date',
        'end_date' => 'date',
        'metadata' => 'array',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($task) {
            $task->created_by = \Illuminate\Support\Facades\Auth::user()->id; // Assign current user as Owner
        });
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class);
    }

    public function assignedUsers(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'task_assignments');
    }

    public function owner(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }
}
