<?php

// app/Models/DocumentRevision.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Document; // Ensure this line is correct and the Document class exists in the specified namespace
use App\Models\User;

class DocumentRevision extends Model
{
    use HasFactory;

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
        'submission_date' => 'date',
        'approval_date' => 'date',
        'metadata' => 'array',
    ];

    public function document()
    {
        return $this->belongsTo(Document::class);
    }

    public function preparedBy()
    {
        return $this->belongsTo(User::class, 'prepared_by');
    }

    public function reviewedBy()
    {
        return $this->belongsTo(User::class, 'reviewed_by');
    }

    public function approvedBy()
    {
        return $this->belongsTo(User::class, 'approved_by');
    }
}
