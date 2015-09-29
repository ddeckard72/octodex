class CountingPlayer
  def initialize
    @count = 0
  end

  def get_guess(result)
    @count += 1
  end
end