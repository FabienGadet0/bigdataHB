
class MainController < ApplicationController
  def index; end

  def upload
    uploaded_io = params[:fl]
    if uploaded_io
      File.open(Rails.root.join('../datafrom', '1.txt'), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end
  end

  def readfl(val)
    data = File.read('./upload/analysis-output')
    r = data.split(' ')
    r[val]
  end

  def alert
    sd1 = readfl(0).to_i
    sd2 = readfl(1).to_i
    if sd1 < 0.19 && sd1 > 0.025
      "<p style='color:green'> GOOD"
    else
      "<p style='color:red'> BAD"
    end
  end
  #   open(uploaded_file) {|f|
  #   f.each_line {|line| puts line}
  # }
  # end
  helper_method :readfl
end

def upload
  uploaded_file = params[:fl]
  if uploaded_file
    file_content = uploaded_file.read
    puts file_content
  end
end
# uploaded_file = params[:file]

# puts file_content
# if params[:person][:picture]
#   uploaded_io = params[:person][:picture]
#   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
#     file.write(uploaded_io.read)
#   end
# end
