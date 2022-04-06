import 'package:flutter/material.dart';
import 'package:virtual_try_on/thankYouPage.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  double sliderValue1 = 0;
  double sliderValue2 = 0;
  double sliderValue3 = 0;
  double sliderValue4 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8.0),
                    Text('How satisfied are you with the experience?'),
                    SizedBox(height: 8.0),
                    Slider(
                      value: sliderValue1,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: sliderValue1.toString(),
                      onChanged: (n) {
                        sliderValue1 = n;
                        setState(() {});
                      },
                      activeColor: Theme.of(context).colorScheme.secondary,
                      inactiveColor:
                          Theme.of(context).colorScheme.secondary.withAlpha(50),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                        'How intutive was the experience for a first time user?'),
                    SizedBox(height: 8.0),
                    Slider(
                      value: sliderValue2,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: sliderValue2.toString(),
                      onChanged: (n) {
                        sliderValue2 = n;
                        setState(() {});
                      },
                      activeColor: Theme.of(context).colorScheme.secondary,
                      inactiveColor:
                          Theme.of(context).colorScheme.secondary.withAlpha(50),
                    ),
                    SizedBox(height: 8.0),
                    Text('How likely are you to recommend this to someone?'),
                    SizedBox(height: 8.0),
                    Slider(
                      value: sliderValue3,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: sliderValue3.toString(),
                      onChanged: (n) {
                        sliderValue3 = n;
                        setState(() {});
                      },
                      activeColor: Theme.of(context).colorScheme.secondary,
                      inactiveColor:
                          Theme.of(context).colorScheme.secondary.withAlpha(50),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'How much do you prefer this over a traditional ecommerce experience?',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                    Slider(
                      value: sliderValue4,
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: sliderValue4.toString(),
                      onChanged: (n) {
                        sliderValue4 = n;
                        setState(() {});
                      },
                      activeColor: Theme.of(context).colorScheme.secondary,
                      inactiveColor:
                          Theme.of(context).colorScheme.secondary.withAlpha(50),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:
                              'Do you have any other feedback? Feel free to add that here.',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                child: Text('Submit response'),
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => ThankYouPage(survey: false));
                  Navigator.pushReplacement(context, route);
                }),
          ],
        ),
      ),
    );
  }
}
