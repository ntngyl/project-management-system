<?php

namespace App\Models\Document;

use Illuminate\Database\Eloquent\Model;
use App\Models\Document\DocumentRevision; // Import DocumentRevision
use App\Models\Project;                  // Import Project model
use App\Models\Task;                     // Import Task model
use App\Models\User;                     // Import User model

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

    public function projects()
    {
        return $this->belongsToMany(Project::class, 'document_project');
    }

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

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($document) {
            $document->created_by = \Illuminate\Support\Facades\Auth::user()->id; // Assign current user as Owner
        });
    }
}
