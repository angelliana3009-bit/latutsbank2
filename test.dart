


import 'dart:io';

void main(){
    String correctpw = "112233";
    double saldo = 100000;
    bool jikabenar=false;

    print("selamat datang di bank");

    for (int attempt=3; attempt>0; attempt--){
        stdout.write("masukkan password anda : ");
        String? inputpassword = stdin.readLineSync();

        if (inputpassword==correctpw){
            jikabenar=true;
            print("login berhasil");
            break;}
            else{ print("password anda salah");
        }
    }
    bool isrunning=true;
    while (isrunning){
        print("MENU UTAMA");
        print("1. Cek saldo");
        print("2. Setor Tunai");
        print("3. Tarik Tunai");
        print("4. Keluar");
        stdout.write("Silakan Pilih menu (1-4) : ");
        String? pilihan = stdin.readLineSync();

        switch(pilihan){
            case '1':
            print("Saldo anda saat ini adalah : Rp ${(saldo)}");
            break;

            case '2':
            print("Setor Tunai sebesar :");
            String? inputsetor = stdin.readLineSync();

            double nominalsetor = double.tryParse(inputsetor ?? '')?? 0.0;
            saldo += nominalsetor;
            break;

            case '3':
            print("Tarik Tunai");
            stdout.write("Nominal uang yang ingin ditarik : ");
            String? inputtarik = stdin.readLineSync();

            double nominaltarik=double.tryParse(inputtarik ?? '')?? 0.0;
            if (nominaltarik>saldo) {
                print("maaf saldo anda tidak cukup");
                break;
            }

            if (nominaltarik % 50000 !=0) {
                    print("kelipatan wajib 50.000 atau 100.000");   
                    break;
                }

            print("Pilih pecahan uang: ");
            print("1. 50.000");
            print("2. 100.000");
            stdout.write("Pilih Pecahan (1/2): ");
            String? pilihanpecahan = stdin.readLineSync();

            int pecahan=0;
            if (pilihanpecahan=='1'){
                pecahan=50000;
                int jumlahlembar=(nominaltarik ~/ pecahan);
                saldo -= nominaltarik;
                print("anda menerima uang pecahan ${(pecahan.toDouble())} sebanyak $jumlahlembar lembar");
                print("sisa saldo anda ${(saldo)}");}

            else if (pilihanpecahan=='2'){
                    double sisatarik = nominaltarik.toDouble();
                    int lembar100 = (sisatarik ~/ 100000);
                    sisatarik %= 100000;
                    int lembar50 = (sisatarik ~/ 50000);
                    saldo -= nominaltarik;
                    if(lembar100>0){ 
                        print("uang pecahan 100.000 sebanyak $lembar100 lembar");
                        if (lembar50>0){
                        print("uang pecahan 50.000 sebanyak $lembar50 lembar");
                        }
                        print("sisa saldo anda $saldo");
                    }
            break;}

            
            if (nominaltarik % pecahan != 0){
                print("nominal tidak bisa menggunakan pecahan ${(pecahan.toDouble())}.");
                break;
            }

        
            

            
        }
    }
}



// if (antreanNasabah.isNotEmpty) {
//     String nasabahDilayani = antreanNasabah.removeFirst();
// } else {
//     print("Antrean kosong!");
// untuk cek klau antrean kosong dn mencegah crash
