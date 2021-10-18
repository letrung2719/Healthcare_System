
package model;

/**
 *
 * @author admin
 */
public class Services {
    private int service_id;
    private String title;
    private String type_id;
    private String image;
    private String description;
    private int price;

    /**
     *
     */
    public Services() {
    }

    /**
     *
     * @param service_id
     * @param title
     * @param type_id
     * @param image
     * @param description
     * @param price
     */
    public Services(int service_id, String title, String type_id, String image, String description, int price) {
        this.service_id = service_id;
        this.title = title;
        this.type_id = type_id;
        this.image = image;
        this.description = description;
        this.price = price;
    }

    /**
     *
     * @return
     */
    public int getService_id() {
        return service_id;
    }

    /**
     *
     * @param service_id
     */
    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    /**
     *
     * @return
     */
    public String getTitle() {
        return title;
    }

    /**
     *
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     *
     * @return
     */
    public String getType_id() {
        return type_id;
    }

    /**
     *
     * @param type_id
     */
    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    /**
     *
     * @return
     */
    public String getImage() {
        return image;
    }

    /**
     *
     * @param image
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     *
     * @return
     */
    public String getDescription() {
        return description;
    }

    /**
     *
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     *
     * @return
     */
    public int getPrice() {
        return price;
    }

    /**
     *
     * @param price
     */
    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Services{" + "service_id=" + service_id + ", title=" + title + ", type_id=" + type_id + ", price=" + price + "}\n";
    }

    
    
}
