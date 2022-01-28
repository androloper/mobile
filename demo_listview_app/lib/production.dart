class Production {
  int? tip;
  String? stokAdBar;
  int? partiSayisi;
  double? yuzdeDeger;
  String? stokAd;
  double? sUMPratikMiktar;
  double? sUMTeorikMiktar;

  Production(
      {this.tip,
        this.stokAdBar,
        this.partiSayisi,
        this.yuzdeDeger,
        this.stokAd,
        this.sUMPratikMiktar,
        this.sUMTeorikMiktar});

  Production.fromJson(Map<String, dynamic> json) {
    tip = json['Tip'];
    stokAdBar = json['StokAdBar'];
    partiSayisi = json['PartiSayisi'];
    yuzdeDeger = json['YuzdeDeger'];
    stokAd = json['StokAd'];
    sUMPratikMiktar = json['SUM_PratikMiktar'];
    sUMTeorikMiktar = json['SUM_TeorikMiktar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Tip'] = this.tip;
    data['StokAdBar'] = this.stokAdBar;
    data['PartiSayisi'] = this.partiSayisi;
    data['YuzdeDeger'] = this.yuzdeDeger;
    data['StokAd'] = this.stokAd;
    data['SUM_PratikMiktar'] = this.sUMPratikMiktar;
    data['SUM_TeorikMiktar'] = this.sUMTeorikMiktar;
    return data;
  }
}