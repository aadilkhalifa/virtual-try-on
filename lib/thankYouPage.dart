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
        appBar: AppBar(title: Text('Thank you')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Thank you for shopping with us.'),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormPage()),
                  );
                },
                child: Text('Take a survey'),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('Thank you')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Thank you for taking the survey.'),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home', (Route<dynamic> route) => false);
                },
                child: Text('Back to home page'),
              )
            ],
          ),
        ),
      );
    }
  }
}
