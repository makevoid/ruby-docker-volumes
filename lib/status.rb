
# ---------------------

# class Coinbase
# end
#
# class ETH
# end

class Status
  def initialize
    # ...
  end

  def parity_down?
    down = true
    # down = false if ETH.coinbase == Coinbase.read
    down
  end

  def privacy_server_down?
    down = true
    down
  end
end
