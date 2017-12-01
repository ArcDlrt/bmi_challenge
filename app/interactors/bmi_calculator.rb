class BmiCalculator
  include Interactor

  before do
    context.error_messages = []
    context.unit_system ||= 'm'

    validate_fields
    context.fail!(message: error_message) unless context.error_messages.empty?
  end

  def call

    context.bmi_value = self.send("bmi_#{context.unit_system}_system")
    context.bmi_category = calculate_bmi_category

  end

  private

  def validate_fields
    if invalid_height?
      context.error_messages << 'Invalid height'
    elsif invalid_weight?
      context.error_messages << 'Invalid weight'
    end
  end

  def invalid_height?
    context.height.blank? || (context.height <= 0)
  end

  def invalid_weight?
    context.weight.blank? || (context.weight <= 0)
  end

  def error_message
    context.error_messages.map{|e| "<li>#{e}</li>"}.join
  end

  def bmi_m_system
    (context.weight / context.height**2).round(2)
  end

  def bmi_e_system
    ((context.weight / context.height**2) * 703).round(2)
  end

  def calculate_bmi_category
    if context.bmi_value < 15
      'Very severely underweight'
    elsif context.bmi_value >= 15 && context.bmi_value < 16
      'Severely underweight'
    elsif context.bmi_value >= 16 && context.bmi_value < 18.5
      'Underweight'
    elsif context.bmi_value >= 18.5 && context.bmi_value < 25
      'Normal (healthy weight)'
    elsif context.bmi_value >= 25 && context.bmi_value < 30
      'Overweight'
    elsif context.bmi_value >= 30 && context.bmi_value < 35
      'Obese Class I (Moderately obese)'
    elsif context.bmi_value >= 35 && context.bmi_value < 40
      'Obese Class II (Severely obese)'
    elsif context.bmi_value >= 40
      'Obese Class III (Very severely obese)'
    end
  end

end