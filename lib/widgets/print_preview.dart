import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../models/pdf_helper.dart';

class PrintPreview extends StatelessWidget {
  const PrintPreview({
    Key? key,
    required PDFHelper pdfHelper,
    required BuildContext ctx,
  })  : _pdfHelper = pdfHelper,
        _ctx = ctx,
        super(key: key);

  final PDFHelper _pdfHelper;
  final BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Theme.of(_ctx).primaryColor),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(_ctx).primaryColor,
          title: const Text(
            'Podgląd wydruku',
            textAlign: TextAlign.center,
          ),
          actions: [
            BackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: PdfPreview(
          canChangeOrientation: false,
          canChangePageFormat: false,
          previewPageMargin:
              const EdgeInsets.symmetric(horizontal: 250, vertical: 50),
          canDebug: false,
          build: (format) => _pdfHelper.generatePdf(_ctx),
        ),
      ),
    );
  }
}
