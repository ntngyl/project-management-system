<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocumentRevisionsTable extends Migration
{
    public function up()
    {
        Schema::create('document_revisions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('document_id')->constrained('documents')->onDelete('cascade');
            $table->string('version')->default('1.0');
            $table->enum('status', ['draft', 'under_review', 'approved', 'rejected'])->default('draft');
            $table->string('path')->nullable();
            $table->foreignId('prepared_by')->nullable()->constrained('users')->onDelete('set null');
            $table->foreignId('reviewed_by')->nullable()->constrained('users')->onDelete('set null');
            $table->foreignId('approved_by')->nullable()->constrained('users')->onDelete('set null');
            $table->date('submission_date')->nullable();
            $table->date('approval_date')->nullable();
            $table->json('metadata')->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('document_revisions');
    }
}
