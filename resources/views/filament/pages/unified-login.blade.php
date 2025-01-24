<x-filament-panels::layout.base>
    <div class="min-h-screen flex items-center justify-center bg-gray-100">
        <div class="w-full max-w-md bg-white p-6 rounded-lg shadow-md">
            <h2 class="text-center text-2xl font-bold mb-6">Unified Login</h2>

            @if ($errors->any())
                <div class="p-3 mb-4 bg-red-100 border border-red-400 text-red-700 rounded">
                    {{ $errors->first('email') }}
                </div>
            @endif

            <form method="POST" action="{{ route('login.submit') }}" class="space-y-4">
                @csrf
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500"
                        required
                        autofocus
                    />
                </div>
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500"
                        required
                    />
                </div>
                <button
                    type="submit"
                    class="w-full py-2 px-4 bg-primary-600 text-white rounded-md shadow-md hover:bg-primary-700"
                >
                    Login
                </button>
            </form>
        </div>
    </div>
</x-filament-panels::layout.base>
