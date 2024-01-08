// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:virtual_try_on/formPage.dart';

class ThankYouPage extends StatefulWidget {
  final bool survey;
  const ThankYouPage({Key? key, required this.survey}) : super(key: key);

  @override
  State<ThankYouPage> createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.survey) {
      return Scaffold(
        appBar: AppBar(title: const Text('Thank you')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Thank you for shopping with us.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FormPage()),
                    );
                  },
                  child: const Text('Take a survey'),
                ),
                const SizedBox(height: 8.0),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  },
                  child: const Text('Back to home page'),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Thank you')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Thank you for taking the survey.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/home', (Route<dynamic> route) => false);
                  },
                  child: const Text('Back to home page'),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
