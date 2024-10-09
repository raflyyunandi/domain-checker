<!DOCTYPE html>
<html>
<head>
    <title>Cek Ketersediaan Domain</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
<form action="{{ route('logout') }}" method="POST" style="display: inline;">
    @csrf
    <button type="submit" class="btn btn-danger">Logout</button>
</form>

    <h2>Cek Ketersediaan Domain</h2>

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('check-domain') }}" method="POST">
        @csrf
        <div class="mb-3">
            <label for="domain" class="form-label">Nama Domain</label>
            <input type="text" class="form-control" id="domain" name="domain" placeholder="contoh: testing123.com" required>
        </div>
        <button type="submit" class="btn btn-primary">Cek Domain</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
