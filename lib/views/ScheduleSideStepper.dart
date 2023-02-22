import 'package:flutter/material.dart';

class SideStepper extends StatefulWidget {
  const SideStepper({super.key});


  @override
  State<SideStepper> createState() => _SideStepperState();
}

class _SideStepperState extends State<SideStepper> {
  int _currentStep = 0;
  StepState comp = StepState.complete;
  StepState edit = StepState.editing;
  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(primary: Colors.teal
          ),
        ),
        child: Center(
          child: Stepper(
            currentStep: _currentStep,
            physics: const ClampingScrollPhysics(),

            onStepTapped: (int newIndex){
              setState(() {
                _currentStep = newIndex;
              });
            },

            controlsBuilder: (context, _) {
              return const SizedBox();
            },
            steps:  [
              Step(
                isActive: _currentStep == 0,
                state: _currentStep == 0 ? comp : edit,
                title: const Text(''),
                content: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              Step(
                isActive: _currentStep == 1,
                state: _currentStep == 1 ? comp : edit,
                title: const Text(''),
                content: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              Step(
                isActive: _currentStep == 2,
                state: _currentStep == 2 ? comp : edit,
                title: const Text(''),
                content: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              Step(
                isActive: _currentStep == 3,
                state: _currentStep == 3 ? comp : edit,
                title: const Text(''),
                content: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
