<?php

use Illuminate\Support\Facades\Route;
// Route::get('/', function () {
//     return view('welcome');
// });

use App\Http\Controllers\Auth\LoginController;
// Route untuk halaman login
Route::get('login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('login', [LoginController::class, 'login']);

// Route untuk logout
Route::post('logout', [LoginController::class, 'logout'])->name('logout');

use App\Http\Controllers\Auth\RegisterController;

// Route untuk halaman pendaftaran
Route::get('register', [RegisterController::class, 'showRegistrationForm'])->name('register');
Route::post('register', [RegisterController::class, 'register']);

use App\Http\Controllers\DomainController;

Route::get('/', [DomainController::class, 'index'])->name('home');
Route::post('/check-domain', [DomainController::class, 'checkDomain'])->name('check-domain');
Route::get('/configure', [DomainController::class, 'configure'])->name('configure');
Route::post('/checkout', [DomainController::class, 'checkout'])->name('checkout');
Route::get('/invoice/{id}', [DomainController::class, 'invoice'])->name('invoice');
Route::get('/invoice/{id}/pdf', [DomainController::class, 'exportPdf'])->name('invoice.pdf');
