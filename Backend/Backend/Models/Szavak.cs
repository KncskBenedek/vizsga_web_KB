using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace Backend.Models;

public partial class Szavak
{
    public int Id { get; set; }

    public string? Angol { get; set; }

    public string? Magyar { get; set; }

    public int? TemaId { get; set; }
    [JsonIgnore]
    public DateTime? Timestamps { get; set; }

    public virtual Tema? Tema { get; set; }
}
