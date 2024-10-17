// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sickler_user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSicklerUserCollection on Isar {
  IsarCollection<CircleUser> get sicklerUsers => this.collection();
}

const SicklerUserSchema = CollectionSchema(
  name: r'SicklerUser',
  id: 4452497618066263105,
  properties: {
    r'email': PropertySchema(
      id: 0,
      name: r'email',
      type: IsarType.string,
    ),
    r'isAnonymous': PropertySchema(
      id: 1,
      name: r'isAnonymous',
      type: IsarType.bool,
    ),
    r'isEmailVerified': PropertySchema(
      id: 2,
      name: r'isEmailVerified',
      type: IsarType.bool,
    ),
    r'isPhoneVerified': PropertySchema(
      id: 3,
      name: r'isPhoneVerified',
      type: IsarType.bool,
    ),
    r'photoUrl': PropertySchema(
      id: 4,
      name: r'photoUrl',
      type: IsarType.string,
    ),
    r'preferences': PropertySchema(
      id: 5,
      name: r'preferences',
      type: IsarType.object,
      target: r'UserPreferences',
    ),
    r'profile': PropertySchema(
      id: 6,
      name: r'profile',
      type: IsarType.object,
      target: r'UserProfile',
    ),
    r'uid': PropertySchema(
      id: 7,
      name: r'uid',
      type: IsarType.string,
    )
  },
  estimateSize: _sicklerUserEstimateSize,
  serialize: _sicklerUserSerialize,
  deserialize: _sicklerUserDeserialize,
  deserializeProp: _sicklerUserDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'UserProfile': UserProfileSchema,
    r'UserPreferences': UserPreferencesSchema
  },
  getId: _sicklerUserGetId,
  getLinks: _sicklerUserGetLinks,
  attach: _sicklerUserAttach,
  version: '3.1.0+1',
);

int _sicklerUserEstimateSize(
  CircleUser object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.email.length * 3;
  {
    final value = object.photoUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 +
      UserPreferencesSchema.estimateSize(
          object.preferences, allOffsets[UserPreferences]!, allOffsets);
  bytesCount += 3 +
      UserProfileSchema.estimateSize(
          object.profile, allOffsets[UserProfile]!, allOffsets);
  bytesCount += 3 + object.uid.length * 3;
  return bytesCount;
}

void _sicklerUserSerialize(
  CircleUser object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.email);
  writer.writeBool(offsets[1], object.isAnonymous);
  writer.writeBool(offsets[2], object.isEmailVerified);
  writer.writeBool(offsets[3], object.isPhoneVerified);
  writer.writeString(offsets[4], object.photoUrl);
  writer.writeObject<UserPreferences>(
    offsets[5],
    allOffsets,
    UserPreferencesSchema.serialize,
    object.preferences,
  );
  writer.writeObject<UserProfile>(
    offsets[6],
    allOffsets,
    UserProfileSchema.serialize,
    object.profile,
  );
  writer.writeString(offsets[7], object.uid);
}

CircleUser _sicklerUserDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CircleUser(
    email: reader.readString(offsets[0]),
    isAnonymous: reader.readBool(offsets[1]),
    isEmailVerified: reader.readBoolOrNull(offsets[2]) ?? false,
    isPhoneVerified: reader.readBoolOrNull(offsets[3]) ?? false,
    photoUrl: reader.readStringOrNull(offsets[4]),
    preferences: reader.readObjectOrNull<UserPreferences>(
          offsets[5],
          UserPreferencesSchema.deserialize,
          allOffsets,
        ) ??
        UserPreferences.empty,
    profile: reader.readObjectOrNull<UserProfile>(
          offsets[6],
          UserProfileSchema.deserialize,
          allOffsets,
        ) ??
        UserProfile.empty,
    uid: reader.readString(offsets[7]),
  );
  return object;
}

P _sicklerUserDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readObjectOrNull<UserPreferences>(
            offset,
            UserPreferencesSchema.deserialize,
            allOffsets,
          ) ??
          UserPreferences.empty) as P;
    case 6:
      return (reader.readObjectOrNull<UserProfile>(
            offset,
            UserProfileSchema.deserialize,
            allOffsets,
          ) ??
          UserProfile.empty) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sicklerUserGetId(CircleUser object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sicklerUserGetLinks(CircleUser object) {
  return [];
}

void _sicklerUserAttach(
    IsarCollection<dynamic> col, Id id, CircleUser object) {}

extension SicklerUserQueryWhereSort
    on QueryBuilder<CircleUser, CircleUser, QWhere> {
  QueryBuilder<CircleUser, CircleUser, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SicklerUserQueryWhere
    on QueryBuilder<CircleUser, CircleUser, QWhereClause> {
  QueryBuilder<CircleUser, CircleUser, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SicklerUserQueryFilter
    on QueryBuilder<CircleUser, CircleUser, QFilterCondition> {
  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      emailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> emailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> emailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      isAnonymousEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isAnonymous',
        value: value,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      isEmailVerifiedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEmailVerified',
        value: value,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      isPhoneVerifiedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPhoneVerified',
        value: value,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'photoUrl',
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'photoUrl',
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> photoUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'photoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'photoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> photoUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'photoUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'photoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'photoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'photoUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> photoUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'photoUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'photoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      photoUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'photoUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidEqualTo(
    String value, {
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

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidGreaterThan(
    String value, {
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

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidLessThan(
    String value, {
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

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidBetween(
    String lower,
    String upper, {
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

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidStartsWith(
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

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidEndsWith(
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

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> uidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uid',
        value: '',
      ));
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition>
      uidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uid',
        value: '',
      ));
    });
  }
}

extension SicklerUserQueryObject
    on QueryBuilder<CircleUser, CircleUser, QFilterCondition> {
  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> preferences(
      FilterQuery<UserPreferences> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'preferences');
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterFilterCondition> profile(
      FilterQuery<UserProfile> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'profile');
    });
  }
}

extension SicklerUserQueryLinks
    on QueryBuilder<CircleUser, CircleUser, QFilterCondition> {}

extension SicklerUserQuerySortBy
    on QueryBuilder<CircleUser, CircleUser, QSortBy> {
  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByIsAnonymous() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAnonymous', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByIsAnonymousDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAnonymous', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByIsEmailVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEmailVerified', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy>
      sortByIsEmailVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEmailVerified', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByIsPhoneVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPhoneVerified', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy>
      sortByIsPhoneVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPhoneVerified', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByPhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUrl', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByPhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUrl', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> sortByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension SicklerUserQuerySortThenBy
    on QueryBuilder<CircleUser, CircleUser, QSortThenBy> {
  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByIsAnonymous() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAnonymous', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByIsAnonymousDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAnonymous', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByIsEmailVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEmailVerified', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy>
      thenByIsEmailVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isEmailVerified', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByIsPhoneVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPhoneVerified', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy>
      thenByIsPhoneVerifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPhoneVerified', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByPhotoUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUrl', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByPhotoUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'photoUrl', Sort.desc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.asc);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QAfterSortBy> thenByUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uid', Sort.desc);
    });
  }
}

extension SicklerUserQueryWhereDistinct
    on QueryBuilder<CircleUser, CircleUser, QDistinct> {
  QueryBuilder<CircleUser, CircleUser, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QDistinct> distinctByIsAnonymous() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAnonymous');
    });
  }

  QueryBuilder<CircleUser, CircleUser, QDistinct>
      distinctByIsEmailVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isEmailVerified');
    });
  }

  QueryBuilder<CircleUser, CircleUser, QDistinct>
      distinctByIsPhoneVerified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPhoneVerified');
    });
  }

  QueryBuilder<CircleUser, CircleUser, QDistinct> distinctByPhotoUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'photoUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CircleUser, CircleUser, QDistinct> distinctByUid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uid', caseSensitive: caseSensitive);
    });
  }
}

extension SicklerUserQueryProperty
    on QueryBuilder<CircleUser, CircleUser, QQueryProperty> {
  QueryBuilder<CircleUser, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CircleUser, String, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<CircleUser, bool, QQueryOperations> isAnonymousProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAnonymous');
    });
  }

  QueryBuilder<CircleUser, bool, QQueryOperations> isEmailVerifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isEmailVerified');
    });
  }

  QueryBuilder<CircleUser, bool, QQueryOperations> isPhoneVerifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPhoneVerified');
    });
  }

  QueryBuilder<CircleUser, String?, QQueryOperations> photoUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'photoUrl');
    });
  }

  QueryBuilder<CircleUser, UserPreferences, QQueryOperations>
      preferencesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferences');
    });
  }

  QueryBuilder<CircleUser, UserProfile, QQueryOperations> profileProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profile');
    });
  }

  QueryBuilder<CircleUser, String, QQueryOperations> uidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uid');
    });
  }
}
