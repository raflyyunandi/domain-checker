<!DOCTYPE html>
<html>
<head>
    <title>Konfigurasi Domain</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Konfigurasi Domain: {{ $domain }}</h2>

    @if (!auth()->check())
        <p>Anda perlu mendaftar atau login untuk melanjutkan.</p>
        <form action="{{ route('checkout') }}" method="POST">
            @csrf
            <input type="hidden" name="domain" value="{{ $domain }}">

            <div class="mb-3">
                <label for="name" class="form-label">Nama</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Nama Anda" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email Anda" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Kata Sandi</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Kata Sandi" required>
            </div>

            <div class="mb-3">
                <label for="password_confirmation" class="form-label">Konfirmasi Kata Sandi</label>
                <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="Konfirmasi Kata Sandi" required>
            </div>

            <button type="submit" class="btn btn-primary">Checkout dan Registrasi</button>
        </form>

        <hr>

        <p>Atau <a href="{{ route('login') }}">Login</a> jika sudah memiliki akun.</p>
    @else
        <form action="{{ route('checkout') }}" method="POST">
            @csrf
            <input type="hidden" name="domain" value="{{ $domain }}">
            <button type="submit" class="btn btn-primary">Checkout</button>
        </form>
    @endif
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
