# Rack and Basic Web Server HTTP
# Go to console and:
# gem intall rack
# Resources:
# http://rack.github.io/


class GithubUser
	attr_reader :url, :username, :name , :imagen , :location

	def initialize(url, username, name, imagen, location)
	@name = name
	@url = url
	@username = username 
	@imagen = imagen
	@location = location
	

	end

	def self.initialize_all_users
		all_users = []
		raw_users = RestClient.get 'https://api.github.com/users?since=135'
		github_user = JSON.parse(raw_users)
		github_user.each do |user|
			all_users << GithubUser.new(github_user["html_url"], github_user["login"], github_user["name"], github_user["avatar_url"], github_user["location"])
		end
		all_users

	end
end


require 'rest-client'
require 'json'



raw_user = RestClient.get 'https://api.github.com/users/tonyyasi'
github_user = JSON.parse(raw_user)
#puts github_user




require 'rack'

## The most basic web app

#basic_app = -> (env) { ['200', {'Content-Type' => 'text/html'}, ["Hello World"]] }

# Uncomment if you want to run
 # Rack::Handler::WEBrick.run basic_app, Host: "0.0.0.0"
require 'erb'
require 'github/markup'




class Page

  def render
    ERB.new(File.read('./layout.erb')).result(binding)
  end

  def content
  	raw_user = RestClient.get 'https://api.github.com/users/tonyyasi'
github_user = JSON.parse(raw_user)
  	user = GithubUser.new(github_user["html_url"], github_user["login"], github_user["name"], github_user["avatar_url"], github_user["location"])
    render do
      %Q{
      	<h1> Name: #{user.name}  </h1>
      	<img src="#{user.imagen}" style="width:304px;height:328px;">
      	<h2> Stuff about this guy </h2>
      	<ul>
      		<li> Github username: #{user.username} </li>
      		<li>URL:  #{user.url} </li>
      		<li>Hobbies: Music, programming and stuff </li>
      	</ul>
      	<p>Favorite programming languages</p>
      	<ol>
      		<li>Ruby</li>
      		<li>Swift</li>
      		<li>Java</li>
      		<li>C++</li>
      		<li>Html,CSS,Javascript</li>
      	</ol>

      	<p>
      	Follow me on twitter
      	<a href="www.twitter.com/tonyyasi"><img src="https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w300" style ="width:200px;height:200px;" ></a>
      	</p>
      	<p>
      	Checkout Icalia
      	<a href="http://www.icalialabs.com/"><img src="https://pbs.twimg.com/profile_images/523198552063746048/BgFH_zPm_400x400.png"></a>
      	</p>
      }
    end
  end

end

webapp = -> (env) {
  ['200', {'Content-Type' => 'text/html'}, [ Page.new.content ] ]
}

 #Rack::Handler::WEBrick
# Webrick Server
Rack::Handler::WEBrick.run webapp, Host: "0.0.0.0"