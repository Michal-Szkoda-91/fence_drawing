import 'dart:io';
import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PDFHelper {
  Future<Uint8List> generatePdf(String title) async {
    final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      //Here you have to print raport
      Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: FittedBox(
                  child: Text(
                    title,
                    style: TextStyle(font: font),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Flexible(child: FlutterLogo())
            ],
          );
        },
      ),
    );
    final output = Directory.current;
    final file = File(
        '${output.path}/example.pdf'); // nie jest doskonala, drukuje do folderu aplikacji
    await file.writeAsBytes(await pdf.save());
    return pdf.save();
  }
}
