<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::create('user_project_permissions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('project_id')->constrained()->onDelete('cascade');
            $table->unsignedBigInteger('resource_id'); // Task, Document, or Item ID
            $table->enum('resource_type', ['task', 'document', 'item']); // Type of resource
            $table->json('permissions')->nullable(); // Permissions stored in JSON format
            $table->timestamps();

            // ✅ Shortened index name to avoid MySQL's 64-character limit
            $table->unique(['user_id', 'project_id', 'resource_id', 'resource_type'], 'user_proj_res_type_unique');
        });
    }

    public function down()
    {
        Schema::dropIfExists('user_project_permissions');
    }
};
