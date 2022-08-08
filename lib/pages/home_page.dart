import 'package:flutter/material.dart';
import 'package:himaskom_oprec/pages/add_mahasiswa_page.dart';
import 'package:himaskom_oprec/pages/hasil_page.dart';
import 'package:himaskom_oprec/pages/list_mahasiswa_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const nameRoute = '/homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Sementara'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, ListMahasiswaPage.nameRoute);
              },
              child: Text('List nama'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, HasilPage.nameRoute);
              },
              child: Text('Hasil Pengumuman'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddMahasiswaPage.nameRoute);
              },
              child: Text('Tambahakan Mahasiswa'),
            )
          ],
        ),
      ),
    );
  }
}
