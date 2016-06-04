# Rack and Basic Web Server HTTP
# Go to console and:
# gem intall rack
# Resources:
# http://rack.github.io/
require 'ostruct'


class GithubUser < OpenStruct
	
def self.find(username)

raw_user = RestClient.get "https://api.github.com/users/#{username}"
github_user = JSON.parse(raw_user)

self.new(github_user)
end
	

	
end


require 'rest-client'
require 'json'
require 'rack'

## The most basic web app

#basic_app = -> (env) { ['200', {'Content-Type' => 'text/html'}, ["Hello World"]] }

# Uncomment if you want to run
 # Rack::Handler::WEBrick.run basic_app, Host: "0.0.0.0"
require 'erb'
require 'github/markup'




class Page

  def render
    ERB.new(File.read('./first_layout.erb')).result(binding)
  end


  def content
  	
  	 user = GithubUser.find("tonyyasi")
    render do
      %Q{
      	<head>
      		<p> aaaaa</p>
      	</head>

      	<body id="demo" style="display:none;">

      	<h1> Name: #{user.name}  </h1>
      	<img src="#{user.avatar_url}" style="width:304px;height:328px;">
      	<h2> Stuff about this guy </h2>
      	<ul>
      		<li> Github username: #{user.login} </li>
      		<li>URL:  <a href ="#{user.html_url}">#{user.html_url} </a></li>
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
      	<p>Follow me on twitter<p>
      	<a href="https://twitter.com/tonyyasi"><img src="https://lh3.ggpht.com/lSLM0xhCA1RZOwaQcjhlwmsvaIQYaP3c5qbDKCgLALhydrgExnaSKZdGa8S3YtRuVA=w300" style ="width:200px;height:200px;" ></a>
      	</p>
      	<p>
      	<p>Checkout Icalia</p>
      	<a href="http://www.icalialabs.com/"><img src="https://pbs.twimg.com/profile_images/523198552063746048/BgFH_zPm_400x400.png" style="width:200px;height:200px;"></a>
      	</p>
      	</body>
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