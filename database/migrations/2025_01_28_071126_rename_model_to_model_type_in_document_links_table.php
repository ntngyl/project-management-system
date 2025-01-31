<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenameModelToModelTypeInDocumentLinksTable extends Migration
{
    public function up()
    {
        Schema::table('document_links', function (Blueprint $table) {
            // Rename the `model` column to `model_type`
            $table->renameColumn('model', 'model_type');
        });
    }

    public function down()
    {
        Schema::table('document_links', function (Blueprint $table) {
            // Revert `model_type` back to `model`
            $table->renameColumn('model_type', 'model');
        });
    }
}
