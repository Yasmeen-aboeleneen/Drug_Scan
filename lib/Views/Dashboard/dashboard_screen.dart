import 'package:drug_scan_app/Core/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, String>> studentData = [
    {
      'name': 'أحمد علي',
      'nationalID': '12345678901234',
      'result': 'Negative',
    },
    {
      'name': 'سارة محمد',
      'nationalID': '98765432109876',
      'result': 'Positive',
    },
    {
      'name': 'محمد حسن',
      'nationalID': '56789012345678',
      'result': 'Negative',
    },
  ];

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'لوحة التحكم',
          style:
              GoogleFonts.aBeeZee(color: kBlack, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns:   [
              DataColumn(label: Text('اسم الطالب',style:
              GoogleFonts.aBeeZee(color: kBlack, fontWeight: FontWeight.bold))),
              DataColumn(label: Text('الرقم القومي',style:
              GoogleFonts.aBeeZee(color: kBlack, fontWeight: FontWeight.bold))),
              DataColumn(label: Text('نتيجة التحليل',style:
              GoogleFonts.aBeeZee(color: kBlack, fontWeight: FontWeight.bold))),
            ],
            rows: studentData.map((data) {
              return DataRow(cells: [
                DataCell(Text(data['name']!)),
                DataCell(Text(data['nationalID']!)),
                DataCell(Text(data['result']!)),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
