<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Relaticle\CustomFields\Models\Contracts\HasCustomFields;
use Relaticle\CustomFields\Models\Concerns\UsesCustomFields;

class Project extends Model implements HasCustomFields
{
    use UsesCustomFields;

    protected $fillable = [
        'name',
        'project_number',
        'project_type',
        'description',
        'start_date',
        'end_date',
        'status',
        'priority',
        'client_id',
        'epc_id',
        'project_manager_id',
        'metadata',
        'created_by', // Owner field added
    ];

    protected $casts = [
        'start_date' => 'date',
        'end_date' => 'date',
        'metadata' => 'array'
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($project) {
            $project->created_by = \Illuminate\Support\Facades\Auth::user()->id; // Assign current user as the Owner
        });
    }

    public function client(): BelongsTo
    {
        return $this->belongsTo(Client::class);
    }

    public function epc(): BelongsTo
    {
        return $this->belongsTo(Client::class, 'epc_id');
    }

    public function projectManager(): BelongsTo
    {
        return $this->belongsTo(User::class, 'project_manager_id');
    }


    public function documents(): HasMany
    {
        return $this->hasMany(\App\Models\Document::class);
    }

    public function tasks(): HasMany
    {
        return $this->hasMany(Task::class);
    }

    public function userPositions(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'user_project_positions', 'project_id', 'user_id')
            ->withPivot('position_id') // Include position IDs in the pivot
            ->withTimestamps();
    }


    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'user_project_positions')
            ->withPivot('position_id') // Track which position user holds
            ->withTimestamps();
    }

    public function positions(): BelongsToMany
    {
        return $this->belongsToMany(Position::class, 'user_project_positions')
            ->withPivot('user_id') // Track which user holds the position
            ->withTimestamps();
    }

    public function owner(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }
    public function scopeOwn($query)
    {
        return $query->where('created_by', \Illuminate\Support\Facades\Auth::user()->id);
    }

    public function linkedDocuments()
    {
        return $this->morphMany(DocumentLink::class, 'model');
    }


    public function scopeAssigned($query)
    {
        return $query->whereIn('id', function ($query) {
            $query->select('project_id')
                ->from('user_project_positions')
                ->where('user_id', \Illuminate\Support\Facades\Auth::user()->id);
        });
    }
}
