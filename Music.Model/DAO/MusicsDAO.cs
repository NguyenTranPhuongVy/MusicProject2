using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;
using Music.Model.DAO;

namespace Music.Model.DAO
{
    public class MusicsDAO
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        GroupDAO groupDAO = new GroupDAO();
        PlayListDAO playListDAO = new PlayListDAO();

        //Hàm thêm
        public bool Add(Music.Model.EF.Music musics, int[] category, int[] singer, int[] album)
        {
            try
            {
                musics.music_datecreate = DateTime.Now;
                musics.music_view = 1;
                musics.music_dowload = 0;
                musics.music_active = false;
                musics.music_option = true ;
                musics.music_bin = false ;

                db.Musics.Add(musics);
                db.SaveChanges();

                // get music id
                var music_id = db.Musics.FirstOrDefault(t => t.user_id == musics.user_id && t.music_bin == false && t.music_active == false).music_id;

                // add category
                foreach(var item in category)
                {
                    groupDAO.Add(new Group()
                    {
                        category_id = item,
                        music_id = music_id
                    });
                }

                // add singer
                foreach (var item in singer)
                {
                    groupDAO.Add(new Group()
                    {
                        category_id = item,
                        music_id = music_id
                    });
                }

                // add music to album
                foreach (var item in album)
                {
                    playListDAO.Add(new PlayList()
                    {
                        albums_id = item,
                        music_id = music_id
                    });
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        //Hàm sửa
        public bool Edit(Music.Model.EF.Music musics, int[] category, int[] singer, int[] album)
        {
            try
            {
                db.Entry(musics).State = EntityState.Modified;
                db.SaveChanges();

                //remove old category 
                foreach(var item in musics.Groups.Where(x => x.category_id != null))
                {
                    db.Groups.Remove(item);
                }
                // add category
                foreach (var item in category)
                {
                    groupDAO.Add(new Group()
                    {
                        category_id = item,
                        music_id = musics.music_id
                    });
                }

                //remove old singer 
                foreach (var item in musics.Groups.Where(x => x.singer_id != null))
                {
                    db.Groups.Remove(item);
                }
                // add singer
                foreach (var item in singer)
                {
                    groupDAO.Add(new Group()
                    {
                        category_id = item,
                        music_id = musics.music_id
                    });
                }

                // remove old album
                foreach (var item in musics.PlayLists)
                {
                    db.PlayLists.Remove(item);
                }
                // add singer
                foreach (var item in album)
                {
                    playListDAO.Add(new PlayList()
                    {
                        albums_id = item,
                        music_id = musics.music_id
                    });
                }
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
