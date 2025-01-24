@extends('layouts.auth')

@section('title', 'Login')

@section('content')
    <div class="text-center">
        <h1 class="text-3xl font-extrabold text-gray-900">Welcome Back</h1>
        <p class="mt-2 text-sm text-gray-600">Login to access your account</p>
    </div>

    @if ($errors->any())
        <div class="mt-4 bg-red-100 border-l-4 border-red-500 text-red-700 p-4 rounded">
            <p class="font-medium">Error:</p>
            <p>{{ $errors->first('email') }}</p>
        </div>
    @endif

    <form method="POST" action="{{ route('login.submit') }}" class="mt-6 space-y-6">
        @csrf
        <!-- Email Field -->
        <div>
            <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
            <input
                type="email"
                id="email"
                name="email"
                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                placeholder="Enter your email"
                required
                autofocus
            />
        </div>
        <!-- Password Field -->
        <div>
            <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
            <input
                type="password"
                id="password"
                name="password"
                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                placeholder="Enter your password"
                required
            />
        </div>
        <!-- Submit Button -->
        <div>
            <button
                type="submit"
                class="w-full flex justify-center py-2 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
            >
                Login
            </button>
        </div>
    </form>
@endsection
