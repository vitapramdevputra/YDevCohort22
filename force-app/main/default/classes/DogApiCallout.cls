public with sharing class DogApiCallout {
    
    public static void dogApiCall() {
        
        //http request
        HttpRequest req = new  HttpRequest();
        //set endpoint
        req.setEndpoint('https://api.thedogapi.com/v1/breeds');
        //set method
        req.setMethod('GET');
        //set headers
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('x-api-key', 'live_tInW632ehyteYOcKY8201ub6rcB4NL2qd3v1YyqjujT6phrB7fJisA727KgzuOO3');

        Http http = new http();
        HttpResponse  response = http.send(req);

        system.debug('resposne status code: ' + response.getStatusCode());
        system.debug('resposne body: ' + response.getBody());

        if (response.getStatusCode() == 200) {
            //parse the response.
            List<TheDogWrapper> dogs = TheDogWrapper.parse(response.getBody());
            for (TheDogWrapper eachDog : dogs) {
                //get details of each DOG.
               
                
                system.debug('Dog name: ' + eachDog.name);
                system.debug('Dog bred for: ' + eachDog.bred_for);
                system.debug('Dog breed_group for: ' + eachDog.breed_group);

                system.debug('Dog life_span: ' + eachDog.life_span);
                system.debug('Dog temperament for: ' + eachDog.temperament);
                system.debug('Dog origin for: ' + eachDog.origin);
                TheDogWrapper.Weight eachDogWeight = eachDog.weight;
                system.debug('--> dog weight (metric) ' + eachDogWeight.metric);

                TheDogWrapper.Weight eachDogHeight = eachDog.Height;
                system.debug('--> dog Height (metric) ' + eachDogHeight.metric);


                system.debug('------');
            }
        }

    }
}