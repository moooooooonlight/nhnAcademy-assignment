package org.example.options;

public class OptionV implements Execute{
    @Override
    public void execute(StringBuffer requestHeader, StringBuffer responseHeader, StringBuffer responseBody) {
        System.out.println(requestHeader.toString());
        System.out.println(responseHeader.toString());
    }
}
