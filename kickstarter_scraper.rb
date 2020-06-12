# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  
  kickstarter = Nokogiri::HTML(html)
  kickstarter.css(".project").text
  
  projects = {}
  
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym]
  end
  projects
  # projects: project = kickstarter.css("li.project.grid_4")
  # title: 
  # project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text
  # project.css("ul.project-stats li.first.funded strong").text
  binding.pry
end


create_project_hash