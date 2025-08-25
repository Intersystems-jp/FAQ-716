Class ZTest.Credentials Extends %Persistent
{

/// ユーザID
Property UserID As %String [ Required, SqlColumnNumber = 2 ];

/// パスワード
Property Password As %String [ SqlColumnNumber = 3 ];

Index UserIDIdx On UserID [ Unique ];

ClassMethod createdummydata()
{
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('johnsonjoshua','~$<sO$#OpMs50I'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('donaldgarcia','E|`)XMzw9ox0rz'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('garzaanthony','6N-1/Nkyv$)Ejs'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('robinsonwilliam','m{@7)R%UB2_jCo'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('hoffmanjennifer','x$O=6RcQa7}j>A'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('lrobinson','%%6(oz?wB2Zram'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('lisa02','&Xz#.}Euc4c16L'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('jpeterson','"%gU5Gk/Y,UT:k|"'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('susanrogers','9f_+Y8vvUp)y94'))
    &sql(Insert INTO ZTest.Credentials (UserID,Password) VALUES('jamesmichael','oj9`b`PJB{tH|\'))
}

/// ユーザ名、パスワードチェックメソッド
/// 合致した場合 1、しない場合 0 を返す
ClassMethod check(uid, pass) As %Boolean
{
    #dim ex As %Exception.AbstractException
    set result=0
    try {

        set stmt=##class(%SQL.Statement).%New()
        set sql="SELECT ID from ZTest.Credentials WHERE UserID=? AND Password=?"
        $$$ThrowOnError(stmt.%Prepare(sql))
        set rset=stmt.%Execute(uid,pass)
        if rset.%SQLCODE<0 {
            set ^checkerror($ZDATETIE($H,3),uid,pass)=rset.%SQLCODE_":"_rset.%Message
            return result
        }
        set result=rset.%Next()
    }
    catch ex {
        set ^checkerror($ZDATETIME($H,3),uid,pass)=ex.DisplayString()
    }
    return result
}

Storage Default
{
<Data name="CredentialsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>UserID</Value>
</Value>
<Value name="3">
<Value>Password</Value>
</Value>
</Data>
<DataLocation>^ZTest.CredentialsD</DataLocation>
<DefaultData>CredentialsDefaultData</DefaultData>
<IdLocation>^ZTest.CredentialsD</IdLocation>
<IndexLocation>^ZTest.CredentialsI</IndexLocation>
<StreamLocation>^ZTest.CredentialsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
