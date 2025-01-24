<?php

namespace App\Models\Document;

use Illuminate\Database\Eloquent\Model;
use App\Models\Document\Document;

class DocumentRevision extends Model
{
    protected $fillable = [
        'document_id',
        'version',
        'status',
        'path',
        'prepared_by',
        'reviewed_by',
        'approved_by',
        'submission_date',
        'approval_date',
        'metadata',
    ];

    protected $casts = [
        'metadata' => 'array',
    ];

    /**
     * Relationship with Document
     * Each revision belongs to one document.
     */
    public function document()
    {
        return $this->belongsTo(Document::class);
    }
}
