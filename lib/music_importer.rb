class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{ |f| Song.create_from_filename(f) }
  end
end


# class MusicImporter
#
#
#   attr_reader :path
#
#   def initialize(path)
#     @path = path
#   end
#
#   def files
#     @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
#   end
#
#   def import
#     files.each{ |f| Song.create_from_filename(f) }
#   end
#   #
#   # attr_accessor :path
#   #
#   # @@filenames = []
#   #
#   # def initialize(path)
#   #   @path = path
#   # end
#   #
#   # def files
#   #   Dir.entries(path).each do |filename|
#   #     @@filenames << filename
#   #   end
#   #   @@filenames.reject! do |filename|
#   #     filename == "." || filename == ".."
#   #   end
#   # end
#   #
#   # def self.filenames
#   #   @@filenames
#   # end
#   #
#   # def import
#   #   @@filenames.uniq.each do |filename|
#   #     Song.create_from_filename(filename)
#   #   end
#   # end
#
# end
