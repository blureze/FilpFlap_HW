# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_data = tsv.split("\n")
    rows = tsv_data.map { |elem| elem.split("\t") }

    headers = rows.first
    value = rows[1..-1]

    @data = value.map do |row|
      row.map.with_index { |cell, i| [headers[i], cell] }.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output = "date\tstudent_id\tlanguages\t\
best_language\tapp_experience\ttech_experience\n"
    @data.each do |elem|
      output += generate_output(elem)
    end
    output
  end

  def generate_output(elem)
    output_arr = []
    elem.each do |_key, value|
      output_arr.push(value)
    end

    output = output_arr.join("\t") + "\n"

    output
  end
end
