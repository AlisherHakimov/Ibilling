import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/features/contracts/presentation/contracts_page.dart';
import 'package:ibilling/features/history/presentation/pages/history_page.dart';
import 'package:ibilling/features/profile/presentation/pages/profile_page.dart';
import 'package:ibilling/features/new/presentation/bloc/new_bloc.dart';
import 'package:ibilling/features/new/presentation/pages/new_contract_page.dart';
import 'package:ibilling/features/new/presentation/pages/new_invoice_page.dart';
import 'package:ibilling/features/new/presentation/widgets/new_dialog.dart';
import 'package:ibilling/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:ibilling/features/saved/presentation/pages/saved_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String label1 = 'Contracts';
  String label2 = 'History';
  String label3 = 'New';
  String label4 = 'Saved';
  String label5 = 'Profile';

  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return BottomNavigationBar(
            onTap: (index) {
              _pageController.jumpToPage(index);
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: darkest,
            currentIndex: currentIndex,
            selectedItemColor: activeIcon,
            unselectedItemColor: notActiveIcon,
            items: [
              BottomNavigationBarItem(
                activeIcon: ActiveTabIcon(label: label1),
                label: label1.tr(),
                icon: TabIcon(label: label1),
              ),
              BottomNavigationBarItem(
                activeIcon: ActiveTabIcon(label: label2),
                label: label2,
                icon: TabIcon(label: label2),
              ),
              BottomNavigationBarItem(
                activeIcon: ActiveTabIcon(label: label3),
                label: label3,
                icon: TabIcon(label: label3),
              ),
              BottomNavigationBarItem(
                activeIcon: ActiveTabIcon(label: label4),
                label: label4.tr(),
                icon: TabIcon(label: label4),
              ),
              BottomNavigationBarItem(
                activeIcon: ActiveTabIcon(label: label5),
                label: label5.tr(),
                icon: TabIcon(label: label5),
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<NewBloc, NewState>(
        builder: (context, state) {
          return PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              currentIndex = index;
              if (index == 2) {
                context.read<NewBloc>().add(NewInitialEvent());
              }
            },
            children: [
              const ContractsPage(),
              HistoryPage(),
              state is NewInitialState
                  ? const NewDialog()
                  : state is NewContractState
                      ? const NewContractPage()
                      : const NewInvoicePage(),
              SavedPage(),
              const ProfilePage(),
            ],
          );
        },
      ),
    );
  }
}

class ActiveTabIcon extends StatelessWidget {
  const ActiveTabIcon({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/bold/$label.svg',
      color: activeIcon,
    );
  }
}

class TabIcon extends StatelessWidget {
  const TabIcon({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/light_outlined/$label.svg',
      color: notActiveIcon,
    );
  }
}
