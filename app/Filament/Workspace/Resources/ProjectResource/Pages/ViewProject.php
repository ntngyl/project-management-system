<?php

namespace App\Filament\Workspace\Resources\ProjectResource\Pages;

use App\Filament\Workspace\Resources\ProjectResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;
use Spatie\Ray\Ray; // For debugging with Spatie Ray

class ViewProject extends ViewRecord
{
    protected static string $resource = ProjectResource::class;

    /**
     * Check if the user has permission for a specific action.
     */
    protected function can(string $action): bool
    {
        $user = auth()->user();

        // Fetch permissions for the user within this project
        $permissions = $this->record->userPositions()
            ->where('user_id', $user->id)
            ->pluck('permissions')
            ->flatten();

        // Debugging output using Spatie Ray
        ray([
            'User ID' => $user->id,
            'Project ID' => $this->record->id,
            'Permissions' => $permissions,
            'Action Checked' => $action,
        ])->orange();

        return $permissions->contains($action);
    }

    /**
     * Define the Blade view to use for displaying the project.
     */
    public function getView(): string
    {
        return 'filament.workspace.pages.view-project';
    }

    /**
     * Fetch and return project-related data for the Blade view.
     */
    public function getViewData(): array
    {
        return [
            'project' => $this->record->toArray(),
            'tasks' => $this->record->tasks, // Removed redundant `->get()`
            'documents' => $this->record->linkedDocuments()->with('document.revisions')->get()->map(fn($link) => $link->document),
            'positions' => $this->record->userPositions,
            'owner' => $this->record->owner,
        ];
    }
}
