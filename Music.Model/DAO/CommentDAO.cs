using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class CommentDAO
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        public bool Add(Comment comment)
        {
            try
            {
                comment.comment_active = true;
                comment.comment_datecreate = DateTime.Now;
                db.Comments.Add(comment);
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        public bool Edit(Comment comment)
        {
            try
            {
                comment.comment_dateupdate = DateTime.Now;
                db.Entry(comment).State = System.Data.Entity.EntityState.Modified ;
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        public bool Del(int? id)
        {
            try
            {
                var removeItem = db.Comments.Find(id);
                foreach(var item in removeItem.Replies)
                {
                    ReplyDAO replyDAO = new ReplyDAO();
                    replyDAO.Del(item.rep_id);
                }
                db.Comments.Remove(removeItem);
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }
    }
}
