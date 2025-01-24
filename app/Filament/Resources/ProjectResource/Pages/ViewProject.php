<?php

namespace App\Filament\Resources\ProjectResource\Pages;

use App\Filament\Resources\ProjectResource;
use Filament\Resources\Pages\Page;
use App\Models\Project;
use Illuminate\Support\Facades\Log;

class ViewProject extends Page
{
    protected static string $resource = ProjectResource::class;
    protected static string $view = 'filament.pages.view-project';

    public Project $record;

    public function mount($record)
    {
        Log::info("ViewProject: Received Record ID - " . json_encode($record));

        // ✅ Convert Collection to Single Project Instance if necessary
        if ($record instanceof Project) {
            $this->record = $record;
        } else {
            $this->record = Project::findOrFail($record);
        }

        Log::info("ViewProject: Loaded Project - " . $this->record->name);
    }

    public function getTitle(): string
    {
        return "Project: " . ($this->record->name ?? 'Unknown');
    }
}
