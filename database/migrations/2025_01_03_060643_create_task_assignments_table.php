<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTaskAssignmentsTable extends Migration
{
    public function up()
    {
        Schema::create('task_assignments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('task_id')->constrained('tasks')->onDelete('cascade');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->json('metadata')->nullable();
            $table->timestamps();

            $table->unique(['task_id', 'user_id']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('task_assignments');
    }
}
