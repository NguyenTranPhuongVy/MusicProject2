using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class CategoriesDAO
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        //Hàm thêm
        public bool ADD(Category category)
        {
            try
            {
                category.category_datecreate = DateTime.Now;
                category.category_dateupdate = DateTime.Now;
                category.category_active = true;
                category.category_bin = false;
                category.category_view = 1;

                db.Categories.Add(category);
                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        //Hàm sua
        public bool Edit(Category category)
        {
            try
            {
                category.category_dateupdate = DateTime.Now;
                category.category_active = true;

                db.Entry(category).State = EntityState.Modified;
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
                Category category = db.Categories.Find(id);
                db.Categories.Remove(category);

                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Active
        public bool Active(int ? id)
        {
            try
            {
                Category category = db.Categories.Find(id);
                category.category_active = !category.category_active;
                db.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }
        //Option
        //public bool Option(int? id)
        //{
        //    try
        //    {
        //        Category category = db.Categories.Find(id);
        //        category.category_option = !category.category_option;
        //        db.SaveChanges();
        //        return true;
        //    }
        //    catch (Exception)
        //    {
        //        return false;
        //    }
        //}

        // Thay doi trang thai Thùng rác
        public bool ChangeBin(int? id)
        {
            try
            {
                Category category = db.Categories.Find(id);
                db.Categories.Find(id).category_bin = !category.category_bin;

                db.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        //Khôi Phục
        //public bool Restore(int ? id)
        //{
        //    try
        //    {
        //        Category category = db.Categories.Find(id);
        //        category.category_bin = false;

        //        db.SaveChanges();

        //        return true;
        //    }
        //    catch(Exception)
        //    {
        //        return false;
        //    }
        //}
    }
}
