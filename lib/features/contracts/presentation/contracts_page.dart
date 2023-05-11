import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/texts/semibold_text_14.dart';
import 'package:ibilling/features/contracts/presentation/bloc/contracts_bloc.dart';
import 'package:ibilling/features/contracts/presentation/widgets/contracts_app_bar.dart';
import 'package:ibilling/features/contracts/presentation/widgets/filter_contracts_body.dart';
import 'package:ibilling/features/contracts/presentation/widgets/main_contracts_body.dart';

class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  @override
  void initState() {
    context.read<ContractsBloc>().add(LoadContractsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ContractsAppBar(),
      body: BlocBuilder<ContractsBloc, ContractsState>(
        builder: (context, state) {
          if (state is LoadingContractsState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedContractsState ||
              state is SearchContractsState) {
            return const MainContractsBody();
          } else if (state is FilterContractsState) {
            return FilterContractsBody(
              onCancelPressed: () {
                context.read<ContractsBloc>().add(FilterOrSearchExitEvent());
              },
            );
          } else {
            return Center(
              child: SemiboldText14(
                'No contracts are made',
                color: color333333,
              ),
            );
          }
        },
      ),
    );
  }
}
