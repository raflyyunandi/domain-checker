<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            font-size: 16px;
            line-height: 24px;
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            color: #555;
        }
        .invoice-box table {
            width: 100%;
            line-height: inherit;
            text-align: left;
        }
        .invoice-box table td {
            padding: 5px;
            vertical-align: top;
        }
        .invoice-box table tr.top table td {
            padding-bottom: 20px;
        }
        .invoice-box table tr.information table td {
            padding-bottom: 40px;
        }
        .invoice-box table tr.heading td {
            background: #eee;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
        }
        .invoice-box table tr.details td {
            padding-bottom: 20px;
        }
        .invoice-box table tr.item td{
            border-bottom: 1px solid #eee;
        }
        .invoice-box table tr.item.last td {
            border-bottom: none;
        }
        .invoice-box table tr.total td:nth-child(2) {
            border-top: 2px solid #eee;
            font-weight: bold;
        }
    </style>
</head>
<body>

<!-- resources/views/invoice.blade.php -->
<div class="invoice-box mt-5">
    <table cellpadding="0" cellspacing="0">
        <tr class="top">
            <td colspan="2">
                <table>
                    <tr>
                        <td class="title">
                            <h2>Invoice</h2>
                        </td>
                        <td>
                            Invoice #: {{ $invoice->id }}<br>
                            Created: {{ $invoice->created_at->format('d/m/Y') }}<br>
                            Status: <span class="{{ $invoice->status === 'PAID' ? 'text-success' : 'text-danger' }}">{{ $invoice->status }}</span> PENDING
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr class="information">
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            Nama: {{ $invoice->user->name }}<br>
                            Email: {{ $invoice->user->email }}<br>
                            <!-- No rekening palsu -->
                            No Rekening: 1234567890
                        </td>
                        <td>
                            <strong>Domain:</strong> {{ $invoice->domain }}<br>
                            <strong>Jumlah:</strong> Rp {{ number_format($invoice->amount, 2, ',', '.') }}
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr class="heading">
            <td>Item</td>
            <td>Harga</td>
        </tr>

        <tr class="item">
            <td>Pembelian Domain</td>
            <td>Rp {{ number_format($invoice->amount, 2, ',', '.') }}</td>
        </tr>

        <tr class="total">
            <td></td>
            <td>Total: Rp {{ number_format($invoice->amount, 2, ',', '.') }}</td>
        </tr>
    </table>

    @if ($invoice->status === 'PENDING')
        <form action="{{ route('invoices.verify', $invoice->id) }}" method="POST" class="mt-4">
            @csrf
            <div class="mb-3">
                <label for="verification_code" class="form-label">Masukkan Kode Verifikasi</label>
                <input type="text" name="verification_code" id="verification_code" class="form-control" required maxlength="6">
            </div>
            <button type="submit" class="btn btn-primary">Verifikasi Kode</button>
        </form>
    @endif
</div>
</body>
</html>
