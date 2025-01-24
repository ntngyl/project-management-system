<?php

namespace App\Filament\Workspace\Pages;

use Filament\Pages\Page;

class UnifiedLogin extends Page
{
    protected static ?string $navigationIcon = null; // No navigation for login
    protected static bool $shouldRegisterNavigation = false; // Not in the nav
    protected static string $view = 'filament.pages.unified-login'; // Link to Blade file
}
