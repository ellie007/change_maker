class ChangeMaker
  # Returns an array of the least amount of coins required to get to 'amount'
  # **Assumption** Change can always be made - BONUS POINTS - raise an error if
  # change can not be made
  # Params:
  # +amount+:: The amount to make change for
  # +denominations+:: An array containing the denominations that can be used.
  #                   Defaults to standard US coin denominations

  def self.make_change(amount, denominations=[1,5,10,25])
    dispense(amount, denominations)
  end

  private

  def self.dispense(amount, denominations)
    dispensed_change, original_amount = [], amount
    denominations.permutation(denominations.count).to_a.each do |denom_set|
      temp_change, amount = [], original_amount
      denom_set.each do |denom|
        while amount >= denom do
          temp_change << denom
          amount -= denom
        end
      end
      dispensed_change = most_efficient_change_dispensation(dispensed_change, temp_change)
    end
    return change_result(dispensed_change, original_amount)
  end

  def self.most_efficient_change_dispensation(dispensed_change, temp_change)
    if dispensed_change.empty?
      dispensed_change = temp_change
    elsif temp_change.count < dispensed_change.count
      dispensed_change = temp_change
    end
    dispensed_change
  end

  def self.change_result(dispensed_change, original_amount)
    if change_equals_original_amount(dispensed_change, original_amount)
      dispensed_change
    else
      raise ChangeError
    end
  end

  def self.change_equals_original_amount(dispensed_change, original_amount)
    dispensed_change.inject(0){|sum,x| sum + x } == original_amount
  end
end

class ChangeError < StandardError; end
