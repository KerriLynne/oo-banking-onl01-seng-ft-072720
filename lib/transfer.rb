class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending" # always initializes with a status of 'pending'
  end

  def valid? #can check that both accounts are valid
    sender.valid? && receiver.valid? #calls on the sender and receiver's #valid? methods
  end

  def execute_transaction
    if !self.valid? || @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status == "pending"
        @sender.deposit( @amount * -1 )
        @receiver.deposit( @amount )
        @status = "complete"
    end
  end

  def reverse_transfer
    @receiver.deposit( @amount * -1 )
    @sender.deposit( @amount )
    "reversed"
  end






end
