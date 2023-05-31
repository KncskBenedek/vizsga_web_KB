using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Backend.Models;

public partial class Tema
{
    public int Id { get; set; }

    public string Temanev { get; set; } = null!;
    [JsonIgnore]
    public DateTime? Timestamps { get; set; }
    [JsonIgnore]

    public virtual ICollection<Szavak> Szavaks { get; set; } = new List<Szavak>();
}
