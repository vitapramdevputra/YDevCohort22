public class TheDogWrapper {

	public Weight weight;
	public Weight height;
	public Integer id;
	public String name;
	public String bred_for;
	public String breed_group;
	public String life_span;
	public String temperament;
	public String origin;
	public String reference_image_id;
	public String country_code;
	public String description;
	public String history;

	public class Weight {
		public String imperial;
		public String metric;
	}

	
	public static List<TheDogWrapper> parse(String json) {
		return (List<TheDogWrapper>) System.JSON.deserialize(json, List<TheDogWrapper>.class);
	}
}