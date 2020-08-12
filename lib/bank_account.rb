class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name) # can initialize a Bank Account
    @name = name #initializes with a name
    @balance = 1000 #always initializes with balance of 1000
    @status = "open"
  end

  def deposit(amount) #can deposit money into its account
    @balance += amount
  end

  def display_balance #can display its balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0 #is valid with an open status and a balance greater than 0
  end

  def close_account
    @status = "closed" #can close its account
  end

  def self.all
    @@all
  end


end
