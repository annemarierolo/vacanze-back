using vacanze_back.VacanzeApi.LogicLayer.Command.Locations; 
using vacanze_back.VacanzeApi.LogicLayer.Command; 
using vacanze_back.VacanzeApi.LogicLayer.Command.Grupo6; 
using vacanze_back.VacanzeApi.Common.Exceptions;
using vacanze_back.VacanzeApi.Common.Exceptions.Grupo8;

namespace vacanze_back.VacanzeApi.Common.Entities.Grupo6
{
    public class HotelBuilder
    {
        private readonly Hotel _hotel;

        private HotelBuilder()
        {
            _hotel = new Hotel();
        }

        public static HotelBuilder Create()
        {
            return new HotelBuilder();
        }

        public HotelBuilder IdentifiedBy(int id)
        {
            _hotel.Id = id;
            return this;
        }

        public HotelBuilder WithName(string name)
        {
            _hotel.Name = name;
            return this;
        }

        public HotelBuilder WithAmountOfRooms(int amount)
        {
            _hotel.AmountOfRooms = amount;
            return this;
        }

        public HotelBuilder WithCapacityPerRoom(int amountOfPersons)
        {
            _hotel.RoomCapacity = amountOfPersons;
            return this;
        }

        public HotelBuilder WithPhone(string phone)
        {
            _hotel.Phone = phone;
            return this;
        }

        public HotelBuilder WithWebsite(string website)
        {
            _hotel.Website = website;
            return this;
        }

        public HotelBuilder WithStars(int amountOfStars)
        {
            _hotel.Stars = amountOfStars;
            return this;
        }

        public HotelBuilder WithPictureUrl(string imageUrl)
        {
            _hotel.Picture = imageUrl;
            return this;
        }

        public HotelBuilder WithPricePerRoom(decimal price)
        {
            _hotel.PricePerRoom = price;
            return this;
        }

        public HotelBuilder LocatedAt(int locationid)
        {
            try
            {
                GetLocationByIdCommand commandId =  CommandFactory.GetLocationByIdCommand(locationid);
                commandId.Execute ();
                _hotel.Location = commandId.GetResult(); 
            }catch (LocationNotFoundException)
            {
                _hotel.Location= null;
            }
 
            return this;
        }

        public HotelBuilder WithStatus(bool isActive)
        {
            _hotel.IsActive = isActive;
            return this;
        }

        public HotelBuilder WithAddressDescription(string addressSepecification)
        {
            _hotel.AddressSpecification = addressSepecification;
            return this;
        }

        public Hotel Build()
        {
            HotelValidatorCommand command =  CommandFactory.HotelValidatorCommand(_hotel);
            command.Execute ();
            return _hotel;
        }

        public Hotel BuildSinVaidar()
        {
            return _hotel;
        }
    }
}