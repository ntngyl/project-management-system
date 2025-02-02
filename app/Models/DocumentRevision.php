<?php

// app/Models/DocumentRevision.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Document; // Ensure this line is correct and the Document class exists in the specified namespace
use App\Models\User;
use Illuminate\Support\Facades\Storage;


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
        'path' => 'array', // Now path is automatically handled as an array
        'submission_date' => 'date',
        'approval_date' => 'date',
        'metadata' => 'array',
    ];

    public function getFileUrlAttribute()
    {
        // Ensure that 'path' is an array and contains the stored file path.
        return isset($this->path['path']) ? Storage::url($this->path['path']) : null;
    }

    public function getOriginalNameAttribute()
    {
        if (is_array($this->path) && isset($this->path['original_name'])) {
            return $this->path['original_name'];
        }
        $decoded = is_string($this->path) ? json_decode($this->path, true) : $this->path;
        return $decoded['original_name'] ?? null;
    }

    /**
     * Get the stored file path.
     */
    public function getStoredPathAttribute()
    {
        if (is_array($this->path) && isset($this->path['stored_path'])) {
            return $this->path['stored_path'];
        }
        $decoded = is_string($this->path) ? json_decode($this->path, true) : $this->path;
        return $decoded['stored_path'] ?? null;
    }

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
