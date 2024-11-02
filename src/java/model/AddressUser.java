package model;

public class AddressUser {
    private int userId;
    private int addressId;
    private String address;

    public AddressUser() {
    }

    public AddressUser(int userId, int addressId, String address) {
        this.userId = userId;
        this.addressId = addressId;
        this.address = address;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
