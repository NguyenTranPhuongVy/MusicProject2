using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class MusicsDAO
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        //Hàm thêm
        public bool Add(Music.Model.EF.Music musics)
        {
            try
            {
                musics.music_datecreate = DateTime.Now;
                musics.music_dateedit = DateTime.Now;
                musics.music_favorite = 1;
                musics.music_view = 1;
                musics.music_dowload = 0;

                db.Musics.Add(musics);
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }
        //Hàm sửa
        public bool Edit(Music.Model.EF.Music musics)
        {
            try
            {
                db.Entry(musics).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        //Hàm xoá
        public bool Delete(int? id)
        {
            try
            {
                Music.Model.EF.Music musics = db.Musics.Find(id);
                db.Musics.Remove(musics);
                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Active
        public bool Active(int? id)
        {
            try
            {
                Music.Model.EF.Music musics = db.Musics.Find(id);
                musics.music_active = !musics.music_active;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        //Option
        public bool Option(int? id)
        {
            try
            {
                Music.Model.EF.Music musics = db.Musics.Find(id);
                musics.music_option = !musics.music_option;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Thùng rác
        public bool Del(int? id)
        {
            try
            {
                Music.Model.EF.Music musics = db.Musics.Find(id);
                musics.music_bin = true;

                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Khôi Phục
        public bool Restore(int? id)
        {
            try
            {
                Music.Model.EF.Music musics = db.Musics.Find(id);
                musics.music_bin = false;

                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
