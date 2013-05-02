require 'rake'

  linkables = Dir.glob('**/*{.symlink}')
  directs = Dir.glob('**/*{.direct}')
  xdg_config = Dir.glob('**/*{.config}')

desc "Hook our dotfiles into system-standard positions."
task :install do

  skip_all = false
  overwrite_all = false
  backup_all = false

  class Array
  def convert dest, prefix
    skip_all = false
    overwrite_all = false
    backup_all = false

    self.each do |linkable|
      overwrite = false
      backup = false
  
      file = linkable.split('/').last.split(prefix).last
      base = "#{ENV["HOME"]}/" + dest
      Dir.mkdir base if (dest.length > 1 and !File.exists? base)
      target =  base + file
  
      if File.exists?(target) || File.symlink?(target)
        unless skip_all || overwrite_all || backup_all
          puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
          case STDIN.gets.chomp
          when 'o' then overwrite = true
          when 'b' then backup = true
          when 'O' then overwrite_all = true
          when 'B' then backup_all = true
          when 'S' then skip_all = true
          when 's' then next
          end
        end
        FileUtils.rm_rf(target) if overwrite || overwrite_all
        `mv "#{target}" "#{target}.backup"` if backup || backup_all
      end
      `ln -s "$PWD/#{linkable}" "#{target}"`
    end
  end
  end

  linkables.convert ".", ".symlink"
  directs.convert "", ".direct"
  xdg_config.convert ".config/", ".config"
end

task :uninstall do

  class Array
    def deconvert dest, prefix
      self.each do |linkable|

        file = linkable.split('/').last.split(prefix).last
        base = "#{ENV["HOME"]}/" + dest
        target =  base + file

        # Remove all symlinks created during installation
        if File.symlink?(target)
          FileUtils.rm(target)
        end
    
        # Replace any backups made during installation
        if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
          `mv "#{target}.backup" "#{target}"` 
        end

      end
    end
  end

  linkables.deconvert ".", ".symlink"
  directs.deconvert "", ".direct"
  xdg_config.deconvert ".config/", ".config"

end

task :default => 'install'
