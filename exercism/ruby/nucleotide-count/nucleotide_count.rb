class Nucleotide
  VALID_NUC = 'ACGT'.chars

  def self.from_dna(dna)
    Nucleotide.new(dna)
  end

  def count(nuc)
    @dna.count(nuc)
  end

  def histogram
    hash = VALID_NUC.inject({}) { |hash, nuc| hash[nuc] = 0; hash }
    @dna.chars.each_with_object(hash) do |nuc, result|
      result[nuc] += 1
    end
  end

  private

  def initialize(dna)
    validate_nucleuotides! dna
    @dna = dna
  end

  # Validate the dna. Could also pre-compute all the counts here
  # and use that to validate
  def validate_nucleuotides!(dna)
    invalid = dna.chars.uniq - VALID_NUC
    raise ArgumentError unless invalid.empty?
  end
end
