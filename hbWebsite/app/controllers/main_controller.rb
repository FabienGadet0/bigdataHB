
class MainController < ApplicationController
  def index
  end
  # def upload
  #   uploaded_file = params[:fl]
  #   if uploaded_file 
  #     file_content = open(uploaded_file)
  #     puts file_content
  #   end
  def readfl(val)
    data = File.read("./upload/analysis-output")
    r = data.split(' ')
    r[val]
  end
  def alert()
    sd1 = readfl(0).to_i
    sd2 = readfl(1).to_i
    if sd1 || sd2 < 0.2
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
# uploaded_file = params[:file]
# file_content = uploaded_file.read
# puts file_content