class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending" # always initializes with a status of 'pending'
  end

  def valid? #can check that both accounts are valid
    if sender.valid? && receiver.valid? #calls on the sender and receiver's #valid? methods
      true
    else
      false
    end
  end

  def execute_transaction
    if !self.valid? || @sender.balance < @amount
      @status = "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
        @sender.deposit( @amount * -1 )
        @receiver.deposit( @amount )
        @status = "complete"
    end
  end
      # BankAccount.all.map do | person |
      #   if person == @sender
      #     person.balance -= @amount
      #   elsif person == @receiver
      #     person.balance += @amount
      #   end
      # end
  #   #
  #   # end
  #   # @status = "complete"
  #
  # end





  # def execute_transaction
  #   if !self.valid? && @sender.balance < @amount
  #     @status = "rejected"
  #       return "Transaction rejected. Please check your account balance."
  #
  #   elsif @status == "complete"
  #     puts "Transaction was already executed"
  #   else
  #     @sender.deposit( @amount * -1 )
  #     @receiver.deposit( @amount )
  #     @status = "complete"
  #   end
  # end


end
