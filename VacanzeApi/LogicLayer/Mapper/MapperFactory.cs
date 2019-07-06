using vacanze_back.VacanzeApi.LogicLayer.Mapper.Grupo3;
using vacanze_back.VacanzeApi.LogicLayer.Mapper.Grupo5;
using vacanze_back.VacanzeApi.LogicLayer.Mapper.Grupo6;
using vacanze_back.VacanzeApi.LogicLayer.Mapper.Grupo7;

namespace vacanze_back.VacanzeApi.LogicLayer.Mapper
{

    public class MapperFactory{

        public static BrandMapper createBrandMapper(){
            return new BrandMapper();
        }

        public static RestaurantMapper CreateRestaurantMapper()
        {
            return new RestaurantMapper();
        }

        public static HotelMapper createHotelMapper(){
            return new HotelMapper();
        }

        public static FlightMapper createFlightMapper(){
            return new FlightMapper();
        }


        public static LocationMapper createLocationMapper(){
            return new LocationMapper();
        }
    }
}