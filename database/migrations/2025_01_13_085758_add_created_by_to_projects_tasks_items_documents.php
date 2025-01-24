<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete()->after('priority');
        });

        Schema::table('tasks', function (Blueprint $table) {
            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete()->after('priority');
        });

        Schema::table('items', function (Blueprint $table) {
            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete()->after('priority');
        });
    }

    public function down(): void
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->dropForeign(['created_by']);
            $table->dropColumn('created_by');
        });

        Schema::table('tasks', function (Blueprint $table) {
            $table->dropForeign(['created_by']);
            $table->dropColumn('created_by');
        });

        Schema::table('items', function (Blueprint $table) {
            $table->dropForeign(['created_by']);
            $table->dropColumn('created_by');
        });
    }
};
