using System;
using System.Collections.Generic;
using System.Data;
using vacanze_back.VacanzeApi.Common.Entities.Grupo6;
using vacanze_back.VacanzeApi.Common.Exceptions;

namespace vacanze_back.VacanzeApi.Persistence.Repository.Grupo6
{
    public static class HotelRepository
    {
        public static int AddHotel(Hotel hotel)
        {
            try
            {
                var table = PgConnection.Instance.ExecuteFunction(
                    "addhotel(@name, @amountOfRooms, @capacityPerRoom, @active, @addressSpecs, " +
                    "@roomPrice, @website, @phone, @picture, @stars, @location)",
                    hotel.Name,
                    hotel.AmountOfRooms,
                    hotel.RoomCapacity,
                    hotel.IsActive,
                    hotel.AddressSpecification,
                    hotel.PricePerRoom,
                    hotel.Website ?? "",
                    hotel.Phone ?? "",
                    hotel.Picture ?? "",
                    hotel.Stars,
                    hotel.Location.Id
                );
                var savedId = Convert.ToInt32(table.Rows[0][0]);
                return savedId;
            }
            catch (DatabaseException e)
            {
                throw new SaveHotelException(e.Message);
            }
            catch (Exception)
            {
                throw new SaveHotelException();
            }
        }

        public static List<Hotel> GetHotels()
        {
            var table = PgConnection.Instance.ExecuteFunction("getHotels()");
            var hotelList = new List<Hotel>();
            for (var i = 0; i < table.Rows.Count; i++)
                hotelList.Add(ExtractHotelFromRow(table.Rows[i]));
            return hotelList;
        }

        public static Hotel GetHotelById(int id)
        {
            var resultTable = PgConnection.Instance.ExecuteFunction("GetHotelById(@p_id)", id);
            if (resultTable.Rows.Count == 0)
                throw new HotelNotFoundException(id);
            return ExtractHotelFromRow(resultTable.Rows[0]);
        }

        public static List<Hotel> GetHotelsByCity(int city)
        {
            var table = PgConnection.Instance.ExecuteFunction("GetHotelsByCity(@city_id)", city);
            var hotelList = new List<Hotel>();
            for (var i = 0; i < table.Rows.Count; i++)
                hotelList.Add(ExtractHotelFromRow(table.Rows[i]));
            return hotelList;
        }

        public static void DeleteHotel(int id)
        {
            try
            {
                PgConnection.Instance.ExecuteFunction("DeleteHotel(@id)", id);
            }
            catch (DatabaseException)
            {
                throw new DeleteHotelException(
                    $"Database error while trying to delete hotel {id}");
            }
            catch (Exception)
            {
                throw new DeleteHotelException($"Unknown error while deleting hotel {id}.");
            }
        }

        public static Hotel UpdateHotel(int id, Hotel newData)
        {
            PgConnection.Instance.ExecuteFunction(
                "updatehotel(@_id, @name, @amountOfRooms, @capacityPerRoom, @active, @addressSpecs, " +
                "@roomPrice, @website, @phone, @picture, @stars, @location)",
                id,
                newData.Name,
                newData.AmountOfRooms,
                newData.RoomCapacity,
                newData.IsActive,
                newData.AddressSpecification,
                newData.PricePerRoom,
                newData.Website ?? "",
                newData.Phone ?? "",
                newData.Picture ?? "",
                newData.Stars,
                newData.Location.Id
            );
            return GetHotelById(id);
        }

        private static Hotel ExtractHotelFromRow(DataRow row)
        {
            var id = Convert.ToInt32(row[0]);
            var name = row[1].ToString();
            var amountOfRooms = Convert.ToInt32(row[2]);
            var roomCapacity = Convert.ToInt32(row[3]);
            var isActive = Convert.ToBoolean(row[4]);
            var addressSpecs = row[5].ToString();
            var pricePerRoom = Convert.ToDecimal(row[6]);
            var website = row[7].ToString();
            var phone = row[8].ToString();
            var picture = row[9].ToString();
            var stars = Convert.ToInt32(row[10]);
            var locationId = Convert.ToInt32(row[11]);

            return HotelBuilder.Create()
                .IdentifiedBy(id)
                .WithName(name)
                .WithAmountOfRooms(amountOfRooms)
                .WithCapacityPerRoom(roomCapacity)
                .WithPricePerRoom(pricePerRoom)
                .WithPhone(phone)
                .WithWebsite(website)
                .WithStars(stars)
                .WithBase64Picture(picture)
                .LocatedAt(LocationRepository.GetLocationById(locationId))
                .WithStatus(isActive)
                .WithAddressDescription(addressSpecs)
                .Build();
        }
    }
}