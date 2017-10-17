/**
 * Created by Manjit Singh on 10/17/2017.
 */


public class GeoLocationClass {
    public String place_id;    //91015268
    public String licence;    //Data © OpenStreetMap contributors, ODbL 1.0. http://www.openstreetmap.org/copyright
    public String osm_type;    //way
    public String osm_id;    //90394420
    public String lat;    //52.54877605
    public String lon;    //-1.81627033283164
    public String display_name;    //137, Pilkington Avenue, Sutton Coldfield, Birmingham, West Midlands Combined Authority, West Midlands, England, B72 1LH, United Kingdom
    public cls_address address;
    public class cls_address {
        public String house_number;    //137
        public String road;    //Pilkington Avenue
        public String suburb;    //Sutton Coldfield
        public String city;    //Birmingham
        public String county;    //West Midlands Combined Authority
        public String state_district;    //West Midlands
        public String state;    //England
        public String postcode;    //B72 1LH
        public String country;    //United Kingdom
        public String country_code;    //gb
    }
    public static GeoLocationClass parse(String json) {
        return (GeoLocationClass) System.JSON.deserialize(json, GeoLocationClass.class);
    }
}