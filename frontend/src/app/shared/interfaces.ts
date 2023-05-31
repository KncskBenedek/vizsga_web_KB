export interface Tema
{
    id: number;
    temanev: string;
}

export interface Szavak
{
    id: number;
    angol: string;
    magyar: string;
    temaId: number;
    temanev: string;
}