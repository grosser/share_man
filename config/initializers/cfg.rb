require 'yaml'
CFG = YAML.load(ERB.new((IO.read('config/config.yml'))).result)[Rails.env].with_indifferent_access
