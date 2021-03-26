using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class GroupDAO
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        public bool Add(Group group)
        {
            try
            {
                group.group_datecreate = DateTime.Now;
                db.Groups.Add(group);
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }

        public bool Del(int? id)
        {
            try
            {
                var removeItem = db.Groups.Find(id);
                db.Groups.Remove(removeItem);
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }
    }
}
