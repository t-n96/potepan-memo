require 'csv'

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_s
num = memo_type.chomp

if num == "1"
  puts "拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp
  puts "メモしたい内容を入力ください"
  puts "入力後は Ctrl+Dを入力してください。"
  input = STDIN.read
  
  CSV.open("#{file_name}.csv","a") do | memo |
    memo.puts ["#{input}"]
  end
elsif num == "2"
  puts "編集したいファイル名を入力してください。"
  edit_name = gets.chomp
  puts "編集したい内容を入力してください"
  puts "入力後は Ctrl+Dを入力してください。"
  edit = STDIN.read
  
  CSV.open("#{edit_name}.csv","a+") do | memo |
    memo.puts ["#{edit}"]
  end
else 
  puts "1か２を入力してください。"
end
