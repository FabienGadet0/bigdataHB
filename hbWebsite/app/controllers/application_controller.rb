class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def upload
    uploaded_file = params[:fl]
    if uploaded_file 
      file_content = open(uploaded_file)
      puts file_content
    end
  end
end
