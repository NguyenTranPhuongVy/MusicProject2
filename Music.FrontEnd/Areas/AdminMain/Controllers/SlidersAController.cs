using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Music.FrontEnd.Function;
using Music.Model.EF;

namespace Music.FrontEnd.Areas.AdminMain.Controllers
{
    public class SlidersAController : Controller
    {
        private MusicProjectDataEntities db = new MusicProjectDataEntities();
        private FilesController filesController = new FilesController();

        // GET: AdminMain/SlidersA
        public ActionResult Index()
        {
            return View(db.Sliders.OrderByDescending(n=>n.slider_datecreate).ToList());
        }

        // GET: AdminMain/SlidersA/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slider slider = db.Sliders.Find(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            return View(slider);
        }

        // GET: AdminMain/SlidersA/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminMain/SlidersA/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "slider_id,slider_img,slider_name,slider_link,slider_datecreate,slider_active")] Slider slider, HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                slider.slider_img = filesController.AddImages(img, "Banner", Guid.NewGuid().ToString());
                slider.slider_datecreate = DateTime.Now;
                db.Sliders.Add(slider);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(slider);
        }

        // GET: AdminMain/SlidersA/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slider slider = db.Sliders.Find(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            return View(slider);
        }

        // POST: AdminMain/SlidersA/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "slider_id,slider_img,slider_name,slider_link,slider_datecreate,slider_active")] Slider slider, HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                if(img != null)
                {
                    slider.slider_img = filesController.AddImages(img, "Banner", Guid.NewGuid().ToString());
                }
                db.Entry(slider).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(slider);
        }

        // GET: AdminMain/SlidersA/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slider slider = db.Sliders.Find(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            db.Sliders.Remove(slider);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ChangeActive(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Music.Model.EF.Slider slider = db.Sliders.Find(id);
            if (slider == null)
            {
                return HttpNotFound();
            }
            db.Sliders.Find(id).slider_active = !db.Sliders.Find(id).slider_active;
            db.SaveChanges();
            return Json(true, JsonRequestBehavior.AllowGet);
        }

        // POST: AdminMain/SlidersA/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Slider slider = db.Sliders.Find(id);
            db.Sliders.Remove(slider);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
