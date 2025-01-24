<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProjectResource\Pages;
use App\Models\Project;
use App\Models\Client;
use App\Models\User;
use App\Models\Position;
use App\Models\Configuration;
use App\Models\UserProjectPosition;
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
use Relaticle\CustomFields\Filament\Forms\Components\CustomFieldsComponent;
use Illuminate\Support\Facades\Auth; // Import Auth facade


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
                            ->required()
                            ->createOptionForm([
                                TextInput::make('name')->required(),
                                TextInput::make('contact_person')->label('Contact Person'),
                                TextInput::make('email')->email()->required(),
                                TextInput::make('phone')->tel(),
                            ]),

                        Select::make('project_manager_id')
                            ->relationship('projectManager', 'name')
                            ->searchable()
                            ->label('Project Manager')
                            ->required(),

                        // Custom Fields Integration
                        CustomFieldsComponent::make()->columns(1),
                    ]),



                    // TAB 3: Initial Documents Upload
                    Tab::make('Initial Documents')->schema([
                        FileUpload::make('documents')
                            ->multiple()
                            ->storeFiles()
                            ->directory('documents')
                            ->preserveFilenames()
                            ->maxSize(10240)
                            ->label('Upload Documents'),
                    ]),
                ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->sortable()->searchable()->label('Project Name'),
                Tables\Columns\TextColumn::make('project_number')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('status')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('priority')->sortable()->searchable(),
                Tables\Columns\TextColumn::make('client.name')->sortable()->searchable()->label('Client'),
                Tables\Columns\TextColumn::make('start_date')->date()->sortable(),
                Tables\Columns\TextColumn::make('end_date')->date()->sortable(),
            ])
            ->filters([])
            ->actions([
                Tables\Actions\ViewAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function canView($record): bool
    {
        $user = Auth::user(); // Use Auth facade

        // Prevent null user errors
        if (!$user) {
            return false;
        }

        return $user->can('view-project') || $user->hasRole(['super_admin', 'admin']);
    }


    public static function canViewAny(): bool
    {
        $user = Auth::user(); // Use Auth facade

        // Prevent errors when user is null (unauthenticated)
        if (!$user) {
            return false;
        }

        return $user->can('view-global-project') ||
            $user->can('view-assigned-project') ||
            $user->can('view-own-project') ||
            $user->hasRole(['super_admin', 'admin']); // Allow admin/super_admin full access
    }

    public static function canCreate(): bool
    {
        return auth()->user()->can('create-project') || auth()->user()->hasRole(['super_admin', 'admin']);
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
