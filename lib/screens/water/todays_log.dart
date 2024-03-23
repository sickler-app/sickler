import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sickler/core/core.dart';

class TodaysLog extends StatelessWidget {
  TodaysLog({super.key});

  List<dynamic> volume = ["150ml", "100ml"];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: volume.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 30 / 9,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              color: SicklerColours.neutral95,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/droplet.svg",
                      colorFilter: ColorFilter.mode(
                          SicklerColours.blueSeed, BlendMode.srcIn),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("150 ml",
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w800)),
                        Text(" 2:13pm ",
                            style: theme.textTheme.bodySmall!
                                .copyWith(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/edit.svg",
                      colorFilter: ColorFilter.mode(
                          SicklerColours.blueSeed, BlendMode.srcIn),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    SvgPicture.asset(
                      "assets/svg/delete.svg",
                      colorFilter: ColorFilter.mode(
                          SicklerColours.red60, BlendMode.srcIn),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
