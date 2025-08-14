import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProgressBarHUD extends StatelessWidget {
  final Color? backGroundColor;

  const ProgressBarHUD({Key? key, this.backGroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(
              dismissible: false,
              color: backGroundColor ?? Colors.grey,
            ),
          ),
          const Center(
            child: SpinKitSpinningLines(
              itemCount: 5,
              color: Color(0xff098EDD),
              lineWidth: 5,
              size: 100,
            ),
          ),
        ],
      ),
    );
  }
}
