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
        Schema::table('invoices', function (Blueprint $table) {
            $table->enum('status', ['PENDING', 'PAID'])->default('PENDING')->after('amount'); // Menambahkan kolom status
            $table->string('verification_code', 6)->nullable()->after('status'); // Menambahkan kolom kode verifikasi
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('invoices', function (Blueprint $table) {
            $table->dropColumn(['status', 'verification_code']); // Menghapus kolom yang ditambahkan
        });
    }
};
