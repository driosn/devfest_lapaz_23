import 'package:devfest23/features/speakers/presentation/_widgets/speaker_card.dart';
import 'package:flutter/material.dart';

class SpeakersPage extends StatelessWidget {
  const SpeakersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: size.width > 500
            ? const _DesktopCardsLayout()
            : const _MobileCardsLayout(),
      ),
    );
  }
}

class _MobileCardsLayout extends StatelessWidget {
  const _MobileCardsLayout();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) => SpeakerCard(
          size: size.width,
        ),
      ),
    );
  }
}

class _DesktopCardsLayout extends StatelessWidget {
  const _DesktopCardsLayout({super.key});

  static const cardMaxSize = 420.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        children: List.generate(
          23,
          (index) => const SpeakerCard(
            size: cardMaxSize,
          ),
        ),
      ),
    );
  }
}
