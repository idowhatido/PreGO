from flask import Flask, request, jsonify
from csv import reader
app = Flask(__name__)

@app.route("/api",methods = ['GET'])
def home():
    #To Update the Probabilities of each Case
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
        print(list(set(final)-set(inputTup)))
        return(list(set(final)-set(inputTup)))



    #Initial Dataset Declaration
    with open('dataset.csv', 'r') as read_obj:
	    csv_reader = reader(read_obj)
	    Data = tuple(map(tuple,csv_reader))
	    print(Data)


    #Main
    d =  {}
    d['Query'] = str(request.args['Query'])
    d['Query'] += ','
    k = tuple(map(str,d['Query'].split(',')))
    ansp = list(CalcSym(k,Data))
    ans = ''.join([str(elem) for elem in ansp])
    Data = Data + (k,)
    d['Query'] = ansp
    return( jsonify(d))