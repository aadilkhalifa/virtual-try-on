import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:virtual_try_on/submitPage.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'formPage.dart';

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
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Step 1:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('lorem ipsum dolor sit amet, consectetur adipiscing'),
                  SizedBox(height: 8.0),
                  Text('Step 2:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('lorem ipsum dolor sit amet, consectetur adipiscing'),
                  SizedBox(height: 8.0),
                  Text('Step 3:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('lorem ipsum dolor sit amet, consectetur adipiscing'),
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
        title: Text('Virtual try on'),
        actions: [
          Center(
            child: Row(
              children: [
                TextButton(
                  child: Text(
                    'Help',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _showMyDialog,
                ),
                TextButton(
                  child: Text(
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
          SizedBox(
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
                Image(
                    image: AssetImage(
                        'assets/shoe' + (selected).toString() + '.png')),
                SizedBox(height: 32.0),
                OutlinedButton(
                  child: Text('Try AR filter'),
                  onPressed: () {
                    _launchURL(snapchat_urls[selected - 1]);
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
                                image: AssetImage('assets/shoe' +
                                    (index + 1).toString() +
                                    '.png'))),
                      ),
                    ),
                  );
                  return Card(
                    // color: Colors.blue[index * 100],
                    child: Container(
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

class UnityDemoScreen extends StatefulWidget {
  UnityDemoScreen({Key? key}) : super(key: key);

  @override
  _UnityDemoScreenState createState() => _UnityDemoScreenState();
}

class _UnityDemoScreenState extends State<UnityDemoScreen> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  late UnityWidgetController _unityWidgetController;
  bool shouldPop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: () async {
            return shouldPop;
            // Pop the category page if Android back button is pressed.
          },
          child: Container(
            color: Colors.amber,
            child: UnityWidget(
              onUnityCreated: onUnityCreated,
            ),
          ),
        ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }
}

void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
