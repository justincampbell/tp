module Keyboard
  extend self

  def wait_for_enter
    $stdin.gets
  end
end
