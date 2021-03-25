using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    class PaysDAO
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        //Hàm thêm
        public bool Add(Pay pay)
        {
            try
            {
                db.Pays.Add(pay);
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }
        //Hàm sửa
        public bool Edit(Pay pay)
        {
            try
            {
                db.Entry(pay).State = EntityState.Modified;
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
                Pay pay = db.Pays.Find(id);
                db.Pays.Remove(pay);
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
