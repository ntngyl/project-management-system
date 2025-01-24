<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Login')</title>
    <!-- TailwindCSS (CDN for simplicity) -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.0.0/dist/tailwind.min.css" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="w-full max-w-md p-6 bg-white rounded shadow">
        @yield('content')
    </div>
</body>
</html>
