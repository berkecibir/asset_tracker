enum AssetType {
  altin('ALTIN'),
  usdPure('USDPURE'),
  usdTry('USDTRY'),
  ons('ONS'),
  eurTry('EURTRY'),
  usdKg('USDKG'),
  eurUsd('EURUSD'),
  eurKg('EURKG'),
  ayar22('AYAR22'),
  gbpTry('GBPTRY'),
  chfTry('CHFTRY'),
  kulceAltin('KULCEALTIN'),
  audTry('AUDTRY'),
  xauXag('XAUXAG'),
  ceyrekYeni('CEYREK_YENI'),
  cadTry('CADTRY'),
  ceyrekEski('CEYREK_ESKI'),
  sarTry('SARTRY'),
  yarimYeni('YARIM_YENI'),
  yarimEski('YARIM_ESKI'),
  jpyTry('JPYTRY'),
  audUsd('AUDUSD'),
  tekYeni('TEK_YENI'),
  tekEski('TEK_ESKI'),
  sekTry('SEKTRY'),
  ataYeni('ATA_YENI'),
  dkkTry('DKKTRY'),
  ataEski('ATA_ESKI'),
  nokTry('NOKTRY'),
  ata5Yeni('ATA5_YENI'),
  usdJpy('USDJPY'),
  ata5Eski('ATA5_ESKI'),
  gremeseYeni('GREMESE_YENI'),
  gremeseEski('GREMESE_ESKI'),
  ayar14('AYAR14'),
  gumusTry('GUMUSTRY'),
  xagUsd('XAGUSD'),
  gumusUsd('GUMUSUSD'),
  unknown('-');

  final String code;
  const AssetType(this.code);
}

extension AssetTypeExtension on AssetType {
  String get displayName {
    switch (this) {
      case AssetType.altin:
        return 'Gram Altın';
      case AssetType.usdPure:
        return 'Ham Dolar';
      case AssetType.usdTry:
        return 'Dolar';
      case AssetType.ons:
        return 'Ons';
      case AssetType.eurTry:
        return 'Euro';
      case AssetType.usdKg:
        return 'Dolar/KG';
      case AssetType.eurUsd:
        return 'Euro/Dolar';
      case AssetType.eurKg:
        return 'Euro/KG';
      case AssetType.ayar22:
        return '22 Ayar Altın';
      case AssetType.gbpTry:
        return 'Sterlin';
      case AssetType.chfTry:
        return 'İsviçre Frangı';
      case AssetType.kulceAltin:
        return 'Külçe Altın';
      case AssetType.audTry:
        return 'Avustralya Doları';
      case AssetType.xauXag:
        return 'Altın Gümüş Oranı';
      case AssetType.ceyrekYeni:
        return 'Çeyrek Altın (Yeni)';
      case AssetType.cadTry:
        return 'Kanada Doları';
      case AssetType.ceyrekEski:
        return 'Çeyrek Altın (Eski)';
      case AssetType.sarTry:
        return 'Suudi Arabistan Riyali';
      case AssetType.yarimYeni:
        return 'Yarım Altın (Yeni)';
      case AssetType.yarimEski:
        return 'Yarım Altın (Eski)';
      case AssetType.jpyTry:
        return 'Japon Yeni';
      case AssetType.audUsd:
        return 'Avustralya Doları/Dolar';
      case AssetType.tekYeni:
        return 'Tam Altın (Yeni)';
      case AssetType.tekEski:
        return 'Tam Altın (Eski)';
      case AssetType.sekTry:
        return 'İsveç Kronu';
      case AssetType.ataYeni:
        return 'Ata Altın (Yeni)';
      case AssetType.dkkTry:
        return 'Danimarka Kronu';
      case AssetType.ataEski:
        return 'Ata Altın (Eski)';
      case AssetType.nokTry:
        return 'Norveç Kronu';
      case AssetType.ata5Yeni:
        return '5\'li Ata Altın (Yeni)';
      case AssetType.usdJpy:
        return 'Dolar/Japon Yeni';
      case AssetType.ata5Eski:
        return '5\'li Ata Altın (Eski)';
      case AssetType.gremeseYeni:
        return 'Gremese Altın (Yeni)';
      case AssetType.gremeseEski:
        return 'Gremese Altın (Eski)';
      case AssetType.ayar14:
        return '14 Ayar Altın';
      case AssetType.gumusTry:
        return 'Gümüş';
      case AssetType.xagUsd:
        return 'Gümüş USD';
      case AssetType.gumusUsd:
        return 'Gümüş USD';
      case AssetType.unknown:
        return 'Bilinmeyen';
    }
  }
}
