# Module that can be included (mixin) to take and output Yaml data
require 'yaml'

module YamlBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_yaml(yaml)
    @data = YAML::load(yaml)
  end

  # to_yaml: converts any data in @data into a yaml string.
  # returns: String in TSV format
  def to_yaml
    @data.to_yaml
  end
end
