import 'dart:io';
import 'dart:typed_data';

import 'package:fence_drawing/providers/content_row_porviders.dart';
import 'package:flutter/material.dart' as material;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'element_model.dart';

class PDFHelper {
  Future<Uint8List> generatePdf(material.BuildContext context) async {
    final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    var dataproviders = Provider.of<DataProviders>(context, listen: false);
    var elementData = Provider.of<ElementModelProvider>(context, listen: false);

    final przesloImage =
        await imageFromAssetBundle('assets/images/przeslo.png');
    final bramaImage = await imageFromAssetBundle('assets/images/brama.png');
    final furtkasmietnikImage =
        await imageFromAssetBundle('assets/images/furtka_smietnik.png');
    final furtkaImage = await imageFromAssetBundle('assets/images/furtka.png');
    final klamkaImage = await imageFromAssetBundle('assets/images/klamka.png');
    final przerwaImage =
        await imageFromAssetBundle('assets/images/przerwa.png');

    final slupekImage = await imageFromAssetBundle('assets/images/slupek.png');
    final zawiasImage = await imageFromAssetBundle('assets/images/zawias.png');
    ImageProvider returnImage(String name) {
      //get images
      var image = przerwaImage;

      switch (name) {
        case 'Przerwa':
          image = przerwaImage;
          break;
        case 'Słupek':
          image = slupekImage;
          break;
        case 'Przęsło':
          image = przesloImage;
          break;
        case 'Brama':
          image = bramaImage;
          break;
        case 'Furtka':
          image = furtkaImage;
          break;
        case 'Furtka śmie.':
          image = furtkasmietnikImage;
          break;
        case 'Zawias':
          image = zawiasImage;
          break;
        case 'Klamka':
          image = klamkaImage;
          break;
        default:
          image = przerwaImage;
      }

      return image;
    }

    pdf.addPage(
      //Here you have to print raport
      Page(
        pageFormat: PdfPageFormat.a4.landscape,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        build: (context) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      dataproviders.getTitle,
                      style: TextStyle(
                        font: font,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    DateTime.now().toString().split(' ')[0],
                    style: TextStyle(
                      font: font,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // First 15 elements of list
              ListView.builder(
                direction: Axis.horizontal,
                itemCount: elementData.createdElementListget.length >= 15
                    ? 15
                    : elementData.createdElementListget.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: 3),
                      SizedBox(
                        width: elementData.createdElementListget[index].lenght *
                                1.0 /
                                (elementData.getDivider * 2) +
                            35,
                        child: Column(
                          children: [
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 12,
                                color: PdfColor.fromHex('f00'),
                              ),
                            ),
                            Text(
                              elementData.createdElementListget[index].lenght
                                  .toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 14,
                              ),
                            ),
                            Divider(
                              color: PdfColor.fromHex(elementData
                                  .createdElementListget[index].hexColor),
                              thickness: 5,
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image(returnImage(elementData
                                  .createdElementListget[index].name)),
                            ),
                            Text(
                              elementData
                                  .createdElementListget[index].totalLenght
                                  .toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: PdfColor.fromHex('#000'),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),

              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // 15 - 30 elements of list
              Padding(
                  padding: const EdgeInsets.all(4),
                  child: Divider(thickness: 1)),
              ListView.builder(
                direction: Axis.horizontal,
                itemCount: elementData.createdElementListget.length >= 30
                    ? 15
                    : elementData.createdElementListget.length - 15,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: 3),
                      SizedBox(
                        width: elementData
                                    .createdElementListget[index + 15].lenght *
                                1.0 /
                                (elementData.getDivider * 2) +
                            35,
                        child: Column(
                          children: [
                            Text(
                              (index + 15 + 1).toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 12,
                                color: PdfColor.fromHex('f00'),
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              elementData
                                  .createdElementListget[index + 15].lenght
                                  .toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 14,
                              ),
                            ),
                            Divider(
                              color: PdfColor.fromHex(elementData
                                  .createdElementListget[index + 15].hexColor),
                              thickness: 5,
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image(returnImage(elementData
                                  .createdElementListget[index + 15].name)),
                            ),
                            Text(
                              elementData
                                  .createdElementListget[index + 15].totalLenght
                                  .toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: PdfColor.fromHex('#000'),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // 30 - 45 elements of list
              Padding(
                  padding: const EdgeInsets.all(4),
                  child: Divider(thickness: 1)),
              ListView.builder(
                direction: Axis.horizontal,
                itemCount: elementData.createdElementListget.length >= 45
                    ? 15
                    : elementData.createdElementListget.length - 30,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: 3),
                      SizedBox(
                        width: elementData
                                    .createdElementListget[index + 30].lenght *
                                1.0 /
                                (elementData.getDivider * 2) +
                            35,
                        child: Column(
                          children: [
                            Text(
                              (index + 30 + 1).toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 12,
                                color: PdfColor.fromHex('f00'),
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              elementData
                                  .createdElementListget[index + 30].lenght
                                  .toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 14,
                              ),
                            ),
                            Divider(
                              color: PdfColor.fromHex(elementData
                                  .createdElementListget[index + 30].hexColor),
                              thickness: 5,
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              child: Image(returnImage(elementData
                                  .createdElementListget[index + 30].name)),
                            ),
                            Text(
                              elementData
                                  .createdElementListget[index + 30].totalLenght
                                  .toString(),
                              style: TextStyle(
                                font: font,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: PdfColor.fromHex('#000'),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(4),
                  child: Divider(thickness: 1)),
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // ////////////////////////////////////////////////
              // info about fence
              Text(
                'Łączna długość ogrodzenia: ${dataproviders.actualLenght.toString()} mm  -  ${dataproviders.actualLenght / 1000} m',
                style: TextStyle(
                  font: font,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(2),
                  child: Divider(thickness: 1)),
              ListView.builder(
                itemCount: elementData.elementModelList.length,
                direction: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          child: Column(
                            children: [
                              Text(
                                elementData.elementModelList[index].name,
                                style: TextStyle(
                                  font: font,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                child: Image(returnImage(
                                    elementData.elementModelList[index].name)),
                              ),
                              Text(
                                'szt. ${elementData.createdElementListget.where((element) => element.name == elementData.elementModelList[index].name).length.toString()}',
                                style: TextStyle(
                                  font: font,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
    // final output = Directory.current;
    final file = File(r'C:\Users\Michal\Desktop\example.pdf');
    // '${output.path}/example.pdf'); // nie jest doskonala, drukuje do folderu aplikacji
    await file.writeAsBytes(await pdf.save());
    return pdf.save();
  }
}
