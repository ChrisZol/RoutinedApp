import { Component } from '@angular/core';
import { Routine } from 'src/app/data/routine';
import { DataService } from '../../services/data.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  constructor(private data: DataService) {}

  refresh(ev) {
    setTimeout(() => {
      ev.detail.complete();
    }, 3000);
  }

  getCurrentDay(): string{
    return new Date().toLocaleString('de-DE');
  }

  getRoutines(): Routine[] {
    return this.data.getRoutines();
  }
}
