<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserProjectPosition extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'project_id',
        'position_id',
    ];

    /**
     * Get the user associated with this position assignment.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the project associated with this position assignment.
     */
    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class);
    }

    /**
     * Get the position associated with this position assignment.
     */
    public function position(): BelongsTo
    {
        return $this->belongsTo(Position::class);
    }
}
