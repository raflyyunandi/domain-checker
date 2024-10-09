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
        Schema::table('whois_records', function (Blueprint $table) {
            $table->text('whois_data')->nullable()->change();
        });
    }

    public function down()
    {
        Schema::table('whois_records', function (Blueprint $table) {
            $table->text('whois_data')->nullable(false)->change();
        });
    }

};
