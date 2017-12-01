require 'rails_helper'

RSpec.describe BmiCalculator do
  context 'call' do
    let(:bmi) { BmiCalculator.call(weight: 100, height: 1.60) }
    let(:bmi_english){ BmiCalculator.call(weight: to_pounds(100), height: to_inches(1.60), unit_system: 'e') }

    it 'fails if no height is given' do
      x = BmiCalculator.call(weight: 100)
      expect(x.success?).to_not be_truthy
    end

    it 'fails if no weight is given' do
      bmi = BmiCalculator.call(height: 1.60)
      expect(bmi.success?).to_not be_truthy
    end

    it 'has metric system as default units' do
      bmi = BmiCalculator.call(weight: 100, height: 1.60)
      expect(bmi.unit_system).to eql('m')
    end

    it 'returns a Obesity Class II for the given examples' do
      expect(bmi.bmi_category).to be_present
      expect(bmi.bmi_category).to eql('Obese Class II (Severely obese)')
      # it returns the same category for the english system
      expect(bmi_english.bmi_category).to eql(bmi.bmi_category)
    end

  end
end

def to_inches(meters)
  meters * 39.37007874
end

def to_pounds(kilos)
  kilos * 2.20462262185
end