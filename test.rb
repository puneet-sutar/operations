require "mod1.rb"
require "rubygems"
require "xmlsimple"
include Validations
#config = XmlSimple.xml_in("./atomic/update.xml")
#id=config['id'].first
#id=config['param'][0]['name'][0]['content']

@operators=["|",">","<",">>","<<","&&"]

def read_atom_name
  $atoms={}
  fin=File.open("atom.info","r")
  fin.each{|line| temp=line.split(" ") ;$atoms[temp[0]]=temp[1];}
end
def create_op
  puts "Enter op name"
  name=gets.chomp
  fout=File.open("./operations/#{name}.xml","w")
  fout.puts"<#{name}>"
  fout.puts"<id>c1</id>"
  fout.puts"<name>#{name}</name>"
  fout.puts"<type>operation</type>"
  fout.puts"<process>"
  puts "Enter configuration"
  config=gets.chomp.split(" ")
  read_atom_name 
=begin  config.each do |val|
  if $atoms.has_key? val
    puts "true"
  end
=end
  input=""  
  @update=XmlSimple.xml_in("./atomic/update.xml")
  n=@update['param'][0]['num']
  i=0
  puts "enter parameters required for update"
  while i< n.to_i
    temp=@update['param'][0]['name'][i]
    puts "ENTER #{temp} : "
    input=input+"#{gets.chomp()}:"
    i=i+1
  end 
 input=input.chop
  fout.puts "<name input='#{input}'>update</name>"
  fout.puts "</process>"
  fout.puts "</#{name}>"
  ####===========================creating ruby code 
  fout=File.open("credit.rb")
  fout.puts "#THIS IS AUTOGENERATED CODE"
  fout.puts "require 'update.rb'"
end

def prepare_input (input)
    str=input.split(":")
object={}
table=str[0]
lhs=str[1]
rhs=str[2]
cond=str[3]
 #puts "rhs = #{rhs}"
$object['object'].each do |obj|
if(obj['name'][0]['value']==table)
object=obj
 end
  end
  if object=={}
    puts "error: Table Does Not Exist"
  end
  #puts object['attr']
  index=1
  while index<str.length
  rhs_split=str[index].split(" ")
    i=0
  while i<rhs_split.length
    if rhs_split[i][0]==35  ##ascii value of #=35
      temp=rhs_split[i].split("#")[1]
      rhs_split[i]=$input[temp]
    elsif is_i?(rhs_split[i])
         puts ""       
    else
      flag=false
      object["attr"].each do |attr|
        if(attr["content"]==rhs_split[i])
          flag=true
        end
      end
      if flag==false
        puts "invalid while creating operation"
      end  
    end
    i=i+1
   end
   str[index]=rhs_split.join(" ");
  index=index+1;
 end
 puts "str output"
 puts str
end
def execute
  puts "ENTER REQUEST FILE NAME : "
  fname=gets.chomp!
  $request=XmlSimple.xml_in(fname)
  
end 

  puts "Select task"
puts "1.Create Operations"
puts "2.Execute"
op=gets.chomp
case op
  when "1"
    create_op
  when "2"
    execute 
end