import 'package:flutter/material.dart';

import '../../core/core.dart';

class ListWheelScrollViewPicker extends StatefulWidget {
  ///
  /// Constructs an versatile and customisable ListWheelScrollView Picker.
  ///
  /// [mode] is one of the modes listed in [AppListWheelScrollViewPickerMode] and
  /// defaults to [AppListWheelScrollViewPickerMode.integer].
  /// Several picker mode exists, which include;
  ///
  /// [AppListWheelScrollViewPickerMode.integer] for a simple single
  /// column picker with integers can be useful for selecting discrete values like ages
  /// [AppListWheelScrollViewPickerMode.decimal] for a simple decimal picker
  /// with two columns, useful for selecting continuous values like weights
  /// [AppListWheelScrollViewPickerMode.duration] for selecting a duration,
  /// this mode requires no parameters and all nullable parameters must be kept null;
  /// [AppListWheelScrollViewPickerMode.time] for selecting a time.
  /// this mode requires no parameters and all nullable parameters must be kept null;
  /// [AppListWheelScrollViewPickerMode.text] for selecting string values.
  /// This mode requires [textDataValuesList] (which is a list of text
  /// values to choose from), and must not be null. All other nullable parameters
  /// must be kept null;

  /// [height] is height of the picker in logical pixels, and defaults to 200px.
  /// It also determines how many of the Picker's available options are visible
  /// both above and below the selected value
  ///
  /// [textDataValuesList] A list of text stings for the user to choose from.
  /// It is required only when [mode] is set to [AppListWheelScrollViewPickerMode.text]
  ///
  /// [selectedItemUnderlayDecoration] A Decoration to be provided to
  /// the [Container] underlying the selected Item to indicate
  /// it is the selected item.
  /// It Defaults to a Decoration matching the Sickler Design,
  /// but can be customisable to any Decoration.
  ///
  /// [primaryInitialValue] The initial Value of the Primary (First) scroll column.
  /// It Defaults to 0 and can be a positive or negative integer
  /// [primaryFinalValue] The Final Value of the Primary (First) scroll column.
  /// It Defaults to 10 and must not be less than the [primaryInitialValue]+[primaryValueInterval]
  /// [primaryValueInterval] The granularity of the Primary (First) scroll colum picker.
  /// It Defaults to 1, and must be a positive integer.
  /// [primaryUnitLabels] The labels for the Primary scroll column.
  /// A List of strings, which is itself, a [ListWheelScrollView].
  /// For Instance, can be used to pick between [AM] and [PM] in
  /// the [AppListWheelScrollViewPickerMode.time] mode.
  /// For the [AppListWheelScrollViewPickerMode.duration] mode,
  /// A Text representing the [hour] is used instead.
  ///
  /// For the [AppListWheelScrollViewPickerMode.duration] mode,
  /// the [primaryInitialValue] and [primaryFinalValue] corresponds the [hours] of the picker.
  ///
  ///
  /// [secondaryInitialValue] The initial Value of the Secondary (Second) scroll column.
  /// It Defaults to 0 and can be a positive or negative integer
  /// [secondaryFinalValue] The Final Value of the Secondary (Second) scroll column.
  /// It Defaults to 10 and must not be less than the [secondaryInitialValue]+[secondaryValueInterval]
  /// [secondaryValueInterval] The granularity of the Secondary (Second) scroll colum picker.
  /// It Defaults to 1, and must be a positive integer.
  /// [secondaryUnitLabels] The labels for the Secondary scroll column.
  /// A List of strings, which is itself, a [ListWheelScrollView].
  /// For the [AppListWheelScrollViewPickerMode.duration] mode,
  /// a Text representing the [minutes] is used instead.
  /// For the [AppListWheelScrollViewPickerMode.duration] mode,
  /// the [secondaryInitialValue] and [secondaryFinalValue]
  /// corresponds the the [minutes] of the picker.
  ///
  /// For the [AppListWheelScrollViewPickerMode.duration] mode,
  /// the [secondaryValueInterval] must be a positive integer factor of 60
  ///
  /// [diameterRatio] Documentation Can be found in the [ListWheelScrollView] widget
  /// [useMagnifier] Documentation Can be found in the [ListWheelScrollView] widget
  /// [magnification] Documentation Can be found in the [ListWheelScrollView] widget
  /// [itemExtent] Documentation Can be found in the [ListWheelScrollView] widget
  ///
  /// [onSelectedItemChanged] A Void Callback which is run when the selected
  /// item index is changed, ie. when a user selects a new item.
  /// Depending on the different modes, the [selectedValue] has different types.
  /// For the [AppListWheelScrollViewPickerMode.text] the [selectedValue] is a [String]
  /// For the [AppListWheelScrollViewPickerMode.integer] the [selectedValue] is an [int]
  /// For the [AppListWheelScrollViewPickerMode.decimal] the [selectedValue] is a [double]
  /// For the [AppListWheelScrollViewPickerMode.duration] the [selectedValue] is a [Duration]
  /// For the [AppListWheelScrollViewPickerMode.time] the [selectedValue] is a [TimeOfDay]
  ///
  /// [scrollViewToLabelPadding] Determines the spacing between the Scrollable area,
  /// and the label, and has a default value of 8 px
  ///
  final double height;
  final double itemExtent;
  final double diameterRatio;
  final bool useMagnifier;
  final double magnification;
  final List<String>? textDataValuesList;
  final BoxDecoration? selectedItemUnderlayDecoration;
  final AppListWheelScrollViewPickerMode mode;
  final int? primaryValueInterval;
  final int? secondaryValueInterval;
  final int? primaryInitialValue;
  final int? primaryFinalValue;
  final int? secondaryInitialValue;
  final int? secondaryFinalValue;
  final List<String>? primaryUnitLabels;
  final List<String>? secondaryUnitLabels;
  final double scrollViewToLabelPadding;

  final void Function(dynamic selectedValue) onSelectedItemChanged;

  const ListWheelScrollViewPicker({
    super.key,
    this.height = 200,
    this.itemExtent = 48,
    this.diameterRatio = 2,
    this.useMagnifier = false,
    this.magnification = 1.1,
    this.mode = AppListWheelScrollViewPickerMode.integer,
    required this.onSelectedItemChanged,
    this.textDataValuesList,
    this.selectedItemUnderlayDecoration,
    this.primaryValueInterval,
    this.secondaryValueInterval,
    this.primaryInitialValue,
    this.primaryFinalValue,
    this.secondaryInitialValue,
    this.secondaryFinalValue,
    this.primaryUnitLabels,
    this.secondaryUnitLabels,
    this.scrollViewToLabelPadding = 8,
  });

  // : assert(
  //       primaryFinalValue >= primaryInitialValue! + primaryValueInterval!),
  //   assert(secondaryFinalValue! >=
  //       secondaryInitialValue! + secondaryValueInterval!);

  // assert((mode == SicklerListWheelScrollViewPickerMode.duration) &&
  // (secondaryValueInterval! > 0 && 60 % secondaryValueInterval == 0)),

  @override
  State<ListWheelScrollViewPicker> createState() =>
      _ListWheelScrollViewPickerState();
}

class _ListWheelScrollViewPickerState
    extends State<ListWheelScrollViewPicker> {
  List<int> generateDataList({
    required int initialValue,
    required int finalValue,
    required int interval,
  }) {
    ///Generates a List to be used for the scroll picker, when
    ///an initial value, final value, and an interval(granularity) are provided
    List<int> data = [];

    int currentValue = initialValue;

    data.add(currentValue);

    for (int i = initialValue; i < finalValue; i += interval) {
      currentValue += interval;
      if ((widget.mode == AppListWheelScrollViewPickerMode.duration ||
              widget.mode == AppListWheelScrollViewPickerMode.time) &&
          currentValue > 59) {
        break;
      }

      data.add(currentValue);
    }

    return data;
  }

  List<int> _primaryGeneratedList = [];
  List<int> _secondaryGeneratedList = [];

  ///objects to hold the selected value based on mode

  String selectedText = "";
  int selectedPrimaryValue = 0;
  int selectedSecondaryValue = 0;

  @override
  void initState() {
    super.initState();
    switch (widget.mode) {
      case AppListWheelScrollViewPickerMode.time:
        _primaryGeneratedList = generateDataList(
          initialValue: 0,
          finalValue: 12,
          interval: widget.primaryValueInterval ?? 1,
        );
        _secondaryGeneratedList = generateDataList(
          initialValue: 0,
          finalValue: 59,
          interval: widget.secondaryValueInterval ?? 1,
        );
        break;

      case AppListWheelScrollViewPickerMode.duration:
        _primaryGeneratedList = generateDataList(
          initialValue: 0,
          finalValue: 24,
          interval: widget.primaryValueInterval ?? 1,
        );
        _secondaryGeneratedList = generateDataList(
          initialValue: 0,
          finalValue: 59,
          interval: widget.secondaryValueInterval ?? 1,
        );
        break;

      case AppListWheelScrollViewPickerMode.decimal:
        _primaryGeneratedList = generateDataList(
          initialValue: widget.primaryInitialValue ?? 0,
          finalValue: widget.primaryFinalValue ?? 10,
          interval: widget.primaryValueInterval ?? 1,
        );

        _secondaryGeneratedList = generateDataList(
          initialValue: widget.secondaryInitialValue ?? 0,
          finalValue: widget.secondaryFinalValue ?? 9,
          interval: widget.secondaryValueInterval ?? 1,
        );
        break;

      default:
        _primaryGeneratedList = generateDataList(
          initialValue: widget.primaryInitialValue ?? 0,
          finalValue: widget.primaryFinalValue ?? 10,
          interval: widget.primaryValueInterval ?? 1,
        );

        _secondaryGeneratedList = generateDataList(
          initialValue: widget.secondaryInitialValue ?? 0,
          finalValue: widget.secondaryFinalValue ?? 10,
          interval: widget.secondaryValueInterval ?? 1,
        );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Handle on selectedItemChanged
  void _handleOnSelectedItemChanged<T>(
      {required int index, required List<T> values, bool? isSecondaryValue}) {
    ///Run a switch case for the different modes
    ///and return thr appropriate object to pass into onselectedItemchanged

    switch (widget.mode) {
      case AppListWheelScrollViewPickerMode.integer:
        selectedPrimaryValue = values[index] as int;
        widget.onSelectedItemChanged.call(selectedPrimaryValue);
        break;

      case AppListWheelScrollViewPickerMode.decimal:
        if (isSecondaryValue != null && isSecondaryValue) {
          selectedSecondaryValue = values[index] as int;
        } else {
          selectedPrimaryValue = values[index] as int;
        }

        double? selectedDecimal =
            double.tryParse("$selectedPrimaryValue.$selectedSecondaryValue");

        widget.onSelectedItemChanged.call(selectedDecimal);
        break;
      case AppListWheelScrollViewPickerMode.duration:
        if (isSecondaryValue != null && isSecondaryValue) {
          selectedSecondaryValue = values[index] as int;
        } else {
          selectedPrimaryValue = values[index] as int;
        }
        Duration selectedDuration = Duration(
            hours: selectedPrimaryValue, minutes: selectedSecondaryValue);

        widget.onSelectedItemChanged.call(selectedDuration);
        break;
      case AppListWheelScrollViewPickerMode.time:
        if (isSecondaryValue == null) {
        } else if (isSecondaryValue) {
          selectedSecondaryValue = values[index] as int;
        } else {
          selectedPrimaryValue = values[index] as int;
        }

        TimeOfDay selectedTimeOfDay = TimeOfDay(
            hour: selectedText == "PM"
                ? selectedPrimaryValue + 12
                : selectedPrimaryValue,
            minute: selectedSecondaryValue);

        widget.onSelectedItemChanged.call(selectedTimeOfDay);
        break;
      case AppListWheelScrollViewPickerMode.text:
        widget.onSelectedItemChanged.call(selectedText);
        break;
    }
  }

  ///Build Picker Widgets (Primary, Secondary, and Label)

  Widget _buildPicker({
    Alignment? alignment,
    double? offAxisFraction,
    required List<int> values,
    bool? alignValuesToRight,
    double? alignmentPadding,
    bool? isSecondaryPicker,
  }) {
    final Size maxValueSize = _getLargestLabelSize(values);
    double padding = alignmentPadding ?? 0;
    bool alignValToRight = alignValuesToRight ?? true;

    return ListWheelScrollView.useDelegate(
      physics: const FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildBuilderDelegate(
          childCount: values.length,
          builder: (context, index) {
            final Size currentValueSize = _getLargestLabelSize([values[index]]);

            return Padding(
              ///Calculates a padding to add to each element in order to align
              ///its values to the right manually if [alignValuesToRight] is true.
              ///Also adds an optional alignmentPadding, to move the whole list view
              ///some set distance horizontally,
              padding: EdgeInsets.only(
                  left: alignValToRight
                      ? (maxValueSize.width - currentValueSize.width) + padding
                      : 0 + padding),
              child: Align(
                alignment: alignment ?? Alignment.center,
                child: Text(
                  values[index].toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }),
      itemExtent: widget.itemExtent,
      diameterRatio: widget.diameterRatio,
      offAxisFraction: offAxisFraction ?? 0,
      useMagnifier: widget.useMagnifier,
      magnification: widget.magnification,
      onSelectedItemChanged: (int? index) {
        _handleOnSelectedItemChanged(
            index: index!, values: values, isSecondaryValue: isSecondaryPicker);
      },
    );
  }

  Widget _buildPickerLabels(
      {required List<String> labelList, Alignment? alignment}) {
    final Size maxLabelSize = _getLargestLabelSize(labelList);
    return labelList.length == 1
        ? SizedBox(
            width: maxLabelSize.width,
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  labelList.first,
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
          )
        : ListWheelScrollView.useDelegate(
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
                childCount: labelList.length,
                builder: (context, index) {
                  return Align(
                    alignment: alignment ?? Alignment.centerLeft,
                    child: Text(
                      labelList[index].toString(),
                      style: Theme.of(context).textTheme.bodyLarge,

                      ///Todo: style it with selected labesl style
                      ///In this case, the label would always be in the center, thus will always be selected
                    ),
                  );
                }),
            itemExtent: widget.itemExtent,
            diameterRatio: widget.diameterRatio,
            offAxisFraction: 0,
            useMagnifier: widget.useMagnifier,
            magnification: widget.magnification,
            onSelectedItemChanged: (int index) {
              selectedText = labelList[index];
              _handleOnSelectedItemChanged(
                  index: index, values: labelList, isSecondaryValue: null);
            });
  }

  Widget pickerMode() {
    switch (widget.mode) {
      case AppListWheelScrollViewPickerMode.integer:
        if (widget.textDataValuesList != null) {
          throw ErrorHint(
              "For a Integer Mode, the textDataValuesList must be null");
        }
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double parentWidth = constraints.maxWidth;
            final Size primaryScrollViewMaxSize =
                _getLargestLabelSize(_primaryGeneratedList);
            final Size pickerLabelSize =
                _getLargestLabelSize(widget.primaryUnitLabels ?? [""]);
            return Stack(
              children: [
                ///Primary Picker
                _buildPicker(
                    values: _primaryGeneratedList,
                    isSecondaryPicker: false,

                    ///Aligns the values to the optical centre if the picker Labels
                    ///are visible, and aligns to the actual centre if no labels are visible
                    alignmentPadding: widget.primaryUnitLabels != null
                        ? (parentWidth / 2) - (pickerLabelSize.width / 2)
                        : null,
                    alignment: widget.primaryUnitLabels != null
                        ? Alignment.centerLeft
                        : null,
                    alignValuesToRight:
                        widget.primaryUnitLabels != null ? true : false),

                ///Primary Picker Unit Label,
                widget.primaryUnitLabels != null
                    ? Padding(
                        ///Automatically aligns the labels and primary scroll to the
                        ///optical centre, by subtracting half of the max label width
                        ///from half of the parent width to get the centre, then adding the
                        ///max scroll width and scroll to Label padding to then nudge the
                        ///labels slightly to the right

                        padding: EdgeInsets.only(
                          left: (parentWidth / 2) -
                              (pickerLabelSize.width / 2) +
                              primaryScrollViewMaxSize.width +
                              widget.scrollViewToLabelPadding,
                        ),
                        child: _buildPickerLabels(
                            labelList: widget.primaryUnitLabels!),
                      )
                    : const SizedBox(),
              ],
            );
          },
        );

      case AppListWheelScrollViewPickerMode.duration:
        if (widget.textDataValuesList != null ||
            widget.primaryUnitLabels != null ||
            widget.secondaryUnitLabels != null ||
            widget.primaryInitialValue != null ||
            widget.primaryFinalValue != null ||
            widget.secondaryInitialValue != null ||
            widget.secondaryFinalValue != null) {
          throw ErrorHint(
              "For a Duration Mode, the textDataValuesList, primaryUnitLabels,secondaryUnitLabels, primaryInitialValue, primaryFinalValue, secondaryInitialValue, secondaryFinalValue, must all be null, consider removing any values.");
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Layout Builder for Hour section
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double parentWidth = constraints.maxWidth;
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  final Size hourSize = _getLargestLabelSize(["hours"]);

                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
                          isSecondaryPicker: false,
                          values: _primaryGeneratedList,
                          alignmentPadding: parentWidth -
                              (hourSize.width +
                                  widget.scrollViewToLabelPadding * 2 +
                                  primaryScrollViewMaxSize.width),

                          ///Constructs an alignment as a fraction of the total
                          ///available parent width, and the width of the "hour"
                          ///label. This value should be between 0, and 1.
                          alignment: Alignment.centerLeft,
                          offAxisFraction: -.25),

                      ///Primary Picker Unit Label,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          //Pad half the screen + half the width of the middle item +
                          // then a spacing between the two, which can be user defined
                          padding: EdgeInsets.only(
                              right: widget.scrollViewToLabelPadding),
                          child: _buildPickerLabels(labelList: ["hours"]),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            ///Layout Builder for Minute section
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
                          isSecondaryPicker: true,
                          alignValuesToRight: true,
                          values: _secondaryGeneratedList,
                          alignment: Alignment.centerLeft,
                          offAxisFraction: 0.5),

                      ///Primary Picker Unit Label,
                      Padding(
                        //Pad half the screen + half the width of the middle item +
                        // then a spacing between the two, which can be user defined
                        padding: EdgeInsets.only(
                            left: primaryScrollViewMaxSize.width +
                                widget.scrollViewToLabelPadding),
                        child: _buildPickerLabels(labelList: ["mins."]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );

      case AppListWheelScrollViewPickerMode.time:
        if (widget.textDataValuesList != null ||
            widget.primaryUnitLabels != null ||
            widget.secondaryUnitLabels != null ||
            widget.primaryInitialValue != null ||
            widget.primaryFinalValue != null ||
            widget.secondaryInitialValue != null ||
            widget.secondaryFinalValue != null) {
          throw ErrorHint(
              "For a Time Mode, the textDataValuesList, primaryUnitLabels,secondaryUnitLabels, primaryInitialValue, primaryFinalValue, secondaryInitialValue, secondaryFinalValue, primaryValueInterval, and secondaryValueInterval must all be null, consider removing any values.");
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Layout Builder for Hour section
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double parentWidth = constraints.maxWidth;
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  final Size decimalPointSize = _getLargestLabelSize(["."]);

                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
                          isSecondaryPicker: false,
                          values: _primaryGeneratedList,
                          alignmentPadding: parentWidth -
                              (decimalPointSize.width +
                                  widget.scrollViewToLabelPadding / 2 +
                                  primaryScrollViewMaxSize.width),

                          ///Constructs an alignment as a fraction of the total
                          ///available parent width, and the width of the "hour"
                          ///label. This value should be between 0, and 1.
                          alignment: Alignment.centerLeft,
                          alignValuesToRight: true,
                          offAxisFraction: -.25),

                      ///Primary Picker Unit Label,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(
                                right: widget.scrollViewToLabelPadding / 4),
                            child: _buildPickerLabels(labelList: [":"])),
                      ),
                    ],
                  );
                },
              ),
            ),

            ///Layout Builder for Decimal section
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
                          isSecondaryPicker: true,
                          alignValuesToRight: true,
                          values: _secondaryGeneratedList,
                          alignment: Alignment.centerLeft,
                          offAxisFraction: 0.5),

                      ///Time Picker Label
                      Padding(
                        //Pad half the screen + half the width of the middle item +
                        // then a spacing between the two, which can be user defined
                        padding: EdgeInsets.only(
                            left: primaryScrollViewMaxSize.width +
                                widget.scrollViewToLabelPadding),
                        child: _buildPickerLabels(labelList: ["AM", "PM"]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );

      case AppListWheelScrollViewPickerMode.decimal:
        if (widget.textDataValuesList != null) {
          throw ErrorHint(
              "For a Decimal Mode,  the textDataValuesList must be null");
        }
        if (widget.primaryUnitLabels != null) {
          throw ErrorHint(
              "For a Decimal mode, the primaryUnitLabels must be null");
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Layout Builder for Primary Number section
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double parentWidth = constraints.maxWidth;
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  final Size decimalPointSize = _getLargestLabelSize(["."]);

                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
                          isSecondaryPicker: false,
                          values: _primaryGeneratedList,
                          alignmentPadding: parentWidth -
                              (decimalPointSize.width +
                                  widget.scrollViewToLabelPadding / 2 +
                                  primaryScrollViewMaxSize.width),

                          ///Constructs an alignment as a fraction of the total
                          ///available parent width, and the width of the "hour"
                          ///label. This value should be between 0, and 1.
                          alignment: Alignment.centerLeft,
                          alignValuesToRight: true,
                          offAxisFraction: -.25),

                      ///Primary Picker Unit Label,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(
                                right: widget.scrollViewToLabelPadding / 4),
                            child: _buildPickerLabels(labelList: ["."])),
                      ),
                    ],
                  );
                },
              ),
            ),

            ///Layout Builder for Decimal section
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
                          isSecondaryPicker: true,
                          alignValuesToRight: true,
                          values: _secondaryGeneratedList,
                          alignment: Alignment.centerLeft,
                          offAxisFraction: 0.5),

                      ///Primary Picker Unit Label,
                      Padding(
                        //Pad half the screen + half the width of the middle item +
                        // then a spacing between the two, which can be user defined
                        padding: EdgeInsets.only(
                            left: primaryScrollViewMaxSize.width +
                                widget.scrollViewToLabelPadding),
                        child: _buildPickerLabels(
                          labelList: [widget.secondaryUnitLabels?.first ?? ""],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );

      case AppListWheelScrollViewPickerMode.text:
        if (widget.textDataValuesList == null) {
          throw ErrorHint(
              "For a Text Mode,  the textDataValuesList must not be null, Consider providing all the text values to choose from in a list");
        }

        return _buildPickerLabels(
            labelList: widget.textDataValuesList!, alignment: Alignment.center);
    }
  }

  Size _getLargestLabelSize(List textList) {
    ///Goes through the list of labels and returns the maximum size (width) of
    ///all the label elements, which would be used to determine the size of the
    ///painter that draws the Label ListWheelScrollView
    Size currentSize;
    Size maxSize = Size.zero;

    for (dynamic text in textList) {
      final TextSpan textSpan = TextSpan(
          text: text.toString(), style: Theme.of(context).textTheme.bodyLarge);
      final TextPainter textPainter =
          TextPainter(text: textSpan, textDirection: TextDirection.ltr);
      textPainter.layout();
      currentSize = textPainter.size;

      if (currentSize.width > maxSize.width) {
        maxSize = currentSize;
      }
    }

    return maxSize;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: widget.itemExtent,
            width: double.infinity,
            decoration: widget.selectedItemUnderlayDecoration ??
                BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      width: 1,
                      color: isDarkMode
                          ? AppColours.neutral20
                          : AppColours.neutral90,
                    ),
                  ),
                ),
          ),
          pickerMode(),
        ],
      ),
    );
  }
}
