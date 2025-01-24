<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Task;

class Category extends Model
{
    use HasFactory;

    protected $fillable = ['parent_id', 'name', 'description', 'type', 'metadata'];

    protected $casts = [
        'metadata' => 'array',
    ];

    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    public function items()
    {
        return $this->hasMany(Item::class);
    }

    public function documents()
    {
        return $this->hasMany(DocumentController::class);
    }

    public function tasks()
    {
        return $this->hasMany(Task::class);
    }
}
