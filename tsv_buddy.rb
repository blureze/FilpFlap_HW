# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv_data = tsv.split("\n")
    rows = tsv_data.map do |elem|
      elem.split("\t")
    end

    headers = rows.first
    value = rows[1..-1]

    @data = value.map do |row|
      row.map.with_index do |cell, i|
        [headers[i], cell]
      end.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output = "date\tstudent_id\tlanguages\tbest_language\tapp_experience\ttech_experience\n"
    @data.each do |elem|
      date = elem['date']
      student_id = elem['student_id']
      languages = elem['languages']
      best_language = elem['best_language']
      app_experience = elem['app_experience']
      tech_experience = elem['tech_experience']

      output += date + "\t" + student_id + "\t" + languages + "\t" + best_language + "\t" + app_experience + "\t" + tech_experience + "\n"
    end
    output
  end
end
