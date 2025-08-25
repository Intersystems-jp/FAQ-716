Class Test.REST Extends %CSP.REST
{

Parameter CONTENTTYPE = "application/json";

Parameter CHARSET = "utf-8";

Parameter CONVERTINPUTSTREAM = 1;

Property key As %String(MAXLEN = "");

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/greeting" Method="GET" Call="greeting" Cors="true"/>
</Routes>
}

ClassMethod greeting() As %Status
{
    set j={}
    set j.Greeging="こんにちは！只今の時刻は、"_$ZDATETIME($H,16)_"です。今日も1日頑張りましょう！"
    do j.%ToJSON()
    return $$$OK
}

}
