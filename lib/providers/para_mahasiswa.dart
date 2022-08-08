import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/mahasiswa.dart';

class ParaMahasiswa with ChangeNotifier {
  List<Mahasiswa> _semuaMahasiswa = [];

  List<Mahasiswa> get semuaMahasiswa => _semuaMahasiswa;

  int get jumlahMahasiswa => _semuaMahasiswa.length;

  Mahasiswa selectById(String id) =>
      _semuaMahasiswa.firstWhere((element) => element.id == id);

  Future<void> addMahasiswa(
      String name, String nim, String bidang, String image) async {
    Uri url = Uri.parse(
        'https://oprec-himaskom-default-rtdb.firebaseio.com/Mahasiswa.json');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'name': name,
            'nim': nim,
            'bidang': bidang,
            'image': image,
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        _semuaMahasiswa.add(
          Mahasiswa(
            id: json.decode(response.body)['name'].toString(),
            name: name,
            nim: nim,
            bidang: bidang,
            imageUrl: image,
          ),
        );
        notifyListeners();
      } else {
        throw ('${response.statusCode}');
      }
    } catch (err) {
      throw (err);
    }
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        'https://oprec-himaskom-default-rtdb.firebaseio.com/Mahasiswa.json');

    var hasilGetData = await http.get(url);

    var dataResponse = jsonDecode(hasilGetData.body) as Map<String, dynamic>;

    if (dataResponse != null) {
      dataResponse.forEach(
        (key, value) {
          _semuaMahasiswa.add(
            Mahasiswa(
              id: key,
              name: value['name'],
              nim: value['nim'],
              bidang: value['bidang'],
              imageUrl: value['image'],
            ),
          );
        },
      );
      notifyListeners();
    }
  }
}
