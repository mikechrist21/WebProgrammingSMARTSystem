<%@page import="java.util.*" %>

<%!
    public class Truck {
        private Connect connect;

        private Integer id;
        private String truckBrand;
        private String truckType;
        private String truckYear;
        private String truckPlate;
        private String stnkNumber;
        private String stnkYear;
        private String stnkExpiredDate;
        private String location;
        private String driverName;
        private String image;
        public Truck() {
            /*
             * Set value with Connect class instance
             */
            this.connect = Connect.getConnection();
        }

        public Truck(ResultSet resultSet) {
            /*
             * Set value with Connect class instance
             */
            this.connect = Connect.getConnection();
            
            try {
                
                /*
                 * Fill this Course class attribute with the data from the.
                 * getInt(<column>) -> to get integer value
                 * getString(<column>) -> to get string value
                 * The parameter from getInt() and getString() method base on column name from course table or column order that start from 1..n
                 */
                
                this.id = resultSet.getInt("id");
                this.truckBrand = resultSet.getString("truckBrand");
                this.truckType = resultSet.getString("truckType");
                this.truckYear = resultSet.getString("truckYear");
                this.truckPlate = resultSet.getString("truckPlate");
                this.stnkNumber = resultSet.getString("stnkNumber");
                this.stnkYear = resultSet.getString("stnkYear");
                this.stnkExpiredDate = resultSet.getString("stnkExpiredDate");
                this.location = resultSet.getString("location");
                this.driverName = resultSet.getString("driverName");
                this.image = resultSet.getString("image");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        /*
         * Setter and Getter from this class
         */
        public void setId(Integer id) { this.id = id; }
        public Integer getId() { return id; }
        public void setTruckBrand(String truckBrand) { this.truckBrand = truckBrand; }
        public String getTruckBrand() { return truckBrand; }
        public void setTruckType(String truckType) { this.truckType = truckType; }
        public String getTruckType() { return truckType; }
        public void setTruckYear(String truckYear) { this.truckYear = truckYear; }
        public String getTruckYear() { return truckYear; }
        public void setTruckPlate(String truckPlate) { this.truckPlate = truckPlate; }
        public String getTruckPlate() { return truckPlate; }
        public void setStnkNumber(String stnkNumber) { this.stnkNumber = stnkNumber; }
        public String getStnkNumber() { return stnkNumber; }
        public void setStnkYear(String stnkYear) { this.stnkYear = stnkYear; }
        public String getStnkYear() { return stnkYear; }
        public void setStnkExpiredDate(String stnkExpiredDate) { this.stnkExpiredDate = stnkExpiredDate; }
        public String getStnkExpiredDate() { return stnkExpiredDate; }
        public void setLocation(String location) { this.location = location; }
        public String getLocation() { return location; }
        public void setDriverName(String driverName) { this.driverName = driverName; }
        public String getDriverName() { return driverName; }
        public void setImage(String image) { this.image = image; }
        public String getImage() { return image; }
        /*
         * Method to get all data from the database
         */
        public Vector<Truck> get() {
            Vector<Truck> trucks = new Vector<Truck>();
    
            try {
                /*
                 * Query to get all data
                 */
                String query = "SELECT * FROM trucks";
                
                /*
                 * Execute the query
                 */
                ResultSet resultSet = connect.executeQuery(query);    
                
                /*
                 * Add all result from the database to the list
                 */
                while (resultSet.next()) {
                    trucks.add(new Truck(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return trucks;
        }

        /*
         * Method to get data from the database by id 
         */
        public Truck find(Integer id) {
            Truck result = null;
    
            try {
                String query = String.format("SELECT * FROM trucks WHERE id = %d LIMIT 1", id);
                ResultSet resultSet = connect.executeQuery(query);
                if (resultSet.next()) {
                    result = new Truck(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        /*
         * Method to get data from the database by column name and value 
         */
        public Truck exists(String column, String value) {
            Truck result = null;
            
            try {
                /*
                 * Query to get data by column name and value
                 */
                String query = String.format("SELECT * FROM trucks WHERE %s = '%s' LIMIT 1", column, value);
                
                /*
                 * Execute the query
                 */
                ResultSet resultSet = connect.executeQuery(query);
                
                /*
                 * Set result value to course model
                 */
                if (resultSet.next()) {
                    result = new Truck(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;    
        }

        /*
         * Method to get last data from the database
         */
        public Truck last() {
            Truck result = null;
            
            try {
                /*
                 * Query to get data last data
                 */
                String query = "SELECT * FROM trucks ORDER BY id DESC LIMIT 1";

                /*
                 * Execute the query
                 */
                ResultSet resultSet = connect.executeQuery(query);            
                
                /*
                 * Set result value to course model
                 */
                if (resultSet.next()) {
                    result = new Truck(resultSet);
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        /*
         * Method to insert data to the database
         */
        public Truck insert() {
            try {
                /*
                 * Query to insert data
                 */
                String query = String.format("INSERT INTO trucks (truckBrand, truckType, truckYear, truckPlate, stnkNumber, stnkYear, stnkExpiredDate, location, driverName, image) VALUES ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')", truckBrand, truckType, truckYear, truckPlate, stnkNumber, stnkYear, stnkExpiredDate,location, driverName, image);
                /*
                 * Execute the query
                 */
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            /*
             * Return last inserted data
             */
            return last();
        }

        /*
         * Method to update data from the database
         */
        public Truck update() {
            try {
                /*
                 * Query to update data
                 */
                String query = String.format("UPDATE trucks SET truckBrand = '%s', truckType = '%s', truckYear = '%s', truckPlate = '%s', stnkNumber = '%s', stnkYear = '%s', stnkExpiredDate = '%s', location = '%s', driverName = '%s' image='%s' WHERE id = %d",truckBrand, truckType, truckYear, truckPlate, stnkNumber, stnkYear, stnkExpiredDate, location, driverName, image, id);
                
                /*
                 * Execute the query
                 */
                connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            return this;
        }

        /*
         * Method to delete data from the database by id
         */
        public Boolean delete(Integer id) {
            Integer affected = 0;
            try {
                /*
                 * Query to delete data
                 */
                String query = String.format("DELETE FROM trucks WHERE id = %d", id);

                /*
                 * Execute the query
                 */
                affected = connect.executeUpdate(query);
            } catch (Exception e) {
                e.printStackTrace();
            }

            return affected > 0;
        }
    }
%>
