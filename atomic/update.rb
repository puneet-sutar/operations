#update 
#1.Atomic
#2.Inbuilt
#3.Used to create larger operations
#variables
#table=INPUT STREAM
#


def update(table,lhs,rhs,condtion,dbh) #dbh = dbi statement variable  
    
  if condition==""
    sth = dbh.prepare("update account set #{lhs} = #{rhs}") #non conditonal update
  else
    sth = dbh.prepare("update #{table} set #{lhs} = #{rhs} WHERE  #{condition}") #conditional update    
  end
  sth.execute()
  sth.close
  dbh.commit
end