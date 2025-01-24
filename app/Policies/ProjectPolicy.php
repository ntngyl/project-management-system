<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Project;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Support\Facades\Log;


class ProjectPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        // Check if the user has permission to view any projects
        $userPermissions = $user->positions()
            ->pluck('permissions')
            ->flatten();

        return $userPermissions->contains('view-own-project') || $userPermissions->contains('view-assigned-project');
    }


    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Project $project): bool
    {
        // Get the user's permissions for the project
        $userPermissions = $user->positions()
            ->where('project_id', $project->id)
            ->pluck('permissions')
            ->flatten();

        // Log the permissions for debugging
        \Log::info('Policy Check', [
            'user_id' => $user->id,
            'project_id' => $project->id,
            'permissions' => $userPermissions,
        ]);

        // Check if the user has permission to view their own or assigned projects
        return $userPermissions->contains('view-own-project') && $project->created_by === $user->id
            || $userPermissions->contains('view-assigned-project');
    }


    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->can('create_project');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Project $project): bool
    {
        $userPositions = $user->positions()->where('project_id', $project->id)->pluck('permissions')->flatten();
        return $userPositions->contains('edit-own-project') && $project->created_by === $user->id
            || $userPositions->contains('edit-assigned-project');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, ?Project $project = null): bool
    {
        // Handle cases where $project is null (e.g., when listing actions)
        if (is_null($project)) {
            return false; // Deny access if no project is provided
        }

        $userPermissions = $user->positions()
            ->where('project_id', $project->id)
            ->pluck('permissions')
            ->flatten();

        return $userPermissions->contains('delete-own-project') && $project->created_by === $user->id
            || $userPermissions->contains('delete-assigned-project');
    }


    /**
     * Determine whether the user can bulk delete.
     */
    public function deleteAny(User $user): bool
    {
        return $user->can('delete_any_project');
    }

    /**
     * Determine whether the user can permanently delete.
     */
    public function forceDelete(User $user, Project $project): bool
    {
        return $user->can('force_delete_project');
    }

    /**
     * Determine whether the user can permanently bulk delete.
     */
    public function forceDeleteAny(User $user): bool
    {
        return $user->can('force_delete_any_project');
    }

    /**
     * Determine whether the user can restore.
     */
    public function restore(User $user, Project $project): bool
    {
        return $user->can('restore_project');
    }

    /**
     * Determine whether the user can bulk restore.
     */
    public function restoreAny(User $user): bool
    {
        return $user->can('restore_any_project');
    }

    /**
     * Determine whether the user can replicate.
     */
    public function replicate(User $user, Project $project): bool
    {
        return $user->can('replicate_project');
    }

    /**
     * Determine whether the user can reorder.
     */
    public function reorder(User $user): bool
    {
        return $user->can('reorder_project');
    }


    public function scopeOwn($query)
    {
        return $query->where('created_by', auth()->id());
    }

    public function scopeAssigned($query)
    {
        return $query->whereIn('id', function ($query) {
            $query->select('project_id')
                ->from('user_project_positions')
                ->where('user_id', auth()->id());
        });
    }
}
