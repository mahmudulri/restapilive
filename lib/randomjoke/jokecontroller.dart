import 'package:get/get.dart';
import 'package:restapilive/randomjoke/jokemodel.dart';
import 'package:restapilive/randomjoke/jokenetwork.dart';

class JokesController extends GetxController {
  @override
  void onInit() {
    fetchJokes();
    super.onInit();
  }

  var isLoading = true.obs;

  var allfinaljokes = JokeModel().obs;

  void fetchJokes() async {
    try {
      isLoading(true);
      var jokelist = await jokeApi.fetchallJokes();
      if (jokelist != null) {
        allfinaljokes.value = jokelist;
        isLoading(false);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
