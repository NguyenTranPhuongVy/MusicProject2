using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Music.Model.EF;

namespace Music.Model.DAO
{
    public class ProfilesDAO
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        ////Hàm thêm
        //public bool Add(Profile profile)
        //{
        //    try
        //    {
        //        db.Profiles.Add(profile);
        //        db.SaveChanges();

        //        return true;
        //    }
        //    catch
        //    {
        //        return false;
        //    }
        //}
        ////Hàm sửa
        //public bool Edit(Profile profile)
        //{
        //    try
        //    {
        //        db.Entry(profile).State = EntityState.Modified;
        //        db.SaveChanges();

        //        return true;
        //    }
        //    catch(Exception)
        //    {
        //        return false;
        //    }
        //}
        ////Hàm xoá
        //public bool Delete(int ? id)
        //{
        //    try
        //    {
        //        Profile profile = db.Profiles.Find(id);
        //        db.Profiles.Remove(profile);
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
