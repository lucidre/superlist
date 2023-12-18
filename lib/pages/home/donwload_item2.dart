import 'package:superlist/common_libs.dart';

class DownloadItem2 extends StatelessWidget {
  const DownloadItem2({super.key});

  Widget buildItem(
      {required String image,
      required String title,
      required String description,
      required HomeController controller}) {
    return InkWell(
      onHover: (value) {
        if (value) {
          controller.setDownlaodItem2Hovered(title);
        } else {
          controller.setDownlaodItem2Hovered('');
        }
      },
      onTap: () {},
      child: Container(
        color: controller.downloadItem2Hovered == title
            ? activeColor2
            : Colors.transparent,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: Image.asset(image, height: 150, width: 150),
            ).fadeInAndMoveFromBottom(),
            verticalSpacer4,
            Text(title, style: poppins15wBold.copyWith(fontSize: 18))
                .fadeInAndMoveFromBottom(),
            Text(description,
                    style: poppins12w600.copyWith(color: inactiveColor2))
                .fadeInAndMoveFromBottom(),
          ],
        ),
      ),
    );
  }

  dynamic get dividerItem =>
      Container(height: double.infinity, width: 1, color: inactiveColor4)
          .fadeIn();

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return Positioned(
        top: kDefaultMargin * 2,
        left: kDefaultMargin * 4,
        child: AnimatedSwitcher(
          duration: fastDuration,
          child: !controller.isDonwloadItemVisible
              ? const SizedBox()
              : buildBodyItem(controller),
        ),
      );
    });
  }

  Stack buildBodyItem(HomeController controller) {
    return Stack(
      children: [
        Container(
          height: 280,
          margin: const EdgeInsets.only(top: 25, left: 25),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(2, 2),
                  spreadRadius: 4,
                  blurRadius: 10),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildItem(
                  image: macOS,
                  title: 'macOS',
                  description: '10.5+',
                  controller: controller),
              dividerItem,
              buildItem(
                  image: webApp,
                  title: 'Web App',
                  description: 'All platforms',
                  controller: controller),
              dividerItem,
              buildItem(
                  image: ios,
                  title: 'iOS',
                  description: 'App Store',
                  controller: controller),
              dividerItem,
              buildItem(
                  image: android,
                  title: 'Android',
                  description: 'Play Store',
                  controller: controller),
            ],
          ),
        ),
        buildCloseButton(controller),
      ],
    );
  }

  Positioned buildCloseButton(HomeController controller) {
    return Positioned(
      top: 0,
      left: 0,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          controller.setDonwloadItemVisible(false);
        },
        onHover: (value) {
          if (value) {
            controller.setDownlaodItem2Hovered("close");
          } else {
            controller.setDownlaodItem2Hovered('');
          }
        },
        child: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: controller.downloadItem2Hovered == 'close'
                ? primaryColor
                : inactiveColor2,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(2, 2),
                  spreadRadius: 4,
                  blurRadius: 10),
            ],
          ),
          child: const Icon(Icons.close_rounded, color: Colors.white),
        ),
      ),
    );
  }
}
