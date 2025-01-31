<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DocumentResource\Pages;
//use App\Filament\Resources\DocumentResource\Widgets\DocumentLinkWidget; // Import the widget
use App\Models\Document;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use RalphJSmit\Filament\RecordFinder\Forms\Components\RecordFinder;


class DocumentResource extends Resource
{
    protected static ?string $model = Document::class;

    protected static ?string $navigationIcon = 'heroicon-o-document';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('title')
                    ->required()
                    ->label('Document Title'),

                Forms\Components\TextInput::make('document_number')
                    ->required()
                    ->label('Document Number'),

                Forms\Components\Select::make('type')
                    ->options([
                        'Technical Spec' => 'Technical Spec',
                        'RFQ' => 'RFQ',
                        'Contract' => 'Contract',
                    ])
                    ->label('Document Type'),

                Forms\Components\Select::make('status')
                    ->options([
                        'Draft' => 'Draft',
                        'Approved' => 'Approved',
                        'Rejected' => 'Rejected',
                    ])
                    ->label('Document Status'),

                Forms\Components\Select::make('priority')
                    ->options([
                        'High' => 'High',
                        'Medium' => 'Medium',
                        'Low' => 'Low',
                    ])
                    ->label('Priority')
                    ->required(),

                Forms\Components\Repeater::make('revisions')
                    ->relationship('revisions')
                    ->schema([
                        Forms\Components\TextInput::make('version')
                            ->required()
                            ->label('Version'),
                        Forms\Components\FileUpload::make('path')
                            ->directory('document-revisions')
                            ->label('Revision File'),
                        Forms\Components\Select::make('status')
                            ->options([
                                'Draft' => 'Draft',
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

                RecordFinder::make('assignedUsers')
                    ->relationship('assignedUsers')
                    ->label('Assigned Users')
                    ->multiple(),

                RecordFinder::make('linkedProjects')
                    ->relationship('linkedProjects')
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
        return $table
            ->columns([
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

                TextColumn::make('revisions.latest.path')
                    ->label('Latest Revision File'),

                TextColumn::make('created_at')
                    ->label('Created At')
                    ->dateTime(),
            ])
            ->filters([])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListDocuments::route('/'),
            'create' => Pages\CreateDocument::route('/create'),
            'edit' => Pages\EditDocument::route('/{record}/edit'),
        ];
    }
}
