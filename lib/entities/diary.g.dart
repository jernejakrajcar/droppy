// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDiaryCollection on Isar {
  IsarCollection<Diary> get diarys => this.collection();
}

const DiarySchema = CollectionSchema(
  name: r'Diary',
  id: -5216934141026337743,
  properties: {},
  estimateSize: _diaryEstimateSize,
  serialize: _diarySerialize,
  deserialize: _diaryDeserialize,
  deserializeProp: _diaryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'entries': LinkSchema(
      id: 7731676264987787386,
      name: r'entries',
      target: r'DiaryEntry',
      single: false,
      linkName: r'diary',
    )
  },
  embeddedSchemas: {},
  getId: _diaryGetId,
  getLinks: _diaryGetLinks,
  attach: _diaryAttach,
  version: '3.1.0+1',
);

int _diaryEstimateSize(
  Diary object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _diarySerialize(
  Diary object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
Diary _diaryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Diary();
  object.id = id;
  return object;
}

P _diaryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _diaryGetId(Diary object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _diaryGetLinks(Diary object) {
  return [object.entries];
}

void _diaryAttach(IsarCollection<dynamic> col, Id id, Diary object) {
  object.id = id;
  object.entries.attach(col, col.isar.collection<DiaryEntry>(), r'entries', id);
}

extension DiaryQueryWhereSort on QueryBuilder<Diary, Diary, QWhere> {
  QueryBuilder<Diary, Diary, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DiaryQueryWhere on QueryBuilder<Diary, Diary, QWhereClause> {
  QueryBuilder<Diary, Diary, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Diary, Diary, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Diary, Diary, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Diary, Diary, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Diary, Diary, QAfterWhereClause> idBetween(
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

extension DiaryQueryFilter on QueryBuilder<Diary, Diary, QFilterCondition> {
  QueryBuilder<Diary, Diary, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Diary, Diary, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Diary, Diary, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Diary, Diary, QAfterFilterCondition> idBetween(
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
}

extension DiaryQueryObject on QueryBuilder<Diary, Diary, QFilterCondition> {}

extension DiaryQueryLinks on QueryBuilder<Diary, Diary, QFilterCondition> {
  QueryBuilder<Diary, Diary, QAfterFilterCondition> entries(
      FilterQuery<DiaryEntry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'entries');
    });
  }

  QueryBuilder<Diary, Diary, QAfterFilterCondition> entriesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'entries', length, true, length, true);
    });
  }

  QueryBuilder<Diary, Diary, QAfterFilterCondition> entriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'entries', 0, true, 0, true);
    });
  }

  QueryBuilder<Diary, Diary, QAfterFilterCondition> entriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'entries', 0, false, 999999, true);
    });
  }

  QueryBuilder<Diary, Diary, QAfterFilterCondition> entriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'entries', 0, true, length, include);
    });
  }

  QueryBuilder<Diary, Diary, QAfterFilterCondition> entriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'entries', length, include, 999999, true);
    });
  }

  QueryBuilder<Diary, Diary, QAfterFilterCondition> entriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'entries', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DiaryQuerySortBy on QueryBuilder<Diary, Diary, QSortBy> {}

extension DiaryQuerySortThenBy on QueryBuilder<Diary, Diary, QSortThenBy> {
  QueryBuilder<Diary, Diary, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Diary, Diary, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension DiaryQueryWhereDistinct on QueryBuilder<Diary, Diary, QDistinct> {}

extension DiaryQueryProperty on QueryBuilder<Diary, Diary, QQueryProperty> {
  QueryBuilder<Diary, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
