import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'likes_viewmodel.dart';

class LikesView extends StackedView<LikesViewModel> {
  const LikesView({super.key});

  @override
  Widget builder(
    BuildContext context,
    LikesViewModel viewModel,
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
  LikesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LikesViewModel();
}
