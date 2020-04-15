# frozen_string_literal: true

class InvalidCodonError < StandardError; end

# rna translation class
class Translation
  TABLE = { AUG: 'Methionine', UUU: 'Phenylalanine', UUC: 'Phenylalanine',
            UUA: 'Leucine', UUG: 'Leucine', UCU: 'Serine', UCC: 'Serine',
            UCA: 'Serine', UCG: 'Serine', UAU: 'Tyrosine', UAC: 'Tyrosine',
            UGU: 'Cysteine', UGC: 'Cysteine', UGG: 'Tryptophan', UAA: 'STOP',
            UAG: 'STOP', UGA: 'STOP' }.freeze

  class << self
    def of_codon(codon)
      TABLE.fetch(codon.to_sym) { raise InvalidCodonError }
    end

    def of_rna(strand)
      strand.scan(/.../).map { |codon| of_codon(codon) }
            .take_while { |amino_acid| amino_acid != 'STOP' }
    end
  end
end
