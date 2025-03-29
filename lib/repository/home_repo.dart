import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/resources/app_url.dart';

class HomeRepo {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> fetchmovieslist() async {
  try {
   // print("API URL: ${AppUrl.movielistapi}"); // Debugging line

    dynamic response = await _apiServices.getGetApiResponse(AppUrl.movielistapi);
    
   // print("API Response: $response"); // Debugging line

    return MovieListModel.fromJson(response); // No need to assign response again
  } catch (e) {
    print("Exception: $e");
    throw e;
  }
}


}
