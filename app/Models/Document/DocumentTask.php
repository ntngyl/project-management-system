<?php

namespace App\Models\Document;

use Illuminate\Database\Eloquent\Model;
use App\Models\Document\Document;
use App\Models\Task;

class DocumentTask extends Model
{
    protected $table = 'document_task';

    protected $fillable = [
        'document_id',
        'task_id',
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
     * Relationship with Task
     * Each link belongs to a task.
     */
    public function task()
    {
        return $this->belongsTo(Task::class);
    }
}
