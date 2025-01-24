<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::table('items', function (Blueprint $table) {
            $table->enum('procurement_status', ['pending', 'ordered', 'received', 'fabricated'])
                ->default('pending')
                ->after('name');

            $table->dateTime('required_delivery_date')->nullable()->after('lead_time');

            $table->foreignId('vendor_id')
                ->nullable()
                ->constrained('vendors')
                ->nullOnDelete()
                ->after('required_delivery_date');
        });
    }

    public function down()
    {
        Schema::table('items', function (Blueprint $table) {
            $table->dropColumn(['procurement_status', 'required_delivery_date']);
            $table->dropForeign(['vendor_id']);
            $table->dropColumn('vendor_id');
        });
    }
};
