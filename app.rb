require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'lib/novelty'
require 'open-uri'

get '/' do
	<<-EOF
	<html>
	<body>
		<center>
		Is this novel?
		<form method='POST'>
			<input type='text' name='url'/>
		</form>
		</center>
	</body>
	</html>
	EOF
end

post "/" do
	DataMapper.setup(:default, "sqlite3:///Users/matt/entp/isthisnovel/isthisnovel.db")
	unless params[:url]
		redirect "/"
	end
	novelty = Novelty.first(:url => params[:url])
	if novelty
		novelty.update_attributes(:amount => novelty.amount + 1)
	 	"no. asked #{novelty.amount} times."
	else
		if open(URI.escape("http://www.google.com/search?q=\"#{params[:url]}\"")).read =~ /of about \<b\>([\d,]*)/
			number_of_results = $1.gsub(/,/,'').to_i
			if number_of_results < 5
				Novelty.create :url => params[:url]
				"yes"
			else
				Novelty.create :url => params[:url]
				"no."
			end
		else
			Novelty.create :url => params[:url]
			"yes"
		end
	end
end
