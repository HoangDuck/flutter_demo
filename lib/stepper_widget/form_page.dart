import 'package:flutter/material.dart';
import 'package:flutter_demo/stepper_widget/custom_input.dart';

import '../custom_stepper.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Stepper Widget ",
          ),
          centerTitle: true,
        ),
        body: CustomStepper(
          type: StepperType.horizontal,
          currentStep: currentStep,
          onStepTapped: (step) => setState(() {
            currentStep = step;
          }),
          steps: getSteps(),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        state: currentStep > 0 ? StepState.indexed : StepState.indexed,
        isActive: currentStep >= 0,
        title: Container(),
        content: Column(
          children: const [
            CustomInput(
              hint: "First Name",
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: "Last Name",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.indexed : StepState.indexed,
        isActive: currentStep >= 1,
        title: Container(),
        content: Column(
          children: const [
            CustomInput(
              hint: "City and State",
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: "Postal Code",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.indexed : StepState.indexed,
        isActive: currentStep >= 1,
        title: Container(),
        content: Column(
          children: const [
            CustomInput(
              hint: "City and State",
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hint: "Postal Code",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.indexed : StepState.indexed,
        isActive: currentStep >= 2,
        title: Container(),
        content: Column(
          children: const [
            CustomInput(
              hint: "Bio",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
    ];
  }
}

