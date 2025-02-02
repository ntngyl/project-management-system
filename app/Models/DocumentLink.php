<?php

// app/Models/DocumentLink.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Document;

class DocumentLink extends Model
{
    use HasFactory;

    protected $fillable = [
        'document_id',
        'model_type',
        'model_id',
    ];

    public function document()
    {
        return $this->belongsTo(Document::class);
    }

    public function model()
    {
        return $this->morphTo();
    }
}
