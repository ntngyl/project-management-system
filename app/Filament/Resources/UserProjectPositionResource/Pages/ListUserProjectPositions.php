<?php

namespace App\Filament\Resources\UserProjectPositionResource\Pages;

use App\Filament\Resources\UserProjectPositionResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListUserProjectPositions extends ListRecords
{
    protected static string $resource = UserProjectPositionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
