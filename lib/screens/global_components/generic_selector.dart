import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Defines the layout options for the [GenericSelector].
enum SelectorLayout {
  /// Arranges items in a vertical column.
  column,

  /// Arranges items in a horizontal row.
  row,

  /// Arranges items in a wrap layout, moving to the next line when space runs out.
  wrap
}

/// A flexible, customizable selector widget that supports single and multi-select modes.
///
/// This widget allows for selection from a list of items of any type T. It can be
/// configured to display items in a column, row, or wrap layout, and supports both
/// single-select and multi-select modes.
///
/// The generic type [T] represents the type of items being selected. This can be
/// any type, such as String, int, or a custom object.
///
/// The generic type [W] represents the type of selectable widget used to display
/// each item. It must be a subclass of [SelectableWidget].
///
/// For consistency, all widgets made to use with this selector should follow the
/// naming convention 'Selectable[WidgetName]'. For example, a selectable version
/// of a Chip would be named 'SelectableChip'.
class GenericSelector<T, W extends SelectableWidget> extends StatefulWidget {
  /// Callback function called when the selection changes.
  ///
  /// This function is called with a list of all currently selected items whenever
  /// the selection changes.
  final void Function(List<T> selectedItems) onItemSelected;

  /// Function that builds a selectable widget for each item.
  ///
  /// This function is called for each item in [items] and should return a widget
  /// of type [W] that represents that item. The [isSelected] parameter indicates
  /// whether the item is currently selected.
  final W Function(T item, bool isSelected, VoidCallback onPressed)
      selectableWidgetBuilder;

  /// The list of selectable items.
  final List<T> items;

  /// The initially selected item(s).
  ///
  /// In single-select mode, only the first item in this list (if provided) will be selected.
  final List<T>? initialSelection;

  /// The layout to use for arranging the items.
  ///
  /// Defaults to [SelectorLayout.row].
  final SelectorLayout layout;

  /// Whether to allow multiple items to be selected.
  ///
  /// If true, multiple items can be selected. If false, only one item can be selected at a time.
  /// Defaults to false.
  final bool isMultiSelectMode;

  /// How the children within a run should be placed in the main axis in a wrap layout.
  ///
  /// For example, if [wrapAlignment] is [WrapAlignment.center], the children in
  /// each run are grouped together in the center of their run in the main axis.
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment wrapAlignment;

  /// How the runs themselves should be placed in the cross axis in a wrap layout.
  ///
  /// For example, if [wrapRunAlignment] is [WrapAlignment.center], the runs are
  /// grouped together in the center of the overall [Wrap] in the cross axis.
  ///
  /// Defaults to [WrapAlignment.start].
  final WrapAlignment wrapRunAlignment;

  /// How much space to place between children in a run in the main axis in a wrap layout.
  ///
  /// For example, if [wrapSpacing] is 10.0, the children will be spaced at least
  /// 10.0 logical pixels apart in the main axis.
  ///
  /// Defaults to 0.0.
  final double wrapSpacing;

  /// How much space to place between the runs themselves in the cross axis in a wrap layout.
  ///
  /// For example, if [wrapRunSpacing] is 10.0, the runs will be spaced at least
  /// 10.0 logical pixels apart in the cross axis.
  ///
  /// Defaults to 0.0.
  final double wrapRunSpacing;

  /// Creates a [GenericSelector].
  ///
  /// The [items], [onItemSelected], and [selectableWidgetBuilder] parameters are required.
  const GenericSelector({
    super.key,
    required this.onItemSelected,
    required this.items,
    required this.selectableWidgetBuilder,
    this.layout = SelectorLayout.row,
    this.isMultiSelectMode = false,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapRunAlignment = WrapAlignment.start,
    this.wrapSpacing = 8,
    this.wrapRunSpacing = 8,
    this.initialSelection,
  });

  @override
  State<GenericSelector> createState() => _GenericSelectorState<T, W>();
}

class _GenericSelectorState<T, W extends SelectableWidget>
    extends State<GenericSelector<T, W>> {
  /// The set of currently selected items.
  late Set<T> selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = Set<T>.from(widget.initialSelection ?? []);
  }

  /// Handles the selection or deselection of an item.
  void _toggleSelection({required T item, required int index}) {
    HapticFeedback.mediumImpact();
    Feedback.forTap(context);

    setState(() {
      if (widget.isMultiSelectMode) {
        if (selectedItems.contains(item)) {
          selectedItems.remove(item);
        } else {
          selectedItems.add(item);
        }
      } else {
        selectedItems = {item};
      }
    });
    widget.onItemSelected(selectedItems.toList());
  }

  @override
  Widget build(BuildContext context) {
    List<W> itemWidgets = List.generate(widget.items.length, (index) {
      return widget.selectableWidgetBuilder(
          widget.items[index], selectedItems.contains(widget.items[index]), () {
        _toggleSelection(item: widget.items[index], index: index);
      });
    }).toList();

    switch (widget.layout) {
      case SelectorLayout.column:
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: itemWidgets,
        );
      case SelectorLayout.row:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: itemWidgets,
        );
      case SelectorLayout.wrap:
        return Wrap(
          alignment: widget.wrapAlignment,
          runAlignment: widget.wrapRunAlignment,
          spacing: widget.wrapSpacing,
          runSpacing: widget.wrapRunSpacing,
          children: itemWidgets,
        );
    }
  }
}

/// Abstract class for creating selectable widgets to be used with [GenericSelector].
///
/// When implementing a selectable widget, name it following the convention
/// 'Selectable[WidgetName]'. For example, a selectable version of a Chip
/// should be named 'SelectableChip'.
abstract class SelectableWidget extends Widget {
  const SelectableWidget({super.key});

  /// Whether this widget is currently selected.
  bool get isSelected;

  /// Callback function to be called when this widget is selected.
  VoidCallback get onSelected;
}
