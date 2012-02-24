require "mod1.rb"
require "rubygems"
require "xmlsimple"
input="Account:bal:bal + #amt + 10:id = #id"
$object=XmlSimple.xml_in("./objects/obj.xml")
$input={"id"=>"101","amt"=>"1001001"}

include Validations
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
puts obj
 end
  end
  if object=={}
    puts "error: Table Does Not Exist"
  end
  #puts object['attr']
  rhs_split=str[2].split(" ")
    i=0
  while i<rhs_split.length
    if rhs_split[i][0]==35  ##ascii value of #=35
      temp=rhs_split[i].split("#")[1]
      rhs_split[i]=$input[temp]
      puts $input[temp]
    elsif is_i?(rhs_split[i])
      puts "num"
    else
      flag=false
      object["attr"].each do |attr|
        if(attr["content"]==rhs_split[i])
          puts "object"
          flag=true
        end
      end
      if flag==false
        puts "invalid while creating operation"
      end  
    end
    i=i+1
   end
  cond_split=cond.split(" ")
  i=0
  while i<cond_split.length
    if cond_split[i][0]==35  ##ascii value of #=35
      temp=cond_split[i].split("#")[1]
      cond_split[i]=$input[temp]
      puts $input[temp]
    elsif is_i?(cond_split[i])
      puts "num"
    else
      flag=false
      object["attr"].each do |attr|
        if(attr["content"]==cond_split[i])
          puts "object"
          flag=true
        end
      end
      if flag==false
        puts "invalid while creating operation"
      end  
    end
    i=i+1
   end
rhs=rhs_split.join(" ")
cond=cond_split.join(" ")
