class HomeController < ApplicationController
  def index
  end

  def evaluate
    respond_to do |format|
      format.js {
        file = File.open('tmp/ruby.rb', 'w')
        file.syswrite(params["code"])
        file.close

        system('ruby tmp/ruby.rb > tmp/result.txt')

        @result = File.read('tmp/result.txt')
        @code = params["code"]


      }

    end
  end
end
