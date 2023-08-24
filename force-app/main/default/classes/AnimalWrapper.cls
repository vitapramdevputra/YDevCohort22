public with sharing class AnimalWrapper {
    public List<String> animals;

	
	public static AnimalWrapper parse(String json) {
		return (AnimalWrapper) System.JSON.deserialize(json, AnimalWrapper.class);
	}
}