import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:virtual_try_on/submitPage.dart';

import 'formPage.dart';

class VirtualTryOnPage extends StatelessWidget {
  CameraController? controller;
  VirtualTryOnPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual try on'),
        actions: [
          Center(
            child: TextButton(
              child: Text(
                'Proceed',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubmitPage()),
                );
              },
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Center(
        child: Stack(children: [
          (!controller!.value.isInitialized)
              ? Container()
              : MaterialApp(
                  home: CameraPreview(controller!),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120.0,
              // color: Colors.red,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (int index) {
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
