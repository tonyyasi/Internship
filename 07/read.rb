## Create a Scheduler class to assign interviews for each interviewer
## 1. Every interviewer has 4 available times: 9:00, 9:30, 10:00 and 10:30
## 2. Every interviewer has more or less the same amount of interviews
## 3. The code at the bottom must run without change
## Hint: http://ruby-doc.org/core-2.2.0/Array.html#method-i-sort

INTERVIEWERS = %w{ Eddie Jorge Rafa Edo Kuri }

CANDIDATES = %w{ Jesus Alejandro Miguel Benjamin William Pablo Luis Rodrigo
                 Andres Josue Juan Yaser Omar Esteban Daniel Jose Gustavo Eduardo }

HOURS = ["9:00", "9:30", "10:00", "10:30"]

## Your code starts here
require 'erb'
require 'rack'

class Interview
  attr_reader :candidate, :time

  def initialize(candidate, time)
    @candidate = candidate
    @time = time
  end
end

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Candidate < Person
end

class Interviewer < Person
  attr_accessor :interviews

  def initialize(name)
    super(name)
    @interviews = []
  end
end

class Scheduler
  attr_reader :interviewers, :candidates

  def initialize
    @interviewers = map_interviewers
    @candidates = CANDIDATES.map { |candidate_name| Candidate.new(candidate_name) }
  end

  def assign_interviews
    @interviewers.each do |interviewer|
      HOURS.each do |hour|
        interviewer.interviews << Interview.new(@candidates.sample, hour)
      end
    end
  end

  private

    def map_interviewers
      INTERVIEWERS.map { |interviewer_name| Interviewer.new(interviewer_name) }
    end
end

class Page

def render
  ERB.new(File.read('./layout.erb')).result(binding)
end

def content
@scheduler = Scheduler.new
@scheduler.assign_interviews
  render do
  end

end

end

webapp = -> (env) {
  ['200', {'Content-Type' => 'text/html'}, [ Page.new.content ] ]
}

Rack::Handler::WEBrick.run webapp, Host: "0.0.0.0"

## Your code ends here





