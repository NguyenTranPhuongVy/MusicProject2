using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class PlayListDAO
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        public bool Add(PlayList playList)
        {
            try
            {
                playList.playlist_datecreate = DateTime.Now;
                db.PlayLists.Add(playList);
                db.SaveChanges();
                return true;
            }
            catch (Exception) { return false; }
        }
    }
}
