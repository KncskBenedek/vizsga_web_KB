using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Backend.Migrations
{
    /// <inheritdoc />
    public partial class CreateInit : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "tema",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    temanev = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: false),
                    timestamps = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__tema__3213E83F4103CD26", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "szavak",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    angol = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    magyar = table.Column<string>(type: "varchar(40)", unicode: false, maxLength: 40, nullable: true),
                    temaId = table.Column<int>(type: "int", nullable: true),
                    timestamps = table.Column<DateTime>(type: "datetime", nullable: true, defaultValueSql: "(getdate())")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__szavak__3213E83F795ED440", x => x.id);
                    table.ForeignKey(
                        name: "FK__szavak__temaId__286302EC",
                        column: x => x.temaId,
                        principalTable: "tema",
                        principalColumn: "id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_szavak_temaId",
                table: "szavak",
                column: "temaId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "szavak");

            migrationBuilder.DropTable(
                name: "tema");
        }
    }
}
