class Nucleotide
  VALID_NUCLEOTIDE = 'ACGT'.chars

  def self.from_dna(dna)
    Nucleotide.new(dna)
  end

  def count(nuc)
    @dna.count(nuc)
  end

  def histogram
    nucleotides = VALID_NUCLEOTIDE.to_h { |k| [k, 0] }
    @dna.chars.each_with_object(nucleotides) do |n, result|
      result[n] += 1
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
    invalid = dna.chars.uniq - VALID_NUCLEOTIDE
    raise ArgumentError unless invalid.empty?
  end
end
