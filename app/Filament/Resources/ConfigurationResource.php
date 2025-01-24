<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ConfigurationResource\Pages;
use App\Models\Configuration;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class ConfigurationResource extends Resource
{
    protected static ?string $model = Configuration::class;
    protected static ?string $navigationIcon = 'heroicon-o-cog';
    protected static ?string $navigationGroup = 'Settings';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('type')
                    ->required()
                    ->options([
                        'project_type' => 'Project Type',
                        'document_type' => 'Document Type',
                        'priority' => 'Priority Levels',
                        'status' => 'Status Options',
                    ])
                    ->native(false),

                Forms\Components\TextInput::make('key')
                    ->required()
                    ->maxLength(255)
                    ->helperText('System identifier (lowercase, no spaces)')
                    ->rules(['alpha_dash']),

                Forms\Components\TextInput::make('label')
                    ->required()
                    ->maxLength(255)
                    ->helperText('Display name shown to users'),

                Forms\Components\Toggle::make('is_active')
                    ->label('Active')
                    ->default(true),

                Forms\Components\TextInput::make('sort_order')
                    ->numeric()
                    ->default(0)
                    ->helperText('Lower numbers appear first'),

                Forms\Components\KeyValue::make('metadata')
                    ->helperText('Additional configuration options')
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('type')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('key')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('label')
                    ->searchable(),

                Tables\Columns\IconColumn::make('is_active')
                    ->boolean()
                    ->sortable(),

                Tables\Columns\TextColumn::make('sort_order')
                    ->numeric()
                    ->sortable(),

                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('type')
                    ->options([
                        'project_type' => 'Project Type',
                        'document_type' => 'Document Type',
                        'priority' => 'Priority Levels',
                        'status' => 'Status Options',
                    ]),
                Tables\Filters\TernaryFilter::make('is_active')
                    ->label('Active'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->defaultSort('type', 'sort_order');
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListConfigurations::route('/'),
            'create' => Pages\CreateConfiguration::route('/create'),
            'edit' => Pages\EditConfiguration::route('/{record}/edit'),
        ];
    }

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }
}
