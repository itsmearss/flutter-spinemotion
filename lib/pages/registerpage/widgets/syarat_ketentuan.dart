import 'package:flutter/material.dart';


class SyaratKetentuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syarat dan Ketentuan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Mohon periksa & baca informasi syarat serta ketentuan yang berlaku.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ExpansionTile(
              title: Text(
                'Syarat & Ketentuan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Syarat dan Ketentuan Kartu Aplikasi SpineMotion ini berlaku dan mengikat Pemegang Kartu Kredit Jenius dan PT Bank BTPN Tbk. ('Bank') sehubungan dengan telah diterbitkannya Kartu Kredit Jenius atas nama Pemegang Kartu.\n\nSyarat dan Ketentuan ini telah disesuaikan dengan Ketentuan Peraturan Perundang-Undangan termasuk Ketentuan Peraturan Bank Indonesia dan Otoritas Jasa Keuangan. Syarat dan ketentuan, ilustrasi perhitungan bunga, besarnya biaya administrasi dan denda, serta informasi layanan Kartu Kredit Jenius secara terinci dan lengkap dapat di akses melalui...",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Informasi Biaya',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Informasi terkait biaya sebagai berikut.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (bool? value) {
                    // Handle checkbox state change
                  },
                ),
                Expanded(
                  child: Text(
                    'Saya telah membaca, mengerti, dan menyetujui pernyataan di atas.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
