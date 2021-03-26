using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class ReplyDAO
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        public bool Add(Reply reply)
        {
            try
            {
                reply.rep_active = true;
                reply.rep_datecreate = DateTime.Now;
                db.Replies.Add(reply);
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        public bool Edit(Reply reply)
        {
            try
            {
                reply.rep_dateupdate = DateTime.Now;
                db.Entry(reply).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        public bool Del(int? id)
        {
            try
            {
                var removeItem = db.Replies.Find(id);
                db.Replies.Remove(removeItem);
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }
    }
}
