class ChangeMaker
  # Returns an array of the least amount of coins required to get to 'amount'
  # **Assumption** Change can always be made - BONUS POINTS - raise an error if
  # change can not be made
  # Params:
  # +amount+:: The amount to make change for
  # +denominations+:: An array containing the denominations that can be used.
  #                   Defaults to standard US coin denominations

  def self.make_change(amount, denominations=[1,5,10,25])
    change = []
    dispenser(amount, change, denominations.sort.reverse)
  end

  def self.dispenser(amount, change, denominations)
    denominations.each do |denom|
      while amount >= denom do
        change << denom
        amount -= denom
      end
    end
    change
  end

end

class ChangeError < StandardError; end
