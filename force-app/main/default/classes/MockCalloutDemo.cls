public class MockCalloutDemo implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest req){

        Assert.areEqual('https://th-apex-http-callout.herokuapp.com/animals', req.getEndpoint());

        //create fake response here
        HttpResponse res = new HttpResponse();
        res.setStatusCode(200);
        res.setBody('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}');
        return res;
    }
}