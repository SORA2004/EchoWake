import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'image_viewmodel.dart';

class ImageView extends StackedView<ImageViewModel> {
  final String username;
  final String imageUrl;
  const ImageView({
    super.key,
    required this.username,
    required this.imageUrl,
  });

  @override
  Widget builder(
    BuildContext context,
    ImageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: CachedNetworkImage(imageUrl: imageUrl),
      ),
    );
  }

  @override
  ImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ImageViewModel();
}
