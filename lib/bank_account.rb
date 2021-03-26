class BankAccount
@@all = []
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end


    def self.all
        @@all
    end

    def deposit(funds)
        self.balance += funds
    end

    def withdraw(funds)
        self.balance -= funds
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        @status == "open" && @balance > 0
    end

    def close_account
        self.status = "closed"
    end

end
