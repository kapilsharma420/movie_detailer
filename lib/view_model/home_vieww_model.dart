import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/repository/home_repo.dart';

class HomeViewwModel with ChangeNotifier {
  final _myrepo = HomeRepo();
  ApiResponse<MovieListModel> movieslist = ApiResponse.loading();
  setmovieslist(ApiResponse<MovieListModel> response) {
    movieslist = response;
    notifyListeners();
  }

  Future<void> fetchmovielistapi() async {
    setmovieslist(ApiResponse.loading());
    _myrepo
        .fetchmovieslist()
        .then((value) {
          setmovieslist(ApiResponse.completed(value));
        })
        .onError((error, stackTrace) {
          setmovieslist(ApiResponse.error(error.toString()));
        });
  }
}
