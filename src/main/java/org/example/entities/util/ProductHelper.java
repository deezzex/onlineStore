/**
 * @author deezzex <3
 */


package org.example.entities.util;

import org.example.entities.User;

public abstract class ProductHelper {
    public static String getAuthorName(User author){
        return author != null ? author.getUsername() : "<none>";
    }
}
