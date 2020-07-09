<%@page import="java.util.*" %>

<%!
    public class Outflow {
        private Connect connect;
        private Integer id;
        private Integer truckID;
        private String trxDate;
        private String trxDescription;
        private Integer trxValue;
        public Outflow() {
            /*
             * Set value with Connect class instance
             */
            this.connect = Connect.getConnection();
        }

        public Outflow(ResultSet resultSet) {
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
                this.truckID = resultSet.getInt("truckID");
                this.trxDate = resultSet.getString("trxDate");
                this.trxDescription = resultSet.getString("trxDescription");
                this.trxValue = resultSet.getInt("trxValue");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        /*
         * Setter and Getter from this class
         */


        public void setId(Integer id) { this.id = id; }
        public Integer getId() { return id; }
        public void setTruckID(Integer truckID) { this.truckID = truckID; }
        public Integer getTruckID() { return truckID; }
        public void setTrxDate(String trxDate) { this.trxDate = trxDate; }
        public String getTrxDate() { return trxDate; }
        public void setTrxDescription(String trxDescription) { this.trxDescription = trxDescription; }
        public String getTrxDescription() { return trxDescription; }
        public void setTrxValue(Integer trxValue) { this.trxValue = trxValue; }
        public Integer getTrxValue() { return trxValue; }
        
        /*
         * Method to get all data from the database
         */
        public Vector<Outflow> get() {
            Vector<Outflow> outflows = new Vector<Outflow>();
    
            try {
                /*
                 * Query to get all data
                 */
                String query = "SELECT * FROM outflows";
                
                /*
                 * Execute the query
                 */
                ResultSet resultSet = connect.executeQuery(query);    
                
                /*
                 * Add all result from the database to the list
                 */
                while (resultSet.next()) {
                    outflows.add(new Outflow(resultSet));        
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            return outflows;
        }

        /*
         * Method to get data from the database by id 
         */
        public Outflow find(Integer id) {
            Outflow result = null;
    
            try {
                String query = String.format("SELECT * FROM outflows WHERE id = %d LIMIT 1", id);
                ResultSet resultSet = connect.executeQuery(query);
                if (resultSet.next()) {
                    result = new Outflow(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        /*
         * Method to get data from the database by column name and value 
         */
        public Outflow exists(String column, String value) {
            Outflow result = null;
            
            try {
                /*
                 * Query to get data by column name and value
                 */
                String query = String.format("SELECT * FROM outflows WHERE %s = '%s' LIMIT 1", column, value);
                
                /*
                 * Execute the query
                 */
                ResultSet resultSet = connect.executeQuery(query);
                
                /*
                 * Set result value to course model
                 */
                if (resultSet.next()) {
                    result = new Outflow(resultSet);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return result;    
        }

        /*
         * Method to get last data from the database
         */
        public Outflow last() {
            Outflow result = null;
            
            try {
                /*
                 * Query to get data last data
                 */
                String query = "SELECT * FROM outflows ORDER BY id DESC LIMIT 1";

                /*
                 * Execute the query
                 */
                ResultSet resultSet = connect.executeQuery(query);            
                
                /*
                 * Set result value to course model
                 */
                if (resultSet.next()) {
                    result = new Outflow(resultSet);
                } 
            } catch (Exception e) {
                e.printStackTrace();
            }

            return result;
        }

        /*
         * Method to insert data to the database
         */
        public Outflow insert() {
            try {
                /*
                 * Query to insert data
                 */
                String query = String.format("INSERT INTO outflows (truckID, trxDate, trxDescription, trxValue) VALUES (%d, '%s', '%s', %d)", truckID, trxDate, trxDescription, trxValue);
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
        public Outflow update() {
            try {
                /*
                 * Query to update data
                 */
                String query = String.format("UPDATE outflows SET truckID = %d, trxDate = '%s', trxDescription = '%s', trxValue = %d WHERE id = %d",truckID, trxDate, trxDescription, trxValue, id);
                
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
                String query = String.format("DELETE FROM outflows WHERE id = %d", id);

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
