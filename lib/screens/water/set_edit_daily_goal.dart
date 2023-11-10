import 'package:flutter/material.dart';
import 'package:sickler/screens/global_components/global_components.dart';

import '../../core/core.dart';
import '../user_info/components/sickler_radio.dart';


class EditDailyGoalScreen extends StatefulWidget {
  const EditDailyGoalScreen({super.key});

  @override
  State<EditDailyGoalScreen> createState() => _EditDailyGoalScreenState();
}

class _EditDailyGoalScreenState extends State<EditDailyGoalScreen> {
  final TextEditingController volumeController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController timeintervalController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  bool _isReminderKnown = false;
  Map<int, bool> isReminderSelected = {0: true};
  Gender selectedRadioValue = Gender.male;
  final List<String> listData = [
    
    "hour",
    "hours",
   
  
  ];

  @override
  void dispose() {
    super.dispose();
    volumeController.dispose();
    ageController.dispose();
    timeintervalController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SicklerAppBar(pageTitle: "Set your\ndaily goal"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Volume", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: volumeController,
                          keyboardType: TextInputType.name,
                          decoration:
                              SicklerInputDecoration.inputDecoration(context)
                                  .copyWith(hintText: "1000ml"),
                        ),
                        const SizedBox(height: 24),
                            Row(
                          children: [
                            Text("Enable reminders for this goal",
                                style: theme.textTheme.bodyMedium),
                            const Spacer(),
                            Switch(
                              value: _isReminderKnown,
                              onChanged: (value) {
                                setState(() {
                                  _isReminderKnown = value;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text("Notification Interval", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 8),
                        TextFormField(
                          readOnly: true,
                          controller: timeintervalController,
                          keyboardType: TextInputType.streetAddress,
                          onTap: () async{
                               await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => SicklerBottomSheet(
                                      title: "Time",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: SicklerListWheelScrollViewPicker(
                                        itemExtent: 48,
                                        onSelectedItemChanged: (selectedValue) {
                                          setState(() {
                                            timeintervalController.text =
                                                selectedValue.toString();
                                          });
                                        },
                                        primaryUnitLabels: listData,
                                        
                                        primaryInitialValue: 0,
                                        primaryFinalValue: 100,
                                      ),
                                    ));
                          },
                          decoration:
                              SicklerInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: "Notification Interval",
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text("We will send you reminder every ${timeintervalController.text} hour to help you achieve this goal", style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 32),
                        Text("Happy drinking", style: theme.textTheme.bodyMedium),
                      

                        const SizedBox(height: 16),
                        
                        const SizedBox(height: 32),
                        const Spacer(),

                        ///Buttons
                        SicklerButton(
                            onPressed: ()async {
                              
                              //Todo: Perform sign in action
                            
                            },
                            label: "Continue"),

                        const SizedBox(height: 64),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
