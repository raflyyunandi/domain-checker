<!DOCTYPE html>
<html>
<head>
    <title>Invoice Pembelian Domain</title>
</head>
<body>
    <h2>Terima Kasih telah melakukan pembelian domain!</h2>
    <p>Berikut adalah detail invoice Anda:</p>
    <p><strong>Domain:</strong> {{ $invoice->domain }}</p>
    <p><strong>Jumlah:</strong> Rp {{ number_format($invoice->amount, 2, ',', '.') }}</p>
    <p>Silakan kunjungi <a href="{{ route('invoice', ['id' => $invoice->id]) }}">tautan ini</a> untuk melihat invoice Anda.</p>
    <p>Terima kasih!</p>
</body>
</html>
