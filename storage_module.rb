require 'json'

module Storage
  def read_file(name)
    return JSON.parse(File.read(name)) if File.exist?(name)

    []
  end

  def write_file(name, array)
    data = []
    array.each do |item|
      data.append(item.generate_string)
    end
    File.write(name, JSON.generate(data))
  end
end
