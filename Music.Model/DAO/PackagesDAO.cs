using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class PackagesDAO
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        //Hàm thêm
        public bool Add(Package package)
        {
            try
            {
                package.package_datecreate = DateTime.Now;

                db.Packages.Add(package);
                db.SaveChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }
        //Hàm sửa
        public bool Edit(Package package)
        {
            try
            {
                db.Entry(package).State = EntityState.Modified;
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
                Package package = db.Packages.Find(id);
                db.Packages.Remove(package);
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
                Package package = db.Packages.Find(id);
                package.package_active = !package.package_active;
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
                Package package = db.Packages.Find(id);
                package.package_option = !package.package_option;
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
                Package package = db.Packages.Find(id);
                package.package_bin = true;

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
                Package package = db.Packages.Find(id);
                package.package_bin = false;

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
