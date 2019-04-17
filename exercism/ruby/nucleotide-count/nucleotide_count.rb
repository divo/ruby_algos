class Nucleotide
  VALID_NUC = 'ACGT'.chars

  def self.from_dna(dna)
    Nucleotide.new(dna)
  end

  def count(nuc)
    @dna.count { |m| m == nuc }
  end

  def histogram
    VALID_NUC.inject({}) do |result, nuc|
      result.update(nuc => count(nuc))
    end
  end

  private

  def initialize(dna)
    validate_nucleuotides! dna
    @dna = dna.chars
  end

  # Validate the dna. Could also pre-compute all the counts here
  # and use that to validate
  def validate_nucleuotides!(dna)
    invalid = dna.chars.uniq - VALID_NUC
    raise ArgumentError unless invalid.empty?
  end
end
