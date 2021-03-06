namespace vacanze_back.VacanzeApi.Common.Entities.Grupo3
{
    public class Airplane: Entity
    {

        
        public string model {get; set;}
        public double loadCapacity {get; set;}
        public int seats {get; set;}
        public double autonomy {get; set;}
        public bool isActive { get; set; }

        public Airplane():base(0){
            
        }

        public Airplane(int id):base(id){
            
        }
        
        public Airplane(int id, string model, double load_capacity, int seats, double autonomy, bool isActive):base(id){
            this.model = model;
            this.loadCapacity = load_capacity;
            this.autonomy = autonomy;
            this.seats = seats;
            this.isActive = isActive;
        }

        public void setModel(string model){
            this.model = model;
        }

        public void setLoadCapacity(double loadCapacity){
            this.loadCapacity = loadCapacity;
        }

        public void setAutonomy(double autonomy){
            this.autonomy = autonomy;
        }

        public void setSeats(int seats){
            this.seats = seats;
        }

    }
}