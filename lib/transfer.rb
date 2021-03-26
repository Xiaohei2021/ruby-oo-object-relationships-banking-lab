require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    
    @sender.valid? && @receiver.valid?
    
  end

  def execute_transaction
  if @sender.balance >= amount && valid? && self.status == "pending"
    @sender.withdraw(amount) && @receiver.deposit(amount)
    self.status = "complete"
  else
    
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  # binding.pry
  end


def reverse_transfer
  
  if valid? && @receiver.balance >= amount && valid? && self.status == "complete" 
       @sender.deposit(amount) && @receiver.withdraw(amount)
       self.status = "reversed" 
  end

end


end
