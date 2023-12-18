import 'dart:math';

import 'package:superlist/common_libs.dart';

class DownloadItem extends StatelessWidget {
  const DownloadItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return AnimatedPositioned(
        duration: fastDuration,
        top: controller.downlaodItem1Hovered ? -20 : -60,
        left: 80,
        child: InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            controller.setDonwloadItemVisible(true);
          },
          onHover: (value) {
            controller.setDownlaodItem1Hovered(value);
          },
          child: AnimatedOpacity(
            duration: fastDuration,
            opacity: controller.isDonwloadItemVisible ? 0 : 1,
            child: Transform.rotate(
              angle: controller.downlaodItem1Hovered ? 0 : -pi / 45,
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(cornersLarge),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: const Offset(2, 2),
                        spreadRadius: 4,
                        blurRadius: 10),
                  ],
                ),
                child: buildBody(controller),
              ),
            ),
          ),
        ),
      );
    });
  }

  IgnorePointer buildBody(HomeController controller) {
    return IgnorePointer(
      ignoring: true,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 200,
                height: 200,
                color: backgroundColor,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    AppSvg(
                      icon: qrCodeSvg,
                      size: 150,
                      color: primaryColor,
                      name: qrCodeSvg,
                    ).fadeInAndMoveFromBottom(),
                    verticalSpacer4,
                    Text('Free forever for individuals',
                            style:
                                poppins12w600.copyWith(color: inactiveColor2))
                        .fadeInAndMoveFromBottom(),
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                child: Text(
                    controller.downlaodItem1Hovered
                        ? 'Click me'
                        : 'Join our beta',
                    style: poppins15wBold.copyWith(
                        color: backgroundColor, fontSize: 18)),
              ).fadeInAndMoveFromBottom()),
            ],
          ),
          buildDots()
        ],
      ),
    );
  }

  Positioned buildDots() {
    return Positioned(
      left: 0,
      right: 0,
      top: 195,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 10,
            height: 10,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
          ).fadeIn(),
        ].expand((item) => List.filled(15, item)).toList(),
      ),
    );
  }
}
