import 'package:get/get.dart';
import 'package:restapilive/eventsfetch/event_model.dart';
import 'package:restapilive/eventsfetch/event_network.dart';

class EventsController extends GetxController {
  var isLoading = true.obs;
  var alleventsdata = AlleventsModel().obs;

  @override
  void onInit() {
    fetchAllevent();
    super.onInit();
  }

//   void fetch_events() async {
//     try {
//       isLoading(true);
//       var allevents = await EventsApi.fetchEvents();
//       if (allevents != null) {
//         alleventsdata.value = allevents as List<AlleventsModel>;
//         print(allevents);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

  Future<void> fetchAllevent() async {
    isLoading(true);
    try {
      var allevents = await EventApi().getEventpost();
      if (allevents != null) {
        alleventsdata.value = allevents;
        isLoading(false);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
