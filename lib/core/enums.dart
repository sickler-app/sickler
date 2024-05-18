enum AppState { initial, submitting, success, error }

enum AuthState {  authenticated, unauthenticated }

enum SicklerButtonType { primary, secondary, outline, text }

enum SicklerChipType { filter, info }

///Todo: might deprecate selected colors
@Deprecated("Might replace the Selector Colors enum type")
enum SelectorColors { purple, blue, green, red, orange }

enum Gender { male, female }

enum Genotype { as, ss, aa }

enum SicklerListWheelScrollViewPickerMode {
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



// enum VolumeType {
//   volume1,
//   volume2,
//   volume3,
//   volume4,
//   volume5,
// }


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
