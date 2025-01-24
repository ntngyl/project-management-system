<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\UnifiedLoginController;
//use App\Filament\Workspace\Pages\UnifiedLogin;


Route::get('/', [UnifiedLoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [UnifiedLoginController::class, 'login'])->name('login.submit');
Route::post('/logout', [UnifiedLoginController::class, 'logout'])->name('logout');

Route::get('/admin/login', function () {
    return redirect('/');
});
Route::get('/workspace/login', function () {
    return redirect('/');
});

Route::get('/test', function () {
    $document = \App\Models\Document\Document::find(2);
    $revisions = $document->revisions;
    $projects = $document->projects;
    $tasks = $document->tasks;

    return response()->json([
        'document' => $document,
        'revisions' => $revisions,
        'projects' => $projects,
        'tasks' => $tasks,
    ]);
});
