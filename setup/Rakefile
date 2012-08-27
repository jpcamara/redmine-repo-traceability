require 'net/http'
require 'zip/zip'

task :build_plugin_env do
  File.open('redmine-2.0.3.zip', 'r') do |file|
    Zip::ZipFile.open(file) do |zip_file|
      zip_file.each do |f|
        f_path = File.join(".", f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      end
    end
  end
end