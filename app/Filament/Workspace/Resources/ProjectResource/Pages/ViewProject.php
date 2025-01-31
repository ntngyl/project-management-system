<?php

namespace App\Filament\Workspace\Resources\ProjectResource\Pages;

use App\Filament\Workspace\Resources\ProjectResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewProject extends ViewRecord
{
    protected static string $resource = ProjectResource::class;

    protected function can(string $action): bool
    {
        $user = auth()->user();
        $permissions = $this->record->userPositions()
            ->where('user_id', $user->id)
            ->pluck('permissions')
            ->flatten();

        \Log::info('User Permissions', ['permissions' => $permissions]);
        return $permissions->contains($action);
    }

    public function getView(): string
    {
        return 'filament.workspace.pages.view-project';
    }

    public function getViewData(): array
    {
        // Fetch project-related data dynamically
        $tasks = $this->record->tasks()->get();
        $documents = $this->record->documents()->get();
        $positions = $this->record->userPositions()->get();
        $owner = $this->record->owner;

        return [
            'project' => $this->record->toArray(), // Fetch all fields from the project model
            'tasks' => $this->record->tasks()->get(),
            //            'documents' => $this->record->documents()->get(),
            'positions' => $this->record->userPositions()->get(),
            'owner' => $this->record->owner,
        ];
    }
}
