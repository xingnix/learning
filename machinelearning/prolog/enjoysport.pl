# a simple demo to illustrate prolog program for enjoy sport

# facts

enjoy(sun,weak,change,p).
enjoy(sun,weak,same,p).
enjoy(cloudy,weak,same,p).
enjoy(cloudy,strong,same,n).



# learned rules, the learning algorithm can be implemented by another progrma to manupulate the text of this file.
enjoy(A,B,C,D) :- B=weak,D=p,!.
# else
enjoy(A,B,C,D) :- D=n.


query2 :- enjoy(cloudy,weak,change,PN),write(PN).
#query2.

query3 :- enjoy(cloudy,strong,change,PN),write(PN).
#query3.
