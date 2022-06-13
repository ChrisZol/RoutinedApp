import { Injectable } from '@angular/core';
import { Routine } from '../data/routine';
import { Task } from '../data/task';

export interface Message {
  fromName: string;
  subject: string;
  date: string;
  id: number;
  read: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class DataService {
  public routines: Routine[] = [
    {
      id: 0,
      name: 'Routine1',
      occurence: 'Daily',
      startTime: new Date(2022, 6),
      endTime: new Date(2020, 7),
      tasks: []
    }
  ];

  public tasks: Task[] = [
    {
      id: 0,
      name: 'Task1',
      duration: 1000,
      description: 'Desc'
    }
  ];

  constructor() { }

  public getRoutines(): Routine[] {
    return this.routines;
  }

  public getRoutineById(id: number): Routine {
    return this.routines[id];
  }
  
  public getTasks(): Task[] {
    return this.tasks;
  }

  public getTaskById(): Task {
    return null;
  }
}
