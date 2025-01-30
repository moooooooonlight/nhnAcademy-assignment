public class WordTokenTransfer implements TokenTransfer{
    
    @Override
    public String transfer(Token token){
        return token.word; 
    }

    @Override
    public String transfer(ClassToken token){
        return " <span style=color:blue>"+token.word+"</span> "; 
    }

    @Override
    public String transfer(ReturnToken token){
        return " <span style=color:blue>"+token.word+"</span> "; 
    }

    @Override
    public String transfer(StaticToken token){
        return " <span style=color:blue>"+token.word+"</span> "; 
    }

    @Override
    public String transfer(OpenLineToken token){
        return " {<br> &nbsp;&nbsp;&nbsp;&nbsp ";
    }
    @Override
    public String transfer(CloseLineToken token){
        return " <br>} ";
    }

    @Override
    public String transfer(RangeToken token){
        return " <span style=color:blue>"+token.word+"</span> "; 
    }

    @Override
    public String transfer(BalnkToken token){
        return " "; 
    }

    @Override
    public String transfer(variableToken token){
        return token.word; 
    }

    @Override
    public String transfer(GeneralToken token){
        return token.word; 
    }
}
