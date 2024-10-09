<!DOCTYPE html>
<html>
<head>
    <title>Hasil Pencarian Domain</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Hasil Pencarian Domain</h2>
    <p><strong>Domain:</strong> {{ $domain }}</p>
    <p><strong>Status:</strong>
        @if ($status === 'available')
            <span class="text-success">Tersedia</span>
        @else
            <span class="text-danger">Tidak Tersedia</span>
        @endif
    </p>

    @if ($status === 'available')
        <a href="{{ route('configure', ['domain' => $domain]) }}" class="btn btn-primary">Pesan Sekarang</a>
    @else
        <button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#whoisInfo" aria-expanded="false" aria-controls="whoisInfo">
            Lihat Informasi WHOIS
        </button>
        <div class="collapse mt-3" id="whoisInfo">
            <div class="card card-body">
                {!! nl2br(e($whois)) !!}
            </div>
        </div>
    @endif

    <a href="{{ route('home') }}" class="btn btn-link mt-3">Kembali ke Pencarian</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
