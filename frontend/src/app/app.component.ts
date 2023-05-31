import { Component, OnInit } from '@angular/core';
import { Szavak, Tema } from './shared/interfaces';
import { StorageService } from './shared/storage.service';
import { NgForm } from '@angular/forms';
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

 szavak: Szavak[] = [];
 temak:Tema[] = [];

constructor(private storageService:StorageService) {}

ngOnInit(){
  console.log( this.storageService.getSzavak().subscribe((value)=>{
    console.log(value);
   let ujObj: Szavak[] = value.map((elem)=>{
      let sor = {id : elem.id, angol: elem.angol, magyar: elem.magyar, temaId: elem.temaId, temanev: elem.tema.temanev}
      return {...sor}
    });
    this.szavak = [...ujObj];
  }));
  console.log(this.storageService.getTemak().subscribe(value=>{
    let ujTemak = value.map(sor=>{
      return {...sor};
    });
    this.temak = [...ujTemak];
    
  }));
  

}

a(a){
  console.log(a);
  
}
}
