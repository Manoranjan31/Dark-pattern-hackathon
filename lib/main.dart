import 'dart:async';
import 'dart:io';

import 'package:dpbh/settings.dart';
import 'package:ed_screen_recorder/ed_screen_recorder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NotoSans'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EdScreenRecorder? screenRecorder;
  bool inProgress = false;

  var permissions = [
    Permission.storage,
    Permission.microphone,
  ];

  @override
  void initState() {
    super.initState();
    screenRecorder = EdScreenRecorder();
  }

  Future<void> startRecord(
      {required String fileName,
      required int width,
      required int height}) async {
    // Define the custom directory path
    Directory? tempDir = await getExternalStorageDirectory();
    String? tempPath = tempDir!.path; // Example custom directory path
    print(tempPath);
    print("hello");
    try {
      var startResponse = await screenRecorder?.startRecordScreen(
        fileName: fileName,
        audioEnable: true,
        width: width,
        height: height,
      );
    } on PlatformException {
      kDebugMode
          ? debugPrint("Error: An error occurred while starting the recording!")
          : null;
    }
  }

  Future<void> stopRecord() async {
    try {
      var stopResponse = await screenRecorder?.stopRecord();
    } on PlatformException {
      kDebugMode
          ? debugPrint("Error: An error occurred while stopping recording.")
          : null;
    }
  }

  Future<void> pauseRecord() async {
    try {
      await screenRecorder?.pauseRecord();
    } on PlatformException {
      kDebugMode
          ? debugPrint("Error: An error occurred while pause recording.")
          : null;
    }
  }

  Future<void> resumeRecord() async {
    try {
      await screenRecorder?.resumeRecord();
    } on PlatformException {
      kDebugMode
          ? debugPrint("Error: An error occurred while resume recording.")
          : null;
    }
  }

  bool changerec = true;
  bool changecapture = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Row(children: [
            SizedBox(
              width: 30,
            ),
            Text("Odin's Eye",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ]),
        ),
        body: Column(children: [
          const SizedBox(
            height: 100,
          ),
          const Row(
              key: Key("Top Text"),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Capture Image",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "Record Video",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ]),
          const SizedBox(
            height: 20,
          ),
          Row(
            key: const Key("Container - 2 features "),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                      boxShadow: [const BoxShadow(blurRadius: 3)]),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.camera_alt,
                          size: 150,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Center(
                        key: const Key("Within Container"),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                key: const Key("Capture Camera"),
                                padding: const EdgeInsets.all(8),
                                child: changecapture
                                    ? ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            foregroundColor: Colors.white),
                                        onPressed: () {
                                          setState(() async {
                                            var permissionStatuses =
                                                await permissions.request();

                                            if (permissionStatuses[
                                                        Permission.storage]!
                                                    .isGranted &&
                                                permissionStatuses[
                                                        Permission.microphone]!
                                                    .isGranted) {
                                              changecapture = !changecapture;
                                            }
                                          });
                                        },
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Flexible(
                                                child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'START SERVICE',
                                              ),
                                            )),
                                          ],
                                        ),
                                      )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            foregroundColor: Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            changecapture = !changecapture;
                                          });
                                        },
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.stop_circle_outlined,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Flexible(
                                                child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'STOP SERVICE',
                                              ),
                                            )),
                                          ],
                                        ),
                                      )),
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color(0xffF5F9F9),
                      boxShadow: [const BoxShadow(blurRadius: 3)]),
                  child: Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.videocam_rounded,
                          size: 190,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: changerec
                                  ? ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white),
                                      onPressed: () async {
                                        var permissionStatuses =
                                            await permissions.request();

                                        setState(() {
                                          startRecord(
                                            fileName: "dark-pattern",
                                            width:
                                                context.size?.width.toInt() ??
                                                    0,
                                            height:
                                                context.size?.height.toInt() ??
                                                    0,
                                          );
                                          changerec = !changerec;
                                        });
                                      },
                                      child: const IntrinsicWidth(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.circle,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Flexible(
                                                child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'START RECORD',
                                              ),
                                            )),
                                          ],
                                        ),
                                      ))
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white),
                                      onPressed: () {
                                        setState(() {
                                          changerec = !changerec;
                                        });
                                        stopRecord();
                                      },
                                      child: const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.stop_circle_outlined,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 6,
                                            ),
                                            Flexible(
                                                child: FittedBox(
                                              child: Text('STOP RECORD'),
                                              fit: BoxFit.scaleDown,
                                            ))
                                          ])),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    // Return a dialog with circular progress indicator and message
                    return AlertDialog(
                      content: Container(
                        height: 200,
                        width: 200,
                        child: const Column(
                          children: [
                            Text(
                              "Analyzing input data for comprehensive detection of potential dark patterns...",
                              textAlign: TextAlign.justify,
                              maxLines: 3,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 25),
                            CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
                Timer(const Duration(seconds: 4), () {
                  // Close the dialog
                  Navigator.pop(context);

                  // Navigate to the next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const settings()),
                  );
                });
              },
              child: const Text(
                "Analyse Dark Pattern",
                style: TextStyle(fontSize: 16, color: Colors.black),
              )),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    boxShadow: [BoxShadow(blurRadius: 3)]),
                child: Column(
                  children: [
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            children: [
                          TextSpan(
                            text: "About ",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                              text: "Odin's Eye:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)),
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: RichText(
                          textAlign: TextAlign.justify,
                          text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: "Odin's Eye ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                  text: "lets users shop confidently by ",
                                ),
                                TextSpan(
                                    text:
                                        "detecting and highlighting manipulative dark patterns ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                TextSpan(
                                    text: "in E-Commerce apps and sites in "),
                                TextSpan(
                                    text: "near real-time.",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        "It leverages a novel approach that prioritizes "),
                                TextSpan(
                                    text:
                                        "user privacy and continuous adaptation.",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ])),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: RichText(
                          textAlign: TextAlign.justify,
                          text: const TextSpan(
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                              children: [
                                TextSpan(text: "Effortlessly capture "),
                                TextSpan(
                                    text:
                                        "dynamic screenshots or record seamless screen videos ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                        "to detect dark patterns in E-commerce sites, "),
                                TextSpan(
                                    text: "all in the background",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ])),
                    ),
                  ],
                )),
          )
        ]));
    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height,
    //   decoration: BoxDecoration(
    //     color: Colors.white.withOpacity(0.3),
    //   ),
    //   child: Stack(
    //     children: [
    //       Align(
    //           alignment: Alignment.topCenter,
    //           child: Opacity(
    //             opacity: 0.3,
    //             child: Container(
    //                 width: double.infinity,
    //                 height: 300,
    //                 decoration: const BoxDecoration(
    //                   boxShadow: [
    //                     BoxShadow(blurRadius: 3, color: Colors.white)
    //                   ],
    //                   borderRadius: BorderRadius.only(
    //                       bottomLeft: Radius.elliptical(23, 45),
    //                       bottomRight: Radius.elliptical(45, 23)),
    //                   image: DecorationImage(
    //                       image: NetworkImage(
    //                           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKbqd7wOkiRR5CUz6kPjR26B-MnygBy344Sg&usqp=CAU"),
    //                       fit: BoxFit.cover),
    //                 )),
    //           )),

    //     ],
    //   ),
    // );
  }
}
