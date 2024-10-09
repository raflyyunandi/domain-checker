<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <style>
        /* Sesuaikan gaya untuk PDF jika diperlukan */
        body { font-family: DejaVu Sans, sans-serif; }
        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            font-size: 16px;
            line-height: 24px;
            color: #555;
        }
        /* Tambahkan gaya lain sesuai kebutuhan */
    </style>
</head>
<body>
<div class="invoice-box">
    <h2>Invoice</h2>
    <p><strong>Invoice #:</strong> {{ $invoice->id }}</p>
    <p><strong>Created:</strong> {{ $invoice->created_at->format('d/m/Y') }}</p>
    <p><strong>Status:</strong> Paid</p>

    <hr>

    <p><strong>Name:</strong> {{ $invoice->user->name }}</p>
    <p><strong>Email:</strong> {{ $invoice->user->email }}</p>
    <p><strong>Domain:</strong> {{ $invoice->domain }}</p>
    <p><strong>Amount:</strong> Rp {{ number_format($invoice->amount, 2, ',', '.') }}</p>
</div>

<a href="{{ route('invoice.pdf', ['id' => $invoice->id]) }}" class="btn btn-secondary mt-3">Unduh PDF</a>

</body>
</html>
