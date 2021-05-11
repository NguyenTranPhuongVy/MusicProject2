﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Music.Model.EF
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MusicProjectDataEntities : DbContext
    {
        public MusicProjectDataEntities()
            : base("name=MusicProjectDataEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Album> Albums { get; set; }
        public virtual DbSet<Author> Authors { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<Genre> Genres { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<History> Historys { get; set; }
        public virtual DbSet<Music> Musics { get; set; }
        public virtual DbSet<National> Nationals { get; set; }
        public virtual DbSet<Package> Packages { get; set; }
        public virtual DbSet<Pay> Pays { get; set; }
        public virtual DbSet<PlayList> PlayLists { get; set; }
        public virtual DbSet<Quest> Quests { get; set; }
        public virtual DbSet<QuestGroup> QuestGroups { get; set; }
        public virtual DbSet<Reply> Replies { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Singer> Singers { get; set; }
        public virtual DbSet<Slider> Sliders { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}
