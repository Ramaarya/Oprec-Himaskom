import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:himaskom_oprec/providers/para_mahasiswa.dart';
import 'package:provider/provider.dart';

class HasilPage extends StatelessWidget {
  HasilPage({Key? key}) : super(key: key);

  static const nameRoute = '/Hasil';

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    final mahasiswa = Provider.of<ParaMahasiswa>(context, listen: false);
    final mahasiswaId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMahasiswa = mahasiswa.selectById(mahasiswaId);
    String name = selectMahasiswa.name;
    String nim = selectMahasiswa.nim;
    String bidang = selectMahasiswa.bidang;
    String imageQr = selectMahasiswa.imageUrl;

    return Scaffold(
      body: (screen.width > 1100 && screen.height > 650)
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        Image.network(
                          'https://pbs.twimg.com/profile_images/3347917835/3427ed69afb85c35b417f67b0a08d812_400x400.png',
                          scale: 4,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HIMASKOM',
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'ini HIMASKOM bukan LTMPT',
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/Ekobis.jpg',
                                height: 40,
                              ),
                              Image.asset(
                                'assets/Sosial.png',
                                height: 40,
                              ),
                              Image.asset(
                                'assets/PSDM.png',
                                height: 40,
                              ),
                              Image.asset(
                                'assets/Kesma.png',
                                height: 40,
                              ),
                              Image.asset(
                                'assets/Mikat.jpg',
                                height: 40,
                              ),
                              Image.asset(
                                'assets/Infokom.jpg',
                                height: 40,
                              ),
                              Image.asset(
                                'assets/Ristek.png',
                                height: 40,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        'PENGUMUMAN HASIL SELEKSI HIMASKOM (BUKAN LTMPT) 2022',
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Card(
                      child: Container(
                        height: screen.height * 2 / 3,
                        width: screen.width * 4 / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white70,
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: imageQr,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                // Image.network('https://iili.io/8hX1Bp.png'),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 50),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              // color: Colors.red,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Nomor Induk Mahasiswa',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Nama',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              // color: Colors.green,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      ': $nim',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    Text(
                                                      ': $name',
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 10),
                                            // color: Colors.blue,
                                            child: Text(
                                              'Selamat! Anda dinyatakan lulus seleksi HIMASKOM 2022 pada :',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                // color: Colors.red,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Nama Himpunannya gan',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Bidang',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                // color: Colors.green,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        ': HIMASKOM - Universitas Diponegoro',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                      Text(
                                                        ': $bidang',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: Text(
                                          'Scan Barcode disamping adick-adick sebelum 9 jam 11 menit setelah pengumuman',
                                          style:
                                              GoogleFonts.poppins(fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    'Ga berkas lagi deck',
                                                    style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  content: const Text(
                                                    'Langsung Adu mekanik abis ScanBarcode ya deck',
                                                  ),
                                                  actions: [
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                          'Shap Senpai !!!'),
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Ga gitu konsepnya kawand'),
                                                              );
                                                            });
                                                      },
                                                      child: const Text(
                                                          'Aku ngundurin diri aja'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: const Text(
                                              'Berkas yang dibutuhin gan'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                              'Kembali ke halaman utama'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          : const Center(
              child: Text(
                '''
                  Web ini tidak dibuat dengan sepenuh hati
              Ui nya ga responsive, jadi dikasih tulisan ini aja
                    karena ga digaji dan kepepet waktu
                  harap pindah ke layar yang lebih lebar''',
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
