<?php

// app/Models/Document/Document.php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\DocumentRevision;
use App\Models\Project;
use App\Models\Task;
use App\Models\User;

class Document extends Model
{
    protected $fillable = [
        'title',
        'document_number',
        'type',
        'status',
        'priority',
        'is_initial_document',
        'metadata',
        'created_by',
    ];

    protected $casts = [
        'metadata' => 'array',
    ];

    public function revisions()
    {
        return $this->hasMany(DocumentRevision::class);
    }

    // public function projects()
    // {
    //     return $this->belongsToMany(Project::class, 'document_project');
    // }

    public function tasks()
    {
        return $this->belongsToMany(Task::class, 'document_task');
    }

    public function owner()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    /**
     * Relationship with users assigned to the document.
     */
    public function assignedUsers()
    {
        return $this->belongsToMany(User::class, 'document_assignments');
    }

    public function linkedProjects()
    {
        return $this->morphedByMany(Project::class, 'model', 'document_links', 'document_id', 'model_id');
    }


    public function linkedTasks()
    {
        return $this->morphToMany(Task::class, 'model', 'document_links', 'document_id', 'model_id');
    }

    public function preparedBy()
    {
        return $this->hasManyThrough(
            User::class, // The related model
            DocumentRevision::class, // The intermediate model
            'document_id', // Foreign key on the DocumentRevision table
            'id', // Foreign key on the User table
            'id', // Local key on the Document table
            'prepared_by' // Local key on the DocumentRevision table
        );
    }


    protected static function boot()
    {
        parent::boot();

        // Automatically assign the current user as the creator
        static::creating(function ($document) {
            $document->created_by = \Illuminate\Support\Facades\Auth::id();
        });
    }
}
