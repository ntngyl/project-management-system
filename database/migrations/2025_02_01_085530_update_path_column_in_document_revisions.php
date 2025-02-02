<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('document_revisions', function (Blueprint $table) {
            // Change 'path' column to JSON type.
            // Note: If your database doesn't support JSON natively,
            // Laravel may convert this to a 'longtext' column.
            $table->json('path')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('document_revisions', function (Blueprint $table) {
            // Rollback to string type.
            $table->string('path')->change();
        });
    }
};
