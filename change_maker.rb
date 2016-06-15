class ChangeMaker
  # Returns an array of the least amount of coins required to get to 'amount'
  # **Assumption** Change can always be made - BONUS POINTS - raise an error if
  # change can not be made
  # Params:
  # +amount+:: The amount to make change for
  # +denominations+:: An array containing the denominations that can be used.
  #                   Defaults to standard US coin denominations

  def self.make_change(amount, denominations=[1,5,10,25])
    dispenser(amount, denominations)
  end

  def self.dispenser(amount, denominations)
    change, original_amount = [], amount

    denominations.permutation(denominations.count).to_a.each do |denom_set|
      temp_change, amount = [], original_amount

      denom_set.each do |denom|
        while amount >= denom do
          temp_change << denom
          amount -= denom
        end
      end

      if change.empty?
        change = temp_change
      elsif temp_change.count < change.count
        change = temp_change
      end
    end
    change
  end

end

class ChangeError < StandardError; end
