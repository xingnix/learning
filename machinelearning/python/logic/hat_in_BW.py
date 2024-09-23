# This program illustrate the inference process of a logic question. There are n person with n hats on heads. The color of hats are black or white and there is at least one black hat. The persons can see each other' hat but no one's own hat. Then they are asked "what's the color of your hats?" in several rounds. Every round they can look each other and listen others answer. Suppose they are clever enough and the answering is at the same time  every round. From the above assumption the answers of ones in black hats are identical and the same is true for that in white hats.

from functools import reduce


# the function guess simulate the inference process of an person who didin't know which color hat on  head. Suppose color of hat on head is black or white, the final answer of the answer_list should be t_b (determined color is  black) or t_w( determined color is white). The answer depend on the previous answer of ones with black or white hat on head, where t_b means the one with black hat on head determined color and f_b means the one with black hat on head cannot determine the color. The round of quesion is represented by length of the answer_list which is constructed from back to front.
def guess(number_of_black_hat_in_sight,guessed_color,answer_list):
    if number_of_black_hat_in_sight==0:
        if guessed_color=="black":
            return answer_list
        elif guessed_color=="white":
            return "FAIL"
        else:
            return "color error"
    elif number_of_black_hat_in_sight>0:
        if guessed_color=="white":
            return guess(number_of_black_hat_in_sight-1,"black",["t_b"]+answer_list)
        elif guessed_color=="black":
            return guess(number_of_black_hat_in_sight-1,"black",["f_b"]+answer_list)
    else:
        return "hat number error"

#  print(guess(0,"black",["t_b"]) , "# [t_b]")
#  print(guess(1,"white",["t_w"]) , "# [t_b,t_w]")
#  print(guess(1,"black",["t_b"]) , "# [f_b,t_b]")
#  print(guess(2,"white",["t_w"]) , "# [f_b,t_b,t_w]")
#  print(guess(2,"black",["t_b"]) , "# [f_b,f_b,t_b]")
#  print(guess(3,"white",["t_w"]) , "# [f_b,f_b,t_b,t_w]")
#  print(guess(3,"black",["t_b"]) , "# [f_b,f_b,f_b,t_b]")
#  print(guess(4,"white",["t_w"]) , "# [f_b,f_b,f_b,t_b,t_w]")
#  print(guess(4,"black",["t_b"]) , "# [f_b,f_b,f_b,f_b,t_b]")
#  print(guess(5,"white",["t_w"]) , "# [f_b,f_b,f_b,f_b,t_b,t_w]")
#  print(guess(5,"black",["t_b"]) , "# [f_b,f_b,f_b,f_b,f_b,t_b]")


# the function list_answer obtained the answer list by using function guess. the returned list constructed by two strings which represent the answer list of one in black hat or white hat individually. "T" means the one knows the color on head and "F" mean don't know the color on head.

def list_answer(number_of_black_hat):
    b=reduce(lambda x,y: x+y,
             map(lambda x: "T" if x=="t_b" else "F",
                 guess(number_of_black_hat-1,"black",["t_b"])))

    w=reduce(lambda x,y: x+y,
             map(lambda x: "T" if x=="t_w" else "F",
                 guess(number_of_black_hat,"white",["t_w"])))
    
    return [b,w]

#  print(list_answer(1),  "# T , FT")
#  print(list_answer(2),  "# FT  ,  FFT")
#  print(list_answer(3),  "# FFT   ,  FFFT")
#  print(list_answer(4),  "# FFFT   ,  FFFFT")
#  print(list_answer(5),  "# FFFFT   ,  FFFFFT")

print(list_answer(3)[0]) #only 3 black hat
print(list_answer(50)[0]) #only 50 black hat
#print(len(list_answer(50)[0]))



# The answer lists can be constructed directly with the increasing number of black hats. The inference is simple: if one in black hat can judge color in round n, then one with which hat can determine the color next turn. Accordingly when one in black hat cannot determine the color at the right round(they should determine) then the one with another black hat can determine color of hat on head.

def answers(max_number_of_black_hat,l):
    if l==[]:
        black_answer="T"
        return answers(max_number_of_black_hat,[["T",black_answer[0:-1]+"FT"]])
    elif len(l)<max_number_of_black_hat:
        previous_round_black_answer=l[-1][0]
        b=previous_round_black_answer[0:-1]+"FT"
        w=b[0:-1]+"FT"
        return answers(max_number_of_black_hat,l+[[b,w]])
    else:
        return l

print(answers(3,[]))
