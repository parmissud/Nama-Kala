import java.util.List;

public class User_login {
    List<user> users;

    public User_login(List users) {
        this.users = users;
    }

    public String checkIfUserHasAcc(String command){
        String phoneNumber=command.split("_")[1];
        String pass=command.split("_")[2];
        for (user u:users
             ) {
            if (u.phoneNumber.equals(phoneNumber)){
                if (u.pass==pass)
                    return "true";
            }

        }
        return "false";

    }

}
