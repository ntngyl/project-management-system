<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserProjectPositionResource\Pages;
use App\Models\UserProjectPosition;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use App\Models\Position;


class UserProjectPositionResource extends Resource
{
    protected static ?string $model = UserProjectPosition::class;
    protected static ?string $navigationGroup = 'Project Management';
    protected static ?string $navigationIcon = 'heroicon-o-users';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('user_id')
                    ->label('User')
                    ->relationship('user', 'name')
                    ->required(),

                Forms\Components\Select::make('project_id')
                    ->label('Project')
                    ->relationship('project', 'name')
                    ->required(),

                // Updated field: using options() instead of relationship() for multi-select.
                Forms\Components\Select::make('position_id')
                    ->label('Position')
                    ->options(Position::all()->pluck('name', 'id')->toArray())
                    ->multiple()
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('project.name')->label('Project'),
                Tables\Columns\TextColumn::make('user.name')->label('User'),
                Tables\Columns\TextColumn::make('position.name')->label('Position'),
            ])
            ->filters([])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListUserProjectPositions::route('/'),
            'create' => Pages\CreateUserProjectPosition::route('/create'),
            'edit'   => Pages\EditUserProjectPosition::route('/{record}/edit'),
        ];
    }
}
