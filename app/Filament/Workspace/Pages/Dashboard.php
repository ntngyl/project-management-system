<?php

namespace App\Filament\Workspace\Pages;

use Filament\Pages\Page;
use App\Models\Project;
use App\Models\Task;
use Illuminate\Support\Facades\Auth;

class Dashboard extends Page
{
    protected static ?string $navigationLabel = 'Dashboard';
    protected static ?string $title = 'Workspace Dashboard';
    protected static string $view = 'filament.workspace.resources.dashboard-resource.pages.dashboard';

    public function getViewData(): array
    {
        $user = Auth::user();

        // Fetch projects and tasks for the logged-in user
        $projects = Project::whereHas('userPositions', function ($query) use ($user) {
            $query->where('user_id', $user->id);
        })->get();

        $tasks = Task::whereHas('project.userPositions', function ($query) use ($user) {
            $query->where('user_id', $user->id);
        })->get();

        // Return data to be passed to the view
        return [
            'projects' => $projects,
            'tasks' => $tasks,
        ];
    }
}
