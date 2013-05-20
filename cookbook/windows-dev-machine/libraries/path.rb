module Path
    def self.home(path)
      File.join(ENV['HOME'], path)
    end

    def self.bin(path)
      File.join(ENV['HOME'], 'bin', path)
    end

    def self.program_files(path, x86 = false)
      program_files = x86 ? 'Program Files (x86)' : 'Program Files'
      File.join(ENV['SYSTEMDRIVE'], program_files, path)
    end
end
