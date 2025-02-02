<?php

namespace App\Policies;

use App\Models\Document;
use App\Models\User;
use Illuminate\Auth\Access\Response;
use Spatie\Ray\Ray; // Spatie Ray for debugging

class DocumentPolicy
{
    /**
     * Determine whether the user can view any documents.
     */
    public function viewAny(User $user): bool
    {
        $userPermissions = $user->positions()->pluck('permissions')->flatten();

        ray('Checking viewAny permission', $userPermissions)->green(); // Debugging

        return $userPermissions->contains('view-own-document') ||
            $userPermissions->contains('view-assigned-document') ||
            $userPermissions->contains('view-global-document');
    }

    /**
     * Determine whether the user can view a specific document.
     */
    public function view(User $user, Document $document): bool
    {
        $userPermissions = $user->positions()->pluck('permissions')->flatten();

        ray()->clearAll(); // Clears previous debug logs
        ray([
            'User ID' => $user->id,
            'Document ID' => $document->id,
            'Permissions' => $userPermissions,
            'Linked to User' => $this->isLinkedToUser($user, $document),
        ])->orange(); // Debugging output in Spatie Ray

        return $userPermissions->contains('view-global-document') ||
            ($userPermissions->contains('view-own-document') && $document->created_by === $user->id) ||
            ($userPermissions->contains('view-assigned-document') && $this->isLinkedToUser($user, $document));
    }

    /**
     * Determine whether the user can create a document.
     */
    public function create(User $user): bool
    {
        ray('Checking create permission for User ID: ' . $user->id)->blue(); // Debugging

        return $user->can('create-document');
    }

    /**
     * Determine whether the user can update the document.
     */
    public function update(User $user, Document $document): bool
    {
        $userPermissions = $user->positions()->pluck('permissions')->flatten();

        ray([
            'User ID' => $user->id,
            'Document ID' => $document->id,
            'Permissions' => $userPermissions,
            'Linked to User' => $this->isLinkedToUser($user, $document),
        ])->purple(); // Debugging

        return $userPermissions->contains('edit-global-document') ||
            ($userPermissions->contains('edit-own-document') && $document->created_by === $user->id) ||
            ($userPermissions->contains('edit-assigned-document') && $this->isLinkedToUser($user, $document));
    }

    /**
     * Determine whether the user can delete the document.
     */
    public function delete(User $user, ?Document $document = null): bool
    {
        if (is_null($document)) {
            return false;
        }

        $userPermissions = $user->positions()->pluck('permissions')->flatten();

        ray([
            'User ID' => $user->id,
            'Document ID' => $document->id,
            'Permissions' => $userPermissions,
            'Linked to User' => $this->isLinkedToUser($user, $document),
        ])->red(); // Debugging

        return $userPermissions->contains('delete-global-document') ||
            ($userPermissions->contains('delete-own-document') && $document->created_by === $user->id) ||
            ($userPermissions->contains('delete-assigned-document') && $this->isLinkedToUser($user, $document));
    }

    /**
     * Determine whether the user can restore the document.
     */
    public function restore(User $user, Document $document): bool
    {
        return false;
    }

    /**
     * Determine whether the user can permanently delete the document.
     */
    public function forceDelete(User $user, Document $document): bool
    {
        return false;
    }

    /**
     * Check if the document is linked to the user through the polymorphic `document_links` table.
     */
    private function isLinkedToUser(User $user, Document $document): bool
    {
        $isLinked = $document->linkedEntities()
            ->whereHas('userPositions', function ($query) use ($user) {
                $query->where('user_id', $user->id);
            })
            ->exists();

        ray('Checking if document is linked to user:', [
            'User ID' => $user->id,
            'Document ID' => $document->id,
            'Is Linked' => $isLinked,
        ])->yellow(); // Debugging

        return $isLinked;
    }
}
