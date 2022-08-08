import 'package:flutter/material.dart';
import 'package:himaskom_oprec/pages/add_mahasiswa_page.dart';
import 'package:himaskom_oprec/pages/hasil_page.dart';
import 'package:himaskom_oprec/pages/home_page.dart';
import 'package:himaskom_oprec/pages/list_mahasiswa_page.dart';
import 'package:himaskom_oprec/providers/para_mahasiswa.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ParaMahasiswa(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oprec Himaskom',
        home: const ListMahasiswaPage(),
        routes: {
          HomePage.nameRoute: (context) => const HomePage(),
          AddMahasiswaPage.nameRoute: (context) => AddMahasiswaPage(),
          ListMahasiswaPage.nameRoute: (context) => ListMahasiswaPage(),
          HasilPage.nameRoute: (context) => HasilPage(),
        },
      ),
    );
  }
}
