<?php

namespace App\Providers\Filament;

use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Filament\Workspace\Pages\UnifiedLogin;
use BezhanSalleh\FilamentShield\FilamentShieldPlugin;
use Relaticle\CustomFields\CustomFieldsPlugin;
use RalphJSmit\Filament\RecordFinder\FilamentRecordFinder;


class WorkspacePanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->id('workspace')
            ->path('workspace') // Generic path instead of 'employee'
            //>login() // Enables authentication
            ->authGuard('web') // Uses default 'web' guard (since employees are in 'users' table)
            ->brandName('Workspace Panel') // Custom branding
            ->colors([
                'primary' => Color::Amber,
            ])
            ->discoverResources(in: app_path('Filament/Workspace/Resources'), for: 'App\\Filament\\Workspace\\Resources')
            ->discoverPages(in: app_path('Filament/Workspace/Pages'), for: 'App\\Filament\\Workspace\\Pages')
            ->pages([
                \App\Filament\Workspace\Pages\Dashboard::class,
                UnifiedLogin::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Workspace/Widgets'), for: 'App\\Filament\\Workspace\\Widgets')
            ->widgets([
                Widgets\AccountWidget::class,
                Widgets\FilamentInfoWidget::class,
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
                \App\Http\Middleware\EnsureUserIsEmployee::class, // Custom Middleware
            ])
            ->plugins([
                FilamentShieldPlugin::make(),
                CustomFieldsPlugin::make(),
                FilamentRecordFinder::make(),
            ]);
    }
}
