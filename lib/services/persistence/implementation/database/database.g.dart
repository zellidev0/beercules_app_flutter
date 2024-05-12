// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DatabaseCardImpl _$$DatabaseCardImplFromJson(Map<String, dynamic> json) =>
    _$DatabaseCardImpl(
      type: $enumDecode(_$BeerculesCardTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$DatabaseCardImplToJson(_$DatabaseCardImpl instance) =>
    <String, dynamic>{
      'type': _$BeerculesCardTypeEnumMap[instance.type]!,
      'amount': instance.amount,
    };

const _$BeerculesCardTypeEnumMap = {
  BeerculesCardType.abstimmung: 'abstimmung',
  BeerculesCardType.alleFuerEinen: 'alleFuerEinen',
  BeerculesCardType.aufzaehlung: 'aufzaehlung',
  BeerculesCardType.beerLove: 'beerLove',
  BeerculesCardType.biergott: 'biergott',
  BeerculesCardType.deckelDrauf: 'deckelDrauf',
  BeerculesCardType.dreiGeschenkeVonHerzen: 'dreiGeschenkeVonHerzen',
  BeerculesCardType.einGeschenkVonHerzen: 'einGeschenkVonHerzen',
  BeerculesCardType.eisprinzessin: 'eisprinzessin',
  BeerculesCardType.filmriss: 'filmriss',
  BeerculesCardType.fragenkoenig: 'fragenkoenig',
  BeerculesCardType.haendeHoch: 'haendeHoch',
  BeerculesCardType.ichHabNochNie: 'ichHabNochNie',
  BeerculesCardType.ichPackeMeinenKoffer: 'ichPackeMeinenKoffer',
  BeerculesCardType.kettenreaktion: 'kettenreaktion',
  BeerculesCardType.knutschkarte: 'knutschkarte',
  BeerculesCardType.links: 'links',
  BeerculesCardType.mensHealth: 'mensHealth',
  BeerculesCardType.ohrenSpitzen: 'ohrenSpitzen',
  BeerculesCardType.opferglas: 'opferglas',
  BeerculesCardType.rechts: 'rechts',
  BeerculesCardType.reimschwein: 'reimschwein',
  BeerculesCardType.richtungswechsel: 'richtungswechsel',
  BeerculesCardType.schereSteinPaarBier: 'schereSteinPaarBier',
  BeerculesCardType.singNoSong: 'singNoSong',
  BeerculesCardType.spiegelSpiegel: 'spiegelSpiegel',
  BeerculesCardType.tauschrausch: 'tauschrausch',
  BeerculesCardType.trinkBuddy: 'trinkBuddy',
  BeerculesCardType.womensHealth: 'womensHealth',
  BeerculesCardType.bier123: 'bier123',
  BeerculesCardType.basicRule1: 'basicRule1',
  BeerculesCardType.basicRule2: 'basicRule2',
  BeerculesCardType.basicRule3: 'basicRule3',
};
