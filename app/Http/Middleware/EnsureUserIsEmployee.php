<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Symfony\Component\HttpFoundation\Response;

class EnsureUserIsEmployee
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();

        if (!$user) {
            Log::warning('Access Denied: No authenticated user.', [
                'url' => $request->url(),
                'ip' => $request->ip(),
            ]);
            abort(403, 'Unauthorized access.');
        }

        if (!$user->hasRole('Employee')) {
            Log::warning('Access Denied: User does not have Employee role.', [
                'user_id' => $user->id,
                'roles' => $user->roles->pluck('name')->toArray(),
                'url' => $request->url(),
                'ip' => $request->ip(),
            ]);
            abort(403, 'Unauthorized access.');
        }

        Log::info('Access Granted: User is an Employee.', [
            'user_id' => $user->id,
            'url' => $request->url(),
        ]);

        return $next($request);
    }
}
