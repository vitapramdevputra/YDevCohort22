public with sharing class ConnectExternalSFOrg {
    public static void getAccounts() {

        //copy account id from target org.
        string endpoint = '/services/data/v58.0/sobjects/Account/0012w00001JPz0XAAT';
        //1. Http Request
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:NC_Old_SFDev2_Yoll'+endpoint);
        req.setMethod('GET');
        //2. http
        http http = new http();

        //3. Http Response
        HttpResponse response = http.send(req);
        system.debug('response code: ' + response.getStatusCode());
        system.debug('response status: ' + response.getStatus());
        system.debug('response body: ' + response.getBody());

        
    }
    public static void getAllAccounts() {

        //copy account id from target org.
        string endpoint = '/services/data/v58.0/query?q=SELECT+Name+FROM+Account';
        //1. Http Request
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:NC_Old_SFDev2_Yoll'+endpoint);
        req.setMethod('GET');
        //2. http
        http http = new http();

        //3. Http Response
        HttpResponse response = http.send(req);
        system.debug('response code: ' + response.getStatusCode());
        system.debug('response status: ' + response.getStatus());
        system.debug('response body: ' + response.getBody());

        
    }

     public static void createAccount() {

        Account a1 = new Account();
        a1.Name = 'New Acc In New Org';
        //a1.Website = 'www.neworg.com';
        a1.Description = 'Creating this via API from other org.';

        string jsonBody = JSON.serialize(a1);

        //copy account id from target org.
        string endpoint = '/services/data/v58.0/sobjects/Account';
        //1. Http Request
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:NC_Old_SFDev2_Yoll'+endpoint);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(jsonBody);
        //2. http
        http http = new http();

        //3. Http Response
        HttpResponse response = http.send(req);
        system.debug('response code: ' + response.getStatusCode());
        system.debug('response status: ' + response.getStatus());
        system.debug('response body: ' + response.getBody());

        
    }
}