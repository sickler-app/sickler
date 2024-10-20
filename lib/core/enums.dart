enum AppState { initial, submitting, success, error }

enum AuthState { authenticated, unauthenticated }

enum SicklerButtonType { primary, secondary, outline, text }

enum SicklerChipType { filter, info }

///Todo: might deprecate selected colors
@Deprecated("Might replace the Selector Colors enum type")
enum SelectorColors { purple, blue, green, red, orange }

enum Gender { male, female }

enum Genotype { as, ss, aa, na }

enum AppListWheelScrollViewPickerMode {
  integer,
  duration,
  time,
  decimal,
  text
}

enum MedicationType {
  tabletsPills,
  capsules,
  droplets,
  injections,
  liquids,
  inhaler,
  creamsOrGels,
  custom
}

enum Units {
  ///Mass Measurement Units
  pound,
  ounce,
  kilogram,
  gram,
  milligram,

  /// Length measurement units
  kilometres,
  metres,
  centimetres,
  millimetres,
  miles,
  inches,
  feet,

  ///Volume measurement units
  litres,
  millilitres,
  centilitres,
  gallons;

  String get symbol {
    switch (this) {
      case Units.pound:
        return 'lb';
      case Units.ounce:
        return 'oz';
      case Units.kilogram:
        return 'kg';
      case Units.gram:
        return 'g';
      case Units.milligram:
        return 'mg';
      case Units.kilometres:
        return 'km';
      case Units.metres:
        return 'm';
      case Units.centimetres:
        return 'cm';
      case Units.millimetres:
        return 'mm';
      case Units.miles:
        return 'mi';
      case Units.inches:
        return 'in';
      case Units.feet:
        return 'ft';
      case Units.litres:
        return 'L';
      case Units.millilitres:
        return 'ml';
      case Units.centilitres:
        return 'cl';
      case Units.gallons:
        return 'gal';
    }
  }
}

enum MedsScheduleEndingState {
  ///An Enum to define the states of the Medication repeat ending format.
  never,
  onDate,
  afterNumberOfOccurrences
}

enum MedsHistoryMode {
  ///An Enum to define the medication history modes
  ///can be used on the [MedsHistoryItem] widget
  ///Can be used for the Meds history mode dropdown
  ///Can be used for switching medication history mode
  daily,
  weekly,
  monthly,
  yearly
}

enum RelationType {
  ///An Enum to define the Relation Types
  ///Can be used for selecting Emergency Contact Relations

  brother,
  sister,
  mother,
  father,
  doctor,
  nurse,
  friend,
}
