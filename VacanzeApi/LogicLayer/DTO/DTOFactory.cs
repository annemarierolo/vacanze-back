using vacanze_back.VacanzeApi.LogicLayer.DTO.Grupo14;
using  vacanze_back.VacanzeApi.LogicLayer.DTO.Grupo5;
using  vacanze_back.VacanzeApi.LogicLayer.DTO.Grupo6;

namespace vacanze_back.VacanzeApi.LogicLayer.DTO{

    public class DTOFactory{

        public static BrandDTO CreateBrandDTO(string brandName){
            return new BrandDTO(brandName);
        }
    

        // +++++++++++++++++
        //     GRUPO 6
        // +++++++++++++++++
        public static HotelDTO CreateHotelDTO(int id , string name , int amountOfRooms, int roomCapacity ,
        bool isActive, string addressSpecs, decimal pricePerRoom, string website , string phone ,
        string picture, int stars , int locationId)
        {
            return new HotelDTO(id, name, amountOfRooms, roomCapacity , isActive, addressSpecs, pricePerRoom,
                                website, phone, picture, stars, locationId );
        }

        public static LocationDTO CreateLocationDTO(int id, string country, string city){
            return new LocationDTO(id, country, city);
        }
        // +++++++++++++++++
        //     GRUPO 14
        // +++++++++++++++++
        public static ResRestaurantDTO CreateResRestaurantDTO(int id, string locationName, string pais, string restName,
         string address, string fecha_reservacion, int cant_person)
        {

            return new ResRestaurantDTO( id,  locationName,  pais,  restName,
          address,  fecha_reservacion,  cant_person);
        }
    }

}