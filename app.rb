from_path="/home/andy/Projects/" #INSERT YOUR DESIRED PATH # take all files from this map included files in submaps and save only files(all) in @to_path
@to_path="/home/andy/Desktop/to/" #INSERT PATH WHERE TO COPY FILES
#------------------------------------------
def getfiles path

Dir.foreach(path) do |f|
name=File.basename f
pathn= @to_path + name
	
filepath =path +"/"+ f

puts filepath
 if File.directory? filepath and name != '..' and name != '.'  and name != 'new' 

 Dir.chdir filepath
str = Dir.pwd
getfiles str

Dir.chdir('..')
elsif File.file? f and name != 'app.rb' 
	f1 = File.open(f, "r:binary")
f2 = File.open(pathn, "a:binary")
 while (b = f1.getc)!= nil do
  	f2.putc b
end
 
f2.close


end

end
end
puts '-----------------processing----------------'
getfiles from_path

puts '-----------finish-----------------'