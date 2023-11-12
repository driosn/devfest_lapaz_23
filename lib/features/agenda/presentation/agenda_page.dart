import 'package:devfest23/features/agenda/presentation/_widgets/talk_card.dart';
import 'package:flutter/material.dart';

import '../data/talks.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: ListView.separated(
          itemCount: 100,
          separatorBuilder: (context, index) => const SizedBox(
            height: 32,
          ),
          itemBuilder: (context, index) {
            return TalkCard(
              talk: talks.first,
            );
          },
        ),
      ),
    );
  }
}
