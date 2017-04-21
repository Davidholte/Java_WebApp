package pojos;


public class Warehouse {

    private int id_warehouse;
    private String name_warehouse;
    private String address;
    private String description;

    /**Empty constructor:*/
    public Warehouse() {

    }
    /**Full Constructor:*/
    public Warehouse(int id_warehouse, String name_warehouse, String address, String description) {
        this.id_warehouse = id_warehouse;
        this.name_warehouse = name_warehouse;
        this.address = address;
        this.description = description;
    }

    /**Getters and Setters:*/
    public int getId() {
        return id_warehouse;
    }

    public void setId(int id_warehouse) {
        this.id_warehouse = id_warehouse;
    }

    public String getName() {
        return name_warehouse;
    }

    public void setName(String name_warehouse) {
        this.name_warehouse = name_warehouse;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String toString() {
        return  "ID: " + id_warehouse + "\n" +
                "Warehouse Name: " + name_warehouse + "\n" +
                "Address: " + address + "\n" +
                "Description" + description + "\n";

    }
}
