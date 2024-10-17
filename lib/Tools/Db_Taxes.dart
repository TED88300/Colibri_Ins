






class Taxe {
  final int? taxeId;
  final int? taxe_activiteId;
  final int? taxe_base;
  final int? taxe_tx;
  final int? taxe_mt;

  Taxe({
    this.taxeId,
    this.taxe_activiteId,
    this.taxe_base,
    this.taxe_tx,
    this.taxe_mt,
  });

  Map<String, dynamic> toMap() {
    return {
      'taxeId': taxeId,
      'taxe_activiteId': taxe_activiteId,
      'taxe_base': taxe_base,
      'taxe_tx': taxe_tx,
      'taxe_mt': taxe_mt,
    };
  }

  @override
  String toString() {
    return 'Taxe{taxeId: $taxeId, taxe_contribuableId: $taxe_activiteId, taxe_base: $taxe_base, taxe_tx: $taxe_tx, taxe_mt: $taxe_mt}';
  }
}



class TaxeHisto {
  int? taxehistoId;
  int? taxehisto_activiteId;
  String? taxehisto_Date;
  int? taxehisto_mt_paye;


  TaxeHisto({
    this.taxehistoId,
    this.taxehisto_activiteId,
    this.taxehisto_Date,
    this.taxehisto_mt_paye,
  });

  Map<String, dynamic> toMap() {
    return {
      'taxehistoId': taxehistoId,
      'taxehisto_activiteId': taxehisto_activiteId,
      'taxehisto_Date': taxehisto_Date,
      'taxehisto_mt_paye': taxehisto_mt_paye,

    };
  }

  @override
  String toString() {
    return 'Taxe{taxehistoId: $taxehistoId, taxehisto_activiteId: $taxehisto_activiteId, taxehisto_Date: $taxehisto_Date, taxehisto_mt_paye: $taxehisto_mt_paye}';
  }
}

