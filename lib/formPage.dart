import 'package:flutter/material.dart';
import 'package:http/http.dart';
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
  TextEditingController feedback_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey'),
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
                    const SizedBox(height: 8.0),
                    const Text('How satisfied are you with the experience?'),
                    const SizedBox(height: 8.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
                        'How intutive was the experience for a first time user?'),
                    const SizedBox(height: 8.0),
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
                    const SizedBox(height: 8.0),
                    const Text('How likely are you to recommend this to someone?'),
                    const SizedBox(height: 8.0),
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
                    const SizedBox(height: 8.0),
                    const Text(
                      'How much do you prefer this over a traditional ecommerce experience?',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),
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
                        controller: feedback_controller,
                        maxLines: 5,
                        decoration: const InputDecoration(
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
                child: const Text('Submit response'),
                onPressed: () async {
                  // print('start');
                  // print(sliderValue1);
                  // print(sliderValue2);
                  // print(sliderValue3);
                  // print(sliderValue4);
                  // print(feedback_controller.text);
                  // print('end');

                  Map<String, String> body = {
                    'field1': sliderValue1.toString(),
                    'field2': sliderValue2.toString(),
                    'field3': sliderValue3.toString(),
                    'field4': sliderValue4.toString(),
                    'field5': feedback_controller.text,
                  };

                  Response r = await post(
                    Uri.parse('http://aadilkhalifa.pythonanywhere.com/form'),
                    body: body,
                  );
                  // return;
                  Route route = MaterialPageRoute(
                      builder: (context) => const ThankYouPage(survey: false));
                  Navigator.pushReplacement(context, route);
                }),
          ],
        ),
      ),
    );
  }
}
