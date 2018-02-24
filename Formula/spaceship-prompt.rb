class SpaceshipPrompt < Formula
  desc "Zsh prompt for Astronauts"
  homepage  "https://github.com/denysdovhan/spaceship-prompt"
  url "https://github.com/denysdovhan/spaceship-prompt/archive/v3.0.2.tar.gz"
  sha256 "da1cd2306f5e71bb02266be6e21505ddd420e2c3297a3e99e86cb94d672c32b9"
  head "https://github.com/denysdovhan/spaceship-prompt.git"

  bottle :unneeded

  def install
    # (prefix/"sections").install Dir["sections/*"]
    # lib.install Dir["lib/*"]
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
