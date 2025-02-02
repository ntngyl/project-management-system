<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\UnifiedLoginController;
//use App\Filament\Workspace\Pages\UnifiedLogin;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\StreamedResponse;
use App\Models\DocumentRevision;


Route::get('/', [UnifiedLoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [UnifiedLoginController::class, 'login'])->name('login.submit');
Route::post('/logout', [UnifiedLoginController::class, 'logout'])->name('logout');

Route::get('/admin/login', function () {
    return redirect('/');
});
Route::get('/workspace/login', function () {
    return redirect('/');
});


Route::get('/download-document/{revision}', function ($revisionId) {
    $revision = DocumentRevision::findOrFail($revisionId);
    $storedPath = $revision->stored_path;
    if (!$storedPath) {
        abort(404);
    }
    return Storage::download($storedPath, $revision->original_name ?? 'file');
})->name('document.download');
