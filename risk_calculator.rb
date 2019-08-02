class RiskCalculator
  ATR_RATIO = 1.5
  RISK_PERCENTAGE = 0.02

  def initialize(balance: nil, atr: nil)
    @balance = balance
    @atr = atr
  end

  def pip_value
    (risk / (ATR_RATIO * atr)).round(2)
  end

  def risk
    balance * RISK_PERCENTAGE
  end

  def pips
    ATR_RATIO * atr
  end

  private

  attr_reader :atr, :balance
end
