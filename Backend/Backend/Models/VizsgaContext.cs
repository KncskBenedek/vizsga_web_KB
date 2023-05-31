using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Backend.Models;

public partial class VizsgaContext : DbContext
{
    public VizsgaContext()
    {
    }

    public VizsgaContext(DbContextOptions<VizsgaContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Szavak> Szavaks { get; set; }

    public virtual DbSet<Tema> Temas { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=localhost;Initial Catalog=vizsga;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Szavak>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__szavak__3213E83F795ED440");

            entity.ToTable("szavak");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Angol)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("angol");
            entity.Property(e => e.Magyar)
                .HasMaxLength(40)
                .IsUnicode(false)
                .HasColumnName("magyar");
            entity.Property(e => e.TemaId).HasColumnName("temaId");
            entity.Property(e => e.Timestamps)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("timestamps");

            entity.HasOne(d => d.Tema).WithMany(p => p.Szavaks)
                .HasForeignKey(d => d.TemaId)
                .HasConstraintName("FK__szavak__temaId__286302EC");
        });

        modelBuilder.Entity<Tema>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tema__3213E83F4103CD26");

            entity.ToTable("tema");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Temanev)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("temanev");
            entity.Property(e => e.Timestamps)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("timestamps");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
