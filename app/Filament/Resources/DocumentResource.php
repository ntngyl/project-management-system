<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DocumentResource\Pages;
use App\Models\Document;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Actions\Action;
use RalphJSmit\Filament\RecordFinder\Forms\Components\RecordFinder;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;
use Illuminate\Support\Facades\Storage;

class DocumentResource extends Resource
{
    protected static ?string $model = Document::class;
    protected static ?string $navigationIcon = 'heroicon-o-document';

    public static function form(Form $form): Form
    {
        return $form->schema([
            // Main Document fields
            Forms\Components\TextInput::make('title')
                ->required()
                ->label('Document Title'),

            Forms\Components\TextInput::make('document_number')
                ->required()
                ->label('Document Number'),

            Forms\Components\Select::make('type')
                ->options([
                    'Technical Spec' => 'Technical Spec',
                    'RFQ'            => 'RFQ',
                    'Contract'       => 'Contract',
                ])
                ->label('Document Type'),

            Forms\Components\Select::make('status')
                ->options([
                    'Draft'    => 'Draft',
                    'Approved' => 'Approved',
                    'Rejected' => 'Rejected',
                ])
                ->label('Document Status'),

            Forms\Components\Select::make('priority')
                ->options([
                    'High'   => 'High',
                    'Medium' => 'Medium',
                    'Low'    => 'Low',
                ])
                ->label('Priority')
                ->required(),

            // Revisions Repeater
            Forms\Components\Repeater::make('revisions')
                ->relationship('revisions')
                ->schema([
                    Forms\Components\TextInput::make('version')
                        ->required()
                        ->label('Version'),

                    // FileUpload field for revision file
                    Forms\Components\FileUpload::make('path')
                        ->directory('document-revisions')
                        ->label('Revision File')
                        ->preserveFilenames(false)
                        ->saveUploadedFileUsing(function (TemporaryUploadedFile $file): string {
                            // Get the original file name and extension.
                            $originalName       = $file->getClientOriginalName();
                            $extension          = $file->getClientOriginalExtension();
                            $filenameWithoutExt = pathinfo($originalName, PATHINFO_FILENAME);

                            // Generate a unique file name.
                            $newFilename = $filenameWithoutExt . '-' . time() . '-' . uniqid() . '.' . $extension;

                            // Store the file under "document-revisions"
                            // (This stores the file under storage/app/document-revisions)
                            $storedPath = $file->storeAs('document-revisions', $newFilename);

                            // Return a JSON string with both the stored file path and the original file name.
                            return json_encode([
                                'stored_path'   => $storedPath,
                                'original_name' => $originalName,
                            ]);
                        })
                        // If no new file is uploaded, keep the existing file JSON.
                        ->dehydrated(function ($state, callable $get) {
                            if (empty($state)) {
                                return $get('old_file');
                            }
                            return $state;
                        }),

                    // Hidden field to store the current file JSON.
                    Forms\Components\Hidden::make('old_file')
                        ->afterStateHydrated(function ($state, callable $set, callable $get) {
                            // When the repeater item is hydrated, store the current "path" value.
                            $current = $get('path');
                            if ($current) {
                                $set('old_file', $current);
                            }
                        })
                        ->dehydrated(false),

                    // Other fields for the revision
                    Forms\Components\Select::make('status')
                        ->options([
                            'Draft'    => 'Draft',
                            'Approved' => 'Approved',
                        ])
                        ->label('Status'),

                    Forms\Components\Select::make('prepared_by')
                        ->relationship('preparedBy', 'name')
                        ->label('Prepared By'),

                    Forms\Components\DatePicker::make('submission_date')
                        ->label('Submission Date'),

                    Forms\Components\DatePicker::make('approval_date')
                        ->label('Approval Date'),
                ])
                ->columns(2)
                ->label('Revisions'),

            // RecordFinder fields for Assigned Users and Linked Projects
            RecordFinder::make('assignedUsers')
                ->relationship('assignedUsers', function ($query) {
                    return $query->select('users.id', 'users.name');
                })
                ->label('Assigned Users')
                ->multiple(),

            RecordFinder::make('linkedProjects')
                ->relationship('linkedProjects', function ($query) {
                    return $query->select('projects.id', 'projects.name');
                })
                ->label('Linked Projects')
                ->multiple()
                ->tableColumns([
                    TextColumn::make('name')->label('Project Name'),
                    TextColumn::make('client.name')->label('Client'),
                ]),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table->columns([
            TextColumn::make('title')
                ->label('Title')
                ->sortable()
                ->searchable(),

            TextColumn::make('document_number')
                ->label('Number')
                ->sortable()
                ->searchable(),

            TextColumn::make('type')
                ->label('Type'),

            TextColumn::make('status')
                ->label('Status'),

            TextColumn::make('priority')
                ->label('Priority'),

            // Column to display the file's original name from the latest revision.
            TextColumn::make('latest_revision_name')
                ->label('File Name')
                ->getStateUsing(function ($record) {
                    $latestRevision = $record->revisions()->latest()->first();
                    return $latestRevision ? $latestRevision->original_name : '-';
                }),

            TextColumn::make('created_at')
                ->label('Created At')
                ->dateTime(),
        ])
            ->actions([
                Tables\Actions\EditAction::make(),
                // Download action button using the download route
                Action::make('download')
                    ->label('Download')
                    ->icon('heroicon-o-download')
                    ->url(function ($record) {
                        $latestRevision = $record->revisions()->latest()->first();
                        if ($latestRevision) {
                            return route('document.download', $latestRevision->id);
                        }
                        return '#';
                    })
                    ->openUrlInNewTab(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            // Add relation managers if needed.
        ];
    }

    public static function getPages(): array
    {
        return [
            'index'  => Pages\ListDocuments::route('/'),
            'create' => Pages\CreateDocument::route('/create'),
            'edit'   => Pages\EditDocument::route('/{record}/edit'),
        ];
    }
}
