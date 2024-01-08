// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:virtual_try_on/submitPage.dart';
import 'package:url_launcher/url_launcher.dart';

class VirtualTryOnPage extends StatefulWidget {
  CameraController? controller;
  Future<void> initializeControllerFuture;
  VirtualTryOnPage({
    Key? key,
    required this.controller,
    required this.initializeControllerFuture,
  }) : super(key: key);

  @override
  State<VirtualTryOnPage> createState() => _VirtualTryOnPageState();
}

class _VirtualTryOnPageState extends State<VirtualTryOnPage> {
  var selected = 1;

  final snapchat_urls = [
    'https://lens.snapchat.com/4394187f0b4c428c913656befdfcc633?share_id=BBCCa9fseJ4&locale=en-GB',
    'https://lens.snapchat.com/5f8ef5e0aae94cb08593385483380143?share_id=0A-hipzMDi0&locale=en-GB',
    'https://lens.snapchat.com/35bc001ea386442ea1b7954527950c8e?share_id=N7eWayFqB1c&locale=en-GB',
  ];

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Guide to using the module'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Step 1:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'Use the bottom list to navigate through the available shoe options.'),
                  SizedBox(height: 8.0),
                  Text('Step 2:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'You can make use of the AR virtual try on feature by clicking on the "Try AR filter" button'),
                  SizedBox(height: 8.0),
                  Text('Step 3:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                      'Once desired shoe is selected, you can proceed by clicking on the button on the app bar.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Back'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual try on'),
        actions: [
          Center(
            child: Row(
              children: [
                TextButton(
                  onPressed: _showMyDialog,
                  child: const Text(
                    'Help',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubmitPage(
                                controller: widget.controller,
                                initializeControllerFuture:
                                    widget.initializeControllerFuture,
                              )),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Stack(children: [
          // (!widget.controller!.value.isInitialized)
          //     ? Container()
          //     : MaterialApp(
          //         home: CameraPreview(widget.controller!),
          //       ),
          // UnityDemoScreen(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/shoe$selected.png')),
                const SizedBox(height: 32.0),
                OutlinedButton(
                  child: const Text('Try AR filter'),
                  onPressed: () {
                    _launchURL(snapchat_urls[selected - 1]);
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 120.0,
              // color: Colors.red,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(3, (int index) {
                  return GestureDetector(
                    onTap: () {
                      selected = index + 1;
                      setState(() {});
                    },
                    child: Card(
                      // color: Colors.blue[index * 100],
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20),
                            border: selected == index + 1
                                ? Border.all(
                                    width: 3.0,
                                    color:
                                        Theme.of(context).colorScheme.secondary)
                                : null),
                        // child: Center(child: Text("Shoe ${index + 1}")),
                        child: Center(
                            child: Image(
                                image:
                                    AssetImage('assets/shoe${index + 1}.png'))),
                      ),
                    ),
                  );
                  return Card(
                    // color: Colors.blue[index * 100],
                    child: SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Center(child: Text("Shoe ${index + 1}")),
                    ),
                  );
                }),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

void _launchURL(_url) async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
