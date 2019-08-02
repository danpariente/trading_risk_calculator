require "rspec"
require "./risk_calculator"

RSpec.describe RiskCalculator do
  it "calculates pips risked based on ATR indicator" do
    atr = 14
    calculator = RiskCalculator.new(atr: atr)

    result = calculator.pips

    expect(result).to eq(21)
  end

  it "calculates the amount to be risk according to percentage of tolerance" do
    balance = 148.5
    calculator = RiskCalculator.new(balance: balance)

    result = calculator.risk

    expect(result).to eq(2.97)
  end
  context "#pip_value" do
    it "returns the value when risk is set" do
      balance = 148.5
      atr = 14
      calculator = RiskCalculator.new(balance: balance, atr: atr)

      result = calculator.pip_value

      expect(result).to eq(0.14)
    end
  end

  it "determines where to set the stop loss" do
    pending
    atr = 14
    exchange_rate = 1.10880
    calculator = RiskCalculator.new(atr: atr)

    result = calculator.stop_loss(exchange_rate)

    expect(result).to eq(1.10859)
  end
end
