import 'dart:io';
import 'dart:typed_data';

import 'package:dpbh/pattern_detected.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pd;
// import 'package:url_launcher/url_launcher.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text(
            "Deceptive Patterns",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "1)",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 3)],
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://assets-global.website-files.com/641217de62a24ec31629c2c4/642af329f353a434d71e8590_7J4OJSw6gyYA6A4OeYZBDV5ooNg_PplteImVRLWlW34.png")),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            height: 250,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [const BoxShadow(blurRadius: 3)]),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Confirm Shaming",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Divider(
                                    color: Colors.grey.shade400,
                                    height: 15,
                                  ),
                                  const Text(
                                    "Confirmshaming works by triggering uncomfortable emotions, such as guilt or shame, to influence users' decision-making",
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "2)",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 3)],
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://assets-global.website-files.com/641217de62a24ec31629c2c4/642af3293e22860dd1211685_zr__JYN7c1IogtKvTaxSy9T0_ZyWLG5q1vax64rlQ-w.png")),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [const BoxShadow(blurRadius: 3)]),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Disguised Ads",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 15,
                                    ),
                                    const Text(
                                      "The disguised ads deceptive pattern works by deliberately blurring the line between actual content and advertising, creating confusion for users",
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "3)",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 250,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 3)],
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://assets-global.website-files.com/641217de62a24ec31629c2c4/642af31b6f5401da2d6440b1_xyl3sWnwybLOl9cWB-8Hek5c_YM89jLfeQwm3b29gEE.png")),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [const BoxShadow(blurRadius: 3)]),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "False Urgency",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                      height: 15,
                                    ),
                                    const Text(
                                      "The user is pressured into completing an action because they are presented with a fake time limitation.",
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final pdfDoc = await makePdf();
              // Save the PDF to a temporary file
              final tempDir = await getTemporaryDirectory();
              final tempPath = tempDir.path;
              print(tempPath);
              final pdfPath = '$tempPath/example.pdf';
              final file = File(pdfPath);
              await file.writeAsBytes(await pdfDoc.save());
              // This is an unverified package soon will loose its capability in that case use url_launcher or any relavant package to show output to user.

              // if (await canLaunchUrl(Uri.file(pdfPath))) {
              //   await launchUrl(Uri.file(pdfPath));
              // } else {
              //   throw 'Could not launch $pdfPath';
              // }

              // but it requires specific version of compilesdk and targetsdk

              OpenFile.open(pdfPath);
            },
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.download,
              color: Colors.white,
            )));
  }
}

// https://drive.google.com/drive/u/0/folders/1kKO61YY-kLMpGCq9pVwXGDHWzaiNVOSm

// https://drive.google.com/uc?export=view&id=19ZczMelBH6TsIbH1nz77DF6uK2AQs8_j

Future<pd.Document> makePdf() async {
  final pdf = pd.Document();

  final Uint8List imageBytes = await fetchImage(
      "https://drive.google.com/uc?export=view&id=19ZczMelBH6TsIbH1nz77DF6uK2AQs8_j");
  pdf.addPage(pd.Page(build: (pd.Context context) {
    return pd.Column(children: [pd.Image(pd.MemoryImage(imageBytes))]);
  }));
  return pdf;
}
