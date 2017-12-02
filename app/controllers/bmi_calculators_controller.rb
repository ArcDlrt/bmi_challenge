class BmiCalculatorsController < ApplicationController

  def index
  end

  def calculate
    @bmi = BmiCalculator.call(
      unit_system: bmi_params['unit_system'],
      weight: bmi_params['weight'].to_f,
      height: bmi_params['height'].to_f,
    )

    respond_to do |format|
      format.js
    end
  end

  private

  def bmi_params
    params.require(:bmi).permit(:unit_system, :weight, :height)
  end
end
