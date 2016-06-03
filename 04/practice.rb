

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

user = GithubUser.new(github_user["html_url"], github_user["login"], github_user["name"], github_user["avatar_url"], github_user["location"])

puts user.username

 puts GithubUser.initialize_all_users
