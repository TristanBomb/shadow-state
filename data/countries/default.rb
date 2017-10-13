$countries = {}

Dir['data/countries/*.rb'].each { |file| load file unless file == __FILE__}
