import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/core/widgets/custom_app_bar.dart';
import 'package:ibilling/core/widgets/filter_app_bar.dart';
import 'package:ibilling/features/contracts/presentation/bloc/contracts_bloc.dart';
import 'package:ibilling/core/widgets/searching_app_bar.dart';

class ContractsAppBar extends StatelessWidget implements PreferredSizeWidget {
  ContractsAppBar({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractsBloc, ContractsState>(
      builder: (context, state) {
        if (state is LoadedContractsState || state is LoadingContractsState) {
          return CustomAppBar(
            title: 'Contracts'.tr(),
            onFilterTap: () =>
                context.read<ContractsBloc>().add(ContractsFilterTapEvent()),
            onSearchTap: () =>
                context.read<ContractsBloc>().add(ContractsSearchTapEvent()),
          );
        } else if (state is SearchContractsState) {
          return SearchingAppBar(
            controller: _controller,
            onChanged: () {},
            onExitPressed: () =>
                context.read<ContractsBloc>().add(FilterOrSearchExitEvent()),
          );
        } else {
          return FilterAppBar(
            onExitPressed: () =>
                context.read<ContractsBloc>().add(FilterOrSearchExitEvent()),
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size(0, 50);
}
