import 'package:echowake/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: SizedBox(
          width: screenWidth(context) * 0.7,
          height: 35.0,
          child: TextField(
            style: const TextStyle(color: Colors.black),
            onSubmitted: (value) => viewModel.search(value),
            decoration: InputDecoration(
              hintText: 'Blissom 검색..',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '최근 검색 기록',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => viewModel.clearSearchHistory(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text(
                    '전체 삭제',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Text(
              '내가 자주 듣는 작품',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // 내가 자주 듣는 작품 리스트
          Expanded(
            child: ListView.builder(
              itemCount:
                  viewModel.searchHistory.length + 5, // 예시를 위해 검색 기록 + 5개 항목
              itemBuilder: (context, index) {
                if (index < viewModel.searchHistory.length) {
                  // 검색 기록 표시
                  return ListTile(
                    title: Text(viewModel.searchHistory[index]),
                    onTap: () =>
                        viewModel.search(viewModel.searchHistory[index]),
                  );
                } else {
                  // '내가 자주 듣는 작품' 항목 표시
                  return ListTile(
                    leading: const Icon(Icons.music_note),
                    title:
                        Text('곡 제목 ${index - viewModel.searchHistory.length}'),
                    subtitle:
                        Text('아티스트 ${index - viewModel.searchHistory.length}'),
                  );
                }
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}
