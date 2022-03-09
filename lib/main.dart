import 'package:flutter/material.dart';

import 'widgets/input_suhu.dart';
import 'widgets/konversi_suhu.dart';
import 'widgets/perhitungan_terkahir.dart';
import 'widgets/riwayat_perhitungan.dart';
import 'widgets/target_perhitungan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController inputCelcius = TextEditingController();

  List<String> listItem = [
    "Kelvin",
    "Reamur",
    "Fahrenheit",
  ];
  List<String> listHasil = [];
  String selectedDropdown = "Kelvin";
  double hasilKonversi = 0;

  void onDropdownChanged(String? value) {
    return setState(() {
      selectedDropdown = value.toString();
    });
  }

  void konversi() {
    return setState(() {
      if (inputCelcius.text.isEmpty) {
        hasilKonversi = 0;
      } else {
        hasilKonversi = double.parse(inputCelcius.text);
        if (selectedDropdown == "Kelvin") {
          hasilKonversi = hasilKonversi + 273.15;
        } else if (selectedDropdown == "Reamur") {
          hasilKonversi = hasilKonversi * 4 / 5;
        } else if (selectedDropdown == "Fahrenheit") {
          hasilKonversi = hasilKonversi * 9 / 5 + 32;
        }
      }
      listHasil.add("Konversi " +
          inputCelcius.text +
          " derajat Celcius ke $selectedDropdown adalah $hasilKonversi");
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              inputSuhu(inputCelcius: inputCelcius),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                child: TargetPerhitungan(
                  selectedDropdown: selectedDropdown,
                  listItem: listItem,
                  onDropdownChanged: onDropdownChanged,
                  konversi: konversi,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Hasil",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    PerhitunganTerakhir(hasilKonversi: hasilKonversi),
                  ],
                ),
              ),
              KonversiSuhu(konversi: konversi),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Riwayat Konversi',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              RiwayatPerhitungan(listHasil: listHasil),
            ],
          ),
        ),
      ),
    );
  }
}
