import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/print_preview.dart';
import '../models/pdf_helper.dart';
import '../providers/content_row_porviders.dart';

class MenuContainer extends StatelessWidget {
  MenuContainer({
    Key? key,
  }) : super(key: key);

  final PDFHelper _pdfHelper = PDFHelper();

  @override
  Widget build(BuildContext context) {
    var dataProviders = Provider.of<DataProviders>(context);
    return Positioned(
      right: 10,
      top: 20,
      child: dataProviders.menuOpacity
          ? MouseRegion(
              onExit: (event) {
                dataProviders.setManuOpacity(false);
              },
              child: Container(
                width: 250,
                height: 350,
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            Colors.black38,
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10),
                          ),
                          textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.headline2!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                        label: const Text('Drukuj do PDF'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return PrintPreview(
                                pdfHelper: _pdfHelper,
                                ctx: context,
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.picture_as_pdf,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            Colors.black38,
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10),
                          ),
                          textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.headline2!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                        label: const Text('Zapisz plik'),
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (ctx) {
                          //     return PrintPreview(
                          //       pdfHelper: _pdfHelper,
                          //       ctx: context,
                          //     );
                          //   },
                          // );
                        },
                        icon: Icon(
                          Icons.save,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(),
    );
  }
}
