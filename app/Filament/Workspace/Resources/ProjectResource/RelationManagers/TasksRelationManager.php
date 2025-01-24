<?php

namespace App\Filament\Workspace\Resources\ProjectResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class TasksRelationManager extends RelationManager
{
    protected static string $relationship = 'tasks';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),

                Forms\Components\Textarea::make('description'),

                Forms\Components\DatePicker::make('start_date')
                    ->label('Start Date'),

                Forms\Components\DatePicker::make('end_date')
                    ->label('End Date'),

                Forms\Components\Select::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'in-progress' => 'In Progress',
                        'completed' => 'Completed',
                    ]),

                Forms\Components\Select::make('priority')
                    ->options([
                        'low' => 'Low',
                        'medium' => 'Medium',
                        'high' => 'High',
                    ]),
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label('Task Name')
                    ->searchable(),

                Tables\Columns\TextColumn::make('status')
                    ->label('Status')
                    ->badge(),

                Tables\Columns\TextColumn::make('priority')
                    ->label('Priority')
                    ->badge(),

                Tables\Columns\TextColumn::make('start_date')
                    ->label('Start Date')
                    ->date(),

                Tables\Columns\TextColumn::make('end_date')
                    ->label('End Date')
                    ->date(),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'in-progress' => 'In Progress',
                        'completed' => 'Completed',
                    ]),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }
}
