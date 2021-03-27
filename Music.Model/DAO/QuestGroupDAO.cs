using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Music.Model.EF;
using Music.Model.DAO;

namespace Music.Model.DAO
{
    public class QuestGroupDAO
    {
        MusicProjectDataEntities db = new MusicProjectDataEntities();
        public bool Add(QuestGroup questGroup)
        {
            try
            {
                questGroup.qg_datecreate = DateTime.Now;
                questGroup.qg_status = false;
                return true;
            }
            catch (Exception) { return false; }
        }

        public bool ProgressQuest(int? user_id, int? quest_id)
        {
            try
            {
                var quest = from qg in db.QuestGroups
                            where qg.user_id == user_id && qg.quest_id == quest_id
                            select quest_id;

                var qgr = db.QuestGroups.Find(quest.First());
                if(qgr.qg_status == false)
                {
                    db.Entry(qgr).State = System.Data.Entity.EntityState.Modified;
                    db.SaveChanges();
                    SuccessQuest(quest.First());
                }
                return true;
            }
            catch (Exception) { return false; }
        }
        
        public bool SuccessQuest(int? id)
        {
            try
            {
                //var questgroup = db.QuestGroups.Find(id);
                //var quest = db.Quests.Find(questgroup.quest_id);
                //if (questgroup.)
                return true;
            }
            catch (Exception) { return true; }
        }
    }
}
