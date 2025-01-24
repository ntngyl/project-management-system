<?php

namespace App\Models\Document;

use Illuminate\Database\Eloquent\Model;
use App\Models\Document\Document;
use App\Models\Project;

class DocumentProject extends Model
{
    protected $table = 'document_project';

    protected $fillable = [
        'document_id',
        'project_id',
    ];

    /**
     * Relationship with Document
     * Each link belongs to a document.
     */
    public function document()
    {
        return $this->belongsTo(Document::class);
    }

    /**
     * Relationship with Project
     * Each link belongs to a project.
     */
    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
