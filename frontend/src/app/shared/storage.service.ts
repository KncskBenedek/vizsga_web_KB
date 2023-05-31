import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { tap } from 'rxjs';
import { Tema } from './interfaces';

@Injectable({
  providedIn: 'root',
})
export class StorageService {
  constructor(private http: HttpClient) {}

  getSzavak() {
    return this.http.get<
      {
        id: number;
        angol: string;
        magyar: string;
        tema: {
          id: number;
          temanev: string;
        };
        temaId: number;
      }[]
    >('https://localhost:7258/szavak');
    /*   .pipe(
        tap({
            next
        })
    ) */
  }
  getTemak() {
    return this.http.get<Tema[]>('https://localhost:7258/tema');
  }
}
