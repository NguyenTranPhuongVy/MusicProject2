using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class SingersDAO
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        //Hàm thêm
        public bool Add(Singer singer)
        {
            try
            {
                singer.singer_datecreate = DateTime.Now;
                singer.singer_dateupdate = DateTime.Now;

                db.Singers.Add(singer);
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }
        //Hàm xoá
        public bool Delete(int? id)
        {
            try
            {
                Singer singer = db.Singers.Find(id);
                db.Singers.Remove(singer);

                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Hàm sửa
        public bool Edit(Singer singer)
        {
            try
            {
                db.Entry(singer).State = EntityState.Modified;
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
                Singer singer = db.Singers.Find(id);
                singer.singer_active = !singer.singer_active;

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
                Singer singer = db.Singers.Find(id);
                singer.singer_option = !singer.singer_option;

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
                Singer singer = db.Singers.Find(id);
                singer.singer_bin = true;

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
                Singer singer = db.Singers.Find(id);
                singer.singer_bin = false;

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
