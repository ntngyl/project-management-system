<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('document_revisions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('document_id');
            $table->string('version');
            $table->text('status');
            $table->string('path');
            $table->unsignedBigInteger('prepared_by');
            $table->unsignedBigInteger('reviewed_by')->nullable();
            $table->unsignedBigInteger('approved_by')->nullable();
            $table->date('submission_date')->nullable();
            $table->date('approval_date')->nullable();
            $table->json('metadata')->nullable();
            $table->timestamps();

            $table->foreign('document_id')->references('id')->on('documents')->onDelete('cascade');
            $table->foreign('prepared_by')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('reviewed_by')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('approved_by')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('document_revisions');
    }
};
