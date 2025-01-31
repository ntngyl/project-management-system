<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToDocumentAssignmentsTable extends Migration
{
    public function up()
    {
        Schema::table('document_assignments', function (Blueprint $table) {
            $table->unsignedBigInteger('document_id')->nullable()->after('id');
            $table->unsignedBigInteger('user_id')->nullable()->after('document_id');

            // Add foreign key constraints
            $table->foreign('document_id')->references('id')->on('documents')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::table('document_assignments', function (Blueprint $table) {
            $table->dropForeign(['document_id']);
            $table->dropForeign(['user_id']);
            $table->dropColumn(['document_id', 'user_id']);
        });
    }
}
