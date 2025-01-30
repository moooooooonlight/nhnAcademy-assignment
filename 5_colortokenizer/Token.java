public abstract class Token {
    protected String word;

    public Token(String word){
        this.word = word;
    }
    public abstract String accept(TokenTransfer transfer);
}


class ClassToken extends Token{
    
    public ClassToken(String word){
        super(word);
    }

    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}

class variableToken extends Token{

    public variableToken(String word){
        super(word);
    }

    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}

class OpenLineToken extends Token{

    public OpenLineToken(String word){
        super(word);
    }
    
    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}

class CloseLineToken extends Token{

    public CloseLineToken(String word){
        super(word);
    }
    
    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}


class ReturnToken extends Token{

    public ReturnToken(String word){
        super(word);
    }
    
    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}

class StaticToken extends Token{

    public StaticToken(String word){
        super(word);
    }

    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}

class RangeToken extends Token{

    public RangeToken(String word){
        super(word);
    }

    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}

class BalnkToken extends Token{

    public BalnkToken(String word){
        super(word);
    }

    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}

class GeneralToken extends Token{

    public GeneralToken(String word){
        super(word);
    }

    @Override
    public String accept(TokenTransfer transfer){
        return transfer.transfer(this);
    }
}