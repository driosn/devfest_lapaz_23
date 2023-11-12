import 'package:devfest23/features/activities/presentation/activities_page.dart';
import 'package:devfest23/features/agenda/presentation/agenda_page.dart';
import 'package:devfest23/features/home/presentation/home_page.dart';
import 'package:devfest23/shared/style/devfest23_colors.dart';
import 'package:flutter/material.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({super.key});

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  late List<_Destination> destinations;

  late ValueNotifier<_Destination> selectedDestinationNotifier;

  @override
  void initState() {
    super.initState();

    destinations = const [
      _Destination(0, 'Inicio', Icon(Icons.home)),
      _Destination(1, 'Agenda', Icon(Icons.notes)),
      _Destination(2, 'Actividades', Icon(Icons.local_activity))
    ];
    selectedDestinationNotifier = ValueNotifier(destinations.first);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1080;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: DevFest23Colors.neutralBlack,
        title: SizedBox(
          width: isDesktop ? 1080 : size.width,
          child: Image.asset(
            'assets/images/devfest_header.png',
            fit: BoxFit.fitHeight,
          ),
        ),
        toolbarHeight: isDesktop ? 200 : 120,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: NavigationBar(
            onDestinationSelected: (index) {
              print('Index: $index');
              selectedDestinationNotifier.value = destinations[index];
            },
            destinations: destinations
                .map(
                  (destination) => NavigationDestination(
                    icon: destination.icon,
                    label: destination.title,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      body: ValueListenableBuilder<_Destination>(
        valueListenable: selectedDestinationNotifier,
        builder: (context, destination, child) {
          return IndexedStack(
            index: destination.index,
            children: const [
              HomePage(),
              AgendaPage(),
              ActivitiesPage(),
            ],
          );
        },
      ),
    );
  }
}

class _Destination {
  const _Destination(
    this.index,
    this.title,
    this.icon,
  );
  final int index;
  final String title;
  final Icon icon;
}
