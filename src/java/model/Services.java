
package model;

public class Services {
    private int service_id;
    private String title;
    private String type_id;
    private String image;
    private String description;
    private int price;

    public Services() {
    }

    public Services(int service_id, String title, String type_id, String image, String description, int price) {
        this.service_id = service_id;
        this.title = title;
        this.type_id = type_id;
        this.image = image;
        this.description = description;
        this.price = price;
    }

    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType_id() {
        return type_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Services{" + "service_id=" + service_id + ", title=" + title + ", type_id=" + type_id + ", price=" + price + "}\n";
    }

    
    
}
