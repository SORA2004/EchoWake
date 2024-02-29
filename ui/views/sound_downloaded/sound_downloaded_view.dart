import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sound_downloaded_viewmodel.dart';

class SoundDownloadedView extends StackedView<SoundDownloadedViewModel> {
  const SoundDownloadedView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SoundDownloadedViewModel viewModel,
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
  SoundDownloadedViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SoundDownloadedViewModel();
}
