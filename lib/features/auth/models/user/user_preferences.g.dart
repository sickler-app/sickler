// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const UserPreferencesSchema = Schema(
  name: r'UserPreferences',
  id: -7545901164102504045,
  properties: {
    r'isFirstTime': PropertySchema(
      id: 0,
      name: r'isFirstTime',
      type: IsarType.bool,
    ),
    r'isOnboarded': PropertySchema(
      id: 1,
      name: r'isOnboarded',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 2,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'lengthUnit': PropertySchema(
      id: 3,
      name: r'lengthUnit',
      type: IsarType.string,
      enumMap: _UserPreferenceslengthUnitEnumValueMap,
    ),
    r'massUnit': PropertySchema(
      id: 4,
      name: r'massUnit',
      type: IsarType.string,
      enumMap: _UserPreferencesmassUnitEnumValueMap,
    ),
    r'themeMode': PropertySchema(
      id: 5,
      name: r'themeMode',
      type: IsarType.string,
      enumMap: _UserPreferencesthemeModeEnumValueMap,
    ),
    r'uid': PropertySchema(
      id: 6,
      name: r'uid',
      type: IsarType.string,
    ),
    r'volumeUnit': PropertySchema(
      id: 7,
      name: r'volumeUnit',
      type: IsarType.string,
      enumMap: _UserPreferencesvolumeUnitEnumValueMap,
    )
  },
  estimateSize: _userPreferencesEstimateSize,
  serialize: _userPreferencesSerialize,
  deserialize: _userPreferencesDeserialize,
  deserializeProp: _userPreferencesDeserializeProp,
);

int _userPreferencesEstimateSize(
  UserPreferences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.lengthUnit;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.massUnit;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.themeMode;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.uid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.volumeUnit;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _userPreferencesSerialize(
  UserPreferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isFirstTime);
  writer.writeBool(offsets[1], object.isOnboarded);
  writer.writeDateTime(offsets[2], object.lastUpdated);
  writer.writeString(offsets[3], object.lengthUnit?.name);
  writer.writeString(offsets[4], object.massUnit?.name);
  writer.writeString(offsets[5], object.themeMode?.name);
  writer.writeString(offsets[6], object.uid);
  writer.writeString(offsets[7], object.volumeUnit?.name);
}

UserPreferences _userPreferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserPreferences(
    isFirstTime: reader.readBoolOrNull(offsets[0]) ?? true,
    isOnboarded: reader.readBoolOrNull(offsets[1]) ?? false,
    lastUpdated: reader.readDateTimeOrNull(offsets[2]),
    lengthUnit: _UserPreferenceslengthUnitValueEnumMap[
        reader.readStringOrNull(offsets[3])],
    massUnit: _UserPreferencesmassUnitValueEnumMap[
        reader.readStringOrNull(offsets[4])],
    themeMode: _UserPreferencesthemeModeValueEnumMap[
        reader.readStringOrNull(offsets[5])],
    uid: reader.readStringOrNull(offsets[6]),
    volumeUnit: _UserPreferencesvolumeUnitValueEnumMap[
        reader.readStringOrNull(offsets[7])],
  );
  return object;
}

P _userPreferencesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (_UserPreferenceslengthUnitValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 4:
      return (_UserPreferencesmassUnitValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 5:
      return (_UserPreferencesthemeModeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_UserPreferencesvolumeUnitValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _UserPreferenceslengthUnitEnumValueMap = {
  r'pound': r'pound',
  r'ounce': r'ounce',
  r'kilogram': r'kilogram',
  r'gram': r'gram',
  r'milligram': r'milligram',
  r'kilometres': r'kilometres',
  r'metres': r'metres',
  r'centimetres': r'centimetres',
  r'millimetres': r'millimetres',
  r'miles': r'miles',
  r'inches': r'inches',
  r'feet': r'feet',
  r'litres': r'litres',
  r'millilitres': r'millilitres',
  r'centilitres': r'centilitres',
  r'gallons': r'gallons',
};
const _UserPreferenceslengthUnitValueEnumMap = {
  r'pound': Units.pound,
  r'ounce': Units.ounce,
  r'kilogram': Units.kilogram,
  r'gram': Units.gram,
  r'milligram': Units.milligram,
  r'kilometres': Units.kilometres,
  r'metres': Units.metres,
  r'centimetres': Units.centimetres,
  r'millimetres': Units.millimetres,
  r'miles': Units.miles,
  r'inches': Units.inches,
  r'feet': Units.feet,
  r'litres': Units.litres,
  r'millilitres': Units.millilitres,
  r'centilitres': Units.centilitres,
  r'gallons': Units.gallons,
};
const _UserPreferencesmassUnitEnumValueMap = {
  r'pound': r'pound',
  r'ounce': r'ounce',
  r'kilogram': r'kilogram',
  r'gram': r'gram',
  r'milligram': r'milligram',
  r'kilometres': r'kilometres',
  r'metres': r'metres',
  r'centimetres': r'centimetres',
  r'millimetres': r'millimetres',
  r'miles': r'miles',
  r'inches': r'inches',
  r'feet': r'feet',
  r'litres': r'litres',
  r'millilitres': r'millilitres',
  r'centilitres': r'centilitres',
  r'gallons': r'gallons',
};
const _UserPreferencesmassUnitValueEnumMap = {
  r'pound': Units.pound,
  r'ounce': Units.ounce,
  r'kilogram': Units.kilogram,
  r'gram': Units.gram,
  r'milligram': Units.milligram,
  r'kilometres': Units.kilometres,
  r'metres': Units.metres,
  r'centimetres': Units.centimetres,
  r'millimetres': Units.millimetres,
  r'miles': Units.miles,
  r'inches': Units.inches,
  r'feet': Units.feet,
  r'litres': Units.litres,
  r'millilitres': Units.millilitres,
  r'centilitres': Units.centilitres,
  r'gallons': Units.gallons,
};
const _UserPreferencesthemeModeEnumValueMap = {
  r'system': r'system',
  r'light': r'light',
  r'dark': r'dark',
};
const _UserPreferencesthemeModeValueEnumMap = {
  r'system': ThemeMode.system,
  r'light': ThemeMode.light,
  r'dark': ThemeMode.dark,
};
const _UserPreferencesvolumeUnitEnumValueMap = {
  r'pound': r'pound',
  r'ounce': r'ounce',
  r'kilogram': r'kilogram',
  r'gram': r'gram',
  r'milligram': r'milligram',
  r'kilometres': r'kilometres',
  r'metres': r'metres',
  r'centimetres': r'centimetres',
  r'millimetres': r'millimetres',
  r'miles': r'miles',
  r'inches': r'inches',
  r'feet': r'feet',
  r'litres': r'litres',
  r'millilitres': r'millilitres',
  r'centilitres': r'centilitres',
  r'gallons': r'gallons',
};
const _UserPreferencesvolumeUnitValueEnumMap = {
  r'pound': Units.pound,
  r'ounce': Units.ounce,
  r'kilogram': Units.kilogram,
  r'gram': Units.gram,
  r'milligram': Units.milligram,
  r'kilometres': Units.kilometres,
  r'metres': Units.metres,
  r'centimetres': Units.centimetres,
  r'millimetres': Units.millimetres,
  r'miles': Units.miles,
  r'inches': Units.inches,
  r'feet': Units.feet,
  r'litres': Units.litres,
  r'millilitres': Units.millilitres,
  r'centilitres': Units.centilitres,
  r'gallons': Units.gallons,
};

extension UserPreferencesQueryFilter
    on QueryBuilder<UserPreferences, UserPreferences, QFilterCondition> {
  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      isFirstTimeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFirstTime',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      isOnboardedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOnboarded',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lengthUnit',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lengthUnit',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitEqualTo(
    Units? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lengthUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitGreaterThan(
    Units? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lengthUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitLessThan(
    Units? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lengthUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitBetween(
    Units? lower,
    Units? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lengthUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lengthUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lengthUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lengthUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lengthUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lengthUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      lengthUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lengthUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'massUnit',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'massUnit',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitEqualTo(
    Units? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'massUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitGreaterThan(
    Units? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'massUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitLessThan(
    Units? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'massUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitBetween(
    Units? lower,
    Units? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'massUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'massUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'massUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'massUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'massUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'massUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      massUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'massUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'themeMode',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'themeMode',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeEqualTo(
    ThemeMode? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeGreaterThan(
    ThemeMode? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeLessThan(
    ThemeMode? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeBetween(
    ThemeMode? lower,
    ThemeMode? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'themeMode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'themeMode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      themeModeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'themeMode',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uid',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'volumeUnit',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'volumeUnit',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitEqualTo(
    Units? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volumeUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitGreaterThan(
    Units? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volumeUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitLessThan(
    Units? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volumeUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitBetween(
    Units? lower,
    Units? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volumeUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'volumeUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'volumeUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'volumeUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'volumeUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volumeUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<UserPreferences, UserPreferences, QAfterFilterCondition>
      volumeUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'volumeUnit',
        value: '',
      ));
    });
  }
}

extension UserPreferencesQueryObject
    on QueryBuilder<UserPreferences, UserPreferences, QFilterCondition> {}
