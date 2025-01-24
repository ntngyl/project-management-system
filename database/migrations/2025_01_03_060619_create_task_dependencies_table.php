<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTaskDependenciesTable extends Migration
{
    public function up()
    {
        Schema::create('task_dependencies', function (Blueprint $table) {
            $table->id();
            $table->foreignId('task_id')->constrained('tasks')->onDelete('cascade');
            $table->foreignId('dependency_id')->constrained('tasks')->onDelete('cascade');
            $table->timestamps();

            $table->unique(['task_id', 'dependency_id']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('task_dependencies');
    }
}
