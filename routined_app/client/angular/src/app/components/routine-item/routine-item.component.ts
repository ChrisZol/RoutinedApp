import { Component, Input, OnInit } from '@angular/core';
import { Routine } from 'src/app/data/routine';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-routine-item',
  templateUrl: './routine-item.component.html',
  styleUrls: ['./routine-item.component.scss'],
})
export class RoutineItemComponent implements OnInit {
  @Input() routine: Routine;
  startTimeStr: string;
  endTimeStr: string;

  constructor() { }

  ngOnInit() 
  {
    this.startTimeStr = formatDate(this.routine.start_time, 'hh:mm', 'en-US');
    this.endTimeStr = formatDate(this.routine.end_time, 'hh:mm', 'en-US');
  }

}
