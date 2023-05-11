import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/config/colors.dart';
import 'package:ibilling/core/widgets/input_field.dart';
import 'package:ibilling/core/widgets/texts/regular_text_14.dart';
import 'package:ibilling/core/widgets/main_app_bar.dart';
import 'package:ibilling/core/widgets/primary_button.dart';
import 'package:ibilling/features/new/presentation/widgets/drop_down_icon.dart';
import 'package:ibilling/features/new/presentation/widgets/field_title.dart';

class NewContractPage extends StatefulWidget {
  const NewContractPage({super.key});

  @override
  State<NewContractPage> createState() => _NewContractPageState();
}

class _NewContractPageState extends State<NewContractPage> {
  final TextEditingController _fulNameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _INNController = TextEditingController();

  String? personValue;

  String? statusValue;

  List<String> personsList = [
    'Физическое лицо',
    'Юридическое лицо',
  ];

  List<String> paymentStatusList = [
    'Paid',
    'In process',
    'Rejected by Payme',
    'Rejected by IQ'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'New contract',
        color: darkest,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FieldTitle(title: 'Лицо'),
                  DropdownButtonFormField(
                    value: personValue,
                    autofocus: true,
                    icon: const DropDownIcon(),
                    decoration: dropDowndecoration(personValue),
                    selectedItemBuilder: ((context) =>
                        personsList.map<Widget>((String item) {
                          return Center(
                            child: Text(item),
                          );
                        }).toList()),
                    items: personsList.map(
                      (item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RegularText14(
                                item,
                              ),
                              SvgPicture.asset(
                                'assets/icons/bold/Radio.svg',
                                color: personValue == item
                                    ? lightGreen
                                    : notActiveIcon,
                              )
                            ],
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      personValue = value;
                    },
                  ),
                  const FieldTitle(title: 'Fisher\' full name'),
                  InputField(controller: _fulNameController),
                  const FieldTitle(title: 'Address of the organization'),
                  InputField(controller: _addressController),
                  const FieldTitle(title: 'ИНН'),
                  InputField(controller: _INNController),
                  const FieldTitle(title: 'Status of the contract'),
                  DropdownButtonFormField(
                    value: statusValue,
                    autofocus: true,
                    icon: const DropDownIcon(),
                    decoration: dropDowndecoration(statusValue),
                    selectedItemBuilder: ((context) =>
                        paymentStatusList.map<Widget>((String item) {
                          return Center(
                            child: Text(item),
                          );
                        }).toList()),
                    items: paymentStatusList.map(
                      (item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RegularText14(
                                item,
                                color: colorE7E7E7,
                              ),
                              SvgPicture.asset(
                                'assets/icons/bold/Radio.svg',
                                color: statusValue == item
                                    ? lightGreen
                                    : notActiveIcon,
                              )
                            ],
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      statusValue = value;
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          title: 'Save contract',
                          verticalPadding: 13,
                          backgroundColor: darkGreen,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration dropDowndecoration(String? selectedItem) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 1.2, color: white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1.2,
          color: selectedItem != null ? white : color606060,
        ),
      ),
    );
  }
}
