module Question
  def sorok_dwa?
    self == 42
  end
end

class Integer
  include Question
end
