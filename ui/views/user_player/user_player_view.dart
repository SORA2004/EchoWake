import 'package:cached_network_image/cached_network_image.dart';
import 'package:echowake/models/post.dart';
import 'package:echowake/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_player_viewmodel.dart';

class UserPlayerView extends StackedView<UserPlayerViewModel> {
  final Post post;

  const UserPlayerView({
    super.key,
    required this.post,
  });

  @override
  Widget builder(
    BuildContext context,
    UserPlayerViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오디오 재생'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 이미지
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: screenHeight(context) * 0.5,
                  child: CachedNetworkImage(
                    imageUrl: viewModel.post.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () => viewModel.navigateToUserView(post.userId),
                    child: CircleAvatar(
                      foregroundImage: CachedNetworkImageProvider(
                        viewModel.post.photoURL ?? viewModel.post.thumbnailUrl,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 타이틀
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(viewModel.post.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          )),
                      Text(
                        viewModel.post.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => viewModel.toggleLike(),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          viewModel.isMyLike
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border),
                          Text('${viewModel.likeCount} 명'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 재생 슬라이더
            Slider(
              onChanged: (value) => viewModel.onChanged(value),
              value: viewModel.sliderValue,
              activeColor: const Color.fromRGBO(108, 199, 245, 1),
              inactiveColor: Colors.grey,
            ),

            //재생시간 표시
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    viewModel.playingTime,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    viewModel.totlaTime,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            // const Spacer(),
            //버튼
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.reply,
                      size: 32,
                    ),
                  ),
                  IconButton(
                    onPressed: () => viewModel.playPrevious(),
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 32,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(108, 199, 245, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(
                          viewModel.isPlaying ? Icons.pause : Icons.play_arrow),
                      iconSize: 32.0,
                      color: Colors.white,
                      onPressed: () => viewModel.togglePlay(),
                    ),
                  ),
                  IconButton(
                    onPressed: () => viewModel.playNext(),
                    icon: const Icon(
                      Icons.skip_next,
                      size: 32,
                    ),
                  ),
                  IconButton(
                    onPressed: () => viewModel.toggleShuffle(),
                    icon: viewModel.isShuffle
                        ? const Icon(
                            Icons.shuffle,
                            size: 32,
                            color: Color.fromRGBO(108, 199, 245, 1),
                          )
                        : const Icon(
                            Icons.shuffle,
                            size: 32,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  UserPlayerViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserPlayerViewModel(
        postId: post.id!,
      );
}
