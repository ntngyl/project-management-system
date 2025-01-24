<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('configurations', function (Blueprint $table) {
            $table->id();
            $table->string('type');  // e.g., 'project_type', 'document_type'
            $table->string('key');   // actual value stored in database
            $table->string('label'); // display label
            $table->boolean('is_active')->default(true);
            $table->integer('sort_order')->default(0);
            $table->json('metadata')->nullable();
            $table->timestamps();

            $table->unique(['type', 'key']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('configurations');
    }
};
