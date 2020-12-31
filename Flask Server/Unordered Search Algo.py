#To Print the Probabilities of each Case
def printProbab(Data):
    l = len(Data)
    set_of_Data = set(Data)
    for i in set_of_Data:
        Num = Data.count(i)
        print("{}/{} ".format(Num,l),end  = ' ')
    return(0)

#To calculate symptoms
def CalcSym(inputTup,Data):
    listinput = list(inputTup)
    listData = list(Data)
    calculated = []
    for i in listData:
        if set(listinput).issubset(set(i)):
            calculated.append(i)
    
    final = []
    for entity in calculated:
        for j in entity:
            final.append(j)
    
    print(set(final)-set(inputTup))

    return(0)


#Initial Dataset Declaration
Data = (('D1','D2'),('D2', 'D3'),('D1','D2'),('D2','D1','D3'),('D2','D3'),('D3'))

#Main
k = tuple(map(str,input().split()))
CalcSym(k,Data)
Data = Data + (k,)


