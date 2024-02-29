import 'package:cached_network_image/cached_network_image.dart';
import 'package:echowake/ui/common/ui_helpers.dart';
import 'package:echowake/ui/widgets/common/user_posts/user_posts.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_viewmodel.dart';

class UserView extends StackedView<UserViewModel> {
  final String userId;

  const UserView({
    super.key,
    required this.userId,
  });

  @override
  Widget builder(
    BuildContext context,
    UserViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(viewModel.data?.name ?? ''),
      ),
      body: !viewModel.dataReady
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => viewModel.navigateToImageView(),
                          child: CircleAvatar(
                            radius: 36,
                            backgroundImage: CachedNetworkImageProvider(
                              viewModel.photoURL,
                            ),
                          ),
                        ),
                        horizontalSpaceMedium,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.username,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(viewModel.data?.bio ?? ''),
                          ],
                        ),
                      ],
                    ),
                    verticalSpaceSmall,
                    MaterialButton(
                      height: 44.0,
                      minWidth: double.infinity,
                      elevation: 0,
                      color: viewModel.isMyFollow
                          ? Colors.grey[200]
                          : const Color.fromRGBO(108, 199, 245, 1),
                      textColor:
                          viewModel.isMyFollow ? Colors.black : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),

                        //굵기 5로
                      ),
                      onPressed: () => viewModel.toggleFollow(),
                      child: viewModel.isMyFollow
                          ? const Text(
                              '팔로우 취소',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : const Text(
                              '팔로우',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                    verticalSpaceMedium,

                    // 게시물 정보
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '${viewModel.data?.postCount}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text(
                                '음악',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${viewModel.data?.followerCount}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text(
                                '팔로워',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '${viewModel.data?.followingCount}',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Text(
                                '팔로잉',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // 게시물
                    UserPosts(userId: userId),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  UserViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserViewModel(
        userId: userId,
      );
}
