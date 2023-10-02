import 'package:flutter/material.dart';

import '../../core/core.dart';

class SicklerListWheelScrollViewPicker extends StatefulWidget {
  /// Constructs an versatile and customisable ListWheelScrollView Picker.
  ///
  /// [mode] is one of the modes listed in [SicklerListWheelScrollViewPickerMode] and
  /// defaults to [SicklerListWheelScrollViewPickerMode.integer].
  /// Several picker mode exists, which include;
  ///
  /// [SicklerListWheelScrollViewPickerMode.integer] for a simple single
  /// column picker with integers can be useful for selecting discrete values like ages
  /// [SicklerListWheelScrollViewPickerMode.decimal] for a simple decimal picker
  /// with two columns, useful for selecting continuous values like weights
  /// [SicklerListWheelScrollViewPickerMode.duration] for selecting a duration,
  /// this mode requires no parameters and all nullable parameters must be kept null;
  /// [SicklerListWheelScrollViewPickerMode.time] for selecting a time.
  /// this mode requires no parameters and all nullable parameters must be kept null;
  /// [SicklerListWheelScrollViewPickerMode.text] for selecting string values.
  /// This mode requires [textDataValuesList] (which is a list of text
  /// values to choose from), and must not be null. All other nullable parameters
  /// must be kept null;

  /// [height] is height of the picker in logical pixels, and defaults to 200px.
  /// It also determines how many of the Picker's available options are visible
  /// both above and below the selected value
  ///
  /// [textDataValuesList] A list of text stings for the user to choose from.
  /// It is required only when [mode] is set to [SicklerListWheelScrollViewPickerMode.text]
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
  /// the [SicklerListWheelScrollViewPickerMode.time] mode.
  /// For the [SicklerListWheelScrollViewPickerMode.duration] mode,
  /// A Text representing the [hour] is used instead.
  ///
  /// For the [SicklerListWheelScrollViewPickerMode.duration] mode,
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
  /// For the [SicklerListWheelScrollViewPickerMode.duration] mode,
  /// a Text representing the [minutes] is used instead.
  /// For the [SicklerListWheelScrollViewPickerMode.duration] mode,
  /// the [secondaryInitialValue] and [secondaryFinalValue]
  /// corresponds the the [minutes] of the picker.
  ///
  /// For the [SicklerListWheelScrollViewPickerMode.duration] mode,
  /// the [secondaryValueInterval] must be a positive integer factor of 60
  ///
  /// [diameterRatio] Documentation Can be found in the [ListWheelScrollView] widget
  /// [useMagnifier] Documentation Can be found in the [ListWheelScrollView] widget
  /// [magnification] Documentation Can be found in the [ListWheelScrollView] widget
  /// [itemExtent] Documentation Can be found in the [ListWheelScrollView] widget
  ///
  /// [onSelectedItemIndexChanged] A Void Callback which is run when the selected item index is changed, ie. when a user selects a new item

  final double height;
  final double itemExtent;
  final double diameterRatio;
  final bool useMagnifier;
  final double magnification;
  final List<String>? textDataValuesList;
  final BoxDecoration? selectedItemUnderlayDecoration;
  final SicklerListWheelScrollViewPickerMode mode;
  final int? primaryValueInterval;
  final int? secondaryValueInterval;
  final int? primaryInitialValue;
  final int? primaryFinalValue;
  final int? secondaryInitialValue;
  final int? secondaryFinalValue;
  final List<String>? primaryUnitLabels;
  final List<String>? secondaryUnitLabels;
  final double scrollViewToLabelPadding;

  final void Function(int index) onSelectedItemIndexChanged;

  SicklerListWheelScrollViewPicker({
    super.key,
    this.height = 200,
    required this.itemExtent,
    this.diameterRatio = 2,
    this.useMagnifier = false,
    this.magnification = 1.1,
    this.mode = SicklerListWheelScrollViewPickerMode.integer,
    required this.onSelectedItemIndexChanged,
    this.textDataValuesList,
    this.selectedItemUnderlayDecoration,
    this.primaryValueInterval = 1,
    this.secondaryValueInterval = 1,
    this.primaryInitialValue = 0,
    this.primaryFinalValue = 10,
    this.secondaryInitialValue = 0,
    this.secondaryFinalValue = 10,
    this.primaryUnitLabels,
    this.secondaryUnitLabels,
    this.scrollViewToLabelPadding = 8,
  })  : assert(
            primaryFinalValue! >= primaryInitialValue! + primaryValueInterval!),
        assert(secondaryFinalValue! >=
            secondaryInitialValue! + secondaryValueInterval!);

  // assert((mode == SicklerListWheelScrollViewPickerMode.duration) &&
  // (secondaryValueInterval! > 0 && 60 % secondaryValueInterval == 0)),

  @override
  State<SicklerListWheelScrollViewPicker> createState() =>
      _SicklerListWheelScrollViewPickerState();
}

class _SicklerListWheelScrollViewPickerState
    extends State<SicklerListWheelScrollViewPicker> {
  List<int> generateDataList({
    required int initialValue,
    required int finalValue,
    required int interval,
  }) {
    ///Generates a List to be used for the scroll picker, when
    ///an initial value, final value, and an interval(granularity) are provided
    List<int> data = [];

    int currentValue = initialValue;

    for (int i = initialValue; i < finalValue; i += interval) {
      currentValue += interval;

      data.add(currentValue);
    }

    return data;
  }

  List<int> _primaryGeneratedList = [];
  List<int> _secondaryGeneratedList = [];

  @override
  void initState() {
    super.initState();
    _primaryGeneratedList = generateDataList(
      initialValue: widget.primaryInitialValue!,
      finalValue: widget.primaryFinalValue!,
      interval: widget.primaryValueInterval!,
    );

    _secondaryGeneratedList = generateDataList(
      initialValue: widget.secondaryInitialValue!,
      finalValue: widget.secondaryFinalValue!,
      interval: widget.secondaryValueInterval!,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  ///Build Picker Widgets (Primary, Secondary, and Label)

  Widget _buildPicker({
    Alignment? alignment,
    double? offAxisFraction,
    required List<int> values,
    bool? alignValuesToRight,
    double? alignmentPadding,
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
      onSelectedItemChanged: widget.onSelectedItemIndexChanged,
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
            onSelectedItemChanged: widget.onSelectedItemIndexChanged,
          );
  }

  Widget pickerMode() {
    switch (widget.mode) {
      case SicklerListWheelScrollViewPickerMode.integer:
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
                    : SizedBox(),
              ],
            );
          },
        );

      case SicklerListWheelScrollViewPickerMode.duration:
        // if (widget.primaryUnitLabels != null ||
        //     widget.secondaryUnitLabels != null ||
        //     widget.primaryInitialValue != null ||
        //     widget.primaryFinalValue != null ||
        //     widget.secondaryInitialValue != null ||
        //     widget.secondaryFinalValue != null) {
        //   throw ErrorHint(
        //       "For a Duration Mode, the primaryUnitLabels,secondaryUnitLabels, primaryInitialValue, primaryFinalValue, secondaryInitialValue, secondaryFinalValue, must all be null, consider removing any values.");
        // }

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

                  print(hourSize.width);
                  print(parentWidth);

                  print((hourSize.width + widget.scrollViewToLabelPadding * 2) /
                      parentWidth);

                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
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
                  final double parentWidth = constraints.maxWidth;
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
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

      case SicklerListWheelScrollViewPickerMode.time:
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
                  final double parentWidth = constraints.maxWidth;
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
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
                        child: _buildPickerLabels(labelList: ["AM", "PM"]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );

      case SicklerListWheelScrollViewPickerMode.decimal:
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
                  final double parentWidth = constraints.maxWidth;
                  final Size primaryScrollViewMaxSize =
                      _getLargestLabelSize(_primaryGeneratedList);
                  return Stack(
                    children: [
                      ///Primary Picker
                      _buildPicker(
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
                          labelList: [widget.primaryUnitLabels?.first ?? ""],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );

      case SicklerListWheelScrollViewPickerMode.text:
        if (widget.textDataValuesList == null) {
          throw ErrorHint(
              "For a Text Mode,  the textDataValuesList must not be null, Consider providing all the text values to choose from in a list");
        }

        // else if (widget.primaryUnitLabels != null ||
        //     widget.secondaryUnitLabels != null ||
        //     widget.primaryInitialValue != null ||
        //     widget.primaryFinalValue != null ||
        //     widget.secondaryInitialValue != null ||
        //     widget.secondaryFinalValue != null ||
        //     widget.primaryValueInterval != null ||
        //     widget.secondaryValueInterval != null) {
        //   throw ErrorHint(
        //       "For a Text Mode, the primaryUnitLabels,secondaryUnitLabels, primaryInitialValue, primaryFinalValue, secondaryInitialValue, secondaryFinalValue, primaryValueInterval, and secondaryValueInterval must all be null, consider removing any values.");
        // }

        ///Todo: Fix the picker in the case where the values are text, use generics
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
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border:
                        Border.all(width: 1, color: theme.colorScheme.primary)),
          ),
          pickerMode(),
        ],
      ),
    );
  }
}
