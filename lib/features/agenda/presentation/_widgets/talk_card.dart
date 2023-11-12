import 'dart:math';

import 'package:devfest23/shared/style/devfest23_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/talk.dart';

class TalkCard extends StatelessWidget {
  const TalkCard({
    required this.talk,
    super.key,
  });

  final Talk talk;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundColor: DevFest23Colors.neutralGrey,
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${talk.startHour}-${talk.finishHour}',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: DevFest23Colors.primaries[
                        Random().nextInt(DevFest23Colors.primaries.length)],
                    fontSize: 16,
                  ),
            ),
            Text(
              talk.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: DevFest23Colors.neutralBlack,
                    fontSize: 16,
                  ),
            ),
            Text(
              talk.fullName,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: DevFest23Colors.neutralGrey,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
