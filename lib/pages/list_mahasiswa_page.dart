import 'package:flutter/material.dart';
import 'package:himaskom_oprec/pages/add_mahasiswa_page.dart';
import 'package:himaskom_oprec/pages/hasil_page.dart';
import 'package:himaskom_oprec/providers/para_mahasiswa.dart';
import 'package:provider/provider.dart';

class ListMahasiswaPage extends StatefulWidget {
  const ListMahasiswaPage({Key? key}) : super(key: key);

  static const nameRoute = 'list';

  @override
  State<ListMahasiswaPage> createState() => _ListMahasiswaPageState();
}

class _ListMahasiswaPageState extends State<ListMahasiswaPage> {
  bool isInit = true;
  TextEditingController pass = TextEditingController();

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<ParaMahasiswa>(context).initialData();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    isInit = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allMahasiswaProvider = Provider.of<ParaMahasiswa>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Mahasiswa Yang Lulus'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Kamu siapa ?'),
                    content: Container(
                      width: 300,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                              'Masukin Passord nya dong kak, takutnya ada hekel kak'),
                          TextFormField(
                            controller: pass,
                            decoration: const InputDecoration(
                              label: Text('Password nya kak :'),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (pass.text == '911') {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(
                                      context, AddMahasiswaPage.nameRoute);
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('Masuk'))
                        ],
                      ),
                    ),
                  );
                },
              );
              //
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: (allMahasiswaProvider.jumlahMahasiswa == 0)
          ? const Center(
              child: Text(
                'No data',
                style: TextStyle(fontSize: 36),
              ),
            )
          : ListView.builder(
              itemCount: allMahasiswaProvider.jumlahMahasiswa,
              itemBuilder: (context, index) {
                var id = allMahasiswaProvider.semuaMahasiswa[index].id;
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HasilPage.nameRoute,
                      arguments: id,
                    );
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                        width: 30,
                        height: 30,
                        child: Image(
                          image: NetworkImage(
                              'https://picsum.photos/id/$index/200/300'),
                        )),
                  ),
                  title: Text(
                    allMahasiswaProvider.semuaMahasiswa[index].name,
                  ),
                );
              }),
    );
  }
}
