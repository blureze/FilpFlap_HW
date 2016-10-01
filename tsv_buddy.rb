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
        [headers[i], cell].to_h
      end
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    output = 'date\tstudent_id\tbest_language\tapp_experience\ttech_experience'
    @data.each do |elem|
      date = elem[0]
      student_id = elem[1]
      languages = elen[2]
      best_language = elem[3]
      app_experience = elem[4]
      tech_experience = elem[5]

      output += date + "\t" + student_id + "\t" + languages + "\t" + best_language + "\t" + app_experience + "\t" + tech_experience + "\n"
    end
  end
end
