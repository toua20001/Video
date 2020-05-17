require "csv"
require "fileutils"
require "date"
require "rubygems"
require "pg"

# パスの設定
TempPath = "/assets/videos"
CsvDir = "#{ARGV[0]}/work/csv"

# initialize
vs001 = []
vs002 = []
vs003 = []
it = 1

NOW = DateTime.now.strftime("'%Y/%m/%d %H:%M:%S'")
p NOW

# 各ファイルに対しての処理
Dir.glob("#{ARGV[0]}/public#{TempPath}/*") do |f|
  uptime = File.stat(f).mtime.to_datetime.strftime("'%Y/%m/%d %H:%M:%S'")

  tmp = []
  tmp.push(0)
  tmp.push(uptime)
  tmp.push(NOW)
  vs001.push(tmp)

  tmp=[]
  tmp.push(it)
  tmp.push(File.basename(f, '.*'))
  tmp.push(nil)
  tmp.push("#{TempPath}/#{File.basename(f)}")
  tmp.push(uptime)
  tmp.push(NOW)
  vs002.push(tmp)

  it += 1
end

p vs001
p vs002

CSV.open("#{CsvDir}/vs001s.csv", "w") do |f|
  vs001.each do |v|
    f << v
  end
end

CSV.open("#{CsvDir}/vs002s.csv", "w") do |f|
  vs002.each do |v|
    f << v
  end
end
