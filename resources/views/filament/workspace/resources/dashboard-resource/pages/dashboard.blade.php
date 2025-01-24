<x-filament::page>
    <div class="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3">
        <!-- Projects Section -->
        <div class="bg-white shadow rounded-lg p-4">
            <h2 class="text-lg font-bold">Assigned Projects</h2>
            <ul>
                @forelse ($projects as $project)
                    <li class="mt-2">
                        <strong>{{ $project->name }}</strong>
                        <span class="text-sm text-gray-500">({{ $project->status }})</span>
                        <a href="{{ route('filament.workspace.resources.projects.view', $project->id) }}" class="text-blue-500 underline">
                            View
                        </a>
                    </li>
                @empty
                    <p>No assigned projects.</p>
                @endforelse
            </ul>
        </div>

        <!-- Tasks Section -->
        <div class="bg-white shadow rounded-lg p-4">
            <h2 class="text-lg font-bold">Assigned Tasks</h2>
            <ul>
                @forelse ($tasks as $task)
                    <li class="mt-2">
                        <strong>{{ $task->name }}</strong>
                        <span class="text-sm text-gray-500">Due: {{ $task->end_date }}</span>
                        <span class="text-sm text-gray-500">Status: {{ $task->status }}</span>
                    </li>
                @empty
                    <p>No assigned tasks.</p>
                @endforelse
            </ul>
        </div>

        <!-- Notifications Placeholder -->
        <div class="bg-white shadow rounded-lg p-4">
            <h2 class="text-lg font-bold">Notifications</h2>
            <p>Notifications will be displayed here once implemented.</p>
        </div>
    </div>
</x-filament::page>
