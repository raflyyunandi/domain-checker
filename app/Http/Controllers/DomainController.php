<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GuzzleHttp\Client;
use App\Models\WhoisRecord;
use App\Models\Invoice;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use PDF;

class DomainController extends Controller
{
    public function index()
    {
        return view('domain.index');
    }

    public function checkDomain(Request $request)
    {
        $request->validate([
            'domain' => 'required|regex:/^(?!:\/\/)([a-zA-Z0-9-_]+\.)+[a-zA-Z]{2,11}?$/',
        ]);

        $domain = $request->input('domain');
        $apiUrl = 'https://portal.qwords.com/apitest/whois.php';
        $client = new \GuzzleHttp\Client();

        try {
            // Tambahkan 'verify' => false untuk menonaktifkan verifikasi SSL
            $response = $client->request('GET', $apiUrl, [
                'query' => ['domain' => $domain],
                'timeout' => 10, // Timeout dalam detik
                'verify' => false, // Menonaktifkan verifikasi SSL
            ]);

            if ($response->getStatusCode() == 200) {
                $body = $response->getBody();
                $data = json_decode($body, true);

                if ($data['result'] === 'success') {
                    // Cek apakah whois_data ada
                    $whoisData = isset($data['whois']) ? $data['whois'] : 'No whois data available';

                    // Simpan data WHOIS jika belum ada
                    WhoisRecord::updateOrCreate(
                        ['domain' => $domain],
                        ['whois_data' => $whoisData, 'status' => $data['status']]
                    );

                    return view('domain.result', [
                        'domain' => $domain,
                        'status' => $data['status'],
                        'whois' => $whoisData,
                    ]);
                } else {
                    return back()->withErrors(['domain' => 'Terjadi kesalahan saat memeriksa domain.']);
                }
            } else {
                return back()->withErrors(['domain' => 'API tidak merespons dengan benar.']);
            }
        } catch (\Exception $e) {
            return back()->withErrors(['domain' => 'Terjadi kesalahan: ' . $e->getMessage()]);
        }
    }


    public function configure(Request $request)
    {
        $domain = $request->query('domain');
        return view('domain.configure', ['domain' => $domain]);
    }

    public function checkout(Request $request)
    {
        // Jika pengguna belum login, lakukan pendaftaran otomatis
        if (!auth()->check()) {
            // Validasi data registrasi
            $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|string|min:6|confirmed',
            ]);

            // Register user otomatis
            $user = User::create([
                'name' => $request->input('name'),
                'email' => $request->input('email'),
                'password' => Hash::make($request->input('password')),
            ]);

            // Login user
            auth()->login($user);
        }

        // Validasi data checkout
        $request->validate([
            'domain' => 'required|regex:/^(?!:\/\/)([a-zA-Z0-9-_]+\.)+[a-zA-Z]{2,11}?$/',
        ]);

        // Generate invoice
        $invoice = Invoice::create([
            'user_id' => auth()->id(),
            'domain' => $request->input('domain'),
            'amount' => 100000, // Harga palsu, bisa diubah sesuai kebutuhan
        ]);

        // Kirim email ke pengguna
        // Mail::to(auth()->user()->email)->send(new InvoiceCreated($invoice));

        // Redirect ke halaman invoice
        return redirect()->route('invoice', ['id' => $invoice->id]);
    }

    public function invoice($id)
    {
        $invoice = Invoice::with('user')->findOrFail($id);
        return view('domain.invoice', ['invoice' => $invoice]);
    }
}
