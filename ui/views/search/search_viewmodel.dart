import 'package:stacked/stacked.dart';

class SearchViewModel extends BaseViewModel {
  List<String> searchResults = []; // 검색 결과를 저장할 리스트
  List<String> searchHistory = []; // 검색 기록을 저장할 리스트
  bool showSearchHistory = true; // 검색 기록 표시 여부

  void search(String query) {
    searchHistory.remove(query);
    searchHistory.insert(0, query);
    showSearchHistory = false;

    rebuildUi();
  }

  void clearSearchHistory() {
    searchHistory.clear();

    rebuildUi();
  }
}
