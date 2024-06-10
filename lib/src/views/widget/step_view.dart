import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_kit/src/controller/survey_controller.dart';
import 'package:survey_kit/src/result/question_result.dart';
import 'package:survey_kit/src/steps/step.dart' as surveystep;

class StepView extends StatelessWidget {
  final surveystep.Step step;
  final Widget title;
  final Widget child;
  final QuestionResult Function() resultFunction;
  final bool isValid;
  final SurveyController? controller;

  const StepView({
    required this.step,
    required this.child,
    required this.title,
    required this.resultFunction,
    this.controller,
    this.isValid = true,
  });

  @override
  Widget build(BuildContext context) {
    final _surveyController = controller ?? context.read<SurveyController>();

    return _content(_surveyController, context);
  }

  Widget _content(SurveyController surveyController, BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      constraints: BoxConstraints.expand(),
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title,
                  const SizedBox(height: 32.0),
                  child,
                ],
              ),
            ),
          ),
          const SizedBox(height: 32.0),
          OutlinedButton(
            onPressed: isValid || step.isOptional
                ? () => surveyController.nextStep(context, resultFunction)
                : null,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              alignment: Alignment.center,
              child: Text(
                step.buttonText?.toUpperCase() ??
                    context
                        .read<Map<String, String>?>()?['next']
                        ?.toUpperCase() ??
                    'Next',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFfafafa),
                    ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (Set<MaterialState> state) => Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(
                        state.contains(MaterialState.disabled) ? 0.5 : 1.0),
              ),
              side: MaterialStateProperty.all(BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
