import 'package:flutter/material.dart';
import 'package:himaskom_oprec/providers/para_mahasiswa.dart';
import 'package:provider/provider.dart';

class AddMahasiswaPage extends StatelessWidget {
  AddMahasiswaPage({Key? key}) : super(key: key);

  static const nameRoute = '/add-Mahasiswa';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController bidangController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final paraMahasiswa = Provider.of<ParaMahasiswa>(context, listen: false);

    final VoidCallback addMahasiswa = () {
      paraMahasiswa
          .addMahasiswa(
        nameController.text,
        nimController.text,
        bidangController.text,
        imageController.text,
      )
          .then(
        (response) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Data Berhasil ditambahkan'),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        },
      ).catchError(
        (err) => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Terjadi error $err'),
              content: Text('Terjadi Kesalahan Pada Server'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Okay'),
                )
              ],
            );
          },
        ),
      );
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Tambahkan Mahasiswa'),
        actions: [
          IconButton(
            onPressed: addMahasiswa,
            icon: Icon(Icons.add_circle_outline_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Nama'),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Nim'),
                textInputAction: TextInputAction.next,
                controller: nimController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Bidang'),
                textInputAction: TextInputAction.next,
                controller: bidangController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: 'Link QR Bidang'),
                controller: imageController,
                onEditingComplete: () {
                  paraMahasiswa.addMahasiswa(
                    nameController.text,
                    nimController.text,
                    bidangController.text,
                    imageController.text,
                  );
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: addMahasiswa,
                  child: Text('Save Data'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
