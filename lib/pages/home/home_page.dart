import 'package:superlist/common_libs.dart';
import 'package:superlist/pages/home/home_item_prime.dart';
import 'donwload_item.dart';
import 'donwload_item2.dart';
import 'home_item5.dart';
import 'home_item3.dart';
import 'home_item4.dart';
import 'home_item6.dart';
import 'home_item7.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            buildBody(),
            const DownloadItem(),
            const DownloadItem2(),
          ],
        ));
  }

  Widget buildBody() {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final controller = Get.find<HomeController>();
        final isScrollingUp = controller.isScrollingUp;
        if (notification is ScrollUpdateNotification) {
          if (notification.scrollDelta != null &&
              notification.scrollDelta! > 1 &&
              !isScrollingUp) {
            controller.setIsScrollingUp(true);
          } else if (notification.scrollDelta != null &&
              notification.scrollDelta! < -1 &&
              isScrollingUp) {
            controller.setIsScrollingUp(false);
          }
        }
        return true;
      },
      child: CustomScrollView(
        controller: Get.find<HomeController>().pageController,
        slivers: const [
          SliverToBoxAdapter(child: HomeItemPrime()),
          SliverToBoxAdapter(child: HomeItem3()),
          SliverToBoxAdapter(child: HomeItem4()),
          SliverToBoxAdapter(child: HomeItem5()),
          SliverToBoxAdapter(child: HomeItem6()),
          SliverToBoxAdapter(child: HomeItem7())
        ],
      ),
    );
  }
}
