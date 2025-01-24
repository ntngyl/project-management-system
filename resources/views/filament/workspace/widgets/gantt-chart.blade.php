<div class="bg-white shadow rounded-lg p-6">
    <h2 class="text-xl font-bold">GANTT Chart</h2>
    <div id="gantt_here" style="width: 100%; height: 400px;"></div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            gantt.config.xml_date = "%Y-%m-%d %H:%i";
            gantt.init("gantt_here");

            // Mock data for GANTT chart
            const tasks = {
                data: [
                    { id: 1, text: "Task 1", start_date: "2025-01-01", duration: 5, progress: 0.6 },
                    { id: 2, text: "Task 2", start_date: "2025-01-03", duration: 4, progress: 0.8, parent: 1 },
                    { id: 3, text: "Task 3", start_date: "2025-01-07", duration: 3, progress: 0.2 },
                ],
                links: [
                    { id: 1, source: 1, target: 2, type: "0" },
                    { id: 2, source: 2, target: 3, type: "0" },
                ],
            };

            gantt.parse(tasks);

            // Add click event listener to tasks
            gantt.attachEvent("onTaskClick", function (id, e) {
                const task = gantt.getTask(id);
                alert(`Task clicked: ${task.text}`);
                return true;
            });
        });
    </script>
</div>
