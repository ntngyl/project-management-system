<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UnifiedLoginController extends Controller
{
    public function showLoginForm()
    {
        return view('auth.login'); // Render the new custom login page
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            if ($user->hasRole('admin') || $user->hasRole('super_admin')) {
                return redirect('/admin'); // Redirect Admin users
            } elseif ($user->hasRole('Employee')) {
                return redirect('/workspace'); // Redirect Employee users
            }
        }

        return back()->withErrors(['email' => 'Invalid credentials.']);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        return redirect('/'); // Redirect to login page after logout
    }
}
