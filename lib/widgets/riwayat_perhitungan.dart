import 'package:flutter/material.dart';

class RiwayatPerhitungan extends StatelessWidget {
  const RiwayatPerhitungan({
    Key? key,
    required this.listHasil,
  }) : super(key: key);

  final List<String> listHasil;

  @override
  Widget build(BuildContext context) {
    var list = listHasil.map((String value) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          style: TextStyle(fontSize: 15),
        ),
      );
    }).toList();
    return Expanded(
      child: list.toString() == '[]'
          ? Center(
              child: Text('Tidak ada riwayat perhitungan'),
            )
          : ListView(
              children: list,
            ),
    );
  }
}
