<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages as UserPages;
use App\Filament\Resources\RoleResource\Pages as RolePages;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class UserResource extends Resource
{
    protected static ?string $model = User::class;
    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationGroup = 'User Management';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('email')
                    ->email()
                    ->required()
                    ->unique(),

                Forms\Components\TextInput::make('password')
                    ->password()
                    ->required()
                    ->hiddenOn('edit')
                    ->maxLength(255),

                Forms\Components\Select::make('roles')
                    ->relationship('roles', 'name')
                    ->multiple()
                    ->searchable()
                    ->preload(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('email')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('roles.name')
                    ->badge()
                    ->separator(','),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('roles')
                    ->relationship('roles', 'name')
                    ->multiple(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => UserPages\ListUsers::route('/'),
            'create' => UserPages\CreateUser::route('/create'),
            'edit' => UserPages\EditUser::route('/{record}/edit'),
        ];
    }
}
