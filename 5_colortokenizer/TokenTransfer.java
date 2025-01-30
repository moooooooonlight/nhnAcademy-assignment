public interface TokenTransfer {
    String transfer(Token token);
    String transfer(ClassToken token);
    String transfer(variableToken token);
    String transfer(OpenLineToken token);
    String transfer(CloseLineToken token);
    String transfer(ReturnToken token);
    String transfer(RangeToken token);
    String transfer(StaticToken token);
    String transfer(BalnkToken token);
    String transfer(GeneralToken token);
}
