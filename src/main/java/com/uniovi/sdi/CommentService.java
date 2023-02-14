package com.uniovi.sdi;
import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import java.util.LinkedList;
import java.util.List;
public class CommentService {
    public List<Comment> getComments() {
        List<Comment> comments = new LinkedList<Comment>();
        ObjectContainer db = null;
        try {
            db = Db4oEmbedded.openFile("dbComments");
            List<Comment> response = db.queryByExample(Comment.class);

            comments.addAll(response);
        } finally {
            db.close();
        }
        return comments;
    }
    public void setNewComment(Comment newComment) {
        ObjectContainer db = null;
        try {
            db = Db4oEmbedded.openFile("dbComments");
            db.store(newComment);
        } finally {
            db.close();
        }
    }
}