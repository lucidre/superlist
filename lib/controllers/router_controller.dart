import 'package:superlist/common_libs.dart';
import 'package:superlist/routing/app_router.dart';

class RouterController extends GetxController {
  final Rx<AppRouter> _router = AppRouter().obs;

  AppRouter get router => _router.value;
}
