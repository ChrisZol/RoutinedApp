import { Component } from '@angular/core';
import { Routine } from 'src/app/data/routine';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  routinesList: Routine[];

  constructor(private dataService: DataService) {}

  ngOnInit() {
    this.dataService.getRoutines().subscribe({
      next: routines =>{
        this.routinesList=routines
      }
    })
  }

  refresh(ev) {
    setTimeout(() => {
      ev.detail.complete();
    }, 3000);
  }

  getCurrentDay(): string{
    return new Date().toLocaleString('de-DE');
  }
}
