import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sound_recorded_viewmodel.dart';

class SoundRecordedView extends StackedView<SoundRecordedViewModel> {
  const SoundRecordedView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SoundRecordedViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  SoundRecordedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SoundRecordedViewModel();
}
