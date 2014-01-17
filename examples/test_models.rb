module TestModels
  @@setup = false

  def self.setup
    @@setup = true
  end

  def self.was_setup?
    @@setup
  end

  def self.unsetup
    @@setup = false
  end
end
