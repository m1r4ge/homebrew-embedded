require 'formula'

class ArmElfBinutils < Formula
  homepage 'http://www.gnu.org/software/binutils/'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.23.tar.gz'
  sha1 '470c388c97ac8d216de33fa397d7be9f96c3fe04'

  def install
    target = 'arm-none-eabi'

    system './configure', "--target=#{target}", "--prefix=#{prefix}",
      '--enable-interwork', '--enable-multilib', '--disable-nls',
      '--disable-shared', '--disable-threads', '--disable-install-libiberty',
      '--with-gcc', '--with-gnu-as', '--with-gnu-ld'

    system 'make'
    system 'make', 'install'

    rm_f "#{lib}/x86_64/libiberty.a"
  end
end