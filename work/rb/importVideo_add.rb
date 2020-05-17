require 'pg'

connect = PG::connect(host: "localhost", port: "5432", user: "tnishi", dbname: "VideoManegementServer_development")
results = connect.exec("select * from vs001s")

results.each do |r|
  p results
end