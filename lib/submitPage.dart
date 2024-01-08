import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:virtual_try_on/checkSizePage.dart';
import 'package:virtual_try_on/thankYouPage.dart';

class SubmitPage extends StatelessWidget {
  CameraController? controller;
  Future<void> initializeControllerFuture;
  SubmitPage({
    Key? key,
    required this.controller,
    required this.initializeControllerFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit page'), actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CheckSizePage(
                      controller: controller,
                      initializeControllerFuture: initializeControllerFuture)),
            );
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: const Text('Check size'),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 8.0),
                    Text('Order details'),
                    SizedBox(height: 8.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the quantity',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the size',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text('User details'),
                    SizedBox(height: 8.0),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your address',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                child: const Text('Place order'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThankYouPage(survey: true)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
