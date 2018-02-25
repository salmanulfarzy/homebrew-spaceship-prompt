class SpaceshipPrompt < Formula
  desc "Zsh prompt for Astronauts"
  homepage  "https://github.com/denysdovhan/spaceship-prompt"
  url "https://github.com/denysdovhan/spaceship-prompt/archive/v3.2.0.tar.gz"
  sha256 "451aa12fc84eb78399d5ebbcaf9ca227ec113f82f9ada46e5116aab03d8e4720"
  head "https://github.com/denysdovhan/spaceship-prompt.git"

  bottle :unneeded

  def install
    (zsh_function/"sections").install Dir["sections/*"]
    (zsh_function/"lib").install Dir["lib/*"]
    zsh_function.install "spaceship.zsh" => "prompt_spaceship_setup"
  end

  def caveats; <<~EOS
    You should add the following to your $HOME/.zshrc:
      autoload -U promptinit; promptinit
      propmt spaceship
    EOS
  end

  test do
    system "true"
  end
end
