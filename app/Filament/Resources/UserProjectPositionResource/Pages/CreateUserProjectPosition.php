<?php

namespace App\Filament\Resources\UserProjectPositionResource\Pages;

use App\Filament\Resources\UserProjectPositionResource;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;
use App\Models\UserProjectPosition;
use Illuminate\Validation\ValidationException;

class CreateUserProjectPosition extends CreateRecord
{
    protected static string $resource = UserProjectPositionResource::class;

    /**
     * Override handleRecordCreation to support multiple position selections.
     */
    protected function handleRecordCreation(array $data): Model
    {
        \Log::info('Data received in handleRecordCreation:', $data);

        if (!isset($data['position_id']) || !is_array($data['position_id'])) {
            throw \Illuminate\Validation\ValidationException::withMessages([
                'position_id' => 'At least one position must be selected.',
            ]);
        }

        $positions = $data['position_id'];
        unset($data['position_id']);

        $createdRecords = collect();

        foreach ($positions as $positionId) {
            $recordData = array_merge($data, ['position_id' => $positionId]);
            $createdRecords->push(\App\Models\UserProjectPosition::create($recordData));
        }

        return $createdRecords->first();
    }
}
