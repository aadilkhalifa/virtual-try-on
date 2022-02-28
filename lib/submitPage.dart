import 'package:flutter/material.dart';
import 'package:virtual_try_on/formPage.dart';
import 'package:virtual_try_on/thankYouPage.dart';

class SubmitPage extends StatelessWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
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
                child: Text('Place order'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThankYouPage(survey: true)),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
