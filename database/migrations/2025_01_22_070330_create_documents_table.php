<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocumentsTable extends Migration
{
    public function up()
    {
        Schema::create('documents', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('document_number')->unique();
            $table->enum('type', ['rfq', 'technical_specification', 'scope_of_work', 'technical_queries', 'vendor_offers', 'drawings', 'engineering', 'quality', 'commercial', 'general']);
            $table->enum('status', ['draft', 'under_review', 'approved', 'rejected'])->default('draft');
            $table->enum('priority', ['high', 'medium', 'low'])->nullable();
            $table->boolean('is_initial_document')->default(false);
            $table->json('metadata')->nullable();
            $table->foreignId('created_by')->nullable()->constrained('users')->onDelete('set null');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('documents');
    }
}
