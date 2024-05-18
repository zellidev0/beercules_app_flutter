import 'package:beercules/gen/assets.gen.dart';
import 'package:beercules/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

enum BeerculesCardType {
  abstimmung,
  alleFuerEinen,
  aufzaehlung,
  beerLove,
  biergott,
  deckelDrauf,
  dreiGeschenkeVonHerzen,
  einGeschenkVonHerzen,
  eisprinzessin,
  filmriss,
  fragenkoenig,
  haendeHoch,
  ichHabNochNie,
  ichPackeMeinenKoffer,
  kettenreaktion,
  knutschkarte,
  links,
  mensHealth,
  ohrenSpitzen,
  opferglas,
  rechts,
  reimschwein,
  richtungswechsel,
  schereSteinPaarBier,
  singNoSong,
  spiegelSpiegel,
  tauschrausch,
  trinkBuddy,
  womensHealth,
  bier123,
  basicRule1,
  basicRule2,
  basicRule3;

  bool isVictimGlass() => this == BeerculesCardType.opferglas;
  bool isBasicRule() =>
      this == BeerculesCardType.basicRule1 ||
      this == BeerculesCardType.basicRule2 ||
      this == BeerculesCardType.basicRule3;

  Widget asset() => switch (this) {
        BeerculesCardType.abstimmung => Assets.instructions.aBSTIMMUNGPic.svg(),
        BeerculesCardType.alleFuerEinen =>
          Assets.instructions.aLLEFUEREINENPic.svg(),
        BeerculesCardType.aufzaehlung =>
          Assets.instructions.aUFZAEHLUNGPic.svg(),
        BeerculesCardType.beerLove => Assets.instructions.bEERLOVEPic.svg(),
        BeerculesCardType.biergott => Assets.instructions.bIERGOTTPic.svg(),
        BeerculesCardType.deckelDrauf =>
          Assets.instructions.dECKELDRAUFPic.svg(),
        BeerculesCardType.dreiGeschenkeVonHerzen =>
          Assets.instructions.dREIGESCHENKEVONHERZENPic.svg(),
        BeerculesCardType.einGeschenkVonHerzen =>
          Assets.instructions.eINGESCHENKVONHERZENPic.svg(),
        BeerculesCardType.eisprinzessin =>
          Assets.instructions.eISPRINZESSINPic.svg(),
        BeerculesCardType.filmriss => Assets.instructions.fILMRISSPic.svg(),
        BeerculesCardType.fragenkoenig =>
          Assets.instructions.fRAGENKOENIGPic.svg(),
        BeerculesCardType.haendeHoch => Assets.instructions.hAENDEHOCHPic.svg(),
        BeerculesCardType.ichHabNochNie =>
          Assets.instructions.iCHHABNOCHNIEPic.svg(),
        BeerculesCardType.ichPackeMeinenKoffer =>
          Assets.instructions.iCHPACKEMEINENKOFFERPic.svg(),
        BeerculesCardType.kettenreaktion =>
          Assets.instructions.kETTENREAKTIONPic.svg(),
        BeerculesCardType.knutschkarte =>
          Assets.instructions.kNUTSCHKARTEPic.svg(),
        BeerculesCardType.links => Assets.instructions.lINKSPic.svg(),
        BeerculesCardType.mensHealth => Assets.instructions.mENSHEALTHPic.svg(),
        BeerculesCardType.ohrenSpitzen =>
          Assets.instructions.oHRENSPITZENPic.svg(),
        BeerculesCardType.opferglas => Assets.instructions.oPFERGLASPic.svg(),
        BeerculesCardType.rechts => Assets.instructions.rECHTSPic.svg(),
        BeerculesCardType.reimschwein =>
          Assets.instructions.rEIMSCHWEINPic.svg(),
        BeerculesCardType.richtungswechsel =>
          Assets.instructions.rICHTUNGSWECHSELPic.svg(),
        BeerculesCardType.schereSteinPaarBier =>
          Assets.instructions.sCHERESTEINPAARBIERPic.svg(),
        BeerculesCardType.singNoSong => Assets.instructions.sINGNOSONGPic.svg(),
        BeerculesCardType.spiegelSpiegel =>
          Assets.instructions.sPIEGLEINSPIEGLEINPic.svg(),
        BeerculesCardType.tauschrausch =>
          Assets.instructions.tAUSCHRAUSCHPic.svg(),
        BeerculesCardType.trinkBuddy => Assets.instructions.tRINKBUDDYPic.svg(),
        BeerculesCardType.womensHealth =>
          Assets.instructions.wOMENSHEALTHPic.svg(),
        BeerculesCardType.bier123 => Assets.instructions.bIER123Pic.svg(),
        BeerculesCardType.basicRule1 => Assets.images.logo.image(),
        BeerculesCardType.basicRule2 => Assets.images.logo.image(),
        BeerculesCardType.basicRule3 => Assets.images.logo.image(),
      };

  String localizedDescription({
    required final bool isLastVictimGlass,
  }) =>
      switch (this) {
        BeerculesCardType.abstimmung =>
          LocaleKeys.game_view_instructions_ABSTIMMUNG_description,
        BeerculesCardType.alleFuerEinen =>
          LocaleKeys.game_view_instructions_ALLE_FUER_EINEN_description,
        BeerculesCardType.aufzaehlung =>
          LocaleKeys.game_view_instructions_AUFZAEHLUNG_description,
        BeerculesCardType.beerLove =>
          LocaleKeys.game_view_instructions_BEER_LOVE_description,
        BeerculesCardType.biergott =>
          LocaleKeys.game_view_instructions_BIERGOTT_description,
        BeerculesCardType.deckelDrauf =>
          LocaleKeys.game_view_instructions_DECKEL_DRAUF_description,
        BeerculesCardType.dreiGeschenkeVonHerzen => LocaleKeys
            .game_view_instructions_DREI_GESCHENKE_VON_HERZEN_description,
        BeerculesCardType.einGeschenkVonHerzen =>
          LocaleKeys.game_view_instructions_EIN_GESCHENK_VON_HERZEN_description,
        BeerculesCardType.eisprinzessin =>
          LocaleKeys.game_view_instructions_EISPRINZESSIN_description,
        BeerculesCardType.filmriss =>
          LocaleKeys.game_view_instructions_FILMRISS_description,
        BeerculesCardType.fragenkoenig =>
          LocaleKeys.game_view_instructions_FRAGENKOENIG_description,
        BeerculesCardType.haendeHoch =>
          LocaleKeys.game_view_instructions_HAENDE_HOCH_description,
        BeerculesCardType.ichHabNochNie =>
          LocaleKeys.game_view_instructions_ICH_HAB_NOCH_NIE_description,
        BeerculesCardType.ichPackeMeinenKoffer =>
          LocaleKeys.game_view_instructions_ICH_PACKE_MEINEN_KOFFER_description,
        BeerculesCardType.kettenreaktion =>
          LocaleKeys.game_view_instructions_KETTENREAKTION_description,
        BeerculesCardType.knutschkarte =>
          LocaleKeys.game_view_instructions_KNUTSCHKARTE_description,
        BeerculesCardType.links =>
          LocaleKeys.game_view_instructions_LINKS_description,
        BeerculesCardType.mensHealth =>
          LocaleKeys.game_view_instructions_MENS_HEALTH_description,
        BeerculesCardType.ohrenSpitzen =>
          LocaleKeys.game_view_instructions_OHREN_SPITZEN_description,
        BeerculesCardType.opferglas => isLastVictimGlass
            ? LocaleKeys.game_view_instructions_OPFERGLAS_LAST_description
            : LocaleKeys.game_view_instructions_OPFERGLAS_description,
        BeerculesCardType.rechts =>
          LocaleKeys.game_view_instructions_RECHTS_description,
        BeerculesCardType.reimschwein =>
          LocaleKeys.game_view_instructions_REIMSCHWEIN_description,
        BeerculesCardType.richtungswechsel =>
          LocaleKeys.game_view_instructions_RICHTUNGSWECHSEL_description,
        BeerculesCardType.schereSteinPaarBier =>
          LocaleKeys.game_view_instructions_SCHERE_STEIN_PAAR_BIER_description,
        BeerculesCardType.singNoSong =>
          LocaleKeys.game_view_instructions_SING_NO_SONG_description,
        BeerculesCardType.spiegelSpiegel =>
          LocaleKeys.game_view_instructions_SPIEGLEIN_SPIEGLEIN_description,
        BeerculesCardType.tauschrausch =>
          LocaleKeys.game_view_instructions_TAUSCHRAUSCH_description,
        BeerculesCardType.trinkBuddy =>
          LocaleKeys.game_view_instructions_TRINK_BUDDY_description,
        BeerculesCardType.womensHealth =>
          LocaleKeys.game_view_instructions_WOMENS_HEALTH_description,
        BeerculesCardType.bier123 =>
          LocaleKeys.game_view_instructions__1_2_3_BIER_description,
        BeerculesCardType.basicRule1 =>
          LocaleKeys.game_view_instructions_BASIC_RULE_1_description,
        BeerculesCardType.basicRule2 =>
          LocaleKeys.game_view_instructions_BASIC_RULE_2_description,
        BeerculesCardType.basicRule3 =>
          LocaleKeys.game_view_instructions_BASIC_RULE_3_description,
      }
          .tr();

  BeerculesCardEventType eventType() => switch (this) {
        BeerculesCardType.abstimmung => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.alleFuerEinen => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.aufzaehlung => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.beerLove =>
          BeerculesCardEventType.withinNextRoundOnce,
        BeerculesCardType.biergott => BeerculesCardEventType.entireGame,
        BeerculesCardType.deckelDrauf =>
          BeerculesCardEventType.withinNextRoundOnce,
        BeerculesCardType.dreiGeschenkeVonHerzen =>
          BeerculesCardEventType.immediateOnce,
        BeerculesCardType.einGeschenkVonHerzen =>
          BeerculesCardEventType.immediateOnce,
        BeerculesCardType.eisprinzessin =>
          BeerculesCardEventType.withinNextRoundOnce,
        BeerculesCardType.filmriss => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.fragenkoenig => BeerculesCardEventType.entireGame,
        BeerculesCardType.haendeHoch =>
          BeerculesCardEventType.withinNextRoundOnce,
        BeerculesCardType.ichHabNochNie => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.ichPackeMeinenKoffer =>
          BeerculesCardEventType.immediateOnce,
        BeerculesCardType.kettenreaktion =>
          BeerculesCardEventType.immediateOnce,
        BeerculesCardType.knutschkarte => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.links => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.mensHealth => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.ohrenSpitzen =>
          BeerculesCardEventType.withinNextRoundOnce,
        BeerculesCardType.opferglas => BeerculesCardEventType.entireGame,
        BeerculesCardType.rechts => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.reimschwein => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.richtungswechsel =>
          BeerculesCardEventType.immediateOnce,
        BeerculesCardType.schereSteinPaarBier =>
          BeerculesCardEventType.immediateOnce,
        BeerculesCardType.singNoSong => BeerculesCardEventType.entireGame,
        BeerculesCardType.spiegelSpiegel =>
          BeerculesCardEventType.immediateOnce,
        BeerculesCardType.tauschrausch =>
          BeerculesCardEventType.withinNextRoundOnce,
        BeerculesCardType.trinkBuddy => BeerculesCardEventType.entireGame,
        BeerculesCardType.womensHealth => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.bier123 => BeerculesCardEventType.immediateOnce,
        BeerculesCardType.basicRule1 => BeerculesCardEventType.entireGame,
        BeerculesCardType.basicRule2 => BeerculesCardEventType.entireGame,
        BeerculesCardType.basicRule3 => BeerculesCardEventType.entireGame,
      };

  String localizedTitle({
    required final bool isLastVictimGlass,
  }) =>
      switch (this) {
        BeerculesCardType.abstimmung =>
          LocaleKeys.game_view_instructions_ABSTIMMUNG_title,
        BeerculesCardType.alleFuerEinen =>
          LocaleKeys.game_view_instructions_ALLE_FUER_EINEN_title,
        BeerculesCardType.aufzaehlung =>
          LocaleKeys.game_view_instructions_AUFZAEHLUNG_title,
        BeerculesCardType.beerLove =>
          LocaleKeys.game_view_instructions_BEER_LOVE_title,
        BeerculesCardType.biergott =>
          LocaleKeys.game_view_instructions_BIERGOTT_title,
        BeerculesCardType.deckelDrauf =>
          LocaleKeys.game_view_instructions_DECKEL_DRAUF_title,
        BeerculesCardType.dreiGeschenkeVonHerzen =>
          LocaleKeys.game_view_instructions_DREI_GESCHENKE_VON_HERZEN_title,
        BeerculesCardType.einGeschenkVonHerzen =>
          LocaleKeys.game_view_instructions_EIN_GESCHENK_VON_HERZEN_title,
        BeerculesCardType.eisprinzessin =>
          LocaleKeys.game_view_instructions_EISPRINZESSIN_title,
        BeerculesCardType.filmriss =>
          LocaleKeys.game_view_instructions_FILMRISS_title,
        BeerculesCardType.fragenkoenig =>
          LocaleKeys.game_view_instructions_FRAGENKOENIG_title,
        BeerculesCardType.haendeHoch =>
          LocaleKeys.game_view_instructions_HAENDE_HOCH_title,
        BeerculesCardType.ichHabNochNie =>
          LocaleKeys.game_view_instructions_ICH_HAB_NOCH_NIE_title,
        BeerculesCardType.ichPackeMeinenKoffer =>
          LocaleKeys.game_view_instructions_ICH_PACKE_MEINEN_KOFFER_title,
        BeerculesCardType.kettenreaktion =>
          LocaleKeys.game_view_instructions_KETTENREAKTION_title,
        BeerculesCardType.knutschkarte =>
          LocaleKeys.game_view_instructions_KNUTSCHKARTE_title,
        BeerculesCardType.links =>
          LocaleKeys.game_view_instructions_LINKS_title,
        BeerculesCardType.mensHealth =>
          LocaleKeys.game_view_instructions_MENS_HEALTH_title,
        BeerculesCardType.ohrenSpitzen =>
          LocaleKeys.game_view_instructions_OHREN_SPITZEN_title,
        BeerculesCardType.opferglas => isLastVictimGlass
            ? LocaleKeys.game_view_instructions_OPFERGLAS_LAST_title
            : LocaleKeys.game_view_instructions_OPFERGLAS_title,
        BeerculesCardType.rechts =>
          LocaleKeys.game_view_instructions_RECHTS_title,
        BeerculesCardType.reimschwein =>
          LocaleKeys.game_view_instructions_REIMSCHWEIN_title,
        BeerculesCardType.richtungswechsel =>
          LocaleKeys.game_view_instructions_RICHTUNGSWECHSEL_title,
        BeerculesCardType.schereSteinPaarBier =>
          LocaleKeys.game_view_instructions_SCHERE_STEIN_PAAR_BIER_title,
        BeerculesCardType.singNoSong =>
          LocaleKeys.game_view_instructions_SING_NO_SONG_title,
        BeerculesCardType.spiegelSpiegel =>
          LocaleKeys.game_view_instructions_SPIEGLEIN_SPIEGLEIN_title,
        BeerculesCardType.tauschrausch =>
          LocaleKeys.game_view_instructions_TAUSCHRAUSCH_title,
        BeerculesCardType.trinkBuddy =>
          LocaleKeys.game_view_instructions_TRINK_BUDDY_title,
        BeerculesCardType.womensHealth =>
          LocaleKeys.game_view_instructions_WOMENS_HEALTH_title,
        BeerculesCardType.bier123 =>
          LocaleKeys.game_view_instructions__1_2_3_BIER_title,
        BeerculesCardType.basicRule1 =>
          LocaleKeys.game_view_instructions_BASIC_RULE_1_title,
        BeerculesCardType.basicRule2 =>
          LocaleKeys.game_view_instructions_BASIC_RULE_2_title,
        BeerculesCardType.basicRule3 =>
          LocaleKeys.game_view_instructions_BASIC_RULE_3_title,
      }
          .tr();
}

enum BeerculesCardEventType {
  immediateOnce,
  withinNextRoundOnce,
  entireGame,
}
