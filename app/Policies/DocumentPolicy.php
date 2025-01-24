<?php

namespace App\Policies;

use Illuminate\Support\Facades\Log;

use App\Models\Document\Document;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class DocumentPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        // Check if the user has permission to view any documents
        $userPermissions = $user->positions()
            ->pluck('permissions')
            ->flatten();

        return $userPermissions->contains('view-own-document') ||
            $userPermissions->contains('view-assigned-document') ||
            $userPermissions->contains('view-global-document');
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Document $document): bool
    {
        // Get the user's permissions for projects or tasks associated with the document
        $userPermissions = $user->positions()
            ->pluck('permissions')
            ->flatten();

        // Log the permissions for debugging
        \Log::info('DocumentPolicy View Check', [
            'user_id' => $user->id,
            'document_id' => $document->id,
            'permissions' => $userPermissions,
        ]);

        // Check if the user has permission to view their own, assigned, or global documents
        return $userPermissions->contains('view-own-document') && $document->created_by === $user->id ||
            $userPermissions->contains('view-assigned-document') && $this->isAssignedToDocument($user, $document) ||
            $userPermissions->contains('view-global-document');
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->can('create-document');
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Document $document): bool
    {
        $userPermissions = $user->positions()->pluck('permissions')->flatten();

        return $userPermissions->contains('edit-own-document') && $document->created_by === $user->id ||
            $userPermissions->contains('edit-assigned-document') && $this->isAssignedToDocument($user, $document) ||
            $userPermissions->contains('edit-global-document');
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, ?Document $document = null): bool
    {
        // Handle cases where $document is null
        if (is_null($document)) {
            return false;
        }

        $userPermissions = $user->positions()->pluck('permissions')->flatten();

        return $userPermissions->contains('delete-own-document') && $document->created_by === $user->id ||
            $userPermissions->contains('delete-assigned-document') && $this->isAssignedToDocument($user, $document) ||
            $userPermissions->contains('delete-global-document');
    }

    private function isAssignedToDocument(User $user, Document $document): bool
    {
        return $document->assignedUsers()->where('user_id', $user->id)->exists() ||
            $document->projects()->whereHas('userProjectPositions', function ($query) use ($user) {
                $query->where('user_id', $user->id);
            })->exists() ||
            $document->tasks()->whereHas('project.userProjectPositions', function ($query) use ($user) {
                $query->where('user_id', $user->id);
            })->exists();
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Document $document): bool
    {
        return false;
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Document $document): bool
    {
        return false;
    }
}
