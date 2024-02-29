import 'package:echowake/ui/views/likes/likes_view.dart';
import 'package:echowake/ui/views/sound_downloaded/sound_downloaded_view.dart';
import 'package:echowake/ui/views/sound_recorded/sound_recorded_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/AppIcon-1024x+(7).png'),
        ),
        title: const Text('Blissom', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ],
      ),
      endDrawer: const Drawer(
          // Drawer 위젯 구현
          ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 120),
          Center(
            child: GestureDetector(
              onTap: () {
                if (viewModel.image != null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Image.file(viewModel.image!),
                      );
                    },
                  );
                }
              },
              child: Container(
                width: 130.0,
                height: 130.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25.0),
                  image: viewModel.image != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(viewModel.image!),
                        )
                      : const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/default_profile_image.png'),
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                viewModel.userName,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () => viewModel.navigateToEditProfile(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '편집',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '팔로우 ${viewModel.following}명',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
              ),
              const SizedBox(width: 10),
              Text(
                '팔로워 ${viewModel.followers}명',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 40),
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const TabBar(
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: '녹음한 소리'),
                    Tab(text: '다운로드한 소리'),
                    Tab(text: '좋아요'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const TabBarView(
                    children: [
                      SoundRecordedView(),
                      SoundDownloadedView(),
                      LikesView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
