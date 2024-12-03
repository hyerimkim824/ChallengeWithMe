package kr.support.action;

public class Gift {
    private String name;
    private String description;
    private int price;
    private String imageUrl;

    // 생성자, getter, setter 추가
    public Gift(String name, String description, int price, String imageUrl) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.imageUrl = imageUrl;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public int getPrice() {
        return price;
    }

    public String getImageUrl() {
        return imageUrl;
    }
}