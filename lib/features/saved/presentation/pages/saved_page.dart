import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/features/saved/presentation/bloc/saved_bloc.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/filter_app_bar.dart';
import '../../../../core/widgets/searching_app_bar.dart';

class SavedPage extends StatelessWidget {
  SavedPage({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      builder: (context, state) {
        return Scaffold(
          appBar: (state is SavedInitialState)
              ? CustomAppBar(
                  title: 'Saved'.tr(),
                  onFilterTap: () =>
                      context.read<SavedBloc>().add(SavedFilterTap()),
                  onSearchTap: () =>
                      context.read<SavedBloc>().add(SavedSearchTap()),
                )
              : (state is SavedSearchState)
                  ? SearchingAppBar(
                      onChanged: (() {}),
                      controller: _controller,
                      onExitPressed: () =>
                          context.read<SavedBloc>().add(SavedInitial()),
                    )
                  : FilterAppBar(
                      onExitPressed: () => context.read<SavedBloc>().add(
                            SavedInitial(),
                          ),
                    ),
          // body: ListView.builder(
          //   padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 68.h),
          //   shrinkWrap: true,
          //   primary: false,
          //   itemCount: 8,
          //   itemBuilder: (context, index) =>  ContractCard(),
          // ),
        );
      },
    );
  }
}
