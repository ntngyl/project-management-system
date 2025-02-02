<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProjectResource\Pages;
use App\Models\Project;
use App\Models\Document;
use App\Models\Configuration;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\FileUpload;
use Filament\Tables\Table;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use RalphJSmit\Filament\RecordFinder\Forms\Components\RecordFinder;
use Illuminate\Support\Facades\Auth;

class ProjectResource extends Resource
{
    protected static ?string $model = Project::class;
    protected static ?string $navigationIcon = 'heroicon-o-cog';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Tabs::make('ProjectTabs')->tabs([
                    // TAB 1: Project Details
                    Tab::make('Project Details')->schema([
                        TextInput::make('name')->required()->label('Project Name'),
                        TextInput::make('project_number')->required()->unique()->label('Project Number'),
                        Select::make('project_type')
                            ->options(Configuration::where('type', 'project_type')->pluck('label', 'key'))
                            ->required()->label('Project Type'),
                        Textarea::make('description')->label('Description'),
                        DatePicker::make('start_date')->required()->label('Start Date'),
                        DatePicker::make('end_date')->required()->label('End Date'),
                        Select::make('status')
                            ->options(Configuration::where('type', 'status')->pluck('label', 'key'))
                            ->required()->label('Status'),
                        Select::make('priority')
                            ->options(Configuration::where('type', 'priority')->pluck('label', 'key'))
                            ->required()->label('Priority'),
                        Select::make('client_id')
                            ->relationship('client', 'name')
                            ->searchable()
                            ->label('Client')
                            ->required(),
                    ]),

                    // TAB 2: DCI-Based Document Management
                    Tab::make('Project Documents')->schema([
                        Repeater::make('documents')
                            ->relationship('linkedDocuments') // Ensure this exists in Project model
                            ->schema([
                                RecordFinder::make('document_id')
                                    ->label('Select Existing Document')
                                    ->relationship('linkedDocuments') // Polymorphic relationship
                                    ->tableColumns([
                                        TextColumn::make('title')->label('Title'),
                                        TextColumn::make('document_number')->label('Number'),
                                        TextColumn::make('type')->label('Type'),
                                    ])
                                    ->helperText('Select an existing document to link it to this project.'),

                                FileUpload::make('new_document')
                                    ->directory('project-documents')
                                    ->label('Upload New Document')
                                    ->helperText('Upload a new document if not selecting an existing one.'),
                            ])
                            ->columns(2)
                            ->label('Project-Level Documents'),
                    ]),
                ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->sortable()->searchable()->label('Project Name'),
                TextColumn::make('project_number')->sortable()->searchable(),
                TextColumn::make('status')->sortable()->searchable(),
                TextColumn::make('priority')->sortable()->searchable(),
                TextColumn::make('client.name')->sortable()->searchable()->label('Client'),
                TextColumn::make('start_date')->date()->sortable(),
                TextColumn::make('end_date')->date()->sortable(),
            ])
            ->filters([])
            ->actions([
                Tables\Actions\ViewAction::make(),
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
            'index' => Pages\ListProjects::route('/'),
            'create' => Pages\CreateProject::route('/create'),
            'edit' => Pages\EditProject::route('/{record}/edit'),
            'view' => Pages\ViewProject::route('/{record}/view'),
        ];
    }
}
