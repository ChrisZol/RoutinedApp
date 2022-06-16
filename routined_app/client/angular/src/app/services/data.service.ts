import { Routine } from '../data/routine';
import { Task } from '../data/task';

import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

import { map } from 'rxjs/operators'

@Injectable({
  providedIn: 'root'
})

export class DataService {

  constructor(private httpClient: HttpClient) { }

  public getRoutines(): Observable<Routine[]> {
    return this.httpClient.get<Routine []>('http://127.0.0.1:3000/routines');
  }

  public getRoutineById(id: number): Observable<Routine> {
    return this.httpClient.get<Routine>('http://127.0.0.1:3000/routine/' + id);
  }
  
  public getTasks(id: number): Observable<Task[]> {
    return this.httpClient.get<Task[]>("http://127.0.0.1:3000/routine/" + id +"/tasks");
  }

  public getTaskById(id:number): Observable<Task> {
    return this.httpClient.get<Task>('http://127.0.0.1:3000/task/' + id);
  }
}
