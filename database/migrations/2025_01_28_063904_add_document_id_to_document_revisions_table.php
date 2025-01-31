<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDocumentIdToDocumentRevisionsTable extends Migration
{
    public function up()
    {
        Schema::table('document_revisions', function (Blueprint $table) {
            $table->unsignedBigInteger('document_id')->nullable()->after('id');
            $table->string('version')->nullable()->after('document_id');
            $table->text('status')->nullable()->after('version');
            $table->string('path')->nullable()->after('status');
            $table->unsignedBigInteger('prepared_by')->nullable()->after('path');
            $table->unsignedBigInteger('reviewed_by')->nullable()->after('prepared_by');
            $table->unsignedBigInteger('approved_by')->nullable()->after('reviewed_by');
            $table->date('submission_date')->nullable()->after('approved_by');
            $table->date('approval_date')->nullable()->after('submission_date');
            $table->json('metadata')->nullable()->after('approval_date');

            // Add foreign key constraints
            $table->foreign('document_id')->references('id')->on('documents')->onDelete('cascade');
            $table->foreign('prepared_by')->references('id')->on('users')->onDelete('set null');
            $table->foreign('reviewed_by')->references('id')->on('users')->onDelete('set null');
            $table->foreign('approved_by')->references('id')->on('users')->onDelete('set null');
        });
    }

    public function down()
    {
        Schema::table('document_revisions', function (Blueprint $table) {
            $table->dropForeign(['document_id']);
            $table->dropForeign(['prepared_by']);
            $table->dropForeign(['reviewed_by']);
            $table->dropForeign(['approved_by']);

            $table->dropColumn([
                'document_id',
                'version',
                'status',
                'path',
                'prepared_by',
                'reviewed_by',
                'approved_by',
                'submission_date',
                'approval_date',
                'metadata',
            ]);
        });
    }
}
