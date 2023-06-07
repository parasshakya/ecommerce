import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorsContainer extends StatefulWidget {
  const ColorsContainer({Key? key}) : super(key: key);

  @override
  State<ColorsContainer> createState() => _ColorsContainerState();
}

class _ColorsContainerState extends State<ColorsContainer> {

  bool isBlackContainerSelected = false;
  bool isRedContainerSelected = false;
  bool isYellowContainerSelected = false;
  bool isGreyContainerSelected = false;
  bool isBlueContainerSelected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                       isBlackContainerSelected = true;
                       isRedContainerSelected = false;
                       isYellowContainerSelected = false;
                       isGreyContainerSelected = false;
                       isBlueContainerSelected = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
               isBlackContainerSelected ?  Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red.shade800,
                        width: 1,
                      ),
                    ),
                  ),
                ) : Container()
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBlackContainerSelected = false;
                      isRedContainerSelected = true;
                      isYellowContainerSelected = false;
                      isGreyContainerSelected = false;
                      isBlueContainerSelected = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
               isRedContainerSelected ?  Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red.shade800,
                        width: 1,
                      ),
                    ),
                  ),
                ) : Container()
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBlackContainerSelected = false;
                      isRedContainerSelected = false;
                      isYellowContainerSelected = true;
                      isGreyContainerSelected = false;
                      isBlueContainerSelected = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ),
                isYellowContainerSelected ? Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red.shade800,
                        width: 1,
                      ),
                    ),
                  ),
                ) : Container()
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBlackContainerSelected = false;
                      isRedContainerSelected = false;
                      isYellowContainerSelected = false;
                      isGreyContainerSelected = true;
                      isBlueContainerSelected = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ),
               isGreyContainerSelected ?  Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red.shade800,
                        width: 1,
                      ),
                    ),
                  ),
                ) : Container()
              ],
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBlackContainerSelected = false;
                      isRedContainerSelected = false;
                      isYellowContainerSelected = false;
                      isGreyContainerSelected = false;
                      isBlueContainerSelected = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                isBlueContainerSelected ? Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.red.shade800,
                        width: 1,
                      ),
                    ),
                  ),
                ) : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
