class RiskCalculator
  ATR_RATIO = 1.5
  RISK_PERCENTAGE = 0.02

  private_constant :ATR_RATIO, :RISK_PERCENTAGE
  attr_writer :atr_ratio, :risk_percentage

  def initialize(balance:, atr:)
    @balance = balance
    @atr = atr
  end

  def pip_value
    (risk / (atr_ratio * atr)).round(2)
  end

  def risk
    balance * risk_percentage
  end

  def pips
    atr_ratio * atr
  end

  private

  attr_reader :atr, :balance

  def atr_ratio
    @atr_ratio ||= ATR_RATIO
  end

  def risk_percentage
    @risk_percentage ||= RISK_PERCENTAGE
  end
end
