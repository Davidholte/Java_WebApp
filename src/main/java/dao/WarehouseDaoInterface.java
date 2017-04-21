package dao;


import pojos.Warehouse;

import java.util.ArrayList;


public interface WarehouseDaoInterface {
    public void createWarehouse(Warehouse warehouse);
    public void createWarehouse(String name_warehouse, String address, String description);
    public void deleteWarehouse(int warehouse_id);
    public void updateWarehouse(Warehouse warehouse);
    public ArrayList<Warehouse> getAllWarehouses(String string);
    public Warehouse getWarehouseById(int warehouseId);
}
