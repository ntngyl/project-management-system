<x-filament::page>
    <div class="bg-gray-100 min-h-screen py-8">
        <div class="max-w-6xl mx-auto bg-white shadow-lg rounded-lg">
            <!-- Header Section -->
            <div class="p-6 border-b border-gray-200">
                <h1 class="text-3xl font-bold text-gray-800">{{ $record->name }}</h1>
                <p class="text-gray-600">{{ $record->description }}</p>
                <div class="mt-4 grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <p class="text-sm text-gray-500"><strong>Start Date:</strong> {{ $record->start_date }}</p>
                    <p class="text-sm text-gray-500"><strong>End Date:</strong> {{ $record->end_date }}</p>
                    <p class="text-sm text-gray-500"><strong>Status:</strong> {{ ucfirst($record->status) }}</p>
                    <p class="text-sm text-gray-500"><strong>Priority:</strong> {{ ucfirst($record->priority) }}</p>
                </div>
            </div>

            <!-- Tabs Section -->
            <div x-data="{ activeTab: 'details' }">
                <!-- Tab Navigation -->
                <div class="border-b border-gray-200 bg-gray-50">
                    <nav class="flex space-x-6 p-4">
                        <button
                            @click="activeTab = 'details'"
                            :class="activeTab === 'details' ? 'text-indigo-600 border-b-2 border-indigo-600' : 'text-gray-500 hover:text-gray-700 hover:border-gray-300'"
                            class="py-2 px-4 font-medium text-sm"
                        >
                            Project Details
                        </button>
                        <button
                            @click="activeTab = 'tasks'"
                            :class="activeTab === 'tasks' ? 'text-indigo-600 border-b-2 border-indigo-600' : 'text-gray-500 hover:text-gray-700 hover:border-gray-300'"
                            class="py-2 px-4 font-medium text-sm"
                        >
                            Tasks
                        </button>
                        <button
                            @click="activeTab = 'gantt'"
                            :class="activeTab === 'gantt' ? 'text-indigo-600 border-b-2 border-indigo-600' : 'text-gray-500 hover:text-gray-700 hover:border-gray-300'"
                            class="py-2 px-4 font-medium text-sm"
                        >
                            GANTT Chart
                        </button>
                        <button
                            @click="activeTab = 'documents'"
                            :class="activeTab === 'documents' ? 'text-indigo-600 border-b-2 border-indigo-600' : 'text-gray-500 hover:text-gray-700 hover:border-gray-300'"
                            class="py-2 px-4 font-medium text-sm"
                        >
                            Documents
                        </button>
                        <button
                            @click="activeTab = 'items'"
                            :class="activeTab === 'items' ? 'text-indigo-600 border-b-2 border-indigo-600' : 'text-gray-500 hover:text-gray-700 hover:border-gray-300'"
                            class="py-2 px-4 font-medium text-sm"
                        >
                            Items
                        </button>
                    </nav>
                </div>

                <!-- Tab Content -->
                <div class="p-6">
                    <!-- Project Details Tab -->
                    <div x-show="activeTab === 'details'" class="space-y-4">
                        <h2 class="text-xl font-semibold text-gray-800">Project Details</h2>
                        <ul class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <li><strong>Project Name:</strong> {{ $record->name }}</li>
                            <li><strong>Description:</strong> {{ $record->description }}</li>
                            <li><strong>Project Number:</strong> {{ $record->project_number }}</li>
                            <li><strong>Project Type:</strong> {{ $record->project_type }}</li>
                            <li><strong>Start Date:</strong> {{ $record->start_date }}</li>
                            <li><strong>End Date:</strong> {{ $record->end_date }}</li>
                            <li><strong>Status:</strong> {{ ucfirst($record->status) }}</li>
                            <li><strong>Priority:</strong> {{ ucfirst($record->priority) }}</li>
                            <li><strong>Client ID:</strong> {{ $record->client_id }}</li>
                            <li><strong>EPC ID:</strong> {{ $record->epc_id }}</li>
                            <li><strong>Project Manager ID:</strong> {{ $record->project_manager_id }}</li>
                            <li><strong>Metadata:</strong> {{ json_encode($record->metadata, JSON_PRETTY_PRINT) }}</li>
                            <li><strong>Created By:</strong> {{ $record->created_by }}</li>
                        </ul>
                    </div>

                    <!-- Tasks Tab -->
                    <div x-data="{ showModal: false, task: {} }" class="p-6">
                        <h2 class="text-xl font-semibold text-gray-800">Tasks</h2>

                        @if ($record->tasks->isEmpty())
                            <p>No tasks available for this project.</p>
                        @else
                            <ul class="list-disc ml-6 space-y-2">
                                @foreach ($record->tasks as $task)
                                    <li>
                                        <a
                                            href="#"
                                            @click.prevent="task = {{ $task->toJson() }}; showModal = true;"
                                            class="text-blue-500 underline"
                                        >
                                            {{ $task->name }}
                                        </a>
                                    </li>
                                @endforeach
                            </ul>
                        @endif

                        <!-- Modal -->
                        <div
                            x-show="showModal"
                            class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50"
                            style="display: none;"
                        >
                            <div class="bg-white rounded-lg shadow-lg w-full max-w-lg p-6">
                                <h3 class="text-xl font-bold text-gray-800 mb-4" x-text="task.name"></h3>

                                <ul class="space-y-2">
                                    <li><strong>Description:</strong> <span x-text="task.description || 'N/A'"></span></li>
                                    <li><strong>Start Date:</strong> <span x-text="task.start_date"></span></li>
                                    <li><strong>End Date:</strong> <span x-text="task.end_date"></span></li>
                                    <li><strong>Status:</strong> <span x-text="task.status"></span></li>
                                    <li><strong>Priority:</strong> <span x-text="task.priority"></span></li>
                                </ul>

                                <div class="mt-6 flex justify-end">
                                    <button
                                        @click="showModal = false"
                                        class="bg-gray-300 hover:bg-gray-400 text-gray-800 font-semibold py-2 px-4 rounded"
                                    >
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- GANTT Chart Tab -->
                    <div x-show="activeTab === 'gantt'" class="space-y-4">
                        <h2 class="text-xl font-semibold text-gray-800">GANTT Chart</h2>
                        <div id="gantt_here" style="width: 100%; height: 400px;"></div>
                        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                gantt.config.xml_date = "%Y-%m-%d %H:%i";
                                gantt.init("gantt_here");
                                gantt.parse({
                                    data: [
                                        { id: 1, text: "Task 1", start_date: "2025-01-01", duration: 5, progress: 0.6 },
                                        { id: 2, text: "Task 2", start_date: "2025-01-03", duration: 4, progress: 0.8, parent: 1 },
                                        { id: 3, text: "Task 3", start_date: "2025-01-07", duration: 3, progress: 0.2 },
                                    ],
                                    links: [
                                        { id: 1, source: 1, target: 2, type: "0" },
                                        { id: 2, source: 2, target: 3, type: "0" },
                                    ],
                                });
                            });
                        </script>
                    </div>

                    <!-- Documents Tab -->
                    <div x-show="activeTab === 'documents'" class="space-y-4">
                        <h2 class="text-xl font-semibold text-gray-800">Project Documents (DCI Tracked)</h2>

                        @if ($documents->isEmpty())
                            <p>No documents available for this project.</p>
                        @else
                            <table class="w-full border-collapse border border-gray-200">
                                <thead>
                                    <tr class="bg-gray-100">
                                        <th class="border border-gray-300 px-4 py-2">Title</th>
                                        <th class="border border-gray-300 px-4 py-2">Version</th>
                                        <th class="border border-gray-300 px-4 py-2">Status</th>
                                        <th class="border border-gray-300 px-4 py-2">Approval</th>
                                        <th class="border border-gray-300 px-4 py-2">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($documents as $document)
                                        <tr>
                                            <td class="border border-gray-300 px-4 py-2">{{ $document->title }}</td>
                                            <td class="border border-gray-300 px-4 py-2">
                                                {{ $document->revisions->last()?->version ?? 'N/A' }}
                                            </td>
                                            <td class="border border-gray-300 px-4 py-2">{{ ucfirst($document->status) }}</td>
                                            <td class="border border-gray-300 px-4 py-2">
                                                @if ($document->approval_date)
                                                    Approved on {{ $document->approval_date->format('d M Y') }}
                                                @else
                                                    <span class="text-red-500">Pending</span>
                                                @endif
                                            </td>
                                            <td class="border border-gray-300 px-4 py-2">
                                                <a href="{{ url('/workspace/documents/' . $document->id) }}"
                                                    class="text-blue-500 underline">
                                                    View
                                                 </a>

                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        @endif
                    </div>


                    <!-- Items Tab -->
                    <div x-show="activeTab === 'items'" class="space-y-4">
                        <h2 class="text-xl font-semibold text-gray-800">Items</h2>
                        <ul class="list-disc ml-6 space-y-2">
                            <li>Item 1</li>
                            <li>Item 2</li>
                            <li>Item 3</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-filament::page>
