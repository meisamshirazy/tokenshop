﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;
using TokenShop.Models;

namespace TokenShop.Areas.admin.Controllers
{
    public class NewsController : BaseController
    {
        // GET: admin/News
        public ActionResult Index()
        {
            string permissions = "";
            int stat = 0;
            if (HasPermission("[news]", ref permissions, ref stat))
                return RedirectToAction("AccessDeny");
            ViewBag.permissions = permissions;
            ViewBag.stat = stat;

            ViewBag.Title = "خبرها";
            List<Post> tk = new List<Post>();
            try
            {
                Dictionary<string, string> parameters = new Dictionary<string, string>();
                parameters.Add("type", "1");
                tk = new Post().GetAll(parameters);
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.Description = ex.Message;
                if (ex.InnerException != null)
                    log.Description += ";" + ex.Message;
                log.ErrorDate = DateTime.Now;
                log.Add();
            }
            return View(tk);
        }
        public ActionResult Create()
        {
            string permissions = "";
            int stat = 0;
            if (HasPermission("[news]", ref permissions, ref stat))
                return RedirectToAction("AccessDeny");
            ViewBag.permissions = permissions;
            ViewBag.stat = stat;

            ViewBag.Title = "ثبت خبر جدید";

            Post tk = new Post();
            try
            {
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.Description = ex.Message;
                if (ex.InnerException != null)
                    log.Description += ";" + ex.Message;
                log.ErrorDate = DateTime.Now;
                log.Add();
            }
            return View(tk);
        }
        [HttpPost]
        public ActionResult Create(string subject, string content, string status, HttpPostedFileBase cover)
        {
            string permissions = "";
            int stat = 0;
            if (HasPermission("[news]", ref permissions, ref stat))
                return RedirectToAction("AccessDeny");
            ViewBag.permissions = permissions;
            ViewBag.stat = stat;

            ViewBag.Title = "ثبت خبر جدید";
            Post tk = new Post();
            try
            {
                if (cover != null)
                {
                    string rnd = DateTime.Now.Year.ToString("0000") + DateTime.Now.Month.ToString("00") + DateTime.Now.Day.ToString("00") + DateTime.Now.Hour.ToString("00") + DateTime.Now.Minute.ToString("00") + DateTime.Now.Second.ToString("00") + Path.GetExtension(cover.FileName);
                    cover.SaveAs(Server.MapPath("~/media/cover/" + rnd));
                    tk.Cover = rnd;
                }
                tk.Point = 0;
                tk.Type = 1;
                tk.CreateDate = DateTime.Now;
                tk.FriendlyUrl = subject.Replace("%", "").Replace("?", "").Replace(".", "").Replace("<", "").Replace(">", "").Replace(")", "").Replace("(", "").Replace("'", "").Replace("\"", "").Replace("\\", "").Replace("/", "").Replace("!", "").Replace("+", "").Replace("_", "").Replace("-", "").Replace("#", "").Replace("}", "").Replace("{", "").Replace("]", "").Replace("[", "").Trim().Replace(" ", "-");
                tk.ModifyDate = DateTime.Now;
                tk.PostContent = content;
                tk.Seen = 0;
                tk.Status = int.Parse(status);
                tk.Subject = subject;
                tk.UserId = int.Parse(Session["user_id"].ToString());
                tk.Add();
                return RedirectToAction("", "News");
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.Description = ex.Message;
                if (ex.InnerException != null)
                    log.Description += ";" + ex.Message;
                log.ErrorDate = DateTime.Now;
                log.Add();
            }
            return View(tk);
        }
        public ActionResult Modify(long Id)
        {
            string permissions = "";
            int stat = 0;
            if (HasPermission("[news]", ref permissions, ref stat))
                return RedirectToAction("AccessDeny");
            ViewBag.permissions = permissions;
            ViewBag.stat = stat;

            ViewBag.Title = "ویرایش خبر";
            Post tk = new Post();
            try
            {
                tk.Id = Id;
                tk=tk.GetOne();
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.Description = ex.Message;
                if (ex.InnerException != null)
                    log.Description += ";" + ex.Message;
                log.ErrorDate = DateTime.Now;
                log.Add();
            }
            return View(tk);
        }
        [HttpPost]
        public ActionResult Modify(string newsId,string subject, string content, string status, HttpPostedFileBase cover)
        {
            string permissions = "";
            int stat = 0;
            if (HasPermission("[news]", ref permissions, ref stat))
                return RedirectToAction("AccessDeny");
            ViewBag.permissions = permissions;
            ViewBag.stat = stat;

            ViewBag.Title = "ویرایش خبر";
            Post tk = new Post();
            try
            {
                tk.Id = long.Parse(newsId);
                tk = tk.GetOne();
                if (cover != null)
                {
                    string rnd = DateTime.Now.Year.ToString("0000") + DateTime.Now.Month.ToString("00") + DateTime.Now.Day.ToString("00") + DateTime.Now.Hour.ToString("00") + DateTime.Now.Minute.ToString("00") + DateTime.Now.Second.ToString("00") + Path.GetExtension(cover.FileName);
                    cover.SaveAs(Server.MapPath("~/media/cover/" + rnd));
                    tk.Cover = rnd;
                }
                tk.ModifyDate = DateTime.Now;
                tk.PostContent = content;
                tk.Status = int.Parse(status);
                tk.Subject = subject;
                tk.ModifiedUserId = int.Parse(Session["user_id"].ToString());
                tk.Update();
                return RedirectToAction("", "News");
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.Description = ex.Message;
                if (ex.InnerException != null)
                    log.Description += ";" + ex.Message;
                log.ErrorDate = DateTime.Now;
                log.Add();
            }
            return View(tk);
        }
    }
}