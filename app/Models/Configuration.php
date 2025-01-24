<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Configuration extends Model
{
    protected $fillable = [
        'type',
        'key',
        'label',
        'is_active',
        'sort_order',
        'metadata'
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'metadata' => 'array'
    ];

    public static function getOptions(string $type): array
    {
        return static::where('type', $type)
            ->where('is_active', true)
            ->orderBy('sort_order')
            ->pluck('label', 'key')
            ->toArray();
    }
}
