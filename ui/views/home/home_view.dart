import 'package:echowake/ui/views/audio_player/audio_player_viewmodel.dart';
import 'package:echowake/ui/widgets/common/post_card/post_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
      BuildContext context,
      HomeViewModel viewModel,
      Widget? child,
      ) {
    return ViewModelBuilder<AudioPlayerViewModel>.reactive( // AudioPlayerViewModel을 구독합니다.
        viewModelBuilder: () => AudioPlayerViewModel(postId: '여기에 postId를 넣으세요'), // postId를 제공해야 합니다.
        builder: (context, audioPlayerViewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/AppIcon-1024x+(7).png'), // 앱 아이콘 추가
              ),
              title: const Text(
                'Blissom', // 앱 이름 추가
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true, // 제목을 중앙에 배치
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () => viewModel.navigateToSearch(), // 검색 페이지로 이동
                ),
              ],
            ),
            body: Stack(
              children: [
                viewModel.isBusy || !viewModel.dataReady
                    ? const Center(child: CircularProgressIndicator())
                    : viewModel.data!.isEmpty
                    ? const Center(
                  child: Text('여러분의 멋진 음악을 들려주세요!'),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: viewModel.data!.length,
                  itemBuilder: (context, index) {
                    final post = viewModel.data![index];
                    return PostCard(post: post);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}