import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utiles/routes/routes_name.dart';
import 'package:mvvm/utiles/utiles.dart';
import 'package:mvvm/view_model/home_vieww_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  HomeViewwModel homeViewwModel = HomeViewwModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewwModel.fetchmovielistapi();
  }

  @override
  Widget build(BuildContext context) {
    final userPrefrence = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,

        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPrefrence.remove().then((value) {
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(
              child: 
              Icon(Icons.logout,color: Colors.white,)
              //Text('logout', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),

      body: ChangeNotifierProvider<HomeViewwModel>(
        create: (BuildContext context) => homeViewwModel,
        child: Consumer<HomeViewwModel>(
          builder: (context, value, _) {
            print(value.movieslist.status);
            switch (value.movieslist.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());

              case Status.ERROR:
                return Center(child: Text(value.movieslist.message.toString()));

              default:
                return ListView.builder(
                  itemCount: value.movieslist.data!.movies!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.movieslist.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, color: Colors.red);
                          },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),

                        title: Text(
                          value.movieslist.data!.movies![index].title
                              .toString(),
                        ),
                        subtitle: Text(
                          value.movieslist.data!.movies![index].year.toString(),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text(Utiles.setavgrating(value.movieslist.data!.movies![index].ratings!).toStringAsFixed(1)),
                            Icon(Icons.star, color: Colors.yellow),
                          ],
                        ),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
