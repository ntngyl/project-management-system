<x-filament::page>
    <div class="p-6">
        <h1 class="text-3xl font-bold mb-4">Project: {{ $record->name }}</h1>

        {{-- 📌 Project Details Section --}}
        <div class="bg-white shadow-md rounded-lg p-4 mb-6">
            <h2 class="text-lg font-semibold mb-2">Project Details</h2>
            <p><strong>Project Number:</strong> {{ $record->project_number }}</p>
            <p><strong>Status:</strong> {{ $record->status }}</p>
            <p><strong>Priority:</strong> {{ $record->priority }}</p>
            <p><strong>Start Date:</strong> {{ $record->start_date }}</p>
            <p><strong>End Date:</strong> {{ $record->end_date }}</p>
            <p><strong>Description:</strong> {{ $record->description }}</p>
        </div>

        {{-- 📌 Team Members Section --}}
        <div class="bg-white shadow-md rounded-lg p-4 mb-6">
            <h2 class="text-lg font-semibold mb-2">Team Members</h2>
            <ul>
                @foreach($record->userPositions as $user)
                    <li>{{ $user->name }} - <strong>Position:</strong> {{ $user->pivot->position_id }}</li>
                @endforeach
            </ul>
        </div>

        {{-- 📌 Tasks Section --}}
        <div class="bg-white shadow-md rounded-lg p-4 mb-6">
            <h2 class="text-lg font-semibold mb-2">Project Tasks</h2>
            @if($record->tasks->count() > 0)
                <ul>
                    @foreach($record->tasks as $task)
                        <li>{{ $task->name }} (Status: {{ $task->status }})</li>
                    @endforeach
                </ul>
            @else
                <p>No tasks assigned to this project.</p>
            @endif
        </div>

        {{-- 📌 Documents Section --}}
        {{-- <div class="bg-white shadow-md rounded-lg p-4">
            <h2 class="text-lg font-semibold mb-2">Project Documents</h2>
            @if($record->documents->count() > 0)
            <ul>
                @foreach($record->documents as $document)
                <li>
                    <a href="{{ asset('storage/documents/' . $document->file_name) }}" target="_blank" class="text-blue-600 underline">
                    {{ $document->file_name }}
                    </a>
                </li>
                @endforeach
            </ul>
            @else
            <p>No documents uploaded for this project.</p>
            @endif
        </div> --}}
    </div>
</x-filament::page>
