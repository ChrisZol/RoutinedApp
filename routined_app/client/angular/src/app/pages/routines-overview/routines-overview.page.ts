import { Component, OnInit } from '@angular/core';
import { Routine } from 'src/app/data/routine';
import { DataService } from 'src/app/services/data.service';

@Component({
  selector: 'app-routines-overview',
  templateUrl: './routines-overview.page.html',
  styleUrls: ['./routines-overview.page.scss'],
})
export class RoutinesOverviewPage implements OnInit {
  routinesList: Routine[];

  constructor(private dataService: DataService) { }

  ngOnInit() {
    this.dataService.getRoutines().subscribe({
      next: routines =>{
        this.routinesList=routines
      }
    })
  }
}
