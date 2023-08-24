public with sharing class CalloutsDemo {
    //Without using wrapper class
        //NORMAL WORLD.
   public static void callAnimalApi() {
        //api or endpoint
            //https://th-apex-http-callout.herokuapp.com/animals
        //method
            //GET
        //key or auth [header]
        //body (methdo: post, put, patch)
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');

        Http htttp = new http();
        HttpResponse response  = htttp.send(req);

        system.debug('response status code: ' + response.getStatusCode());
        if (response.getStatusCode() == 200) {
            system.debug('response json body: ' + response.getBody());

            Map<string, object> results = (Map<string, object>)JSON.deserializeUntyped(response.getBody());

            //how to get all keys from map?
            for (string eachKey : results.keySet()) {
                Object objvalue = results.get(eachKey);

                List<Object> allAnimalsObj = (list<Object>)objvalue;
                List<string> allAnimalsStr = new list<string>();
                for (Object eachAnimal : allAnimalsObj) {
                    system.debug('each Animal is ====> ' + eachAnimal);
                    string str = (string)eachAnimal;
                    allAnimalsStr.add(str);
                }
                system.debug('all animals list<string> ===> ' + allAnimalsStr);

            }

        }
        
   }

   //with using wrapper class
    //json2apex (wrapper) world
    @future(callout = true)
   public static void callAnimalApi2() {
        //api or endpoint
            //https://th-apex-http-callout.herokuapp.com/animals
        //method
            //GET
        //key or auth [header]
        //body (methdo: post, put, patch)
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        req.setMethod('GET');

        Http htttp = new http();
        HttpResponse response  = htttp.send(req);

        system.debug('response status code: ' + response.getStatusCode());
        if (response.getStatusCode() == 200) {
            system.debug('response json body: ' + response.getBody());
            AnimalWrapper result = AnimalWrapper.parse(response.getBody());
            //List<string> allAnimals = result.animals;
            for (String eachAnimal : result.animals) {
                system.debug('each animal with wrapper ==> ' + eachAnimal);
            }
        }
        
   }
}