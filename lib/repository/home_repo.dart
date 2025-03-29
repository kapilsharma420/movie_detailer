import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/resources/app_url.dart';

class HomeRepo {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<MovieListModel> fetchmovieslist() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
        AppUrl.movielistapi
      );
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
