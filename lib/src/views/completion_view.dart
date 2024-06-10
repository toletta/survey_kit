import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:survey_kit/src/result/step/completion_step_result.dart';
import 'package:survey_kit/src/steps/predefined_steps/completion_step.dart';
import 'package:survey_kit/src/views/widget/step_view.dart';

class CompletionView extends StatelessWidget {
  final CompletionStep completionStep;
  final DateTime _startDate = DateTime.now();
  final String assetPath;

  CompletionView({required this.completionStep, this.assetPath = ""});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final _circleSize = width * 0.25;
    final _iconSize = _circleSize - width * 0.07;
    return StepView(
      step: completionStep,
      resultFunction: () => CompletionStepResult(
        completionStep.stepIdentifier,
        _startDate,
        DateTime.now(),
      ),
      title: Column(
        children: [
          Container(
            width: _circleSize,
            height: _circleSize,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.check,
                size: _iconSize,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            completionStep.title,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Text(
              completionStep.text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.left,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 32.0),
            //   child: Container(
            //     width: 150.0,
            //     height: 150.0,
            //     child: assetPath.isNotEmpty
            //         ? Lottie.asset(
            //             assetPath,
            //             repeat: false,
            //           )
            //         : Lottie.asset(
            //             'assets/fancy_checkmark.json',
            //             package: 'survey_kit',
            //             repeat: false,
            //           ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
