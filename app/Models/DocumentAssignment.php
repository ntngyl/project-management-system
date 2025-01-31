<?php

// app/Models/DocumentAssignment.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Document;
use App\Models\User;

class DocumentAssignment extends Model
{
    use HasFactory;

    protected $fillable = [
        'document_id',
        'user_id',
    ];

    public function document()
    {
        return $this->belongsTo(Document::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
