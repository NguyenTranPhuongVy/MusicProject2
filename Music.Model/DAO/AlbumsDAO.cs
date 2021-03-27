using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class AlbumsDAO
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        //Hàm thêm
        public bool Add(Album album)
        {
            try
            {
                album.album_datecreate = DateTime.Now;
                album.album_active = true;
                album.album_bin = false;
                album.album_view = 1;

                db.Albums.Add(album);
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }
        //Hàm sửa
        public bool Edit(Album album)
        {
            try
            {
                album.album_dateedit = DateTime.Now;
                db.Entry(album).State = EntityState.Modified;
                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        //Hàm xoá
        public bool Delete(int ? id)
        {
            try
            {
                Album album = db.Albums.Find(id);
                db.Albums.Remove(album);
                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Active(int? id)
        {
            try
            {
                Album album = db.Albums.Find(id);
                album.album_active = !album.album_active;
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
                Album album = db.Albums.Find(id);
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
                Album album = db.Albums.Find(id);
                album.album_bin = true;

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
                Album album = db.Albums.Find(id);
                album.album_bin = false;

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
