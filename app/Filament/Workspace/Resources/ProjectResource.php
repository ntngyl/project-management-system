<?php

namespace App\Filament\Workspace\Resources;

use App\Filament\Workspace\Resources\ProjectResource\Pages;
use App\Models\Project;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class ProjectResource extends Resource
{
    protected static ?string $model = Project::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->label('Project Name'),

                Forms\Components\Textarea::make('description')
                    ->label('Description'),

                Forms\Components\DatePicker::make('start_date')
                    ->label('Start Date'),

                Forms\Components\DatePicker::make('end_date')
                    ->label('End Date'),

                Forms\Components\Select::make('status')
                    ->label('Status')
                    ->options([
                        'planned' => 'Planned',
                        'in-progress' => 'In Progress',
                        'completed' => 'Completed',
                    ]),

                Forms\Components\Select::make('priority')
                    ->label('Priority')
                    ->options([
                        'low' => 'Low',
                        'medium' => 'Medium',
                        'high' => 'High',
                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label('Project Name')
                    ->searchable(),

                Tables\Columns\TextColumn::make('description')
                    ->label('Description')
                    ->limit(50),

                Tables\Columns\TextColumn::make('status')
                    ->label('Status')
                    ->badge(),

                Tables\Columns\TextColumn::make('priority')
                    ->label('Priority')
                    ->badge(),

                Tables\Columns\TextColumn::make('created_by')
                    ->label('Created By')
                    ->formatStateUsing(fn($state) => optional($state)->name),

                Tables\Columns\TextColumn::make('created_at')
                    ->label('Created At')
                    ->dateTime(),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('status')
                    ->options([
                        'planned' => 'Planned',
                        'in-progress' => 'In Progress',
                        'completed' => 'Completed',
                    ]),

                Tables\Filters\SelectFilter::make('priority')
                    ->options([
                        'low' => 'Low',
                        'medium' => 'Medium',
                        'high' => 'High',
                    ]),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            \App\Filament\Workspace\Resources\ProjectResource\RelationManagers\TasksRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProjects::route('/'),
            'create' => Pages\CreateProject::route('/create'),
            'edit' => Pages\EditProject::route('/{record}/edit'),
            'view' => Pages\ViewProject::route('/{record}'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->where(function ($query) {
                $query->where('created_by', auth()->id())
                    ->orWhereIn('id', function ($subquery) {
                        $subquery->select('project_id')
                            ->from('user_project_positions')
                            ->where('user_id', auth()->id());
                    });
            });
    }
}
